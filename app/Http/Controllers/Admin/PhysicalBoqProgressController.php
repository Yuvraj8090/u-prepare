<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\PhysicalBoqProgress;
use App\Models\BoqEntryData;
use App\Models\SubPackageProject;
use App\Models\MediaFile;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Validation\Rule;

class PhysicalBoqProgressController extends Controller
{
    /** ---------------------------
     * Display the BOQ progress page
     * --------------------------- */
    public function index(Request $request)
    {
        $subProjects = SubPackageProject::select('id', 'name')->get();
        $selectedProjectId = $request->input('sub_package_project_id');
        $selectedDate = $request->input('date', now()->format('Y-m-d'));

        $subProject = $selectedProjectId ? SubPackageProject::find($selectedProjectId) : null;

        $boqEntries = $selectedProjectId 
            ? $this->getBoqEntriesGrouped($selectedProjectId)
            : collect();

        $physicalProgress = $selectedProjectId 
            ? $this->getPhysicalProgressData($selectedProjectId, $selectedDate)
            : collect();

        return view('admin.physical_boq_progress.index', compact(
            'subProjects', 'subProject', 'boqEntries', 'physicalProgress', 'selectedProjectId', 'selectedDate'
        ));
    }

    /** ---------------------------
     * AJAX: Get physical progress JSON
     * --------------------------- */
    public function getPhysicalProgress(Request $request)
    {
        $projectId = $request->sub_package_project_id;
        $selectedDate = $request->date ?? now()->format('Y-m-d');

        $subProject = SubPackageProject::find($projectId);
        $boqEntries = $this->getBoqEntriesGrouped($projectId);
        $physicalProgress = $this->getPhysicalProgressData($projectId, $selectedDate);

        return response()->json([
            'subProject' => $subProject,
            'selectedDate' => $selectedDate,
            'boqEntries' => $boqEntries,
            'physicalProgress' => $physicalProgress,
        ]);
    }

    /** ---------------------------
     * AJAX: Store or update progress
     * --------------------------- */
    public function saveProgress(Request $request)
    {
        $data = $request->validate([
            'sub_package_project_id' => 'required|exists:sub_package_projects,id',
            'progress_date' => 'required|date',
            'entries.*.boq_entry_id' => 'required|exists:boqentry_data,id',
            'entries.*.current_day.qty' => 'required|numeric|min:0',
            'entries.*.current_day.amount' => 'nullable|numeric|min:0',
        ]);

        foreach ($data['entries'] as $entry) {
            $boqEntry = BoqEntryData::findOrFail($entry['boq_entry_id']);

            PhysicalBoqProgress::updateOrCreate(
                [
                    'boq_entry_id' => $boqEntry->id,
                    'sub_package_project_id' => $data['sub_package_project_id'],
                    'progress_submitted_date' => $data['progress_date'],
                ],
                [
                    'qty' => $entry['current_day']['qty'],
                    'amount' => $entry['current_day']['qty'] * $boqEntry->rate,
                ]
            );
        }

        return response()->json(['status' => 'success', 'message' => 'Progress saved successfully.']);
    }

    /** ---------------------------
     * Create page
     * --------------------------- */
    public function create(Request $request)
    {
        $boqEntry = BoqEntryData::findOrFail($request->boq_entry_id);
        $progressSums = $this->getTotalProgressForEntry($boqEntry->id);

        return view('admin.physical_boq_progress.create', compact('boqEntry', 'progressSums'));
    }

    /** ---------------------------
     * Edit page
     * --------------------------- */
    public function edit(PhysicalBoqProgress $physicalBoqProgress)
    {
        $boqEntry = $physicalBoqProgress->boqEntry;
        $progressSums = $this->getTotalProgressForEntry($boqEntry->id, $physicalBoqProgress->id);

        return view('admin.physical_boq_progress.edit', compact('physicalBoqProgress', 'boqEntry', 'progressSums'));
    }

    /** ---------------------------
     * Store new progress
     * --------------------------- */
    public function store(Request $request)
    {
        $validated = $this->validateProgress($request);
        $this->createOrUpdateProgress($validated);
        return redirect()->route('admin.physical_boq_progress.index')
            ->with('success', 'Physical BOQ Progress record created successfully.');
    }

    /** ---------------------------
     * Update existing progress
     * --------------------------- */
    public function update(Request $request, PhysicalBoqProgress $physicalBoqProgress)
    {
        $validated = $this->validateProgress($request);
        $this->createOrUpdateProgress($validated, $physicalBoqProgress);
        return redirect()->route('admin.physical_boq_progress.index')
            ->with('success', 'Physical BOQ Progress record updated successfully.');
    }

    /** ---------------------------
     * Delete progress
     * --------------------------- */
    public function destroy(Request $request, PhysicalBoqProgress $physicalBoqProgress)
    {
        $this->deleteImages($physicalBoqProgress->media);
        $physicalBoqProgress->delete();

        return redirect()->route('admin.physical_boq_progress.index')
            ->with('success', 'Physical BOQ Progress record deleted successfully.');
    }

