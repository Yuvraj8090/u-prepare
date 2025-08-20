<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Role;
use App\Models\RoleRoute;
use Illuminate\Http\Request;

class RoleRouteController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        // Get all roles with their assigned routes
        $roles = Role::with('routes')->paginate(10);
        return view('admin.role_routes.index', compact('roles'));
    }

    /**
     * Show the form for creating/updating role routes.
     */
public function create(Request $request)
{
    $roles = Role::all();

    // Get all named routes that are inside admin group & protected by middleware
    $routeCollection = \Illuminate\Support\Facades\Route::getRoutes();

    $routes = collect($routeCollection)
        ->filter(function ($route) {
            $middlewares = $route->middleware();

            return $route->getName() 
                && in_array('auth:sanctum', $middlewares) 
                && in_array(config('jetstream.auth_session'), $middlewares)
                && in_array('verified', $middlewares);
        })
        ->map(fn($route) => $route->getName())
        ->sort() // ✅ alphabetic order
        ->values();

    // If ?role_id is passed, prefill selected role & routes
    $selectedRole = null;
    $selectedRoutes = [];

    if ($request->has('role_id')) {
        $selectedRole = Role::with('routes')->findOrFail($request->role_id);
        $selectedRoutes = $selectedRole->routes->pluck('route_name')->toArray();
    }

    return view('admin.role_routes.create', compact('roles', 'routes', 'selectedRole', 'selectedRoutes'));
}


    /**
     * Store/Update role routes.
     */
    public function store(Request $request)
    {
        $request->validate([
            'role_id' => 'required|exists:roles,id',
            'route_names' => 'required|array|min:1',
        ]);

        // Delete old routes for the role
        RoleRoute::where('role_id', $request->role_id)->delete();

        // Insert new selected routes
        foreach ($request->route_names as $routeName) {
            RoleRoute::create([
                'role_id' => $request->role_id,
                'route_name' => $routeName,
            ]);
        }

        return redirect()->route('admin.role_routes.index')
            ->with('success', 'Routes updated for role successfully.');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(RoleRoute $roleRoute)
    {
        $roleRoute->delete();
        return redirect()->route('admin.role_routes.index')->with('success', 'Role Route deleted successfully.');
    }
}
