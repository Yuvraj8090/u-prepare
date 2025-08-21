<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Contract;
use App\Models\Contractor;
use App\Models\PackageProject;
use App\Models\SubPackageProject;
use App\Models\EpcEntryData;
use App\Models\BoqEntryData;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use Exception;

class ContractController extends Controller
{
    public function index()
    {
        $contracts = Contract::with(['project:id,package_name', 'contractor:id,company_name'])
            ->select('id', 'contract_number', 'project_id', 'contractor_id', 'contract_value', 'count_sub_project', 'signing_date')
            ->latest()
            ->get();
        $packageProjects = PackageProject::withWorkProgramData()->latest()->get();

        return view('admin.contracts.index', compact('contracts', 'packageProjects'));
    }

    public function create(Request $request)
    {
        $projects = PackageProject::select('id', 'package_name', 'package_number')->orderBy('package_name')->get();

        $contractors = Contractor::select('id', 'company_name', 'gst_no')->orderBy('company_name')->get();

        $packageProjects = PackageProject::basicInfo()->get();

        $contract = new Contract();
        $contract->contractor = new Contractor();
        $selectedPackageProjectId = null;

        if ($request->package_project_id) {
            // ✅ Check if a contract already exists
            $exists = Contract::where('project_id', $request->package_project_id)->exists();
            if ($exists) {
                return redirect()->back()->withInput()->with('error', 'A contract has already been created for the selected project.');
            }

            // Only fetch if not already used
            $selectedPackageProjectId = PackageProject::withWorkProgramData()->find($request->package_project_id);
        }

        return view('admin.contracts.create', compact('projects', 'contractors', 'contract', 'selectedPackageProjectId', 'packageProjects'));
    }

