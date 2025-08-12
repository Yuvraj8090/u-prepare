<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\SubPackageProject;
use App\Models\EpcEntryData;

class EpcEntryDataController extends Controller
{
 public function index(Request $request)
{
    $subProjects = SubPackageProject::select('id', 'name')->get();
    $selectedProjectId = $request->input('sub_package_project_id');

    $epcEntries = collect();
    $subProject = null;
    $remainingPercent = null;
    $remainingAmount = null;
    $warnings = []; // <-- store validation messages

    if ($selectedProjectId) {
        $subProject = SubPackageProject::find($selectedProjectId);

        $epcEntries = EpcEntryData::where('sub_package_project_id', $selectedProjectId)
            ->orderByRaw("CAST(SUBSTRING_INDEX(sl_no, '.', 1) AS UNSIGNED), sl_no")
            ->get()
            ->groupBy(function ($item) {
                return explode('.', $item->sl_no)[0];
            });

        $allEntries = $epcEntries->flatten();

        // 1️⃣ Percentage check
        $totalPercent = $allEntries->sum('percent');
        if ($totalPercent !== 100) {
            $remainingPercent = 100 - $totalPercent;
            if ($totalPercent > 100) {
                $warnings[] = "Total percentage exceeds 100% by " . abs($remainingPercent) . "%.";
            } elseif ($totalPercent < 100) {
                $warnings[] = "Total percentage is less than 100% by " . abs($remainingPercent) . "%.";
            }
        }

        // 2️⃣ Amount check
        $totalAmount = $allEntries->sum('amount');
        if ($subProject && $subProject->contract_value !== null) {
            $remainingAmount = $subProject->contract_value - $totalAmount;
            if ($totalAmount > $subProject->contract_value) {
                $warnings[] = "Total amount exceeds contract value by " . number_format(abs($remainingAmount), 2) . ".";
            } elseif ($totalAmount < $subProject->contract_value) {
                $warnings[] = "Total amount is less than contract value by " . number_format(abs($remainingAmount), 2) . ".";
            }
        }

        // 3️⃣ Per-entry anomaly checks
        foreach ($allEntries as $entry) {
            if ($entry->percent < 0 || $entry->percent > 100) {
                $warnings[] = "Entry '{$entry->sl_no}' has invalid percent value ({$entry->percent}%).";
            }
            if ($entry->amount < 0) {
                $warnings[] = "Entry '{$entry->sl_no}' has a negative amount.";
            }
        }
    }

    return view('admin.epcentry_data.index', compact(
        'subProjects',
        'epcEntries',
        'subProject',
        'selectedProjectId',
        'remainingPercent',
        'remainingAmount',
        'warnings'
    ));
}



    // Show create form
    public function create(Request $request)
    {
        $subProject = null;
        if ($request->has('sub_package_project_id')) {
            $subProject = SubPackageProject::findOrFail($request->sub_package_project_id);
        }

        return view('admin.epcentry_data.create', compact('subProject'));
    }

    // Store single or multiple EPC entries
    public function store(Request $request)
    {
        // Bulk insert mode (entries array provided)
        if ($request->has('entries') && is_array($request->entries)) {
            $validated = $request->validate([
                'sub_package_project_id' => 'required|exists:sub_package_projects,id',
                'entries' => 'required|array|min:1',
                'entries.*.sl_no' => 'required|string|max:255',
                'entries.*.item_description' => 'required|string',
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

        // Single insert mode
        $validated = $request->validate([
            'sub_package_project_id' => 'required|exists:sub_package_projects,id',
            'sl_no' => 'required|string|max:255',
            'item_description' => 'required|string',
            'percent' => 'nullable|numeric|min:0|max:100',
            'amount' => 'nullable|numeric|min:0',
        ]);

        EpcEntryData::create($validated);

        return redirect()
            ->route('admin.epcentry_data.index', ['sub_package_project_id' => $validated['sub_package_project_id']])
            ->with('success', 'EPC entry created successfully.');
    }

    // Show edit form
    public function edit($id)
    {
        $entry = EpcEntryData::findOrFail($id);
        $subProjects = SubPackageProject::select('id', 'name')->get();

        return view('admin.epcentry_data.edit', compact('entry', 'subProjects'));
    }

    // Update EPC entry
    public function update(Request $request, $id)
    {
        $entry = EpcEntryData::findOrFail($id);

        $validated = $request->validate([
            'sub_package_project_id' => 'required|exists:sub_package_projects,id',
            'sl_no' => 'required|string|max:255',
            'item_description' => 'required|string',
            'percent' => 'nullable|numeric|min:0|max:100',
            'amount' => 'nullable|numeric|min:0',
        ]);

        $entry->update($validated);

        return redirect()
            ->route('admin.epcentry_data.index', ['sub_package_project_id' => $validated['sub_package_project_id']])
            ->with('success', 'EPC entry updated successfully.');
    }

    // Bulk delete EPC entries
    // Bulk delete (permanent)
    public function bulkDestroy(Request $request)
    {
        $request->validate([
            'ids' => 'required|array|min:1',
            'ids.*' => 'exists:epcentry_data,id',
        ]);

        $ids = $request->input('ids');

        try {
            // Force delete permanently
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

    // Single delete (soft delete)
    public function destroy($id)
    {
        $entry = EpcEntryData::findOrFail($id);
        $projectId = $entry->sub_package_project_id;

        $entry->delete(); // Soft delete

        return redirect()
            ->route('admin.epcentry_data.index', ['sub_package_project_id' => $projectId])
            ->with('success', 'EPC entry deleted (soft delete).');
    }
}
