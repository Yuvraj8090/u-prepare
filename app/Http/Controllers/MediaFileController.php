<?php

namespace App\Http\Controllers;


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
     * API: List files in LightGallery format (DB + Storage)
     */
    public function index()
    {
        $filesFromDB = MediaFile::latest()->get()->map->toLightGallery();

        // Get all loose files in storage/app/public/uploads
        $storageFiles = collect(Storage::disk('public')->files('uploads'))
            ->reject(function ($path) use ($filesFromDB) {
                // Skip files already in DB
                return $filesFromDB->contains(fn($file) => str_contains($file['src'], $path));
            })
            ->map(function ($path) {
                $url = asset('storage/' . $path);
                $filename = pathinfo($path, PATHINFO_FILENAME);

                return [
                    'id' => null,
                    'src' => $url,
                    'thumb' => $url,
                    'subHtml' => "<h4>{$filename}</h4><p></p>"
                ];
            });

        return response()->json($filesFromDB->merge($storageFiles)->values());
    }
}
