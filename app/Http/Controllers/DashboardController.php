<?php

namespace App\Http\Controllers;

use App\Models\Department;
use App\Models\PackageComponent;
use App\Models\PackageProject;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
    /**
     * Show the main dashboard page with aggregated data and enhanced visualizations.
     */
    public function index()
    {
        // ==========================
        // 1. Department Data
        // ==========================
        $departments = Department::select('id', 'name', 'budget')->get();
        $departments->map(fn($d) => $d->budget = $d->budget ?? 0);
        $totalDepartmentBudget = $departments->sum('budget');

        // ==========================
        // 2. Package Components Data
        // ==========================
        $components = PackageComponent::select('id', 'name', 'budget')->get();
        $components->map(fn($c) => $c->budget = $c->budget ?? 0);
        $totalComponentBudget = $components->sum('budget');

        // ==========================
        // 3. Package Projects Data
        // ==========================
        $projects = PackageProject::with([
            'department:id,name',
            'packageComponent:id,name',
            'category:id,name',
            'subCategory:id,name',
        ])->get();
        $totalProjectBudget = $projects->sum('estimated_budget_incl_gst');

        // ==========================
        // 4. Projects by Department (Pie/Donut/Bar options)
        // ==========================
        $projectsByDepartment = $projects->groupBy('department.name')->map(function ($group) {
            return [
                'count' => $group->count(),
                'budget' => $group->sum('estimated_budget_incl_gst')
            ];
        });

        // ==========================
        // 5. Monthly Budget Utilization
        // ==========================
        $monthlyBudget = $projects->groupBy(function ($project) {
            return $project->dec_approval_date?->format('Y-m') ?? 'N/A';
        })->map(fn($group) => $group->sum('estimated_budget_incl_gst'));

        // ==========================
        // 6. Budget vs Actual Spending
        // ==========================
        $budgetVsActual = $projects->map(fn($project) => [
            'name' => $project->package_name,
            'budget' => $project->estimated_budget_incl_gst,
            'actual' => $project->actual_spending ?? 0
        ]);

        // ==========================
        // 7. S-Curve Data (Cumulative Budget)
        // ==========================
        $sCurveData = $projects->sortBy('dec_approval_date')
            ->map(function ($project) use ($projects) {
                return [
                    'date' => $project->dec_approval_date?->format('Y-m-d') ?? 'N/A',
                    'cumulative_budget' => $projects->where('dec_approval_date', '<=', $project->dec_approval_date)
                        ->sum('estimated_budget_incl_gst')
                ];
            })->values();

        // ==========================
        // 8. Data for Tables with Percentage Columns
        // ==========================
        $projectsWithPercent = $projects->map(fn($project) => [
            'name' => $project->package_name,
            'budget' => $project->estimated_budget_incl_gst,
            'department' => $project->department?->name,
            'component' => $project->packageComponent?->name,
            'budget_percentage' => $totalProjectBudget > 0 ? round(($project->estimated_budget_incl_gst / $totalProjectBudget) * 100, 2) : 0,
        ]);

        return view('admin.dashboard', compact(
            'departments',
            'totalDepartmentBudget',
            'components',
            'totalComponentBudget',
            'projects',
            'totalProjectBudget',
            'projectsByDepartment',
            'monthlyBudget',
            'budgetVsActual',
            'sCurveData',
            'projectsWithPercent'
        ));
    }
}
