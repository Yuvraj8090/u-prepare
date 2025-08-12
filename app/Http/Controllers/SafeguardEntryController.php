<?php

namespace App\Http\Controllers;

use App\Models\SafeguardEntry;
use App\Models\SafeguardCompliance;
use App\Models\ContractionPhase;
use App\Models\SubPackageProject;
use App\Imports\SafeguardEntriesImport;
use Illuminate\Http\Request;
use Maatwebsite\Excel\Facades\Excel;

class SafeguardEntryController extends Controller
{
    /** List entries */
    public function index(Request $request)
    {
        $subProjects = SubPackageProject::select('id', 'name')->get();
        $selectedProjectId = $request->input('sub_package_project_id');
        $entries = collect();
        $subProject = null;

        $safeguardCompliances = SafeguardCompliance::all();
        $contractionPhases = ContractionPhase::all();

        if ($selectedProjectId) {
            $subProject = SubPackageProject::find($selectedProjectId);

            $entries = SafeguardEntry::with(['subPackageProject', 'safeguardCompliance', 'contractionPhase'])
                ->where('sub_package_project_id', $selectedProjectId)
                ->orderByRaw("CAST(SUBSTRING_INDEX(sl_no, '.', 1) AS UNSIGNED), sl_no")
                ->get()
                ->groupBy(function ($item) {
                    return explode('.', $item->sl_no)[0];
                });
        }

        return view('admin.safeguard_entries.index', compact('subProjects', 'entries', 'subProject', 'selectedProjectId', 'safeguardCompliances', 'contractionPhases'));
    }

    /** Import from Excel */
    public function import(Request $request)
    {
        $request->validate([
            'sub_package_project_id' => 'required|exists:sub_package_projects,id',
            'safeguard_compliance_id' => 'required|exists:safeguard_compliances,id',
            'contraction_phase_id' => 'required|exists:contraction_phases,id',
            'file' => 'required|mimes:xlsx,xls,csv',
        ]);

        Excel::import(new SafeguardEntriesImport($request->sub_package_project_id, $request->safeguard_compliance_id, $request->contraction_phase_id), $request->file('file'));

        return back()->with('success', 'Safeguard entries imported successfully.');
    }

    /** Show create form */
    public function create()
    {
        $compliances = SafeguardCompliance::all();
        $phases = ContractionPhase::all();
        $projects = SubPackageProject::all();

        return view('admin.safeguard_entries.create', compact('compliances', 'phases', 'projects'));
    }

    /** Store new entry */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'sub_package_project_id' => 'required|exists:sub_package_projects,id',
            'safeguard_compliance_id' => 'required|exists:safeguard_compliances,id',
            'contraction_phase_id' => 'required|exists:contraction_phases,id',
            'sl_no' => 'nullable|string|max:1000',
            'item_description' => 'nullable|string',
        ]);

        SafeguardEntry::create($validated);

        return redirect()
            ->route('admin.safeguard_entries.index', [
                'sub_package_project_id' => $validated['sub_package_project_id'],
            ])
            ->with('success', 'Safeguard entry created successfully.');
    }

    /** Show edit form */
    public function edit(SafeguardEntry $safeguardEntry)
    {
        $compliances = SafeguardCompliance::all();
        $phases = ContractionPhase::all();
        $projects = SubPackageProject::all();

        return view('admin.safeguard_entries.edit', compact('safeguardEntry', 'compliances', 'phases', 'projects'));
    }

    /** Update existing entry */
    public function update(Request $request, SafeguardEntry $safeguardEntry)
    {
        $validated = $request->validate([
            'sub_package_project_id' => 'required|exists:sub_package_projects,id',
            'safeguard_compliance_id' => 'required|exists:safeguard_compliances,id',
            'contraction_phase_id' => 'required|exists:contraction_phases,id',
            'sl_no' => 'nullable|string|max:1000',
            'item_description' => 'nullable|string',
        ]);

        $safeguardEntry->update($validated);

        return redirect()
            ->route('admin.safeguard_entries.index', [
                'sub_package_project_id' => $validated['sub_package_project_id'],
            ])
            ->with('success', 'Safeguard entry updated successfully.');
    }

    /** Delete single entry */
    public function destroy(SafeguardEntry $safeguardEntry)
    {
        $projectId = $safeguardEntry->sub_package_project_id;
        $safeguardEntry->delete();

        return redirect()
            ->route('admin.safeguard_entries.index', [
                'sub_package_project_id' => $projectId,
            ])
            ->with('success', 'Safeguard entry deleted successfully.');
    }

    /** Bulk delete */
    public function bulkDelete(Request $request)
    {
        $request->validate([
            'ids' => 'required|array',
            'ids.*' => 'exists:safeguard_entries,id',
            'sub_package_project_id' => 'required|exists:sub_package_projects,id',
        ]);

        SafeguardEntry::whereIn('id', $request->ids)->delete();

        return redirect()
            ->route('admin.safeguard_entries.index', [
                'sub_package_project_id' => $request->sub_package_project_id,
            ])
            ->with('success', 'Selected safeguard entries deleted successfully.');
    }
}
