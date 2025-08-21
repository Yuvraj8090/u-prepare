<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\PhysicalEpcProgress;
use App\Models\EpcEntryData;
use App\Models\SubPackageProject;
use App\Models\MediaFile;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Validation\Rule;

class PhysicalEpcProgressController extends Controller
{
    public function index(Request $request)
    {
        $request->validate([
            'sub_package_project_id' => 'nullable|integer',
        ]);

        if (!$request->filled('sub_package_project_id')) {
            return redirect()->back()->with('error', 'Sub Package Project ID is required.');
        }

        $subPackageProject = SubPackageProject::find($request->sub_package_project_id);

        if (!$subPackageProject) {
            return redirect()->back()->with('error', 'Invalid Sub Package Project ID.');
        }

        $query = PhysicalEpcProgress::with(['epcentryData.subPackageProject'])->whereHas('epcentryData', function ($q) use ($request) {
            $q->where('sub_package_project_id', $request->sub_package_project_id);
        });

        $progressEntries = $query->latest()->paginate(15);

        // Attach images from MediaFile model
        $progressEntries->getCollection()->transform(function ($entry) {
            $imageIds = is_array($entry->images) ? $entry->images : json_decode($entry->images, true);

            if (empty($imageIds)) {
                $entry->image_urls = [];
                return $entry;
            }

            $entry->image_urls = MediaFile::whereIn('id', $imageIds)
                ->pluck('path') // assuming you have `url` column or an accessor
                ->toArray();

            return $entry;
        });

        return view('admin.physical_epc_progress.index', [
            'progressEntries' => $progressEntries,
            'subPackageProjectName' => $subPackageProject->name,
        ]);
    }

    public function create(Request $request)
    {
        $request->validate([
            'sub_package_project_id' => 'required|integer',
        ]);

        $epcEntries = EpcEntryData::where('sub_package_project_id', $request->sub_package_project_id)->orderBy('sl_no')->get();

        $progressSums = PhysicalEpcProgress::selectRaw('epcentry_data_id, SUM(percent) as total_percent')->groupBy('epcentry_data_id')->pluck('total_percent', 'epcentry_data_id');

        return view('admin.physical_epc_progress.create', compact('epcEntries', 'progressSums'))->with('sub_package_project_id', $request->sub_package_project_id);
    }

    public function edit(PhysicalEpcProgress $physicalEpcProgress)
    {
        $sub_package_project_id = $physicalEpcProgress->epcentryData->sub_package_project_id;

        $epcEntries = EpcEntryData::where('sub_package_project_id', $sub_package_project_id)->orderBy('sl_no')->get();

        $progressSums = PhysicalEpcProgress::selectRaw('epcentry_data_id, SUM(percent) as total_percent')->groupBy('epcentry_data_id')->pluck('total_percent', 'epcentry_data_id');

        return view('admin.physical_epc_progress.edit', [
            'physicalEpcProgress' => $physicalEpcProgress,
            'epcEntries' => $epcEntries,
            'progressSums' => $progressSums,
            'sub_package_project_id' => $sub_package_project_id,
        ]);
    }

    public function store(Request $request)
    {
        $validated = $this->validateProgress($request);

        $epcEntry = EpcEntryData::findOrFail($validated['epcentry_data_id']);

        $existingPercentSum = PhysicalEpcProgress::where('epcentry_data_id', $validated['epcentry_data_id'])->sum('percent');
        $remainingPercent = $epcEntry->percent - $existingPercentSum;

        if ($validated['percent'] > $remainingPercent) {
            return back()
                ->withErrors([
                    'percent' => "Percent cannot exceed remaining allowed percent ($remainingPercent%).",
                ])
                ->withInput();
        }

        $subPackageProject = SubPackageProject::findOrFail($epcEntry->sub_package_project_id);

        $validated['amount'] = ($validated['percent'] / 100) * $subPackageProject->contract_value;

        $additionalMeta = [
            'subject' => 'Physical EPC Progress',
            'sub_package_project_id' => $epcEntry->subPackageProject?->name,
            'name' => $epcEntry->subPackageProject?->name,
        ];

        $validated['images'] = $this->handleImages($request, $additionalMeta);

        PhysicalEpcProgress::create($validated);

        return redirect()
            ->route('admin.physical_epc_progress.index', [
                'sub_package_project_id' => $epcEntry->sub_package_project_id,
            ])
            ->with('success', 'Physical EPC Progress record created successfully.');
    }

