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
        $assignments = PackageProjectAssignment::with(['project', 'assignee', 'assigner'])
            ->latest()
            ->get();

        return view('admin.package_project_assignments.index', compact('assignments'));
    }

    /**
     * Show form to assign a project
     */
    public function create()
    {
        $projects = PackageProject::basicInfo()->get();
        $users = User::select('id', 'name')->get();
        $subDepartments = \App\Models\SubDepartment::select('id', 'name')->get();

        return view('admin.package_project_assignments.create', compact('projects', 'users', 'subDepartments'));
    }

    /**
     * Store a new assignment
     */
    public function store(Request $request)
    {
        $request->validate([
            'package_project_id' => 'required|exists:package_projects,id',
            'assigned_to' => 'nullable|exists:users,id',
            'sub_department_id' => 'nullable|exists:sub_departments,id',
        ]);

        // ✅ Case 1: assign to specific user
        if ($request->filled('assigned_to')) {
            PackageProjectAssignment::create([
                'package_project_id' => $request->package_project_id,
                'assigned_to' => $request->assigned_to,
                'assigned_by' => auth()->id(),
            ]);

            return redirect()->route('admin.package-project-assignments.index')->with('success', 'Project assigned to user successfully.');
        }

        // ✅ Case 2: assign to all users in a sub-department
        if ($request->filled('sub_department_id')) {
            $subDept = SubDepartment::with('users')->find($request->sub_department_id);

            if (!$subDept || $subDept->users->isEmpty()) {
                return back()->with('error', 'No users found in this sub-department.');
            }

            foreach ($subDept->users as $user) {
                PackageProjectAssignment::firstOrCreate(
                    [
                        'package_project_id' => $request->package_project_id,
                        'assigned_to' => $user->id,
                    ],
                    [
                        'assigned_by' => auth()->id(),
                    ],
                );
            }

            return redirect()->route('admin.package-project-assignments.index')->with('success', 'Project assigned to all users in sub-department successfully.');
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
