<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\ProcurementWorkProgram;
use App\Models\PackageProject;
use App\Models\ProcurementDetail;
use Illuminate\Http\Request;

class ProcurementWorkProgramController extends Controller
{
    public function index()
    {
        $packageProjects = PackageProject::with(['procurementDetail', 'workPrograms'])
            ->latest()
            ->get();

        foreach ($packageProjects as $project) {
            $project->has_work_program = $project->workPrograms->isNotEmpty();
        }

        return view('admin.procurement_work_programs.index', compact('packageProjects'));
    }

public function create(Request $request)
{
    $packageProjects = PackageProject::all();

    // Optionally get only procurement details relevant to a selected package
    $procurementDetails = ProcurementDetail::when($request->package_project_id, function ($query) use ($request) {
        $query->where('package_project_id', $request->package_project_id);
    })->get();

    return view('admin.procurement_work_programs.create', [
        'packageProjects' => $packageProjects,
        'procurementDetails' => $procurementDetails,
        'selectedPackageProjectId' => $request->package_project_id,
    ]);
}


   public function store(Request $request)
{
    $data = $request->validate([
        'package_project_id' => 'required|array|min:1',
        'package_project_id.*' => 'required|exists:package_projects,id',

        'procurement_details_id' => 'required|array|min:1',
        'procurement_details_id.*' => 'required|exists:procurement_details,id',

        'name_work_program' => 'required|array|min:1',
        'name_work_program.*' => 'required|string|max:255',

        'weightage' => 'required|array|min:1',
        'weightage.*' => 'required|numeric|min:0|max:100',

        'days' => 'nullable|array',
        'days.*' => 'nullable|integer|min:0',

        'start_date' => 'nullable|array',
        'start_date.*' => 'nullable|date',

        'planned_date' => 'nullable|array',
        'planned_date.*' => 'nullable|date',
    ]);

    $count = count($data['name_work_program']);

    // Ensure total weightage is 100%
    $totalWeightage = array_sum($data['weightage']);
    if ($totalWeightage !== 100) {
        return redirect()->back()
            ->withInput()
            ->withErrors(['weightage' => 'The total weightage must be exactly 100%.']);
    }

    for ($i = 0; $i < $count; $i++) {
        ProcurementWorkProgram::create([
            'package_project_id' => $data['package_project_id'][0],
            'procurement_details_id' => $data['procurement_details_id'][0],
            'name_work_program' => $data['name_work_program'][$i],
            'weightage' => $data['weightage'][$i],
            'days' => $data['days'][$i] ?? null,
            'start_date' => $data['start_date'][$i] ?? null,
            'planned_date' => $data['planned_date'][$i] ?? null,
        ]);
    }

    return redirect()->route('admin.procurement-work-programs.index')
        ->with('success', 'Work programs created successfully.');
}


    public function edit(ProcurementWorkProgram $procurementWorkProgram)
    {
        $packageProjects = PackageProject::all();
        $procurementDetails = ProcurementDetail::all();

        return view('admin.procurement_work_programs.edit', compact(
            'procurementWorkProgram',
            'packageProjects',
            'procurementDetails'
        ));
    }

    public function update(Request $request, ProcurementWorkProgram $procurementWorkProgram)
    {
        $validated = $request->validate([
            'package_project_id' => 'required|exists:package_projects,id',
            'procurement_details_id' => 'required|exists:procurement_details,id',
            'name_work_program' => 'required|string|max:255',
            'weightage' => 'required|numeric|min:0|max:100',
            'days' => 'nullable|integer|min:0',
            'start_date' => 'nullable|date',
            'planned_date' => 'nullable|date',
        ]);

        $procurementWorkProgram->update($validated);

        return redirect()->route('admin.procurement-work-programs.index')
            ->with('success', 'Work Program updated successfully.');
    }

    public function destroy(ProcurementWorkProgram $procurementWorkProgram)
    {
        $procurementWorkProgram->delete();

        return redirect()->route('admin.procurement-work-programs.index')
            ->with('success', 'Work Program deleted successfully.');
    }
}
