<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\ContractionPhase;
use Illuminate\Http\Request;

class ContractionPhaseController extends Controller
{
    public function index()
    {
        $phases = ContractionPhase::latest()->paginate(10);
        return view('admin.contraction_phases.index', compact('phases'));
    }

    public function create()
    {
        return view('admin.contraction_phases.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
        ]);

        ContractionPhase::create($request->only('name'));

        return redirect()->route('admin.contraction-phases.index')->with('success', 'Contraction Phase created successfully.');
    }

    public function edit(ContractionPhase $contractionPhase)
    {
        return view('admin.contraction_phases.edit', compact('contractionPhase'));
    }

    public function update(Request $request, ContractionPhase $contractionPhase)
    {
        $request->validate([
            'name' => 'required|string|max:255',
        ]);

        $contractionPhase->update($request->only('name'));

        return redirect()->route('admin.contraction-phases.index')->with('success', 'Contraction Phase updated successfully.');
    }

    public function destroy(ContractionPhase $contractionPhase)
    {
        $contractionPhase->delete();
        return redirect()->route('admin.contraction-phases.index')->with('success', 'Contraction Phase deleted successfully.');
    }
}
