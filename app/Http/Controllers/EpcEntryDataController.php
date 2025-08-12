<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\SubPackageProject;
use App\Models\EpcEntryData;
use App\Models\WorkService;
use App\Models\AlreadyDefineEpc;

class EpcEntryDataController extends Controller
{
    public function index(Request $request)
    {
        $subProjects = SubPackageProject::select('id', 'name')->get();
        $workservices = WorkService::select('id', 'name')->get();

        // Get selected filters
        $selectedWorkServiceId = $request->input('work_service_id');
        $selectedProjectId = $request->input('sub_package_project_id');

        // Filter AlreadyDefineEpc by selected work service
        $epcentrydefine = collect();
        if ($selectedWorkServiceId) {
            $epcentrydefine = AlreadyDefineEpc::with(['activityName']) // eager load activity name relation
                ->where('work_service', $selectedWorkServiceId)
                ->orderBy('sl_no')
                ->get();
        }

        $epcEntries = collect();
        $subProject = null;
        $remainingPercent = null;
        $remainingAmount = null;
        $warnings = [];

        if ($selectedProjectId) {
            $subProject = SubPackageProject::find($selectedProjectId);

            $epcEntries = EpcEntryData::where('sub_package_project_id', $selectedProjectId)
                ->orderByRaw("CAST(SUBSTRING_INDEX(sl_no, '.', 1) AS UNSIGNED), sl_no")
                ->get()
                ->groupBy(function ($item) {
                    return explode('.', $item->sl_no)[0];
                });

            $allEntries = $epcEntries->flatten();

            // Check percent totals
            $totalPercent = $allEntries->sum('percent');
            if ($totalPercent !== 100) {
                $remainingPercent = 100 - $totalPercent;
                $warnings[] = $totalPercent > 100 ? 'Total percentage exceeds 100% by ' . abs($remainingPercent) . '%.' : 'Total percentage is less than 100% by ' . abs($remainingPercent) . '%.';
            }

            // Check amount totals
            $totalAmount = $allEntries->sum('amount');
            if ($subProject && $subProject->contract_value !== null) {
                $remainingAmount = $subProject->contract_value - $totalAmount;
                $warnings[] = $totalAmount > $subProject->contract_value ? 'Total amount exceeds contract value by ' . number_format(abs($remainingAmount), 2) . '.' : 'Total amount is less than contract value by ' . number_format(abs($remainingAmount), 2) . '.';
            }

            // Check individual entries
            foreach ($allEntries as $entry) {
                if ($entry->percent < 0 || $entry->percent > 100) {
                    $warnings[] = "Entry '{$entry->sl_no}' has invalid percent value ({$entry->percent}%).";
                }
                if ($entry->amount < 0) {
                    $warnings[] = "Entry '{$entry->sl_no}' has a negative amount.";
                }
            }
        }

        return view('admin.epcentry_data.index', compact('subProjects', 'workservices', 'epcentrydefine', 'epcEntries', 'subProject', 'selectedWorkServiceId', 'selectedProjectId', 'remainingPercent', 'remainingAmount', 'warnings'));
    }
    public function storeFromDefined(Request $request)
{
    $validated = $request->validate([
        'sub_package_project_id' => 'required|exists:sub_package_projects,id',
        'work_service_id' => 'required|exists:work_service,id',
    ]);

    $subProjectId = $validated['sub_package_project_id'];
    $workServiceId = $validated['work_service_id'];

    // Get Already Defined EPC for that work service
    $definedEntries = AlreadyDefineEpc::where('work_service', $workServiceId)->get();

    if ($definedEntries->isEmpty()) {
        return back()->with('error', 'No defined EPC entries found for this work service.');
    }

    $insertCount = 0;

    foreach ($definedEntries as $def) {
        EpcEntryData::create([
            'sub_package_project_id' => $subProjectId,
            'sl_no' => $def->sl_no,
            'activity_name' => $def->activityName?->name ?? null,
            'stage_name' => $def->stage_name,
            'item_description' => $def->item_description,
            'percent' => $def->percent,
            'amount' => 0, // you can calculate amount if needed
        ]);
        $insertCount++;
    }

    return redirect()
        ->route('admin.epcentry_data.index', [
            'sub_package_project_id' => $subProjectId,
            'work_service_id' => $workServiceId
        ])
        ->with('success', "{$insertCount} EPC entries stored successfully from defined entries.");
}


