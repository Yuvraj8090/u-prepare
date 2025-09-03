<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\PackageProject;
use App\Models\PackageProjectAssignment;
use App\Models\User;
use App\Models\SubDepartment;
use Illuminate\Http\Request;

class PackageProjectAssignmentController extends Controller
{
    /**
     * Show all assignments
     */
    public function index()
{
    // Get all projects with their assignments, assignee & assigner
    $projects = PackageProject::with([
        'assignments.assignee',
        'assignments.assigner',
    ])
    ->latest()
    ->get();

    return view('admin.package_project_assignments.index', compact('projects'));
}


    /**
     * Show form to assign a project
     */
    public function create()
{
    $departments = \App\Models\Department::select('id', 'name')->get();
    $users = User::select('id', 'name')->get();
    $subDepartments = SubDepartment::select('id', 'name', 'department_id')->get();

    // Projects will be loaded via AJAX based on department selection
    $projects = collect();

    return view('admin.package_project_assignments.create', compact('departments', 'users', 'subDepartments', 'projects'));
}
public function getProjectsByDepartment($departmentId)
{
    $projects = PackageProject::basicInfo()
        ->where('department_id', $departmentId)
        ->get();

    return response()->json($projects);
}


    /**
     * Store a new assignment
     */
    public function store(Request $request)
{
    $request->validate([
        'package_project_ids' => 'required|array|min:1', // bulk project support
        'package_project_ids.*' => 'exists:package_projects,id',
        'assigned_to' => 'nullable|exists:users,id',
        'sub_department_id' => 'nullable|exists:sub_departments,id',
    ]);

    $projectIds = $request->package_project_ids;

    // ✅ Case 1: assign to specific user
    if ($request->filled('assigned_to')) {
        foreach ($projectIds as $projectId) {
            PackageProjectAssignment::firstOrCreate(
                [
                    'package_project_id' => $projectId,
                    'assigned_to' => $request->assigned_to,
                ],
                [
                    'assigned_by' => auth()->id(),
                ],
            );
        }

        return redirect()
            ->route('admin.package-project-assignments.index')
            ->with('success', 'Project(s) assigned to user successfully.');
    }

    // ✅ Case 2: assign to all users in a sub-department
    if ($request->filled('sub_department_id')) {
        $subDept = SubDepartment::with('users')->find($request->sub_department_id);

        if (!$subDept || $subDept->users->isEmpty()) {
            return back()->with('error', 'No users found in this sub-department.');
        }

        foreach ($projectIds as $projectId) {
            foreach ($subDept->users as $user) {
                PackageProjectAssignment::firstOrCreate(
                    [
                        'package_project_id' => $projectId,
                        'assigned_to' => $user->id,
                    ],
                    [
                        'assigned_by' => auth()->id(),
                    ],
                );
            }
        }

        return redirect()
            ->route('admin.package-project-assignments.index')
            ->with('success', 'Project(s) assigned to all users in sub-department successfully.');
    }

    return back()->with('error', 'Please select either a user or a sub-department.');
}


    /**
     * Delete an assignment
     */
    public function destroy(PackageProjectAssignment $packageProjectAssignment)
    {
        $packageProjectAssignment->delete();

        return back()->with('success', 'Assignment removed successfully.');
    }
}
