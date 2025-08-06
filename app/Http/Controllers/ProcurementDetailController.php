<?php

namespace App\Http\Controllers;

use App\Models\ProcurementDetail;
use App\Models\PackageProject;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class ProcurementDetailController extends Controller
{
    public function index()
    {
        $packageProjects = PackageProject::with([
            'procurementDetail',
            'project',
            'category',
            'subCategory',
            'department',
            'vidhanSabha',
            'district',
            'block'
        ])->latest()->paginate(10);

        return view('admin.procurement_details.index', compact('packageProjects'));
    }

    public function create(PackageProject $packageProject)
    {
        $methodsOfProcurement = $packageProject->category?->methods_of_procurement ?? [];
        
        return view('admin.procurement_details.create', [
            'packageProject' => $packageProject,
            'methodsOfProcurement' => $methodsOfProcurement
        ]);
    }

    public function store(Request $request, PackageProject $packageProject)
    {
        $validated = $request->validate([
            'method_of_procurement' => 'required|string|max:255',
            'type_of_procurement' => 'required|string|max:255',
            'publication_date' => 'nullable|date',
            'publication_document' => 'nullable|file|mimes:pdf,doc,docx|max:2048',
            'tender_fee' => 'nullable|numeric|min:0',
            'earnest_money_deposit' => 'nullable|numeric|min:0',
            'bid_validity_days' => 'nullable|integer|min:0',
            'emd_validity_days' => 'nullable|integer|min:0',
        ]);

        if ($request->hasFile('publication_document')) {
            $validated['publication_document_path'] = $request->file('publication_document')
                ->store('procurement_docs', 'public');
        }

        $procurementDetail = $packageProject->procurementDetail()->create($validated);

        return redirect()->route('admin.procurement-details.show', $procurementDetail)
            ->with('success', 'Procurement details created successfully.');
    }

    public function show(ProcurementDetail $procurementDetail)
    {
        $procurementDetail->load('packageProject');
        
        return view('admin.procurement_details.show', compact('procurementDetail'));
    }

    public function edit(ProcurementDetail $procurementDetail)
    {
        $methodsOfProcurement = $procurementDetail->packageProject->category?->methods_of_procurement ?? [];
        
        return view('admin.procurement_details.edit', [
            'procurementDetail' => $procurementDetail,
            'methodsOfProcurement' => $methodsOfProcurement
        ]);
    }

    public function update(Request $request, ProcurementDetail $procurementDetail)
    {
        $validated = $request->validate([
            'method_of_procurement' => 'required|string|max:255',
            'type_of_procurement' => 'required|string|max:255',
            'publication_date' => 'nullable|date',
            'publication_document' => 'nullable|file|mimes:pdf,doc,docx|max:2048',
            'tender_fee' => 'nullable|numeric|min:0',
            'earnest_money_deposit' => 'nullable|numeric|min:0',
            'bid_validity_days' => 'nullable|integer|min:0',
            'emd_validity_days' => 'nullable|integer|min:0',
        ]);

        if ($request->hasFile('publication_document')) {
            // Delete old file if exists
            if ($procurementDetail->publication_document_path) {
                Storage::disk('public')->delete($procurementDetail->publication_document_path);
            }
            $validated['publication_document_path'] = $request->file('publication_document')
                ->store('procurement_docs', 'public');
        }

        $procurementDetail->update($validated);

        return redirect()->route('admin.procurement-details.show', $procurementDetail)
            ->with('success', 'Procurement details updated successfully.');
    }

    public function destroy(ProcurementDetail $procurementDetail)
    {
        // Delete associated file if exists
        if ($procurementDetail->publication_document_path) {
            Storage::disk('public')->delete($procurementDetail->publication_document_path);
        }

        $procurementDetail->delete();

        return redirect()->route('admin.package-projects.show', $procurementDetail->package_project_id)
            ->with('success', 'Procurement details deleted successfully.');
    }
}