    public function create(Request $request)
    {
        $subProject = null;
        if ($request->has('sub_package_project_id')) {
            $subProject = SubPackageProject::findOrFail($request->sub_package_project_id);
        }
        return view('admin.epcentry_data.create', compact('subProject'));
    }

    public function store(Request $request)
    {
        if ($request->has('entries') && is_array($request->entries)) {
            $validated = $request->validate([
                'sub_package_project_id' => 'required|exists:sub_package_projects,id',
                'entries' => 'required|array|min:1',
                'entries.*.sl_no' => 'required|string|max:255',
                'entries.*.activity_name' => 'required|string',
                'entries.*.stage_name' => 'nullable|string',
                'entries.*.item_description' => 'nullable|string',
                'entries.*.percent' => 'nullable|numeric|min:0|max:100',
                'entries.*.amount' => 'nullable|numeric|min:0',
            ]);

            foreach ($validated['entries'] as $entry) {
                $entry['sub_package_project_id'] = $validated['sub_package_project_id'];
                EpcEntryData::create($entry);
            }

            return redirect()
                ->route('admin.epcentry_data.index', ['sub_package_project_id' => $validated['sub_package_project_id']])
                ->with('success', count($validated['entries']) . ' EPC entries created successfully.');
        }

        $validated = $request->validate([
            'sub_package_project_id' => 'required|exists:sub_package_projects,id',
            'sl_no' => 'required|string|max:255',
            'activity_name' => 'required|string',
            'stage_name' => 'nullable|string',
            'item_description' => 'nullable|string',
            'percent' => 'nullable|numeric|min:0|max:100',
            'amount' => 'nullable|numeric|min:0',
        ]);

        EpcEntryData::create($validated);

        return redirect()
            ->route('admin.epcentry_data.index', ['sub_package_project_id' => $validated['sub_package_project_id']])
            ->with('success', 'EPC entry created successfully.');
    }

    public function edit($id)
    {
        $entry = EpcEntryData::findOrFail($id);
        $subProjects = SubPackageProject::select('id', 'name')->get();
        return view('admin.epcentry_data.edit', compact('entry', 'subProjects'));
    }

    public function update(Request $request, $id)
    {
        $entry = EpcEntryData::findOrFail($id);

        $validated = $request->validate([
            'sub_package_project_id' => 'required|exists:sub_package_projects,id',
            'sl_no' => 'required|string|max:255',
            'activity_name' => 'required|string',
            'stage_name' => 'nullable|string',
            'item_description' => 'nullable|string',
            'percent' => 'nullable|numeric|min:0|max:100',
            'amount' => 'nullable|numeric|min:0',
        ]);

        $entry->update($validated);

        return redirect()
            ->route('admin.epcentry_data.index', ['sub_package_project_id' => $validated['sub_package_project_id']])
            ->with('success', 'EPC entry updated successfully.');
    }

    public function bulkDestroy(Request $request)
    {
        $request->validate([
            'ids' => 'required|array|min:1',
            'ids.*' => 'exists:epcentry_data,id',
        ]);

        $ids = $request->input('ids');

        try {
            EpcEntryData::withTrashed()->whereIn('id', $ids)->forceDelete();

            if ($request->ajax()) {
                return response()->json([
                    'message' => count($ids) . ' EPC entries permanently deleted.',
                ]);
            }

            return redirect()
                ->route('admin.epcentry_data.index')
                ->with('success', count($ids) . ' EPC entries permanently deleted.');
        } catch (\Exception $e) {
            \Log::error('Bulk delete failed for EPC entries IDs: ' . implode(',', $ids) . '. Error: ' . $e->getMessage());

            if ($request->ajax()) {
                return response()->json(['error' => 'Failed to delete EPC entries: ' . $e->getMessage()], 500);
            }

            return redirect()
                ->route('admin.epcentry_data.index')
                ->withErrors('Error deleting entries: ' . $e->getMessage());
        }
    }

    public function destroy($id)
    {
        $entry = EpcEntryData::findOrFail($id);
        $projectId = $entry->sub_package_project_id;
        $entry->delete();

        return redirect()
            ->route('admin.epcentry_data.index', ['sub_package_project_id' => $projectId])
            ->with('success', 'EPC entry deleted (soft delete).');
    }
}
