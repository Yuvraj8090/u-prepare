<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\PackageProject;
use App\Models\PackageProjectAssignment;
use App\Models\User;
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
            ->paginate(15);

        return view('admin.package_project_assignments.index', compact('assignments'));
    }

    /**
     * Show form to assign a project
     */
    public function create()
    {
        $projects = PackageProject::basicInfo()->get();
        $users = User::select('id', 'name')->get();

        return view('admin.package_project_assignments.create', compact('projects', 'users'));
    }

    /**
     * Store a new assignment
     */
    public function store(Request $request)
    {
        $request->validate([
            'package_project_id' => 'required|exists:package_projects,id',
            'assigned_to' => 'required|exists:users,id',
        ]);

        PackageProjectAssignment::create([
            'package_project_id' => $request->package_project_id,
            'assigned_to' => $request->assigned_to,
            'assigned_by' => auth()->id(),
        ]);

        return redirect()->route('admin.package-project-assignments.index')
            ->with('success', 'Project assigned successfully.');
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
