<?php

namespace App\Http\Controllers;

use App\Models\Department;
use App\Models\PackageComponent;
use App\Models\PackageProject;

class DashboardController extends Controller
{
    public function index()
    {
        $departments = Department::select('id','name','budget')->get()->map(fn($d)=> $d->budget ??= 0);
        $components  = PackageComponent::select('id','name','budget')->get()->map(fn($c)=> $c->budget ??= 0);
        $projects    = PackageProject::with(['department','packageComponent'])->get();

        $totalProjectBudget = $projects->sum('estimated_budget_incl_gst');

        $projectsByDepartment = $projects->groupBy('department.name')->map(fn($group)=> [
            'count'=>$group->count(),
            'budget'=>$group->sum('estimated_budget_incl_gst')
        ]);

        $monthlyBudget = $projects->groupBy(fn($p)=> $p->dec_approval_date?->format('Y-m') ?? 'N/A')
                                  ->map(fn($group)=> $group->sum('estimated_budget_incl_gst'));

        $budgetVsActual = $projects->map(fn($p)=> [
            'name'=>$p->package_name,
            'budget'=>$p->estimated_budget_incl_gst,
            'actual'=>$p->actual_spending ?? 0
        ]);

        $sCurveData = $projects->sortBy('dec_approval_date')
            ->map(fn($p)=> [
                'date'=>$p->dec_approval_date?->format('Y-m-d') ?? 'N/A',
                'cumulative_budget'=>$projects->where('dec_approval_date','<=',$p->dec_approval_date)
                                            ->sum('estimated_budget_incl_gst')
            ])->values();

        return view('admin.dashboard', compact(
            'departments','components','projects',
            'projectsByDepartment','monthlyBudget','budgetVsActual','sCurveData'
        ));
    }
}