    public function store(Request $request)
    {
        $validated = $this->validateContract($request);

        try {
            DB::transaction(function () use ($validated, $request) {
                // Create contractor if not selected
                if (empty($validated['contractor_id']) && isset($validated['contractor'])) {
                    $validated['contractor_id'] = Contractor::create($validated['contractor'])->id;
                }

                // Handle file upload
                if ($request->hasFile('contract_document_file')) {
                    $validated['contract_document'] = $this->storeContractFile($request->file('contract_document_file'));
                }

                unset($validated['contractor'], $validated['contract_document_file']);

                // Create contract
                $contract = Contract::create($validated);

                $contract->load('project');

                // Handle sub-package project logic
                $this->handleSubProjects($contract, $request); // ✅ Pass both arguments
            });

            return redirect()->route('admin.contracts.index')->with('success', 'Contract created successfully.');
        } catch (Exception $e) {
            return back()
                ->withInput()
                ->withErrors(['error' => 'Failed to create contract: ' . $e->getMessage()]);
        }
    }
    public function show($id)
    {
        $contract = Contract::with(['project.procurementDetail.typeOfProcurement', 'contractor', 'subProjects'])->findOrFail($id);

        // Format contract numbers and dates
        $contract->formatted_value = number_format($contract->contract_value, 2);
        $contract->formatted_security = number_format($contract->security ?? 0, 2);
        $contract->formatted_signing_date = optional($contract->signing_date)->format('d M Y') ?? 'N/A';
        $contract->formatted_commencement_date = optional($contract->commencement_date)->format('d M Y') ?? 'N/A';
        $contract->formatted_initial_completion_date = optional($contract->initial_completion_date)->format('d M Y') ?? 'N/A';
        $contract->formatted_revised_completion_date = optional($contract->revised_completion_date)->format('d M Y') ?? 'N/A';

        // Get type name safely, default to 'EPC'
        $procurementTypeName = $contract->project->procurementDetail->typeOfProcurement->name ?? 'EPC';
        $procurementType = strtolower(trim($procurementTypeName));

        $subProjectsData = $contract->subProjects->map(function ($sp) use ($procurementType) {
            $actions = [];

            // 1. FINANCIAL PROGRESS
            $financeTotal = \App\Models\FinancialProgressUpdate::where('project_id', $sp->id)->sum('finance_amount');
            $financePercent = $sp->contract_value > 0 ? round(($financeTotal / $sp->contract_value) * 100, 2) : 0;

            // 2. PHYSICAL PROGRESS
            $physicalValue = 0;
            $physicalPercent = 0;

            if ($procurementType === 'epc') {
                $physicalValue = \App\Models\PhysicalEpcProgress::whereHas('epcentryData', function ($q) use ($sp) {
                    $q->where('sub_package_project_id', $sp->id);
                })->sum('amount');

                $physicalPercent = $sp->contract_value > 0 ? round(($physicalValue / $sp->contract_value) * 100, 2) : 0;
            } elseif ($procurementType === 'item-wise') {
                $physicalValue = \App\Models\PhysicalBoqProgress::where('sub_package_project_id', $sp->id)->sum('amount');

                $physicalPercent = $sp->contract_value > 0 ? round(($physicalValue / $sp->contract_value) * 100, 2) : 0;
            }

            // 3. ACTION BUTTONS
            if ($procurementType === 'epc') {
                $epcEntries = \App\Models\EpcEntryData::where('sub_package_project_id', $sp->id)->get();
                $totalPercent = $epcEntries->sum('percent');
                $totalAmount = $epcEntries->sum('amount');

                $hasCompleteEpcEntries = $epcEntries->count() > 0 && $totalPercent == 100;
                $amountMatchesContractValue = $totalAmount == $sp->contract_value;

                if ($hasCompleteEpcEntries) {
                    $actions[] = [
                        'label' => 'Modify Activities',
                        'icon' => 'fas fa-industry',
                        'class' => 'btn-success',
                        'route' => route('admin.epcentry_data.index', ['sub_package_project_id' => $sp->id]),
                    ];

                    if ($amountMatchesContractValue) {
                        $actions[] = [
                            'label' => 'Update Physical Progress',
                            'icon' => 'fas fa-hard-hat',
                            'class' => 'btn-info',
                            'route' => route('admin.physical_epc_progress.index', ['sub_package_project_id' => $sp->id]),
                        ];
                    }
                } else {
                    $actions[] = [
                        'label' => 'Define Activities',
                        'icon' => 'fas fa-industry',
                        'class' => 'btn-success',
                        'route' => route('admin.epcentry_data.index', ['sub_package_project_id' => $sp->id]),
                    ];
                }
            } elseif ($procurementType === 'item-wise') {
                $boqEntries = \App\Models\BoqEntryData::where('sub_package_project_id', $sp->id)->get();
                $totalAmount = $boqEntries->sum('amount');

                if ($boqEntries->count() > 0) {
                    $actions[] = [
                        'label' => 'Update BOQ Sheet',
                        'icon' => 'fas fa-file-invoice-dollar',
                        'class' => 'btn-primary',
                        'route' => route('admin.boqentry.index', ['sub_package_project_id' => $sp->id]),
                    ];

                    if ($totalAmount == $sp->contract_value) {
                        $actions[] = [
                            'label' => 'Update Physical Progress',
                            'icon' => 'fas fa-hard-hat',
                            'class' => 'btn-info',
                            'route' => route('admin.physical_itemwise_progress.index', ['sub_package_project_id' => $sp->id]),
                        ];
                    }
                } else {
                    $actions[] = [
                        'label' => 'Create BOQ Sheet',
                        'icon' => 'fas fa-file-invoice-dollar',
                        'class' => 'btn-primary',
                        'route' => route('admin.boqentry.index', ['sub_package_project_id' => $sp->id]),
                    ];
                }
            } else {
                // Default actions if unknown type
                $actions[] = [
                    'label' => 'Create BOQ Sheet',
                    'icon' => 'fas fa-file-invoice-dollar',
                    'class' => 'btn-primary',
                    'route' => route('admin.boqentry.index', ['sub_package_project_id' => $sp->id]),
                ];
                $actions[] = [
                    'label' => 'Create EPC Entry',
                    'icon' => 'fas fa-industry',
                    'class' => 'btn-success',
                    'route' => route('admin.epcentry_data.index', ['sub_package_project_id' => $sp->id]),
                ];
            }

            // Always add Financial Progress Update
            $actions[] = [
                'label' => 'Update Financial Progress',
                'icon' => 'fas fa-file-invoice-dollar',
                'class' => 'btn-secondary',
                'route' => route('admin.financial-progress-updates.index', ['sub_package_project_id' => $sp->id]),
            ];

            // Always add Safe Guard Entry
            $actions[] = [
                'label' => 'Create Environment Details',
                'icon' => 'fas fa-shield-alt',
                'class' => 'btn-warning',
                'route' => route('admin.safeguard_entries.index', ['sub_package_project_id' => $sp->id]),
            ];

            return [
                'id' => $sp->id,
                'name' => $sp->name,
                'contractValue' => number_format($sp->contract_value, 2),
                'financeTotal' => number_format($financeTotal, 2),
                'financePercent' => $financePercent,
                'physicalValue' => number_format($physicalValue, 2),
                'physicalPercent' => $physicalPercent,
                'actions' => $actions,
            ];
        });

        return view('admin.contracts.show', [
            'contract' => $contract,
            'subProjectsData' => $subProjectsData,
        ]);
    }

    public function edit(Contract $contract)
    {
        $projects = PackageProject::select('id', 'package_name', 'package_number')->get();
        $contractors = Contractor::select('id', 'company_name', 'gst_no')->get();

        $contract->load(['project', 'contractor']);

        return view('admin.contracts.edit', compact('contract', 'projects', 'contractors'));
    }

    public function update(Request $request, $id)
    {
        $contract = Contract::with('subProjects', 'project')->findOrFail($id);

        // Update contract itself
        $contract->update($request->only(['contract_number', 'contract_value', 'security', 'signing_date', 'commencement_date', 'initial_completion_date', 'revised_completion_date', 'actual_completion_date', 'count_sub_project']));

        // Update subprojects if applicable
        if ($contract->count_sub_project > 0) {
            $subProjects = $contract->subProjects;

            if ($subProjects->count() === 1) {
                $sp = $subProjects->first();
                $sp->update([
                    'name' => $sp->name ?? $contract->project->package_name,
                    'contract_value' => $contract->contract_value,
                ]);
            }
        }

        return redirect()->route('admin.contracts.index')->with('success', 'Contract updated successfully.');
    }

