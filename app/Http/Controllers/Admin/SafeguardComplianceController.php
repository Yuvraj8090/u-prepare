<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\SafeguardCompliance;
use Illuminate\Http\Request;

class SafeguardComplianceController extends Controller
{
    public function index()
    {
        $compliances = SafeguardCompliance::latest()->paginate(10);
        return view('admin.safeguard_compliances.index', compact('compliances'));
    }

    public function create()
    {
        return view('admin.safeguard_compliances.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255'
        ]);

        SafeguardCompliance::create($request->only('name'));

        return redirect()->route('admin.safeguard-compliances.index')->with('success', 'Safeguard Compliance created successfully.');
    }

    public function edit(SafeguardCompliance $safeguardCompliance)
    {
        return view('admin.safeguard_compliances.edit', compact('safeguardCompliance'));
    }

    public function update(Request $request, SafeguardCompliance $safeguardCompliance)
    {
        $request->validate([
            'name' => 'required|string|max:255'
        ]);

        $safeguardCompliance->update($request->only('name'));

        return redirect()->route('admin.safeguard-compliances.index')->with('success', 'Safeguard Compliance updated successfully.');
    }

    public function destroy(SafeguardCompliance $safeguardCompliance)
    {
        $safeguardCompliance->delete();
        return redirect()->route('admin.safeguard-compliances.index')->with('success', 'Safeguard Compliance deleted successfully.');
    }
}
