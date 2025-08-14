<?php

namespace App\Http\Controllers;

use App\Models\SafeguardEntry;
use App\Models\SocialSafeguardEntry;
use App\Models\SubPackageProject;
use App\Models\SafeguardCompliance;
use App\Models\ContractionPhase;
use App\Models\MediaFile;
use Illuminate\Http\Request;
use Carbon\Carbon;
use Illuminate\Support\Facades\Storage;

class SocialSafeguardEntryController extends Controller
{
    // Show entries with latest data
    public function index(Request $request)
    {
        $selectedDate = $request->date_of_entry
            ? Carbon::parse($request->date_of_entry)->format('Y-m-d')
            : now()->format('Y-m-d');

        $entries = SafeguardEntry::with([
            'subPackageProject',
            'safeguardCompliance',
            'contractionPhase',
            'socialSafeguardEntries',
        ])
        ->when($request->filled('sub_package_project_id'), fn($q) => $q->where('sub_package_project_id', $request->sub_package_project_id))
        ->when($request->filled('safeguard_compliance_id'), fn($q) => $q->where('safeguard_compliance_id', $request->safeguard_compliance_id))
        ->when($request->filled('contraction_phase_id'), fn($q) => $q->where('contraction_phase_id', $request->contraction_phase_id))
        ->orderBy('sl_no')
        ->get();

        foreach ($entries as $entry) {
            $allSocials = $entry->socialSafeguardEntries;
            $eligibleEntries = $allSocials->filter(fn($s) => $s->date_of_entry->format('Y-m-d') <= $selectedDate);
            $social = $eligibleEntries->sortByDesc('date_of_entry')->first();
            $entry->social = $social;

            $hasValidity = $entry->is_validity && $social?->validity_date;
            $oneTime = $entry->contractionPhase->is_one_time ?? false;

            if ($oneTime) {
                $entry->is_locked = $social ? ($hasValidity ? Carbon::parse($social->validity_date)->isFuture() : true) : false;
            } else {
                $entry->is_locked = $hasValidity && Carbon::parse($social->validity_date)->isFuture();
            }

            // Load gallery
            if ($social?->photos_documents_case_studies) {
                $mediaIds = $social->photos_documents_case_studies;
                $entry->gallery = MediaFile::whereIn('id', $mediaIds)->get()->map->toLightGallery();
            } else {
                $entry->gallery = [];
            }
        }

        return view('admin.social_safeguard_entries.index', [
            'entries' => $entries,
            'projects' => SubPackageProject::orderBy('name')->get(),
            'safeguardCompliances' => SafeguardCompliance::orderBy('name')->get(),
            'contractionPhases' => ContractionPhase::orderBy('name')->get(),
            'subPackageProjectId' => $request->sub_package_project_id,
            'selectedDate' => $selectedDate,
        ]);
    }

    // Store or update entries from index table, including media uploads
    public function storeOrUpdateFromIndex(Request $request)
    {
        if (!$request->has('entries') || !is_array($request->entries)) {
            return response()->json(['status' => 'error', 'message' => 'No data provided.'], 400);
        }

        $updatedCount = 0;

        foreach ($request->entries as $entryId => $data) {
            $date = $data['date_of_entry'] ?? now()->format('Y-m-d');

            $existing = SocialSafeguardEntry::where('safeguard_entry_id', $entryId)
                ->whereDate('date_of_entry', $date)
                ->first();

            // Handle media file uploads if present
            $mediaIds = $data['photos_documents_case_studies'] ?? [];

            if ($request->hasFile("entries.$entryId.photos_documents_case_studies")) {
                foreach ($request->file("entries.$entryId.photos_documents_case_studies") as $file) {
                    $path = $file->store('media_files', 'public');
                    $media = MediaFile::create([
                        'path' => $path,
                        'type' => $file->getClientMimeType(),
                        'meta_data' => ['name' => $file->getClientOriginalName()],
                    ]);
                    $mediaIds[] = $media->id;
                }
            }

            $payload = [
                'yes_no' => $data['yes_no'] ?? null,
                'photos_documents_case_studies' => $mediaIds,
                'remarks' => $data['remarks'] ?? null,
                'validity_date' => $data['validity_date'] ?? null,
                'date_of_entry' => $date,
            ];

            $safeguard = SafeguardEntry::find($entryId);

            if ($safeguard->is_validity && $payload['validity_date']) {
                if (Carbon::parse($payload['validity_date'])->lt(now())) {
                    return response()->json([
                        'status' => 'error',
                        'message' => "Cannot save entry {$entryId}. Validity date has expired.",
                    ], 400);
                }
            }

            if (!$existing) {
                $payload['safeguard_entry_id'] = $entryId;
                $payload['sub_package_project_id'] = $safeguard->sub_package_project_id;
                $payload['social_compliance_id'] = $safeguard->safeguard_compliance_id;
                $payload['contraction_phase_id'] = $safeguard->contraction_phase_id;

                SocialSafeguardEntry::create($payload);
                $updatedCount++;
            } elseif ($this->hasChanged($existing, $payload)) {
                $existing->update($payload);
                $updatedCount++;
            }
        }

        return response()->json([
            'status' => 'success',
            'message' => $updatedCount > 0
                ? "$updatedCount entr" . ($updatedCount > 1 ? 'ies' : 'y') . ' updated successfully.'
                : 'No changes detected.',
        ]);
    }

    private function hasChanged(SocialSafeguardEntry $existing, array $payload)
    {
        foreach ($payload as $key => $value) {
            if ($key === 'photos_documents_case_studies') {
                if ($existing->{$key} != $value) return true;
            } elseif ($existing->{$key} != $value) return true;
        }
        return false;
    }
}
