<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\UserController;
use App\Http\Controllers\ProjectController;
use App\Http\Controllers\Admin\RoleController;
use App\Http\Controllers\Admin\PackageProjectController;
use App\Http\Controllers\Admin\DesignationController;
use App\Http\Controllers\Admin\DepartmentController;
use App\Http\Controllers\Admin\ProjectsCategoryController;
use App\Http\Controllers\Admin\ProcurementDetailController;
use App\Http\Controllers\Admin\ProcurementWorkProgramController;

Route::get('/', function () {
    return view('welcome');
});

Route::middleware(['auth:sanctum', config('jetstream.auth_session'), 'verified'])->group(function () {
    Route::prefix('admin')
        ->name('admin.')
        ->group(function () {
             Route::resource('procurement-work-programs',ProcurementWorkProgramController::class);

            // Procurement Details Routes
            Route::prefix('package-projects/{packageProject}/procurement-details')->group(function () {
                Route::get('create', [ProcurementDetailController::class, 'create'])->name('procurement-details.create');
                Route::post('/', [ProcurementDetailController::class, 'store'])->name('procurement-details.store');
            });
            
            Route::resource('procurement-details', ProcurementDetailController::class)->except(['create', 'store']);
            
            // Other admin routes...
            Route::resource('users', UserController::class);
            Route::resource('roles', RoleController::class);
            Route::resource('departments', DepartmentController::class);
            Route::resource('designations', DesignationController::class);
            Route::resource('projects', ProjectController::class);
            Route::resource('projects-category', ProjectsCategoryController::class);
            Route::resource('package-projects', PackageProjectController::class);
        });
    
    Route::get('admin/dashboard', function () {
        return view('dashboard');
    })->name('dashboard');
});
