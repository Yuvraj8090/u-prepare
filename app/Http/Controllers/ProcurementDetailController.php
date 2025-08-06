<?php

namespace App\Http\Controllers;

use App\Models\ProcurementDetail;
use App\Models\PackageProject;
use Illuminate\Http\Request;

class ProcurementDetailController extends Controller
{
    public function create(PackageProject $packageProject)
    {
        return view('admin.procurement_details.create', compact('packageProject'));
    }

    public function store(Request $request, PackageProject $packageProject)
    {
        $validated = $request->validate([
            'method_of_procurement' => 'nullable|string|max:255',
            'type_of_procurement' => 'nullable|string|max:255',
            'publication_date' => 'nullable|date',
            'publication_document' => 'nullable|file|mimes:pdf,doc,docx',
            'tender_fee' => 'nullable|numeric',
            'earnest_money_deposit' => 'nullable|numeric',
            'bid_validity_days' => 'nullable|integer',
            'emd_validity_days' => 'nullable|integer',
        ]);

        if ($request->hasFile('publication_document')) {
            $validated['publication_document_path'] = $request->file('publication_document')->store('procurement_docs');
        }

        $validated['package_project_id'] = $packageProject->id;

        ProcurementDetail::create($validated);

        return redirect()->route('admin.package_projects.show', $packageProject->id)->with('success', 'Procurement details added successfully.');
    }

    public function edit(ProcurementDetail $procurementDetail)
    {
        return view('admin.procurement_details.edit', compact('procurementDetail'));
    }

    public function update(Request $request, ProcurementDetail $procurementDetail)
    {
        $validated = $request->validate([
            'method_of_procurement' => 'nullable|string|max:255',
            'type_of_procurement' => 'nullable|string|max:255',
            'publication_date' => 'nullable|date',
            'publication_document' => 'nullable|file|mimes:pdf,doc,docx',
            'tender_fee' => 'nullable|numeric',
            'earnest_money_deposit' => 'nullable|numeric',
            'bid_validity_days' => 'nullable|integer',
            'emd_validity_days' => 'nullable|integer',
        ]);

        if ($request->hasFile('publication_document')) {
            $validated['publication_document_path'] = $request->file('publication_document')->store('procurement_docs');
        }

        $procurementDetail->update($validated);

        return redirect()->route('admin.package_projects.show', $procurementDetail->package_project_id)->with('success', 'Procurement details updated.');
    }

    public function destroy(ProcurementDetail $procurementDetail)
    {
        $procurementDetail->delete();

        return back()->with('success', 'Procurement details deleted.');
    }
}
