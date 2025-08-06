<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\UserController;
use App\Http\Controllers\ProjectController;
use App\Http\Controllers\Admin\RoleController;
use App\Http\Controllers\Admin\PackageProjectController;
use App\Http\Controllers\Admin\DesignationController;
use App\Http\Controllers\Admin\DepartmentController;
use App\Http\Controllers\Admin\ProjectsCategoryController;

Route::get('/', function () {
    return view('welcome');
});

Route::middleware(['auth:sanctum', config('jetstream.auth_session'), 'verified'])->group(function () {
    Route::prefix('admin')
        ->name('admin.')
        ->group(function () {
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
