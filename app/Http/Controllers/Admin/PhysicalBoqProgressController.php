<?php
namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\PhysicalBoqProgress;
use App\Models\BoqEntryData;
use App\Models\SubPackageProject;
use App\Models\MediaFile;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Validation\Rule;

class PhysicalBoqProgressController extends Controller
{
    public function index(Request $request)
    {
        $subProjects = SubPackageProject::select('id', 'name')->get();
        $selectedProjectId = $request->input('sub_package_project_id');
        $selectedDate = $request->input('date', now()->format('Y-m-d'));

        $subProject = null;
        $boqEntries = collect();
        $physicalProgress = collect();

        if ($selectedProjectId) {
            $subProject = SubPackageProject::find($selectedProjectId);

            // Fetch BOQ entries
            $boqEntries = BoqEntryData::where('sub_package_project_id', $selectedProjectId)
                ->orderByRaw("CAST(SUBSTRING_INDEX(sl_no, '.', 1) AS UNSIGNED), sl_no")
                ->get()
                ->groupBy(function ($item) {
                    return explode('.', $item->sl_no)[0];
                });

            // Fetch existing progress for the selected date
            $physicalProgress = PhysicalBoqProgress::where('sub_package_project_id', $selectedProjectId)
                ->whereDate('progress_submitted_date', $selectedDate)
                ->get()
                ->keyBy('boq_entry_id');
        }

        return view('admin.physical_boq_progress.index', compact(
            'subProjects', 'subProject', 'boqEntries', 'physicalProgress', 'selectedProjectId', 'selectedDate'
        ));
    }

    // AJAX store or update
    public function saveProgress(Request $request)
    {
        $data = $request->validate([
            'sub_package_project_id' => 'required|exists:sub_package_projects,id',
            'progress_date' => 'required|date',
            'entries.*.boq_entry_id' => 'required|exists:boqentry_data,id',
            'entries.*.qty' => 'required|numeric|min:0',
            'entries.*.amount' => 'nullable|numeric|min:0',
        ]);

        foreach ($data['entries'] as $entry) {
            $boqEntry = BoqEntryData::findOrFail($entry['boq_entry_id']);

            $progress = PhysicalBoqProgress::updateOrCreate(
                [
                    'boq_entry_id' => $boqEntry->id,
                    'sub_package_project_id' => $data['sub_package_project_id'],
                    'progress_submitted_date' => $data['progress_date']
                ],
                [
                    'qty' => $entry['qty'],
                    'amount' => $entry['qty'] * $boqEntry->rate,
                ]
            );
        }

        return response()->json(['status' => 'success', 'message' => 'Progress saved successfully.']);
    }
}
