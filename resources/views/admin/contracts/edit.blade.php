@extends('admin.layouts.app')

@section('title', 'Create Contract')

@section('content')
<div class="container mx-auto p-4 max-w-2xl">
    <h1 class="text-2xl font-bold mb-4">Create Contract</h1>

    @if ($errors->any())
    <div class="bg-red-100 text-red-700 p-3 mb-4 rounded">
        <ul class="list-disc pl-5">
            @foreach ($errors->all() as $error)
            <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
    @endif

    <form action="{{ route('admin.contracts.store') }}" method="POST">
        @csrf

        <div class="mb-4">
            <label for="contract_number" class="block font-semibold mb-1">Contract Number <span class="text-red-600">*</span></label>
            <input type="text" name="contract_number" id="contract_number" value="{{ old('contract_number') }}" required class="w-full border px-3 py-2 rounded" />
        </div>

        <div class="mb-4">
            <label for="project_id" class="block font-semibold mb-1">Project <span class="text-red-600">*</span></label>
            <select name="project_id" id="project_id" required class="w-full border px-3 py-2 rounded">
                <option value="">Select Project</option>
                @foreach($projects as $project)
                <option value="{{ $project->id }}" @selected(old('project_id') == $project->id)>{{ $project->package_name }}</option>
                @endforeach
            </select>
        </div>

        <div class="mb-4">
            <label for="contract_value" class="block font-semibold mb-1">Contract Value (₹) <span class="text-red-600">*</span></label>
            <input type="number" step="0.01" min="0" name="contract_value" id="contract_value" value="{{ old('contract_value') }}" required class="w-full border px-3 py-2 rounded" />
        </div>

        <div class="mb-4">
            <label for="security" class="block font-semibold mb-1">Security Deposit (₹)</label>
            <input type="number" step="0.01" min="0" name="security" id="security" value="{{ old('security', 0) }}" class="w-full border px-3 py-2 rounded" />
        </div>

        <!-- Dates -->
        <div class="grid grid-cols-2 gap-4 mb-4">
            <div>
                <label for="signing_date" class="block font-semibold mb-1">Signing Date</label>
                <input type="date" name="signing_date" id="signing_date" value="{{ old('signing_date') }}" class="w-full border px-3 py-2 rounded" />
            </div>
            <div>
                <label for="commencement_date" class="block font-semibold mb-1">Commencement Date</label>
                <input type="date" name="commencement_date" id="commencement_date" value="{{ old('commencement_date') }}" class="w-full border px-3 py-2 rounded" />
            </div>
            <div>
                <label for="initial_completion_date" class="block font-semibold mb-1">Initial Completion Date</label>
                <input type="date" name="initial_completion_date" id="initial_completion_date" value="{{ old('initial_completion_date') }}" class="w-full border px-3 py-2 rounded" />
            </div>
            <div>
                <label for="revised_completion_date" class="block font-semibold mb-1">Revised Completion Date</label>
                <input type="date" name="revised_completion_date" id="revised_completion_date" value="{{ old('revised_completion_date') }}" class="w-full border px-3 py-2 rounded" />
            </div>
            <div>
                <label for="actual_completion_date" class="block font-semibold mb-1">Actual Completion Date</label>
                <input type="date" name="actual_completion_date" id="actual_completion_date" value="{{ old('actual_completion_date') }}" class="w-full border px-3 py-2 rounded" />
            </div>
        </div>

        <!-- Contract Document -->
        <div class="mb-4">
            <label for="contract_document" class="block font-semibold mb-1">Contract Document (File Path)</label>
            <input type="text" name="contract_document" id="contract_document" value="{{ old('contract_document') }}" placeholder="e.g. documents/contract123.pdf" class="w-full border px-3 py-2 rounded" />
        </div>

        <!-- Contractor Selection or Creation -->
        <fieldset class="mb-4 border p-3 rounded">
            <legend class="font-semibold mb-2">Contractor</legend>

            <div class="mb-2">
                <label for="contractor_id" class="block font-semibold mb-1">Select Existing Contractor</label>
                <select name="contractor_id" id="contractor_id" class="w-full border px-3 py-2 rounded">
                    <option value="">-- Select Contractor --</option>
                    @foreach($contractors as $contractor)
                    <option value="{{ $contractor->id }}" @selected(old('contractor_id') == $contractor->id)>{{ $contractor->company_name }}</option>
                    @endforeach
                </select>
            </div>

            <p class="mb-2 text-gray-600">OR create new contractor below (if none selected above):</p>

            <div class="grid grid-cols-2 gap-4">
                <div>
                    <label for="contractor_company_name" class="block font-semibold mb-1">Company Name</label>
                    <input type="text" name="contractor[company_name]" id="contractor_company_name" value="{{ old('contractor.company_name') }}" class="w-full border px-3 py-2 rounded" />
                </div>
                <div>
                    <label for="contractor_authorized_personnel_name" class="block font-semibold mb-1">Authorized Personnel</label>
                    <input type="text" name="contractor[authorized_personnel_name]" id="contractor_authorized_personnel_name" value="{{ old('contractor.authorized_personnel_name') }}" class="w-full border px-3 py-2 rounded" />
                </div>
                <div>
                    <label for="contractor_phone" class="block font-semibold mb-1">Phone</label>
                    <input type="text" name="contractor[phone]" id="contractor_phone" value="{{ old('contractor.phone') }}" class="w-full border px-3 py-2 rounded" />
                </div>
                <div>
                    <label for="contractor_email" class="block font-semibold mb-1">Email</label>
                    <input type="email" name="contractor[email]" id="contractor_email" value="{{ old('contractor.email') }}" class="w-full border px-3 py-2 rounded" />
                </div>
                <div>
                    <label for="contractor_gst_no" class="block font-semibold mb-1">GST Number</label>
                    <input type="text" name="contractor[gst_no]" id="contractor_gst_no" value="{{ old('contractor.gst_no') }}" class="w-full border px-3 py-2 rounded" />
                </div>
                <div class="col-span-2">
                    <label for="contractor_address" class="block font-semibold mb-1">Address</label>
                    <textarea name="contractor[address]" id="contractor_address" rows="3" class="w-full border px-3 py-2 rounded">{{ old('contractor.address') }}</textarea>
                </div>
            </div>
        </fieldset>

        <div class="flex justify-end space-x-2">
            <a href="{{ route('admin.contracts.index') }}" class="btn btn-secondary px-4 py-2 rounded">Cancel</a>
            <button type="submit" class="btn btn-primary px-4 py-2 rounded">Create Contract</button>
        </div>
    </form>
</div>
@endsection
