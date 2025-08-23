<?php

namespace App\Http\Controllers;

use App\Models\Department;
use App\Models\PackageComponent;
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

        // Contracts
        $contracts = Contract::withBasicRelations()->get();

        // Type of Procurement with LOA, contract pending, and signed contracts stats
        $typeOfProcurement = TypeOfProcurement::select('id', 'name', 'description')
            ->withCount([
                // LOA issued: Planned date passed but contract not signed
                'procurementDetails as loa_issued_count' => function ($query) {
                    $query->join('package_projects', 'procurement_details.package_project_id', '=', 'package_projects.id')->join('procurement_work_programs', 'procurement_work_programs.procurement_details_id', '=', 'procurement_details.id')->leftJoin('contracts', 'contracts.project_id', '=', 'package_projects.id')->whereNull('contracts.id')->whereNotNull('procurement_work_programs.planned_date')->whereDate('procurement_work_programs.planned_date', '<=', now());
                },
                'procurementDetails as loa_to_be_issued_count' => function ($query) {
            $query->join('package_projects', 'procurement_details.package_project_id', '=', 'package_projects.id')
                  ->join('procurement_work_programs', 'procurement_work_programs.procurement_details_id', '=', 'procurement_details.id')
                  ->leftJoin('contracts', 'contracts.project_id', '=', 'package_projects.id')
                  ->whereNull('contracts.id') // Contract not yet signed
                  ->whereNotNull('procurement_work_programs.planned_date')
                  ->whereDate('procurement_work_programs.planned_date', '<=', now());
        },
                // Contracts signed
                'procurementDetails as signed_contracts_count' => function ($query) {
                    $query->join('package_projects', 'procurement_details.package_project_id', '=', 'package_projects.id')->join('contracts', 'contracts.project_id', '=', 'package_projects.id')->whereNull('contracts.deleted_at')->whereNotNull('contracts.signing_date');
                },
                // Contract signing pending: Work program done but contract not signed
                'procurementDetails as contract_pending_count' => function ($query) {
                    $query->join('package_projects', 'procurement_details.package_project_id', '=', 'package_projects.id')->join('procurement_work_programs', 'procurement_work_programs.procurement_details_id', '=', 'procurement_details.id')->leftJoin('contracts', 'contracts.project_id', '=', 'package_projects.id')->whereNull('contracts.id');
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
