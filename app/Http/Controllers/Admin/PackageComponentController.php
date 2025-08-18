<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\PackageComponent;
use Illuminate\Http\Request;

class PackageComponentController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $components = PackageComponent::latest()->paginate(10);
        return view('admin.package_components.index', compact('components'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('admin.package_components.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'name'   => 'required|string|max:255',
            'budget' => 'nullable|numeric|min:0',
        ]);

        PackageComponent::create($request->only(['name', 'budget']));

        return redirect()->route('admin.package-components.index')
                         ->with('success', 'Package Component created successfully.');
    }

    /**
     * Display the specified resource.
     */
    public function show(PackageComponent $packageComponent)
    {
        return view('admin.package_components.show', compact('packageComponent'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(PackageComponent $packageComponent)
    {
        return view('admin.package_components.edit', compact('packageComponent'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, PackageComponent $packageComponent)
    {
        $request->validate([
            'name'   => 'required|string|max:255',
            'budget' => 'nullable|numeric|min:0',
        ]);

        $packageComponent->update($request->only(['name', 'budget']));

        return redirect()->route('admin.package-components.index')
                         ->with('success', 'Package Component updated successfully.');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(PackageComponent $packageComponent)
    {
        $packageComponent->delete();

        return redirect()->route('admin.package-components.index')
                         ->with('success', 'Package Component deleted successfully.');
    }
}