    public function update(Request $request, PhysicalEpcProgress $physicalEpcProgress)
    {
        $validated = $this->validateProgress($request);

        $epcEntry = EpcEntryData::findOrFail($validated['epcentry_data_id']);

        $existingPercentSum = PhysicalEpcProgress::where('epcentry_data_id', $validated['epcentry_data_id'])->where('id', '!=', $physicalEpcProgress->id)->sum('percent');

        $remainingPercent = $epcEntry->percent - $existingPercentSum;

        if ($validated['percent'] > $remainingPercent) {
            return back()
                ->withErrors([
                    'percent' => "Percent cannot exceed remaining allowed percent ($remainingPercent%).",
                ])
                ->withInput();
        }

        $subPackageProject = SubPackageProject::findOrFail($epcEntry->sub_package_project_id);

        $validated['amount'] = ($validated['percent'] / 100) * $subPackageProject->contract_value;

        $additionalMeta = [
            'subject' => 'Physical EPC Progress',
            'sub_package_project_id' => $epcEntry->sub_package_project_id,
            'name' => $epcEntry->name ?? null,
        ];

        $newImageIds = $this->handleImages($request, $additionalMeta);

        // Merge new image IDs with existing ones
        $validated['images'] = array_merge($physicalEpcProgress->images ?? [], $newImageIds);

        $physicalEpcProgress->update($validated);

        return redirect()
            ->route('admin.physical_epc_progress.index', [
                'sub_package_project_id' => $epcEntry->sub_package_project_id,
            ])
            ->with('success', 'Physical EPC Progress record updated successfully.');
    }
    public function destroy(Request $request, PhysicalEpcProgress $physicalEpcProgress)
    {
        $this->deleteImages($physicalEpcProgress->images);

        $subProjectId = $request->input('sub_package_project_id') ?? ($physicalEpcProgress->epcentryData->sub_package_project_id ?? null);

        $physicalEpcProgress->delete();

        return redirect()
            ->route('dashboard', [
                'sub_package_project_id' => $subProjectId,
            ])
            ->with('success', 'Physical EPC Progress record deleted successfully.');
    }

    public function bulkDestroy(Request $request)
    {
        $request->validate([
            'ids' => 'required|array',
            'ids.*' => 'integer|exists:physical_epc_progress,id',
        ]);

        $entries = PhysicalEpcProgress::whereIn('id', $request->ids)->get();

        foreach ($entries as $entry) {
            $this->deleteImages($entry->images);
            $entry->delete();
        }

        return response()->json(['status' => 'success']);
    }

    private function validateProgress(Request $request)
    {
        return $request->validate([
            'epcentry_data_id' => ['required', Rule::exists('epcentry_data', 'id')],
            'percent' => 'required|numeric|min:0|max:100',
            'amount' => 'nullable|numeric|min:0',
            'items' => 'nullable|string',
            'progress_submitted_date' => 'nullable|date',
            'images.*' => 'nullable|image|mimes:jpg,jpeg,png|max:2048',
        ]);
    }

    /**
     * Handle images upload:
     * - Save image files
     * - Extract EXIF GPS data
     * - Save media_files record with meta_data
     * - Return array of media_file IDs
     */
    private function handleImages(Request $request, array $additionalMeta = []): array
    {
        $imageIds = [];

        if ($request->hasFile('images')) {
            foreach ($request->file('images') as $file) {
                $path = $file->store('progress_images', 'public');

                $exif = @exif_read_data($file->getPathname());
                if (!is_array($exif)) {
                    $exif = [];
                }

                $lat = $this->getGps($exif, 'Latitude');
                $lng = $this->getGps($exif, 'Longitude');

                $metaData = array_merge($additionalMeta, [
                    'original_name' => $file->getClientOriginalName(),
                    'latitude' => $lat,
                    'longitude' => $lng,
                ]);

                $mediaFile = MediaFile::create([
                    'path' => $path,
                    'type' => $file->getClientMimeType(),
                    'meta_data' => $metaData,
                ]);

                $imageIds[] = $mediaFile->id;
            }
        }

        return $imageIds;
    }

    /**
     * Convert EXIF GPS data to decimal degrees
     */
    private function getGps(array $exif, string $coord)
    {
        if (empty($exif) || !isset($exif["GPS{$coord}"]) || !isset($exif["GPS{$coord}Ref"])) {
            return null;
        }

        $gps = $exif["GPS{$coord}"];
        $ref = $exif["GPS{$coord}Ref"];

        $parts = array_map(function ($part) {
            $pos = strpos($part, '/');
            if ($pos === false) {
                return floatval($part);
            }
            $nums = explode('/', $part);
            return $nums[1] != 0 ? floatval($nums[0]) / floatval($nums[1]) : 0;
        }, explode(',', $gps));

        if (count($parts) != 3) {
            return null;
        }

        [$degrees, $minutes, $seconds] = $parts;

        $decimal = $degrees + $minutes / 60 + $seconds / 3600;

        if ($ref == 'S' || $ref == 'W') {
            $decimal *= -1;
        }

        return $decimal;
    }

    /**
     * Delete images physically and media_files records
     */
    private function deleteImages(array $imageIds = [])
    {
        if (!empty($imageIds)) {
            $mediaFiles = MediaFile::whereIn('id', $imageIds)->get();

            foreach ($mediaFiles as $mediaFile) {
                Storage::disk('public')->delete($mediaFile->path);
                $mediaFile->delete();
            }
        }
    }
}
