<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\MediaFile;
use Illuminate\Support\Facades\Storage;

class MediaFileController extends Controller
{
    /**
     * Show gallery view
     */
    public function gallery()
    {
        $allFiles = Storage::disk('public')->allFiles();

        $filesGrouped = collect($allFiles)->groupBy(function ($file) {
            return dirname($file);
        })->map(function ($files) {
            return $files->map(function ($path) {
                $url = asset('storage/' . $path);
                $filename = pathinfo($path, PATHINFO_BASENAME);
                $ext = strtolower(pathinfo($path, PATHINFO_EXTENSION));
                $isImage = in_array($ext, ['jpg','jpeg','png','gif','webp']);
                $thumb = $isImage ? $url : asset('icons/file-icon.png'); // icon for non-image files

                return [
                    'url' => $url,
                    'thumb' => $thumb,
                    'filename' => $filename,
                    'isImage' => $isImage,
                    'ext' => $ext,
                ];
            });
        });

        return view('admin.media-gallery', compact('filesGrouped'));
    }

    /**
     * Upload media files via AJAX
     */
   public function upload(Request $request)
{
    if (!$request->hasFile('media_files')) {
        return response()->json(['status' => 'error', 'message' => 'No files uploaded.'], 400);
    }

    // Validate required details
    $request->validate([
        'entry_id' => 'required|integer',
        'project_id' => 'required|integer',
        'safeguard_compliance_id' => 'required|integer',
        'contraction_phase_id' => 'required|integer',
        'yes_no' => 'nullable|in:0,1,3',
        'remarks' => 'nullable|string',
        'validity_date' => 'nullable|date',
        'date_of_entry' => 'required|date',
    ]);

    // Get or create SocialSafeguardEntry
    $socialEntry = $request->filled('social_id')
        ? \App\Models\SocialSafeguardEntry::find($request->social_id)
        : new \App\Models\SocialSafeguardEntry();

    if (!$socialEntry->exists) {
        $socialEntry->safeguard_entry_id = $request->entry_id;
    }

    // Update all details
    $socialEntry->sub_package_project_id = $request->project_id;
    $socialEntry->social_compliance_id = $request->safeguard_compliance_id;
    $socialEntry->contraction_phase_id = $request->contraction_phase_id;
    $socialEntry->yes_no = $request->yes_no;
    $socialEntry->remarks = $request->remarks;
    $socialEntry->validity_date = $request->validity_date;
    $socialEntry->date_of_entry = $request->date_of_entry;

    // Handle uploaded files
    $mediaIds = $socialEntry->photos_documents_case_studies ?? []; // existing files

    foreach ($request->file('media_files') as $file) {
        $path = $file->store('uploads', 'public');

        // Fetch human-readable names
        $projectName = optional(\App\Models\SubPackageProject::find($request->project_id))->name;
        $complianceName = optional(\App\Models\SafeguardCompliance::find($request->safeguard_compliance_id))->name;
        $phaseName = optional(\App\Models\ContractionPhase::find($request->contraction_phase_id))->name;

        $media = \App\Models\MediaFile::create([
            'path' => $path,
            'type' => $file->getClientMimeType(),
            'meta_data' => [
                'name' => $file->getClientOriginalName(),
                'project_name' => $projectName,
                'safeguard_compliance' => $complianceName,
                'contraction_phase' => $phaseName,
                'yes_no' => $request->yes_no,
                'remarks' => $request->remarks,
                'validity_date' => $request->validity_date,
                'date_of_entry' => $request->date_of_entry,
            ],
        ]);

        $mediaIds[] = $media->id;
    }

    // Store IDs as JSON in DB
    $socialEntry->photos_documents_case_studies = $mediaIds;
    $socialEntry->save();

    // Prepare files for response
    $uploadedFiles = [];
    foreach ($mediaIds as $id) {
        $media = \App\Models\MediaFile::find($id);
        if ($media) {
            $uploadedFiles[] = [
                'id' => $media->id,
                'url' => \Storage::url($media->path),
                'name' => $media->meta_data['name'] ?? 'File',
                'meta_data' => $media->meta_data, // include all details
            ];
        }
    }

    return response()->json([
        'status' => 'success',
        'files' => $uploadedFiles,
        'social_id' => $socialEntry->id,
    ]);
}



    /**
     * API: List all media files in LightGallery format
     */
    public function index()
    {
        // Files from DB
        $filesFromDB = MediaFile::latest()->get()->map(function($file) {
            return [
                'id' => $file->id,
                'src' => Storage::url($file->path),
                'thumb' => Storage::url($file->path),
                'subHtml' => "<h4>{$file->meta_data['name']}</h4>",
            ];
        });

        // Loose files in storage/app/public/uploads not in DB
        $storageFiles = collect(Storage::disk('public')->files('uploads'))
            ->reject(function ($path) use ($filesFromDB) {
                return $filesFromDB->contains(fn($file) => str_contains($file['src'], $path));
            })
            ->map(function ($path) {
                $url = asset('storage/' . $path);
                $filename = pathinfo($path, PATHINFO_FILENAME);

                return [
                    'id' => null,
                    'src' => $url,
                    'thumb' => $url,
                    'subHtml' => "<h4>{$filename}</h4>",
                ];
            });

        return response()->json($filesFromDB->merge($storageFiles)->values());
    }
}
