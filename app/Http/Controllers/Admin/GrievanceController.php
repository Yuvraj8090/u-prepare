<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Grievance;
use Illuminate\Http\Request;

class GrievanceController extends Controller
{
    /**
     * Display a listing of grievances with filters & pagination.
     */
    public function index(Request $request)
    {
        $query = Grievance::query();

        // ✅ Apply filters
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

        // ✅ Paginate
        $grievances = $query->latest()->get();

        // ✅ Summary counts
        $total    = Grievance::count();
        $pending  = Grievance::where('status', 'pending')->count();
        $resolved = Grievance::where('status', 'resolved')->count();
        $rejected = Grievance::where('status', 'rejected')->count();

        // ✅ Distinct filter options
        $districts = Grievance::distinct()->pluck('district')->filter()->toArray();
        $relatedToOptions = Grievance::distinct()->pluck('grievance_related_to')->filter()->toArray();

        return view('admin.grievances.index', compact(
            'grievances',
            'total',
            'pending',
            'resolved',
            'rejected',
            'districts',
            'relatedToOptions'
        ));
    }

    /**
     * Show the form for creating a new grievance.
     */
    public function create()
    {
        return view('admin.grievances.create');
    }

    /**
     * Store a newly created grievance.
     */
    public function store(Request $request)
    {
        $request->validate([
            'full_name' => 'required|string|max:255',
            'grievance_related_to' => 'required|string|max:255',
            'nature_of_complaint' => 'required|string|max:500',
            'status' => 'nullable|string|in:pending,in-progress,resolved,rejected',
        ]);

        Grievance::create($request->all());

        return redirect()->route('admin.grievances.index')
            ->with('success', 'Grievance created successfully.');
    }

    /**
     * Show a grievance.
     */
   public function show($grievance_no)
{
    $grievance = Grievance::where('grievance_no', $grievance_no)->firstOrFail();
    return view('admin.grievances.show', compact('grievance'));
}


    /**
     * Show the form for editing a grievance.
     */
    public function edit(Grievance $grievance)
    {
        return view('admin.grievances.edit', compact('grievance'));
    }

    /**
     * Update a grievance.
     */
    public function update(Request $request, Grievance $grievance)
    {
        $request->validate([
            'full_name' => 'required|string|max:255',
            'grievance_related_to' => 'required|string|max:255',
            'nature_of_complaint' => 'required|string|max:500',
            'status' => 'nullable|string|in:pending,in-progress,resolved,rejected',
        ]);

        $grievance->update($request->all());

        return redirect()->route('admin.grievances.index')
            ->with('success', 'Grievance updated successfully.');
    }

    /**
     * Delete a grievance.
     */
    public function destroy(Grievance $grievance)
    {
        $grievance->delete();

        return redirect()->route('admin.grievances.index')
            ->with('success', 'Grievance deleted successfully.');
    }
}
