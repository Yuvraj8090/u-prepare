<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\SafeguardCompliance;
use App\Models\Role; // make sure Role model is imported
use Illuminate\Http\Request;

class SafeguardComplianceController extends Controller
{
    public function index()
    {
        // removed pagination → fetch all
        $compliances = SafeguardCompliance::latest()->get();
        return view('admin.safeguard_compliances.index', compact('compliances'));
    }

    public function create()
    {
        $roles = Role::all(); // fetch roles for dropdown
        return view('admin.safeguard_compliances.create', compact('roles'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'role_id' => 'required|exists:roles,id',
        ]);

        SafeguardCompliance::create($request->only('name', 'role_id'));

        return redirect()->route('admin.safeguard-compliances.index')
                         ->with('success', 'Safeguard Compliance created successfully.');
    }

    public function edit(SafeguardCompliance $safeguardCompliance)
    {
        $roles = Role::all();
        return view('admin.safeguard_compliances.edit', compact('safeguardCompliance', 'roles'));
    }

    public function update(Request $request, SafeguardCompliance $safeguardCompliance)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'role_id' => 'required|exists:roles,id',
        ]);

        $safeguardCompliance->update($request->only('name', 'role_id'));

        return redirect()->route('admin.safeguard-compliances.index')
                         ->with('success', 'Safeguard Compliance updated successfully.');
    }

    public function destroy(SafeguardCompliance $safeguardCompliance)
    {
        $safeguardCompliance->delete();
        return redirect()->route('admin.safeguard-compliances.index')
                         ->with('success', 'Safeguard Compliance deleted successfully.');
    }
}
