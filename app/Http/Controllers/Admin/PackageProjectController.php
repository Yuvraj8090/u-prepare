<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\StorePackageProjectRequest;
use App\Http\Requests\Admin\UpdatePackageProjectRequest;
use App\Models\{
    PackageProject,
    Project,
    ProjectsCategory,
    SubCategory,
    Department,
    Assembly,
    Constituency,
    GeographyDistrict,
    GeographyBlock,
    PackageComponent,
    Contract
};
use Illuminate\Http\RedirectResponse;
use Illuminate\Support\Facades\Storage;
use Illuminate\View\View;

class PackageProjectController extends Controller
{
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
                'procurementDetail:id,package_project_id,method_of_procurement,type_of_procurement_id,publication_date',
                'workPrograms:id,package_project_id,procurement_details_id,name_work_program,weightage,days,start_date,planned_date',
                'subProjects:id,project_id,name',
            ])
            ->withCount('workPrograms')
            ->latest()
            ->get();

        return view('admin.package-projects.index', compact('packageProjects'));
    }

    public function create(): View
    {
        return view('admin.package-projects.create', $this->formData());
    }

    public function store(StorePackageProjectRequest $request): RedirectResponse
    {
        $data = $request->validated();

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
    }

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

        $contract = Contract::withBasicRelations()
            ->where('project_id', $packageProject->id)
            ->first();

        return view('admin.package-projects.show', compact('packageProject', 'contract'));
    }

  public function edit(PackageProject $packageProject): View
{
  // <-- this will show all fields, including DEC/HPC dates
  $projects       = Project::select('id', 'name', 'budget')->get();
            $categories    = ProjectsCategory::all();
            $subCategories  = SubCategory::all();
            $departments   = Department::all();
            $constituencies = Constituency::all();
            $districts    = GeographyDistrict::all();
            $blocks      = GeographyBlock::all();
            $components     = PackageComponent::all();
            $assembly = Assembly::all();
    return view('admin.package-projects.edit',compact('assembly','packageProject','projects','categories','subCategories','departments','constituencies','districts','blocks','components'));
}


    public function update(UpdatePackageProjectRequest $request, PackageProject $packageProject): RedirectResponse
    {
        $data = $request->validated();

        if ($request->hasFile('dec_document_path')) {
            Storage::disk('public')->delete($packageProject->dec_document_path);
            $data['dec_document_path'] = $request->file('dec_document_path')->store('package-projects/dec-documents', 'public');
        }

        if ($request->hasFile('hpc_document_path')) {
            Storage::disk('public')->delete($packageProject->hpc_document_path);
            $data['hpc_document_path'] = $request->file('hpc_document_path')->store('package-projects/hpc-documents', 'public');
        }

        $packageProject->update($data);

        return redirect()
            ->route('admin.package-projects.index')
            ->with('success', 'Package project updated successfully.');
    }

    public function destroy(PackageProject $packageProject): RedirectResponse
    {
        Storage::disk('public')->delete([
            $packageProject->dec_document_path,
            $packageProject->hpc_document_path,
        ]);

        $packageProject->delete();

        return redirect()
            ->route('admin.package-projects.index')
            ->with('success', 'Package project deleted successfully.');
    }

    /**
     * Shared form data for create/edit views
     */
    private function formData(): array
    {
        return [
            'projects'       => Project::select('id', 'name', 'budget')->get(),
            'categories'     => ProjectsCategory::all(),
            'subCategories'  => SubCategory::all(),
            'departments'    => Department::all(),
            'constituencies' => Constituency::all(),
            'districts'      => GeographyDistrict::all(),
            'blocks'         => GeographyBlock::all(),
            'components'     => PackageComponent::all(),
        ];
    }
}
