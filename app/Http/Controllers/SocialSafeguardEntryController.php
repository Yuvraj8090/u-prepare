<?php

namespace App\Http\Controllers;

use App\Models\SafeguardEntry;
use App\Models\SocialSafeguardEntry;
use App\Models\SubPackageProject;
use App\Models\SafeguardCompliance;
use App\Models\ContractionPhase;
use App\Models\Contract;
use App\Models\MediaFile;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class SocialSafeguardEntryController extends Controller
{
    /**
     * List social safeguard entries for a project & compliance
     */
    public function index(int $project_id, int $compliance_id, int $phase_id = null, Request $request)
    {
        $subProject = SubPackageProject::findOrFail($project_id);
        $compliance = SafeguardCompliance::findOrFail($compliance_id);

        $this->authorizeComplianceAccess($compliance);

        // Auto-select first phase if not provided
        $phase_id ??= $compliance->contractionPhases()->first()?->id ?? 1;

        $selectedDate = $request->input('date_of_entry', now()->format('Y-m-d'));

        $entries = SafeguardEntry::with(['socialSafeguardEntries', 'contractionPhase'])
            ->where([
                'sub_package_project_id' => $project_id,
                'safeguard_compliance_id' => $compliance_id,
                'contraction_phase_id' => $phase_id,
            ])
            ->get();

        // ✅ Standardize processing
        $entries = $this->processEntries($entries, $selectedDate);

        return view('admin.social_safeguard_entries.index', compact('entries', 'subProject', 'compliance', 'phase_id', 'selectedDate'));
    }

    /**
     * Report summary
     */
    public function report(int $project_id, int $compliance_id, Request $request)
    {
        $subProject = SubPackageProject::findOrFail($project_id);
        $compliance = SafeguardCompliance::findOrFail($compliance_id);

        // package & contract
        $packageProject = $subProject->packageProject ?? null;
        $contract = $packageProject ? Contract::where('project_id', $packageProject->id)->first() : null;
        $contractStart = $contract?->commencement_date;

        // date range
        $requestedStart = $request->input('start_date', $contractStart ?? $subProject->start_date?->format('Y-m-d'));
        $requestedEnd = $request->input('end_date', now()->format('Y-m-d'));

        $start = Carbon::parse($requestedStart);
        $end = Carbon::parse($requestedEnd);

        // enforce start >= contractStart if available
        if ($contractStart && $start->lt(Carbon::parse($contractStart))) {
            $start = Carbon::parse($contractStart);
        }

        // end cannot be future
        if ($end->gt(Carbon::now())) {
            $end = Carbon::now();
        }

        // ensure start <= end
        if ($start->gt($end)) {
            [$start, $end] = [$end, $start];
        }

        $startDate = $start->format('Y-m-d');
        $endDate = $end->format('Y-m-d');

        // months in range (inclusive)
        $monthsInRange = $end->year * 12 + $end->month - ($start->year * 12 + $start->month) + 1;
        $monthsInRange = max(1, $monthsInRange);

        $phases = ContractionPhase::orderBy('name')->get();

        $phaseReports = [];
        $overallTotal = 0;
        $overallDone = 0;

        $debug = $request->boolean('debug', false);
        $debugInfo = [];

        foreach ($phases as $phase) {
            // Get child safeguard_entry IDs at DB level
            $childIds = DB::table('safeguard_entries')->where('sub_package_project_id', $subProject->id)->where('safeguard_compliance_id', $compliance->id)->where('contraction_phase_id', $phase->id)->where('sl_no', 'like', '%.%')->pluck('id')->toArray();

            $childCount = count($childIds);

            if ($childCount === 0) {
                $phaseReports[] = [
                    'phase' => $phase->name,
                    'total' => 0,
                    'done' => 0,
                    'percent' => 0.0,
                ];
                continue;
            }

            if ($phase->is_one_time) {
                $totalForPhase = $childCount;

                $doneForPhase = DB::table('social_safeguard_entries')
                    ->whereIn('safeguard_entry_id', $childIds)
                    ->where('sub_package_project_id', $subProject->id)
                    ->where('social_compliance_id', $compliance->id)
                    ->where('contraction_phase_id', $phase->id)
                    ->whereBetween('date_of_entry', [$startDate, $endDate])
                    ->count();
            } else {
                $totalForPhase = $childCount * $monthsInRange;

                $doneForPhase = DB::table('social_safeguard_entries')
                    ->whereIn('safeguard_entry_id', $childIds)
                    ->where('sub_package_project_id', $subProject->id)
                    ->where('social_compliance_id', $compliance->id)
                    ->where('contraction_phase_id', $phase->id)
                    ->whereBetween('date_of_entry', [$startDate, $endDate])
                    ->count();
            }

            $percent = $totalForPhase > 0 ? round(($doneForPhase / $totalForPhase) * 100, 2) : 0.0;

            $phaseReports[] = [
                'phase' => $phase->name,
                'total' => $totalForPhase,
                'done' => $doneForPhase,
                'percent' => $percent,
            ];

            $overallTotal += $totalForPhase;
            $overallDone += $doneForPhase;
        }

        $overallPercent = $overallTotal > 0 ? round(($overallDone / $overallTotal) * 100, 2) : 0.0;

        return view('admin.social_safeguard_entries.report', compact('subProject', 'packageProject', 'contract', 'compliance', 'startDate', 'endDate', 'monthsInRange', 'phaseReports', 'overallTotal', 'overallDone', 'overallPercent'));
    }

    /**
     * Report details
     */
    public function reportDetails(int $project_id, int $compliance_id, Request $request)
    {
        $subProject = SubPackageProject::findOrFail($project_id);
        $compliance = SafeguardCompliance::findOrFail($compliance_id);

        $packageProject = $subProject->packageProject ?? null;
        $contract = $packageProject ? Contract::where('project_id', $packageProject->id)->first() : null;
        $contractStart = $contract?->commencement_date;

        $start = Carbon::parse($request->input('start_date', $contractStart ?? $subProject->start_date?->format('Y-m-d')));
        $end = Carbon::parse($request->input('end_date', now()->format('Y-m-d')));

        if ($contractStart && $start->lt(Carbon::parse($contractStart))) {
            $start = Carbon::parse($contractStart);
        }

        if ($end->gt(Carbon::now())) {
            $end = Carbon::now();
        }

        $startDate = $start->format('Y-m-d');
        $endDate = $end->format('Y-m-d');

        $entries = DB::table('social_safeguard_entries AS sse')
            ->join('safeguard_entries AS se', 'sse.safeguard_entry_id', '=', 'se.id')
            ->join('contraction_phases AS cp', 'sse.contraction_phase_id', '=', 'cp.id')
            ->select('sse.id as sse_id', 'se.id as safeguard_entry_id', 'se.item_description', 'sse.yes_no', 'sse.photos_documents_case_studies', 'sse.remarks', 'sse.validity_date', 'sse.date_of_entry', 'sse.created_at', 'sse.updated_at', 'cp.name as phase_name')
            ->where('sse.sub_package_project_id', $subProject->id)
            ->where('sse.social_compliance_id', $compliance->id)
            ->whereBetween('sse.date_of_entry', [$startDate, $endDate])
            ->orderBy('sse.date_of_entry', 'desc')
            ->get();

        return view('admin.social_safeguard_entries.report_details', compact('subProject', 'compliance', 'packageProject', 'contract', 'startDate', 'endDate', 'entries'));
    }

    public function destroy($id)
    {
        DB::table('social_safeguard_entries')->where('id', $id)->delete();
        return redirect()->back()->with('success', 'Safeguard entry deleted successfully.');
    }

    private function authorizeComplianceAccess(SafeguardCompliance $compliance)
    {
        $userRole = auth()->user()->role_id;
        if ($userRole != 1 && $userRole != $compliance->role_id) {
            abort(403, 'Unauthorized access to this compliance.');
        }
    }

    /**
     * Natural sort & attach social, locked status, gallery
     */
    private function processEntries($entries, string $selectedDate)
    {
        return $entries
            ->sort(fn($a, $b) => $this->naturalSort($a->sl_no, $b->sl_no))
            ->values()
            ->map(function ($entry) use ($selectedDate) {
                $phase = $entry->contractionPhase;

                if ($phase?->is_one_time) {
                    // Only latest entry for one-time phases
                    $socialEntries = collect([$entry->socialSafeguardEntries()->whereDate('date_of_entry', '<=', $selectedDate)->latest('date_of_entry')->first()])->filter();
                } else {
                    // All entries up to the date for recurring phases
                    $socialEntries = $entry->socialSafeguardEntries()->whereDate('date_of_entry', '<=', $selectedDate)->orderBy('date_of_entry', 'desc')->get();
                }

                // Attach entries & computed flags
                $entry->socialEntries = $socialEntries;
                $entry->social = $socialEntries->first(); // keep backward compatibility
                $entry->is_locked = $this->computeLocked($entry, $entry->social);
                $entry->gallery = $this->loadGallery($entry->social);

                return $entry;
            });
    }

    private function naturalSort(string $aSl, string $bSl): int
    {
        $aParts = explode('.', $aSl);
        $bParts = explode('.', $bSl);

        foreach ($aParts as $i => $part) {
            $aNum = is_numeric($part) ? intval($part) : $part;
            $bNum = $bParts[$i] ?? null;

            if ($bNum === null) {
                return 1;
            }

            $bNum = is_numeric($bNum) ? intval($bNum) : $bNum;

            if ($aNum === $bNum) {
                continue;
            }

            return $aNum < $bNum ? -1 : 1;
        }

        return count($aParts) <=> count($bParts);
    }

    private function computeLocked($entry, $social): bool
    {
        $hasValidity = $entry->is_validity && $social?->validity_date;
        $oneTime = $entry->contractionPhase?->is_one_time ?? false;

        return $oneTime ? ($social ? ($hasValidity ? Carbon::parse($social->validity_date)->isFuture() : true) : false) : $hasValidity && Carbon::parse($social->validity_date)->isFuture();
    }

    private function loadGallery($social)
    {
        if (!$social?->photos_documents_case_studies) {
            return collect();
        }
        return MediaFile::whereIn('id', $social->photos_documents_case_studies)->get()->map->toLightGallery();
    }

    /**
     * Overview of sub-package projects
     */
    public function subPackageProjectOverview(Request $request)
    {
        $date = $request->date_of_entry ? Carbon::parse($request->date_of_entry)->format('Y-m-d') : now()->format('Y-m-d');

        $subProjects = SubPackageProject::with([
            'safeguardEntries' => function ($q) {
                $q->with(['socialSafeguardEntries'])->orderBy('sl_no');
            },
        ])
            ->orderBy('name')
            ->get();

        $safeguardCompliances = SafeguardCompliance::orderBy('name')->get();
        $contractionPhases = ContractionPhase::orderBy('name')->get();

        $statusMap = [];
        foreach ($subProjects as $project) {
            foreach ($safeguardCompliances as $compliance) {
                $entries = $project->safeguardEntries->where('safeguard_compliance_id', $compliance->id);

                $done =
                    $entries
                        ->filter(function ($entry) use ($date) {
                            return $entry->socialSafeguardEntries()->whereDate('date_of_entry', '<=', $date)->exists();
                        })
                        ->count() > 0;

                $statusMap[$project->id][$compliance->id] = $done;
            }
        }

        return view('admin.social_safeguard_entries.overview', compact('subProjects', 'safeguardCompliances', 'contractionPhases', 'statusMap', 'date'));
    }

    private function canAccessCompliance(SafeguardCompliance $compliance): bool
    {
        $userRole = auth()->user()->role_id;
        return $userRole == 1 || $userRole == $compliance->role_id;
    }

    /**
     * Store or update a single social safeguard entry
     */
    public function save(Request $request)
    {
        $validated = $request->validate([
            'entry_id' => 'required|exists:safeguard_entries,id',
            'sub_package_project_id' => 'required|exists:sub_package_projects,id',
            'social_compliance_id' => 'required|exists:safeguard_compliances,id',
            'contraction_phase_id' => 'required|exists:contraction_phases,id',
            'yes_no' => 'nullable|string',
            'remarks' => 'nullable|string',
            'validity_date' => 'nullable|date',
            'date_of_entry' => 'nullable|date',
            'photos_documents_case_studies.*' => 'nullable|file',
        ]);

        $entry = SafeguardEntry::findOrFail($validated['entry_id']);
        $date = $validated['date_of_entry'] ?? now()->format('Y-m-d');

        $social = SocialSafeguardEntry::firstOrNew([
            'safeguard_entry_id' => $entry->id,
            'date_of_entry' => $date,
        ]);

        // Handle uploaded files
        $mediaIds = $social->photos_documents_case_studies ?? [];
        if ($request->hasFile('photos_documents_case_studies')) {
            foreach ($request->file('photos_documents_case_studies') as $file) {
                $media = MediaFile::create([
                    'path' => $file->store('media_files', 'public'),
                    'type' => $file->getClientMimeType(),
                    'meta_data' => ['name' => $file->getClientOriginalName()],
                ]);
                $mediaIds[] = $media->id;
            }
        }

        $social->fill($validated);
        $social->photos_documents_case_studies = $mediaIds;
        $social->save();

        return response()->json([
            'status' => 'success',
            'social_id' => $social->id,
            'message' => 'Entry saved successfully.',
        ]);
    }

    /**
     * Global overview
     */
    public function overview(Request $request)
    {
        $date = $request->input('date_of_entry', now()->format('Y-m-d'));

        $subProjects = SubPackageProject::with(['safeguardEntries.socialSafeguardEntries'])
            ->orderBy('name')
            ->get();
        $compliances = SafeguardCompliance::orderBy('name')->get();

        $statusMap = [];
        foreach ($subProjects as $project) {
            foreach ($compliances as $compliance) {
                $done = $project->safeguardEntries->where('safeguard_compliance_id', $compliance->id)->filter(fn($entry) => $entry->socialSafeguardEntries()->whereDate('date_of_entry', '<=', $date)->exists())->count() > 0;

                $statusMap[$project->id][$compliance->id] = $done;
            }
        }

        return view('admin.social_safeguard_entries.overview', compact('subProjects', 'compliances', 'statusMap', 'date'));
    }
}
