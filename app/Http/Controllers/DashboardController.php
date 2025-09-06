<?php

namespace App\Http\Controllers;

use App\Models\Department;
use App\Models\PackageComponent;
use App\Models\PackageProject;
use App\Models\Contract;
use App\Models\TypeOfProcurement;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
    public function index()
    {
        // Departments with stats
        $departments = Department::withProjectAndContractStats()->withFinancialStats()->get();

        // Package Components
        $components = PackageComponent::select('id', 'name', 'budget')->get();

        // Contracts (soft delete safe)
        $contracts = Contract::withBasicRelations()->whereNull('deleted_at')->get();

        $typeOfProcurement = TypeOfProcurement::select('id', 'name', 'description')
            // Count of all packages under this type
            ->withCount([
                'procurementDetails as procurement_details_count' => function ($query) {
                    $query->join('package_projects', 'procurement_details.package_project_id', '=', 'package_projects.id');
                },

                // LOA Issued
                'procurementDetails as loa_issued_count' => function ($query) {
                    $query
                        ->join('package_projects', 'procurement_details.package_project_id', '=', 'package_projects.id')
                        ->join('procurement_work_programs', 'procurement_work_programs.procurement_details_id', '=', 'procurement_details.id')
                        ->leftJoin('contracts', function ($join) {
                            $join->on('contracts.project_id', '=', 'package_projects.id')->whereNull('contracts.deleted_at');
                        })
                        ->whereNull('contracts.id')
                        ->whereNotNull('procurement_work_programs.planned_date')
                        ->whereDate('procurement_work_programs.planned_date', '<=', now());
                },

                // LOA To Be Issued
                'procurementDetails as loa_to_be_issued_count' => function ($query) {
                    $query
                        ->join('package_projects', 'procurement_details.package_project_id', '=', 'package_projects.id')
                        ->join('procurement_work_programs', 'procurement_work_programs.procurement_details_id', '=', 'procurement_details.id')
                        ->leftJoin('contracts', function ($join) {
                            $join->on('contracts.project_id', '=', 'package_projects.id')->whereNull('contracts.deleted_at');
                        })
                        ->whereNull('contracts.id')
                        ->whereNotNull('procurement_work_programs.planned_date')
                        ->whereDate('procurement_work_programs.planned_date', '<=', now());
                },

                // Signed Contracts
                'procurementDetails as signed_contracts_count' => function ($query) {
                    $query->join('package_projects', 'procurement_details.package_project_id', '=', 'package_projects.id')->join('contracts', 'contracts.project_id', '=', 'package_projects.id')->whereNull('contracts.deleted_at')->whereNotNull('contracts.signing_date');
                },

                // Contract Pending
                'procurementDetails as contract_pending_count' => function ($query) {
                    $query
                        ->join('package_projects', 'procurement_details.package_project_id', '=', 'package_projects.id')
                        ->join('procurement_work_programs', 'procurement_work_programs.procurement_details_id', '=', 'procurement_details.id')
                        ->leftJoin('contracts', function ($join) {
                            $join->on('contracts.project_id', '=', 'package_projects.id')->whereNull('contracts.deleted_at');
                        })
                        ->whereNull('contracts.id');
                },

                // Commencement Given
                'procurementDetails as commencement_given_count' => function ($query) {
                    $query->join('package_projects', 'procurement_details.package_project_id', '=', 'package_projects.id')->join('contracts', 'contracts.project_id', '=', 'package_projects.id')->whereNull('contracts.deleted_at')->whereNotNull('contracts.commencement_date');
                },

                // ✅ Rebid Packages for this type
                'procurementDetails as rebid_count' => function ($query) {
                    $query->join('package_projects', 'procurement_details.package_project_id', '=', 'package_projects.id')->where('package_projects.status', PackageProject::STATUS_REBID)->whereColumn('procurement_details.type_of_procurement_id', 'type_of_procurements.id');
                },
            ])
            ->withSum(
                [
                    'procurementDetails as signed_contracts_value' => function ($query) {
                        $query->join('package_projects', 'procurement_details.package_project_id', '=', 'package_projects.id')->join('contracts', 'contracts.project_id', '=', 'package_projects.id')->whereNull('contracts.deleted_at')->whereNotNull('contracts.signing_date');
                    },
                ],
                'contracts.contract_value',
            )
            ->get();

        return view('admin.dashboard', compact('departments', 'components', 'contracts', 'typeOfProcurement'));
    }

    public function index2()
    {
        // Departments with stats
        $departments = Department::withProjectAndContractStats()->withFinancialStats()->get();

        // Package Components
        $components = PackageComponent::select('id', 'name', 'budget')->get();

        // Contracts
        $contracts = Contract::withBasicRelations()->get();

        // Type of Procurement
        $typeOfprocurement = TypeOfProcurement::select('id', 'name', 'description')->get();

        return view('admin.dashboard', compact('departments', 'components', 'contracts', 'typeOfprocurement'));
    }
}