    /** ---------------------------
     * Bulk delete
     * --------------------------- */
    public function bulkDestroy(Request $request)
    {
        $request->validate(['ids' => 'required|array', 'ids.*' => 'integer|exists:physical_boq_progress,id']);
        $entries = PhysicalBoqProgress::whereIn('id', $request->ids)->get();

        foreach ($entries as $entry) {
            $this->deleteImages($entry->media);
            $entry->delete();
        }

        return response()->json(['status' => 'success']);
    }

    /** ---------------------------
     * PRIVATE HELPERS
     * --------------------------- */

    // Get BOQ entries grouped by sl_no
    private function getBoqEntriesGrouped($projectId)
    {
        return BoqEntryData::where('sub_package_project_id', $projectId)
            ->orderBy('sl_no')
            ->get()
            ->groupBy('sl_no');
    }

    // Calculate physical progress (previous, current, up to date)
    private function getPhysicalProgressData($projectId, $selectedDate)
    {
        $selectedDateCarbon = Carbon::parse($selectedDate);
        $boqEntries = $this->getBoqEntriesGrouped($projectId);
        $allProgress = PhysicalBoqProgress::where('sub_package_project_id', $projectId)->get()->groupBy('boq_entry_id');

        $result = [];

        foreach ($boqEntries as $entries) {
            foreach ($entries as $entry) {
                $boqId = $entry->id;
                $progressCollection = $allProgress[$boqId] ?? collect();

                $previousQty = $progressCollection->filter(fn($p) => Carbon::parse($p->progress_submitted_date)->lt($selectedDateCarbon))->sum('qty');
                $previousAmount = $progressCollection->filter(fn($p) => Carbon::parse($p->progress_submitted_date)->lt($selectedDateCarbon))->sum('amount');

                $currentRecord = $progressCollection->first(fn($p) => Carbon::parse($p->progress_submitted_date)->isSameDay($selectedDateCarbon));
                $currentQty = $currentRecord->qty ?? 0;
                $currentAmount = $currentRecord->amount ?? 0;

                $result[$boqId] = (object)[
                    'since_previous' => (object)['qty' => $previousQty, 'amount' => $previousAmount],
                    'current_day' => (object)['qty' => $currentQty, 'amount' => $currentAmount],
                    'up_to_date' => (object)['qty' => $previousQty + $currentQty, 'amount' => $previousAmount + $currentAmount],
                ];
            }
        }

        return $result;
    }

    // Validate progress input
    private function validateProgress(Request $request)
    {
        return $request->validate([
            'boq_entry_id' => ['required', Rule::exists('boqentry_data', 'id')],
            'qty' => 'required|numeric|min:0',
            'amount' => 'nullable|numeric|min:0',
            'progress_submitted_date' => 'nullable|date',
            'media.*' => 'nullable|image|mimes:jpg,jpeg,png|max:2048',
            'lat' => 'nullable|numeric',
            'long' => 'nullable|numeric',
        ]);
    }

    // Create or update a progress record
    private function createOrUpdateProgress(array $validated, PhysicalBoqProgress $existing = null)
    {
        $boqEntry = BoqEntryData::findOrFail($validated['boq_entry_id']);
        $remainingQty = $boqEntry->qty - PhysicalBoqProgress::where('boq_entry_id', $boqEntry->id)
            ->when($existing, fn($q) => $q->where('id', '!=', $existing->id))->sum('qty');

        if ($validated['qty'] > $remainingQty) {
            abort(422, "Quantity cannot exceed remaining allowed quantity ($remainingQty).");
        }

        $validated['amount'] = $validated['qty'] * $boqEntry->rate;
        $newMediaIds = $this->handleImages(request(), [
            'subject' => 'Physical BOQ Progress',
            'boq_entry_id' => $boqEntry->id,
            'item_description' => $boqEntry->item_description,
        ]);

        $validated['media'] = $existing 
            ? array_merge($existing->media ?? [], $newMediaIds) 
            : $newMediaIds;

        if ($existing) {
            $existing->update($validated);
        } else {
            PhysicalBoqProgress::create($validated);
        }
    }

    // Sum progress for a BOQ entry
    private function getTotalProgressForEntry($boqEntryId, $excludeId = null)
    {
        $query = PhysicalBoqProgress::where('boq_entry_id', $boqEntryId);
        if ($excludeId) $query->where('id', '!=', $excludeId);
        return $query->sum('qty');
    }

    // Handle media file upload
    private function handleImages(Request $request, array $additionalMeta = []): array
    {
        $mediaIds = [];
        if ($request->hasFile('media')) {
            foreach ($request->file('media') as $file) {
                $path = $file->store('boq_progress_images', 'public');
                $mediaFile = MediaFile::create([
                    'path' => $path,
                    'type' => $file->getClientMimeType(),
                    'meta_data' => array_merge($additionalMeta, ['original_name' => $file->getClientOriginalName()]),
                ]);
                $mediaIds[] = $mediaFile->id;
            }
        }
        return $mediaIds;
    }

    // Delete media files
    private function deleteImages(array $mediaIds = [])
    {
        if (!$mediaIds) return;
        $mediaFiles = MediaFile::whereIn('id', $mediaIds)->get();
        foreach ($mediaFiles as $file) {
            Storage::disk('public')->delete($file->path);
            $file->delete();
        }
    }
}
