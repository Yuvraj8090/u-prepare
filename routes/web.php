<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\UserController;
use App\Http\Controllers\ProjectController;
use App\Http\Controllers\BoqentryDataController;
use App\Http\Controllers\ContractorController;
use App\Http\Controllers\Admin\RoleController;
use App\Http\Controllers\Admin\ContractController;
use App\Http\Controllers\EpcEntryDataController;
use App\Http\Controllers\SafeguardEntryController;
use App\Http\Controllers\Admin\PackageProjectController;
use App\Http\Controllers\Admin\DesignationController;
use App\Http\Controllers\Admin\ContractionPhaseController;
use App\Http\Controllers\AlreadyDefineEpcController;
use App\Http\Controllers\Admin\SafeguardComplianceController;
use App\Http\Controllers\Admin\DepartmentController;
use App\Http\Controllers\Admin\PhysicalBoqProgressController;
use App\Http\Controllers\Admin\ProjectsCategoryController;
use App\Http\Controllers\Admin\PhysicalEpcProgressController;
use App\Http\Controllers\Admin\WorkServiceController;
use App\Http\Controllers\MediaFileController;
use App\Http\Controllers\Admin\ProcurementDetailController;
use App\Http\Controllers\Admin\ProcurementWorkProgramController;

Route::get('/', function () {
    return view('welcome');
});

Route::middleware(['auth:sanctum', config('jetstream.auth_session'), 'verified'])->group(function () {
    Route::prefix('admin')
        ->name('admin.')
        ->group(function () {


    Route::get('physical_boq_progress', [PhysicalBoqProgressController::class, 'index'])
        ->name('physical_boq_progress.index');
        Route::get('physical_boq_progress_get', [PhysicalBoqProgressController::class, 'physicalProgress'])
        ->name('boqentry.physical-progress');
 Route::post('physical_boq_update', [PhysicalBoqProgressController::class, 'saveProgress'])
        ->name('boqentry.save-physical-progress');
    Route::get('physical_boq_progress/create', [PhysicalBoqProgressController::class, 'create'])
        ->name('physical_boq_progress.create');

    Route::post('physical_boq_progress', [PhysicalBoqProgressController::class, 'store'])
        ->name('physical_boq_progress.store');

    Route::get('physical_boq_progress/{physicalBoqProgress}/edit', [PhysicalBoqProgressController::class, 'edit'])
        ->name('physical_boq_progress.edit');

    Route::put('physical_boq_progress/{physicalBoqProgress}', [PhysicalBoqProgressController::class, 'update'])
        ->name('physical_boq_progress.update');

    Route::delete('physical_boq_progress/{physicalBoqProgress}', [PhysicalBoqProgressController::class, 'destroy'])
        ->name('physical_boq_progress.destroy');

    // Bulk delete route
    Route::delete('physical_boq_progress/bulk-delete', [PhysicalBoqProgressController::class, 'bulkDestroy'])
        ->name('physical_boq_progress.bulk-delete');


            Route::delete('physical-epc-progress/bulk-destroy', [PhysicalEpcProgressController::class, 'bulkDestroy'])->name('physical_epc_progress.bulkDestroy');

            Route::resource('physical_epc_progress', PhysicalEpcProgressController::class);

            Route::resource('already_define_epc', AlreadyDefineEpcController::class);
            Route::post('epcentry_data/store-from-defined', [EpcEntryDataController::class, 'storeFromDefined'])->name('epcentry_data.storeFromDefined');

            Route::resource('work_services', WorkServiceController::class);
            Route::get('/procurement-work-programs/{package_project_id}/edit-by-package/{procurement_details_id}', [ProcurementWorkProgramController::class, 'editByPackage'])->name('procurement-work-programs.edit-by-package');
            Route::post('/procurement-work-programs/{package_project_id}/{procurement_details_id}/upload-documents', [ProcurementWorkProgramController::class, 'uploadDocumentsAndUpdate'])->name('procurement-work-programs.upload-documents');
            Route::resource('procurement-work-programs', ProcurementWorkProgramController::class);
            Route::post('/procurement-work-programs/store-single', [ProcurementWorkProgramController::class, 'storeSingle'])->name('procurement-work-programs.store-single');
            Route::put('/procurement-work-programs/update-single/{id}', [ProcurementWorkProgramController::class, 'updateSingle'])->name('procurement-work-programs.update-single');
            Route::resource('contractors', ContractorController::class);
            Route::resource('contracts', ContractController::class);
            Route::prefix('package-projects/{packageProject}/procurement-details')->group(function () {
                Route::get('create', [ProcurementDetailController::class, 'create'])->name('procurement-details.create');
                Route::post('/', [ProcurementDetailController::class, 'store'])->name('procurement-details.store');
            });

            Route::get('media-gallery', [MediaFileController::class, 'gallery'])->name('media.gallery');
            Route::get('media-files', [MediaFileController::class, 'index'])->name('media.index');

            Route::resource('procurement-details', ProcurementDetailController::class)->except(['create', 'store']);
            Route::post('safeguard_entries/import', [SafeguardEntryController::class, 'import'])->name('safeguard_entries.import');
            Route::delete('safeguard_entries/bulk-delete', [SafeguardEntryController::class, 'bulkDelete'])->name('safeguard_entries.bulk-delete');
            Route::resource('safeguard_entries', SafeguardEntryController::class);
            Route::prefix('boqentry')
                ->name('boqentry.')
                ->group(function () {
                    Route::get('/', [BoqentryDataController::class, 'index'])->name('index');
                    Route::post('/upload', [BoqentryDataController::class, 'uploadExcel'])->name('upload');
                    Route::get('/create', [BoqentryDataController::class, 'create'])->name('create');
                    Route::post('/', [BoqentryDataController::class, 'store'])->name('store');
                    Route::get('/{id}/edit', [BoqentryDataController::class, 'edit'])->name('edit');
                    Route::put('/{id}', [BoqentryDataController::class, 'update'])->name('update');
                    Route::delete('/bulk-delete', [BoqentryDataController::class, 'bulkDestroy'])->name('bulk-delete');
                    Route::delete('/{id}', [BoqentryDataController::class, 'destroy'])->name('destroy');
                });
            Route::resource('contraction-phases', ContractionPhaseController::class);
            Route::resource('safeguard-compliances', SafeguardComplianceController::class);
            Route::prefix('epcentry_data')
                ->name('epcentry_data.')
                ->group(function () {
                    Route::get('/', [EpcEntryDataController::class, 'index'])->name('index');
                    Route::get('/create', [EpcEntryDataController::class, 'create'])->name('create');
                    Route::post('/', [EpcEntryDataController::class, 'store'])->name('store');
                    Route::get('/{id}/edit', [EpcEntryDataController::class, 'edit'])->name('edit');
                    Route::put('/{id}', [EpcEntryDataController::class, 'update'])->name('update');
                    Route::delete('/bulk-destroy', [EpcEntryDataController::class, 'bulkDestroy'])->name('bulkDestroy');
                    Route::delete('/{id}', [EpcEntryDataController::class, 'destroy'])->name('destroy');
                });
            Route::resource('users', UserController::class);
            Route::resource('roles', RoleController::class);
            Route::resource('departments', DepartmentController::class);
            Route::resource('designations', DesignationController::class);
            Route::resource('project', ProjectController::class);
            Route::resource('projects-category', ProjectsCategoryController::class);
            Route::resource('package-projects', PackageProjectController::class);
        });
    Route::get('admin/dashboard', function () {
        return view('dashboard');
    })->name('dashboard');
});
