<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\{Grievance, GrievanceLog, GrievanceAssignment, User};
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class GrievanceController extends Controller
{
    /**
     * Display grievances with filters & pagination.
     */
    public function index(Request $request)
    {
        $query = Grievance::query();

        // Filters
        if ($request->filled('search')) {
            $query->where('full_name', 'like', '%' . $request->search . '%');
        }
        if ($request->filled('district')) {
            $query->where('district', $request->district);
        }
        if ($request->filled('related_to')) {
            $query->where('grievance_related_to', $request->related_to);
        }
        if ($request->filled('status')) {
            $query->where('status', $request->status);
        }
        if ($request->filled('year')) {
            $query->whereYear('created_at', $request->year);
        }
        if ($request->filled('month')) {
            $query->whereMonth('created_at', $request->month);
        }

        $grievances = $query->latest()->paginate(20);

        // Stats
        $total    = Grievance::count();
        $pending  = Grievance::where('status', 'pending')->count();
        $resolved = Grievance::where('status', 'resolved')->count();
        $rejected = Grievance::where('status', 'rejected')->count();

        // Filters data
        $districts = Grievance::distinct()->pluck('district')->filter()->toArray();
        $relatedToOptions = Grievance::distinct()->pluck('grievance_related_to')->filter()->toArray();

        return view('admin.grievances.index', compact(
            'grievances', 'total', 'pending', 'resolved', 'rejected', 'districts', 'relatedToOptions'
        ));
    }

    /**
     * Show grievance details with logs & assignments.
     */
    public function show($grievance_no)
    {
        $users = User::all();
        $grievance = Grievance::with([
            'logs.user',
            'assignments.assignedUser',
            'assignments.assignedByUser'
        ])->where('grievance_no', $grievance_no)->firstOrFail();

        return view('admin.grievances.show', compact('grievance', 'users'));
    }

    /**
     * Store Log.
     */
    public function storeLog(Request $request, $grievance_id)
    {
        try {
            $request->validate([
                'title' => 'required|string|max:255',
                'remark' => 'nullable|string',
                'preliminary_action_taken' => 'nullable|string|max:500',
                'final_action_taken' => 'nullable|string|max:500',
            ]);

            $log = GrievanceLog::create([
                'grievance_id' => $grievance_id,
                'user_id' => auth()->id(),
                'title' => $request->title,
                'remark' => $request->remark,
                'preliminary_action_taken' => $request->preliminary_action_taken,
                'final_action_taken' => $request->final_action_taken,
            ]);

            return response()->json(['success' => true, 'message' => 'Log added successfully.', 'log' => $log]);
        } catch (\Exception $e) {
            Log::error("Error storing grievance log: " . $e->getMessage());
            return response()->json(['success' => false, 'message' => 'Failed to add log.'], 500);
        }
    }

    public function updateLog(Request $request, $id)
    {
        try {
            $request->validate([
                'title' => 'required|string|max:255',
                'remark' => 'nullable|string',
                'preliminary_action_taken' => 'nullable|string|max:500',
                'final_action_taken' => 'nullable|string|max:500',
            ]);

            $log = GrievanceLog::findOrFail($id);
            $log->update($request->all());

            return response()->json(['success' => true, 'message' => 'Log updated successfully.', 'log' => $log]);
        } catch (\Exception $e) {
            Log::error("Error updating grievance log: " . $e->getMessage());
            return response()->json(['success' => false, 'message' => 'Failed to update log.'], 500);
        }
    }

    public function destroyLog($id)
    {
        try {
            $log = GrievanceLog::findOrFail($id);
            $log->delete();

            return response()->json(['success' => true, 'message' => 'Log deleted successfully.']);
        } catch (\Exception $e) {
            Log::error("Error deleting grievance log: " . $e->getMessage());
            return response()->json(['success' => false, 'message' => 'Failed to delete log.'], 500);
        }
    }

    /**
     * Store Assignment.
     */
    public function storeAssignment(Request $request, $grievance_id)
    {
        try {
            $request->validate([
                'assigned_to' => 'required|integer|exists:users,id',
                'department'  => 'required|string|max:255',
            ]);

            $assignment = GrievanceAssignment::create([
                'grievance_id' => $grievance_id,
                'assigned_to'  => $request->assigned_to,
                'assigned_by'  => auth()->id(),
                'department'   => $request->department,
            ]);

            return response()->json(['success' => true, 'message' => 'Assignment added successfully.', 'assignment' => $assignment]);
        } catch (\Exception $e) {
            Log::error("Error storing grievance assignment: " . $e->getMessage());
            return response()->json(['success' => false, 'message' => 'Failed to add assignment.'], 500);
        }
    }

    public function updateAssignment(Request $request, $id)
    {
        try {
            $request->validate([
                'assigned_to' => 'required|integer|exists:users,id',
                'department'  => 'required|string|max:255',
            ]);

            $assignment = GrievanceAssignment::findOrFail($id);
            $assignment->update([
                'assigned_to' => $request->assigned_to,
                'department'  => $request->department,
            ]);

            return response()->json(['success' => true, 'message' => 'Assignment updated successfully.', 'assignment' => $assignment]);
        } catch (\Exception $e) {
            Log::error("Error updating grievance assignment: " . $e->getMessage());
            return response()->json(['success' => false, 'message' => 'Failed to update assignment.'], 500);
        }
    }

    public function destroyAssignment($id)
    {
        try {
            $assignment = GrievanceAssignment::findOrFail($id);
            $assignment->delete();

            return response()->json(['success' => true, 'message' => 'Assignment deleted successfully.']);
        } catch (\Exception $e) {
            Log::error("Error deleting grievance assignment: " . $e->getMessage());
            return response()->json(['success' => false, 'message' => 'Failed to delete assignment.'], 500);
        }
    }
}
