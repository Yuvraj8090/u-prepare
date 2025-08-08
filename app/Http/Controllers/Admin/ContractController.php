<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Contract;
use App\Models\Contractor;
use App\Models\PackageProject;
use Illuminate\Http\Request;

class ContractController extends Controller
{
    public function index()
    {
        $contracts = Contract::with(['project', 'contractor'])->paginate(15);
        return view('admin.contracts.index', compact('contracts'));
    }

    public function create()
    {
        // You may want to send existing projects and contractors to select
        $projects = PackageProject::all();
        $contractors = Contractor::all();

        return view('admin.contracts.create', compact('projects', 'contractors'));
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'contract_number' => 'required|string|unique:contracts,contract_number',
            'project_id' => 'required|exists:package_projects,id',
            'contract_value' => 'required|numeric|min:0',
            'security' => 'nullable|numeric|min:0',
            'signing_date' => 'nullable|date',
            'commencement_date' => 'nullable|date',
            'initial_completion_date' => 'nullable|date',
            'revised_completion_date' => 'nullable|date',
            'actual_completion_date' => 'nullable|date',
            'contract_document' => 'nullable|string|max:255',

            // contractor fields or contractor_id
            'contractor_id' => 'nullable|exists:contractors,id',

            // If no contractor_id, contractor details required
            'contractor.company_name' => 'required_without:contractor_id|string|max:255',
            'contractor.authorized_personnel_name' => 'required_without:contractor_id|string|max:255',
            'contractor.phone' => 'nullable|string|max:20|unique:contractors,phone',
            'contractor.email' => 'nullable|email|unique:contractors,email',
            'contractor.gst_no' => 'nullable|string|max:50|unique:contractors,gst_no',
            'contractor.address' => 'nullable|string|max:500',
        ]);

        // If contractor_id not provided, create new Contractor
        if (empty($validated['contractor_id'])) {
            $contractorData = $validated['contractor'];
            $contractor = Contractor::create($contractorData);
            $validated['contractor_id'] = $contractor->id;
        }

        // Remove nested contractor array before creating Contract
        unset($validated['contractor']);

        Contract::create($validated);

        return redirect()->route('admin.contracts.index')->with('success', 'Contract created successfully.');
    }

    public function show(Contract $contract)
    {
        $contract->load(['project', 'contractor']);
        return view('admin.contracts.show', compact('contract'));
    }

    public function edit(Contract $contract)
    {
        $projects = PackageProject::all();
        $contractors = Contractor::all();

        $contract->load(['project', 'contractor']);

        return view('admin.contracts.edit', compact('contract', 'projects', 'contractors'));
    }

    public function update(Request $request, Contract $contract)
    {
        $validated = $request->validate([
            'contract_number' => 'required|string|unique:contracts,contract_number,' . $contract->id,
            'project_id' => 'required|exists:package_projects,id',
            'contract_value' => 'required|numeric|min:0',
            'security' => 'nullable|numeric|min:0',
            'signing_date' => 'nullable|date',
            'commencement_date' => 'nullable|date',
            'initial_completion_date' => 'nullable|date',
            'revised_completion_date' => 'nullable|date',
            'actual_completion_date' => 'nullable|date',
            'contract_document' => 'nullable|string|max:255',

            'contractor_id' => 'required|exists:contractors,id',
        ]);

        $contract->update($validated);

        return redirect()->route('admin.contracts.index')->with('success', 'Contract updated successfully.');
    }

    public function destroy(Contract $contract)
    {
        $contract->delete();
        return redirect()->route('admin.contracts.index')->with('success', 'Contract deleted successfully.');
    }
}
