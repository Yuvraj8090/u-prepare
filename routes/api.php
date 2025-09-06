<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\PackageController;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\SocialSafeguardEntryApiController;

Route::post('/login', [AuthController::class, 'login']);
Route::post('/logout', [AuthController::class, 'logout']);
Route::get('/me', [AuthController::class, 'me']);


// 🔐 Protected routes (via token middleware)
Route::middleware('auth.token')->group(function () {

    // Existing routes
    Route::get('/packages/assigned', [PackageController::class, 'assignedPackages']);

    // Social Safeguard Entries API
    Route::prefix('social-safeguard')->group(function () {

        // List entries for a project, compliance, and optional phase
        Route::get('/entries/{project_id}/{compliance_id}/{phase_id?}', [SocialSafeguardEntryApiController::class, 'index']);
// Upload media files for a social safeguard entry
Route::post('/entry/upload', [SocialSafeguardEntryApiController::class, 'upload']);

        // Save or update an entry
        Route::post('/entry/save', [SocialSafeguardEntryApiController::class, 'save']);

        // Delete an entry
        Route::delete('/entry/{id}', [SocialSafeguardEntryApiController::class, 'destroy']);

        // Overview (status of all projects and compliances)
        Route::get('/overview', [SocialSafeguardEntryApiController::class, 'overview']);
    });
});

