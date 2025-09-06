<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\MediaFile;
use App\Models\SocialSafeguardEntry;
use Illuminate\Support\Facades\Storage;

class MediaFileController extends Controller
{
    /**
     * Show gallery view
     */
    public function gallery()
    {
        $allFiles = Storage::disk('public')->allFiles();

        $filesGrouped = collect($allFiles)
            ->groupBy(function ($file) {
                return dirname($file);
            })
            ->map(function ($files) {
                return $files->map(function ($path) {
                    $url = asset('storage/' . $path);
                    $filename = pathinfo($path, PATHINFO_BASENAME);
                    $ext = strtolower(pathinfo($path, PATHINFO_EXTENSION));
                    $isImage = in_array($ext, ['jpg', 'jpeg', 'png', 'gif', 'webp']);
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
    $request->validate([
        'social_id' => 'required|exists:social_safeguard_entries,id',
        'media_files.*' => 'required|file',
    ]);

    $socialEntry = SocialSafeguardEntry::findOrFail($request->social_id);
    $mediaIds = $socialEntry->photos_documents_case_studies ?? [];

    foreach ($request->file('media_files') as $file) {
        $path = $file->store('uploads', 'public');

        $media = MediaFile::create([
            'path' => $path,
            'type' => $file->getClientMimeType(),
            'meta_data' => ['name' => $file->getClientOriginalName()],
        ]);

        $mediaIds[] = $media->id;
    }

    $socialEntry->photos_documents_case_studies = $mediaIds;
    $socialEntry->save();

    $uploadedFiles = MediaFile::whereIn('id', $mediaIds)->get()->map(fn($media) => [
        'id' => $media->id,
        'url' => Storage::url($media->path),
        'name' => $media->meta_data['name'] ?? 'File',
        'type' => $media->type,
        'meta_data' => $media->meta_data,
    ]);

    return response()->json([
        'status' => 'success',
        'files' => $uploadedFiles,
        'social_id' => $socialEntry->id,
        'message' => 'Files uploaded successfully.',
    ]);
}



    /**
     * API: List all media files in LightGallery format
     */
    public function index()
    {
        // Files from DB
        $filesFromDB = MediaFile::latest()
            ->get()
            ->map(function ($file) {
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
