<x-app-layout>
    <div class="container-fluid py-4">

        <!-- Breadcrumb -->
        <div class="row mb-4">
            <div class="col-md-12 d-flex justify-content-between align-items-center">
                <h4 class="mb-0 text-primary">
                    <i class="fas fa-file-contract me-2"></i> Contract Details
                </h4>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb mb-0 bg-white p-2 rounded shadow-sm">
                        <li class="breadcrumb-item">
                            <a href="{{ route('dashboard') }}" class="text-decoration-none">
                                <i class="fas fa-home"></i>
                            </a>
                        </li>
                        <li class="breadcrumb-item">Admin</li>
                        <li class="breadcrumb-item">
                            <a href="{{ route('admin.contracts.index') }}" class="text-decoration-none">Contracts</a>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">Details</li>
                    </ol>
                </nav>
            </div>
        </div>

        <div class="card shadow-sm mb-4">
            <div class="card-header bg-white d-flex justify-content-between align-items-center border-0">
                <h5 class="mb-0 text-primary">
                    <i class="fas fa-info-circle me-2"></i> {{ $contract->contract_number }}
                </h5>
                <div>
                    <a href="{{ route('admin.contracts.edit', $contract) }}"
                        class="btn btn-sm btn-outline-primary me-2">
                        <i class="fas fa-edit me-1"></i> Edit
                    </a>
                    <a href="{{ route('admin.contracts.index') }}" class="btn btn-sm btn-outline-secondary">
                        <i class="fas fa-list me-1"></i> Back to List
                    </a>
                </div>
            </div>

            <div class="card-body">

                {{-- Contract & Project Info --}}
                <div class="row mb-4">
                    <div class="col-md-6">
                        <h6 class="text-secondary mb-3"><i class="fas fa-file-signature me-2"></i> Contract Information
                        </h6>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                <p class="mb-0 d-flex align-items-center">
                                    <i class="fas fa-hashtag text-primary me-2"></i> Contract Number
                                </p>
                                <span class="fw-bold">{{ $contract->contract_number }}</span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                <p class="mb-0 d-flex align-items-center">
                                    <i class="fas fa-money-bill-wave text-success me-2"></i> Contract Value
                                </p>
                                <span
                                    class="fw-bold text-success">₹{{ number_format($contract->contract_value, 2) }}</span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                <p class="mb-0 d-flex align-items-center">
                                    <i class="fas fa-shield-alt text-warning me-2"></i> Security Deposit
                                </p>
                                <span class="fw-bold">₹{{ number_format($contract->security ?? 0, 2) }}</span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                <p class="mb-0 d-flex align-items-center">
                                    <i class="fas fa-calendar-check text-info me-2"></i> Signing Date
                                </p>
                                <span>{{ optional($contract->signing_date)->format('d M Y') ?? 'N/A' }}</span>
                            </li>
                        </ul>
                    </div>

                    <div class="col-md-6">
                        <h6 class="text-secondary mb-3"><i class="fas fa-project-diagram me-2"></i> Project Information
                        </h6>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                <p class="mb-0 d-flex align-items-center">
                                    <i class="fas fa-box text-primary me-2"></i> Package Name
                                </p>
                                <span class="fw-bold">{{ $contract->project->package_name ?? 'N/A' }}</span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                <p class="mb-0 d-flex align-items-center">
                                    <i class="fas fa-barcode text-secondary me-2"></i> Package Number
                                </p>
                                <span>{{ $contract->project->package_number ?? 'N/A' }}</span>
                            </li>
                        </ul>
                    </div>
                </div>

                {{-- Contractor Info --}}
                <div class="mb-4">
                    <h6 class="text-secondary mb-3"><i class="fas fa-user-tie me-2"></i> Contractor Information</h6>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            <p class="mb-0 d-flex align-items-center">
                                <i class="fas fa-building text-primary me-2"></i> Company Name
                            </p>
                            <span class="fw-bold">{{ $contract->contractor->company_name ?? 'N/A' }}</span>
                        </li>
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            <p class="mb-0 d-flex align-items-center">
                                <i class="fas fa-receipt text-warning me-2"></i> GST Number
                            </p>
                            <span>{{ $contract->contractor->gst_no ?? 'N/A' }}</span>
                        </li>
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            <p class="mb-0 d-flex align-items-center">
                                <i class="fas fa-envelope text-info me-2"></i> Email
                            </p>
                            <span>{{ $contract->contractor->email ?? 'N/A' }}</span>
                        </li>
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            <p class="mb-0 d-flex align-items-center">
                                <i class="fas fa-phone text-success me-2"></i> Phone
                            </p>
                            <span>{{ $contract->contractor->phone ?? 'N/A' }}</span>
                        </li>
                        <li class="list-group-item d-flex justify-content-between align-items-start">
                            <p class="mb-0 d-flex align-items-center">
                                <i class="fas fa-map-marker-alt text-danger me-2 mt-1"></i> Address
                            </p>
                            <span>{{ $contract->contractor->address ?? 'N/A' }}</span>
                        </li>
                    </ul>
                </div>

                {{-- Timeline Dates --}}
                <div class="row mb-4">
                    <div class="col-md-4">
                        <div class="border rounded p-3 text-center bg-light">
                            <i class="fas fa-play-circle fa-2x text-primary mb-2"></i>
                            <h6>Commencement Date</h6>
                            <p class="mb-0">{{ optional($contract->commencement_date)->format('d M Y') ?? 'N/A' }}
                            </p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="border rounded p-3 text-center bg-light">
                            <i class="fas fa-flag-checkered fa-2x text-success mb-2"></i>
                            <h6>Initial Completion</h6>
                            <p class="mb-0">
                                {{ optional($contract->initial_completion_date)->format('d M Y') ?? 'N/A' }}</p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="border rounded p-3 text-center bg-light">
                            <i class="fas fa-calendar-alt fa-2x text-warning mb-2"></i>
                            <h6>Revised Completion</h6>
                            <p class="mb-0">
                                {{ optional($contract->revised_completion_date)->format('d M Y') ?? 'N/A' }}</p>
                        </div>
                    </div>
                </div>

                @if ($contract->project && $contract->project->procurementDetail)
                    <div class="card mb-4">
                        <div class="card-header bg-light">
                            <h6 class="mb-0">
                                <i class="fas fa-file-invoice-dollar text-primary me-2"></i> Procurement Details
                            </h6>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <dl class="row mb-0">
                                        <dt class="col-sm-5 text-muted">Method</dt>
                                        <dd class="col-sm-7">
                                            {{ $contract->project->procurementDetail->method_of_procurement }}</dd>

                                        <dt class="col-sm-5 text-muted">Type</dt>
                                        <dd class="col-sm-7">
                                            {{ $contract->project->procurementDetail->type_of_procurement }}</dd>

                                        <dt class="col-sm-5 text-muted">Publication Date</dt>
                                        <dd class="col-sm-7">
                                            {{ optional($contract->project->procurementDetail->publication_date)->format('d M Y') ?? 'N/A' }}
                                        </dd>
                                    </dl>
                                </div>
                                <div class="col-md-6">
                                    <dl class="row mb-0">
                                        <dt class="col-sm-5 text-muted">Tender Fee</dt>
                                        <dd class="col-sm-7">
                                            ₹{{ number_format($contract->project->procurementDetail->tender_fee, 2) }}
                                        </dd>

                                        <dt class="col-sm-5 text-muted">EMD Amount</dt>
                                        <dd class="col-sm-7">
                                            ₹{{ number_format($contract->project->procurementDetail->earnest_money_deposit, 2) }}
                                        </dd>

                                        <dt class="col-sm-5 text-muted">Bid Validity</dt>
                                        <dd class="col-sm-7">
                                            {{ $contract->project->procurementDetail->bid_validity_days }} days</dd>
                                    </dl>
                                </div>
                            </div>

                            @if ($contract->project->procurementDetail->publication_document_path)
                                <div class="mt-3">
                                    <a href="{{ asset('storage/' . $contract->project->procurementDetail->publication_document_path) }}"
                                        target="_blank" class="btn btn-outline-primary">
                                        <i class="fas fa-file-pdf me-2"></i> View Procurement Document
                                    </a>
                                </div>
                            @endif
                        </div>
                    </div>
                @endif

                {{-- Sub-Projects --}}
                {{-- Sub-Projects --}}
                <div>
                    <h6 class="text-secondary mb-3">
                        <i class="fas fa-layer-group me-2"></i>
                        Sub-Projects ({{ $contract->count_sub_project }})
                    </h6>

                    @if ($contract->subProjects->isEmpty())
                        <p class="text-muted fst-italic">No sub-projects found.</p>
                    @else
                        <x-admin.data-table id="sub-projects-table" :headers="[
                            '#',
                            'Name',
                            'Contract Value (₹)',
                            'Financial Progress',
                            'Physical Progress',
                            'Actions',
                        ]" :excel="true"
                            :print="true" :pageLength="10" :resourceName="'sub-projects'">

                            @foreach ($subProjectsData as $i => $sp)
                                <tr>
                                    <td>{{ $i + 1 }}</td>
                                    <td>{{ $sp['name'] }}</td>
                                    <td class="text-end">₹{{ $sp['contractValue'] }}</td>

                                    <!-- Financial Progress -->
                                    <td>
                                        <div class="mb-1">
                                            <small>₹{{ $sp['financeTotal'] }} ({{ $sp['financePercent'] }}%)</small>
                                        </div>
                                        <div class="progress" style="height: 12px;">
                                            <div class="progress-bar bg-secondary" role="progressbar"
                                                style="width: {{ $sp['financePercent'] }}%;"
                                                aria-valuenow="{{ $sp['financePercent'] }}" aria-valuemin="0"
                                                aria-valuemax="100">
                                            </div>
                                        </div>
                                    </td>

                                    <!-- Physical Progress -->
                                    <td>
                                        <div class="mb-1">
                                            <small>₹{{ $sp['physicalValue'] }} ({{ $sp['physicalPercent'] }}%)</small>
                                        </div>
                                        <div class="progress" style="height: 12px;">
                                            <div class="progress-bar bg-info" role="progressbar"
                                                style="width: {{ $sp['physicalPercent'] }}%;"
                                                aria-valuenow="{{ $sp['physicalPercent'] }}" aria-valuemin="0"
                                                aria-valuemax="100">
                                            </div>
                                        </div>
                                    </td>

                                    <!-- Actions -->
                                    <td>
                                        <div class="d-flex flex-wrap gap-2">
                                            @foreach ($sp['actions'] as $action)
                                                <a href="{{ $action['route'] }}"
                                                    class="btn btn-sm {{ $action['class'] }} d-flex align-items-center gap-1">
                                                    <i class="{{ $action['icon'] }}"></i>
                                                    <span>{{ $action['label'] }}</span>
                                                </a>
                                            @endforeach
                                        </div>
                                    </td>
                                </tr>
                            @endforeach

                        </x-admin.data-table>
                    @endif
                </div>


                {{-- Footer Buttons --}}
                <div class="mt-4 d-flex justify-content-between align-items-center border-top pt-3">
                    <small class="text-muted">
                        <i class="fas fa-info-circle me-1"></i> Contract ID: {{ $contract->id }}
                    </small>
                    <div>
                        <a href="{{ route('admin.contracts.edit', $contract) }}" class="btn btn-primary me-2">
                            <i class="fas fa-edit me-1"></i> Edit Contract
                        </a>
                        <a href="{{ route('admin.contracts.index') }}" class="btn btn-secondary">
                            <i class="fas fa-arrow-left me-1"></i> Back to List
                        </a>
                    </div>
                </div>

            </div>
        </div>

    </div>
</x-app-layout>
