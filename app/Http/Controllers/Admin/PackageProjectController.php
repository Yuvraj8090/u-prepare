<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\StorePackageProjectRequest;
use App\Http\Requests\Admin\UpdatePackageProjectRequest;
use App\Models\PackageProject;
use Illuminate\Http\RedirectResponse;
use Illuminate\Support\Facades\Storage;
use Illuminate\View\View;

class PackageProjectController extends Controller
{
    /**
     * Display a listing of package projects with related data.
     */
    public function index(): View
    {
        $packageProjects = PackageProject::with([
            'project:id,name,budget',
            'category:id,name',
            'subCategory:id,name',
            'department:id,name',
            'vidhanSabha:id,name',
            'lokSabha:id,name',
            'district:id,name',
            'block:id,name',
            'procurementDetail:id,package_project_id,method_of_procurement,type_of_procurement,publication_date',
            'workPrograms:id,package_project_id,procurement_details_id,name_work_program,weightage,days,start_date,planned_date',
            'subProjects:id,project_id,name',
        ])
        ->withCount('workPrograms') // quick info: how many work programs exist
        ->latest()
        ->paginate(10);

        return view('admin.package-projects.index', compact('packageProjects'));
    }

    /**
     * Show the form for creating a new package project.
     */
    public function create(): View
    {
        return view('admin.package-projects.create', [
            'projects'       => \App\Models\Project::select('id', 'name', 'budget')->get(),
            'categories'     => \App\Models\ProjectsCategory::all(),
            'subCategories'  => \App\Models\SubCategory::all(),
            'departments'    => \App\Models\Department::all(),
            'constituencies' => \App\Models\Constituency::all(),
            'districts'      => \App\Models\GeographyDistrict::all(),
            'blocks'         => \App\Models\GeographyBlock::all(),
        ]);
    }

    /**
     * Store a newly created package project.
     */
    public function store(StorePackageProjectRequest $request): RedirectResponse
    {
        try {
            $data = $request->validated();

            // Handle file uploads
            if ($request->hasFile('dec_document_path')) {
                $data['dec_document_path'] = $request->file('dec_document_path')->store('package-projects/dec-documents', 'public');
            }
            if ($request->hasFile('hpc_document_path')) {
                $data['hpc_document_path'] = $request->file('hpc_document_path')->store('package-projects/hpc-documents', 'public');
            }

            PackageProject::create($data);

            return redirect()
                ->route('admin.package-projects.index')
                ->with('success', 'Package project created successfully.');
        } catch (\Exception $e) {
            return back()
                ->withInput()
                ->with('error', 'Error creating package project: ' . $e->getMessage());
        }
    }

    /**
     * Display the specified package project with all related details.
     */
    public function show(PackageProject $packageProject): View
    {
        $packageProject->load([
            'project:id,name,budget',
            'category:id,name',
            'subCategory:id,name',
            'department:id,name',
            'vidhanSabha:id,name',
            'lokSabha:id,name',
            'district:id,name',
            'block:id,name',
            'procurementDetail',
            'workPrograms',
            'subProjects:id,project_id,name',
        ]);

        // Load contract separately for clarity
        $contract = \App\Models\Contract::withBasicRelations()
            ->where('project_id', $packageProject->id)
            ->first();

        return view('admin.package-projects.show', compact('packageProject', 'contract'));
    }

    /**
     * Show the form for editing the specified package project.
     */
    public function edit(PackageProject $packageProject): View
    {
        return view('admin.package-projects.edit', [
            'packageProject' => $packageProject,
            'projects'       => \App\Models\Project::select('id', 'name', 'budget')->get(),
            'categories'     => \App\Models\ProjectsCategory::all(),
            'subCategories'  => \App\Models\SubCategory::all(),
            'departments'    => \App\Models\Department::all(),
            'constituencies' => \App\Models\Constituency::all(),
            'districts'      => \App\Models\GeographyDistrict::all(),
            'blocks'         => \App\Models\GeographyBlock::all(),
        ]);
    }

    /**
     * Update the specified package project.
     */
    public function update(UpdatePackageProjectRequest $request, PackageProject $packageProject): RedirectResponse
    {
        try {
            $data = $request->validated();

            // Handle file updates
            if ($request->hasFile('dec_document_path')) {
                if ($packageProject->dec_document_path) {
                    Storage::disk('public')->delete($packageProject->dec_document_path);
                }
                $data['dec_document_path'] = $request->file('dec_document_path')->store('package-projects/dec-documents', 'public');
            }
            if ($request->hasFile('hpc_document_path')) {
                if ($packageProject->hpc_document_path) {
                    Storage::disk('public')->delete($packageProject->hpc_document_path);
                }
                $data['hpc_document_path'] = $request->file('hpc_document_path')->store('package-projects/hpc-documents', 'public');
            }

            $packageProject->update($data);

            return redirect()
                ->route('admin.package-projects.index')
                ->with('success', 'Package project updated successfully.');
        } catch (\Exception $e) {
            return back()
                ->withInput()
                ->with('error', 'Error updating package project: ' . $e->getMessage());
        }
    }

    /**
     * Remove the specified package project.
     */
    public function destroy(PackageProject $packageProject): RedirectResponse
    {
        try {
            if ($packageProject->dec_document_path) {
                Storage::disk('public')->delete($packageProject->dec_document_path);
            }
            if ($packageProject->hpc_document_path) {
                Storage::disk('public')->delete($packageProject->hpc_document_path);
            }

            $packageProject->delete();

            return redirect()
                ->route('admin.package-projects.index')
                ->with('success', 'Package project deleted successfully.');
        } catch (\Exception $e) {
            return back()
                ->with('error', 'Error deleting package project: ' . $e->getMessage());
        }
    }
}
