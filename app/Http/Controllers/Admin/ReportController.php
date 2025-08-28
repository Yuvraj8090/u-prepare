<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Contract;
use App\Models\PackageProject;
use App\Models\FinancialProgressUpdate;
use App\Models\PhysicalEpcProgress;
use App\Models\PhysicalBoqProgress;
use Illuminate\Http\Request;

class ReportController extends Controller
{
    public function index(Request $request)
    {
        // Eager load necessary relationships to avoid N+1 queries
       $packageProjects = PackageProject::with([
    'contracts.contractor:id,company_name',
    'contracts.subProjects',
    'contracts.project.procurementDetail',
    'contracts.project.category',
    'contracts.project.subCategory',
    'contracts.project.district',
    'contracts.project.block',
    'contracts.project.department',
])->latest()->get();

foreach ($packageProjects as $project) {
    foreach ($project->contracts as $contract) {
        // Financial progress
        $financeTotal = FinancialProgressUpdate::where('project_id', $contract->id)->sum('finance_amount');
        $contract->financial_progress = $contract->contract_value > 0
            ? round(($financeTotal / $contract->contract_value) * 100, 2)
            : 0;

        // Physical progress
        $epcPhysical = PhysicalEpcProgress::whereHas('epcentryData', function ($q) use ($contract) {
            $q->whereIn('sub_package_project_id', $contract->subProjects->pluck('id'));
        })->sum('amount');

        $boqPhysical = PhysicalBoqProgress::whereIn('sub_package_project_id', $contract->subProjects->pluck('id'))
            ->sum('amount');

        $contract->physical_progress = $contract->contract_value > 0
            ? round((($epcPhysical + $boqPhysical) / $contract->contract_value) * 100, 2)
            : 0;

        // Sub-projects
        foreach ($contract->subProjects as $sub) {
            $subFinanceTotal = FinancialProgressUpdate::where('project_id', $sub->id)->sum('finance_amount');
            $sub->financial_progress = $contract->contract_value > 0
                ? round(($subFinanceTotal / $contract->contract_value) * 100, 2)
                : 0;

            $subPhysical = PhysicalBoqProgress::where('sub_package_project_id', $sub->id)->sum('amount')
                + PhysicalEpcProgress::whereHas('epcentryData', fn($q) => $q->where('sub_package_project_id', $sub->id))->sum('amount');

            $sub->physical_progress = $contract->contract_value > 0
                ? round(($subPhysical / $contract->contract_value) * 100, 2)
                : 0;
        }
    }
}

return view('admin.reports.index', compact('packageProjects'));

    }
}
