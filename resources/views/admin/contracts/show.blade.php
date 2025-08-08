@extends('admin.layouts.app')

@section('title', 'View Contract')

@section('content')
<div class="container mx-auto p-4 max-w-xl">
    <h1 class="text-2xl font-bold mb-4">Contract Details</h1>

    <div class="bg-white p-4 rounded shadow">
        <p><strong>Contract Number:</strong> {{ $contract->contract_number }}</p>
        <p><strong>Project:</strong> {{ $contract->project->package_name ?? 'N/A' }}</p>
        <p><strong>Contractor:</strong> {{ $contract->contractor->company_name ?? 'N/A' }}</p>
        <p><strong>Contract Value:</strong> ₹{{ number_format($contract->contract_value, 2) }}</p>
        <p><strong>Security Deposit:</strong> ₹{{ number_format($contract->security, 2) }}</p>
        <p><strong>Signing Date:</strong> {{ optional($contract->signing_date)->format('d M Y') ?? 'N/A' }}</p>
        <p><strong>Commencement Date:</strong> {{ optional($contract->commencement_date)->format('d M Y') ?? 'N/A' }}</p>
        <p><strong>Initial Completion Date:</strong> {{ optional($contract->initial_completion_date)->format('d M Y') ?? 'N/A' }}</p>
        <p><strong>Revised Completion Date:</strong> {{ optional($contract->revised_completion_date)->format('d M Y') ?? 'N/A' }}</p>
        <p><strong>Actual Completion Date:</strong> {{ optional($contract->actual_completion_date)->format('d M Y') ?? 'N/A' }}</p>
        <p><strong>Contract Document:</strong> {{ $contract->contract_document ?? 'N/A' }}</p>
        <p><strong>Created At:</strong> {{ $contract->created_at->format('d M Y') }}</p>
        <p><strong>Updated At:</strong> {{ $contract->updated_at->format('d M Y') }}</p>
    </div>

    <div class="mt-4 space-x-2">
        <a href="{{ route('admin.contracts.edit', $contract) }}" class="btn btn-primary">Edit</a>
        <a href="{{ route('admin.contracts.index') }}" class="btn btn-secondary">Back to List</a>
    </div>
</div>
@endsection
