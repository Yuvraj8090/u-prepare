<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\PackageProject;
use Illuminate\Http\Request;

class PackageController extends Controller
{
    /**
     * Fetch all packages assigned to the authenticated user
     */
    public function assignedPackages(Request $request)
    {
        $user = $request->user();

        $packages = PackageProject::with([
            'department:id,name',
            'category:id,name',
            'subCategory:id,name',
            'contracts.contractor:id,company_name',
            'contracts.subProjects', // sub packages under contract
            'subProjects', // sub-packages even if not under contract
        ])
            ->when($user->role_id !== 1, function ($query) use ($user) {
                $query->whereHas('assignments', fn($q) => $q->where('assigned_to', $user->id));
            })
            ->get()
            ->map(function ($pkg) {
                return [
                    'id' => $pkg->id,
                    'package_name' => $pkg->package_name,
                    'status' => $pkg->status,
                    'estimated_budget_incl_gst' => $pkg->estimated_budget_incl_gst,
                    'department' => optional($pkg->department)->name,
                    'category' => optional($pkg->category)->name,
                    'sub_category' => optional($pkg->subCategory)->name,

                    // Contracts Info
                    'contracts' => $pkg->contracts->map(
                        fn($c) => [
                            'id' => $c->id,
                            'contract_number' => $c->contract_number,
                            'contract_value' => $c->contract_value,
                            'contractor' => optional($c->contractor)->company_name,
                            'signing_date' => $c->signing_date?->format('Y-m-d'),
                            'commencement_date' => $c->commencement_date?->format('Y-m-d'),
                            'initial_completion_date' => $c->initial_completion_date?->format('Y-m-d'),
                            'revised_completion_date' => $c->revised_completion_date?->format('Y-m-d'),
                            'actual_completion_date' => $c->actual_completion_date?->format('Y-m-d'),

                            // Sub Projects under contract
                            'sub_projects' => $c->subProjects->map(
                                fn($sp) => [
                                    'id' => $sp->id,
                                    'name' => $sp->name,
                                    'contract_value' => $sp->contract_value,
                                    'lat' => $sp->lat,
                                    'long' => $sp->long,
                                    'physical_progress' => $sp->physical_progress_percentage,
                                    'financial_progress' => $sp->financial_progress_percentage,
                                    'total_finance_amount' => $sp->total_finance_amount,
                                ],
                            ),
                        ],
                    ),
                ];
            });

        return response()->json([
            'user' => [
                'id' => $user->id,
                'name' => $user->name,
                'role_id' => $user->role_id,
            ],
            'packages' => $packages,
        ]);
    }
}