    public function destroy(Contract $contract)
    {
        try {
            DB::transaction(function () use ($contract) {
                $this->deleteContractFile($contract->contract_document);
                $contract->delete();
            });

            return redirect()->route('admin.contracts.index')->with('success', 'Contract deleted successfully.');
        } catch (Exception $e) {
            return back()->withErrors(['error' => 'Failed to delete contract: ' . $e->getMessage()]);
        }
    }

    /**
     * Create or update sub-package projects and sync count.
     */
    private function handleSubProjects(Contract $contract, Request $request)
    {
        // Remove old sub-projects for this contract's project
        SubPackageProject::where('project_id', $contract->project_id)->delete();

        $isMulti = $request->input('has_multiple_sub_projects') === 'yes';
        $contractValue = (float) $contract->contract_value;

        if (!$isMulti) {
            // Single sub-project mode
            $name = $request->input('sub_project_name') ?: $contract->project->package_name;
            $value = $request->input('sub_project_contract_value') ?: $contractValue;
            $lat = $request->input('lat'); // Nullable lat
            $long = $request->input('long'); // Nullable long

            SubPackageProject::create([
                'name' => $name,
                'contract_value' => $value,
                'project_id' => $contract->project_id,
                'lat' => $lat,
                'long' => $long,
            ]);
        } else {
            // Multiple sub-project mode
            $multiData = $request->input('multi_sub_projects', []);
            $count = max(count($multiData), 2); // Ensure at least 2

            // Default value per project if missing
            $defaultValue = $count > 0 ? round($contractValue / $count, 2) : 0;

            foreach ($multiData as $i => $sp) {
                SubPackageProject::create([
                    'name' => $sp['name'] ?: 'Sub Project ' . ($i + 1),
                    'contract_value' => isset($sp['value']) && $sp['value'] !== '' ? $sp['value'] : $defaultValue,
                    'project_id' => $contract->project_id,
                    'lat' => $sp['lat'] ?? null,
                    'long' => $sp['long'] ?? null,
                ]);
            }
        }

        // Update count on contract
        $contract->update([
            'count_sub_project' => SubPackageProject::where('project_id', $contract->project_id)->count(),
        ]);
    }

    private function storeContractFile($file)
    {
        $fileName = 'contract_' . time() . '_' . preg_replace('/\s+/', '_', $file->getClientOriginalName());
        return $file->storeAs('contracts', $fileName, 'public');
    }

    private function deleteContractFile($path)
    {
        if ($path && Storage::disk('public')->exists($path)) {
            Storage::disk('public')->delete($path);
        }
    }

    private function validateContract(Request $request, $id = null)
    {
        $rules = [
            'contract_number' => ['required', 'string', Rule::unique('contracts', 'contract_number')->ignore($id)],
            'project_id' => 'required|exists:package_projects,id',
            'contract_value' => 'required|numeric|min:0',
            'security' => 'nullable|numeric|min:0',
            'count_sub_project' => 'nullable|numeric|min:0',
            'signing_date' => 'nullable|date',
            'commencement_date' => 'nullable|date',
            'initial_completion_date' => 'nullable|date',
            'revised_completion_date' => 'nullable|date',
            'actual_completion_date' => 'nullable|date',
            'contractor_id' => $id ? 'required|exists:contractors,id' : 'nullable|exists:contractors,id',
            'contract_document_file' => 'nullable|file|mimes:pdf,doc,docx,xls,xlsx|max:5120',

            // Single sub-project lat/long (nullable, numeric)
            'lat' => 'nullable|numeric|between:-90,90',
            'long' => 'nullable|numeric|between:-180,180',

            // For multiple sub-projects: validate each item's lat/long as nullable numeric
            'multi_sub_projects.*.lat' => 'nullable|numeric|between:-90,90',
            'multi_sub_projects.*.long' => 'nullable|numeric|between:-180,180',
        ];

        if (!$id && !$request->filled('contractor_id')) {
            $rules = array_merge($rules, [
                'contractor.company_name' => 'required_without:contractor_id|string|max:255',
                'contractor.authorized_personnel_name' => 'required_without:contractor_id|string|max:255',
                'contractor.phone' => 'nullable|string|max:20|unique:contractors,phone',
                'contractor.email' => 'nullable|email|unique:contractors,email',
                'contractor.gst_no' => 'nullable|string|max:50|unique:contractors,gst_no',
                'contractor.address' => 'nullable|string|max:500',
            ]);
        }

        $messages = [
            'contractor.company_name.required_without' => 'Company Name is required if no contractor is selected.',
            'contractor.authorized_personnel_name.required_without' => 'Authorized Personnel Name is required if no contractor is selected.',
        ];

        return $request->validate($rules, $messages);
    }
}
