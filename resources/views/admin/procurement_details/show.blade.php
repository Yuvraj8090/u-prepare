<x-app-layout>
    <div class="container-fluid">
        <!-- Breadcrumb -->
        <div class="row mb-4">
            <div class="col-md-12 d-flex justify-content-between align-items-center">
                <h4 class="mb-0">
                    <i class="fas fa-file-contract text-primary me-2"></i> Procurement Details
                </h4>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb mb-0">
                        <li class="breadcrumb-item"><a href="{{ route('dashboard') }}"><i class="fas fa-home"></i></a></li>
                        <li class="breadcrumb-item">Admin</li>
                        <li class="breadcrumb-item"><a href="{{ route('admin.package-projects.index') }}">Package Projects</a></li>
                        <li class="breadcrumb-item"><a href="{{ route('admin.package-projects.show', $procurementDetail->package_project_id) }}">Package #{{ $procurementDetail->package_project_id }}</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Procurement Details</li>
                    </ol>
                </nav>
            </div>
        </div>

        <!-- Main Card -->
        <div class="card shadow-sm">
            <div class="card-header bg-white d-flex justify-content-between align-items-center">
                <h5 class="mb-0 text-primary">
                    <i class="fas fa-info-circle me-2"></i> Procurement Details
                </h5>
                <div>
                    <a href="{{ route('admin.package-projects.show', $procurementDetail->package_project_id) }}" class="btn btn-sm btn-secondary me-2">
                        <i class="fas fa-arrow-left me-1"></i> Back to Package
                    </a>
                    <a href="{{ route('admin.procurement-details.edit', $procurementDetail) }}" class="btn btn-sm btn-primary">
                        <i class="fas fa-edit me-1"></i> Edit
                    </a>
                </div>
            </div>

            <div class="card-body">
                <div class="row">
                    <div class="col-md-6">
                        <div class="mb-4">
                            <h6 class="mb-3 text-muted border-bottom pb-2">
                                <i class="fas fa-info-circle me-2"></i> Basic Information
                            </h6>
                            <div class="row">
                                <div class="col-6 mb-3">
                                    <p class="small text-muted mb-1">Method of Procurement</p>
                                    <p class="fw-semibold">{{ $procurementDetail->method_of_procurement ?? 'Not specified' }}</p>
                                </div>
                                <div class="col-6 mb-3">
                                    <p class="small text-muted mb-1">Type of Procurement</p>
                                    <p class="fw-semibold">{{ $procurementDetail->type_of_procurement ?? 'Not specified' }}</p>
                                </div>
                                <div class="col-6 mb-3">
                                    <p class="small text-muted mb-1">Publication Date</p>
                                    <p class="fw-semibold">
                                        @if($procurementDetail->publication_date)
                                            {{ $procurementDetail->publication_date->format('d M, Y') }}
                                        @else
                                            Not specified
                                        @endif
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="mb-4">
                            <h6 class="mb-3 text-muted border-bottom pb-2">
                                <i class="fas fa-money-bill-wave me-2"></i> Financial Details
                            </h6>
                            <div class="row">
                                <div class="col-6 mb-3">
                                    <p class="small text-muted mb-1">Tender Fee</p>
                                    <p class="fw-semibold">
                                        @if($procurementDetail->tender_fee)
                                            ₹{{ number_format($procurementDetail->tender_fee, 2) }}
                                        @else
                                            Not specified
                                        @endif
                                    </p>
                                </div>
                                <div class="col-6 mb-3">
                                    <p class="small text-muted mb-1">EMD Amount</p>
                                    <p class="fw-semibold">
                                        @if($procurementDetail->earnest_money_deposit)
                                            ₹{{ number_format($procurementDetail->earnest_money_deposit, 2) }}
                                        @else
                                            Not specified
                                        @endif
                                    </p>
                                </div>
                                <div class="col-6 mb-3">
                                    <p class="small text-muted mb-1">Bid Validity</p>
                                    <p class="fw-semibold">
                                        @if($procurementDetail->bid_validity_days)
                                            {{ $procurementDetail->bid_validity_days }} days
                                        @else
                                            Not specified
                                        @endif
                                    </p>
                                </div>
                                <div class="col-6 mb-3">
                                    <p class="small text-muted mb-1">EMD Validity</p>
                                    <p class="fw-semibold">
                                        @if($procurementDetail->emd_validity_days)
                                            {{ $procurementDetail->emd_validity_days }} days
                                        @else
                                            Not specified
                                        @endif
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                @if($procurementDetail->publication_document_path)
                <div class="border-top pt-4 mt-4">
                    <h6 class="mb-3 text-muted border-bottom pb-2">
                        <i class="fas fa-file-alt me-2"></i> Documents
                    </h6>
                    <div class="d-flex align-items-center">
                        <i class="fas fa-file-pdf text-danger me-3 fa-2x"></i>
                        <div>
                            <p class="mb-1 fw-semibold">Publication Document</p>
                            <a href="{{ Storage::url($procurementDetail->publication_document_path) }}" 
                               target="_blank" class="btn btn-sm btn-outline-primary">
                                <i class="fas fa-download me-1"></i> Download
                            </a>
                        </div>
                    </div>
                </div>
                @endif
            </div>
        </div>
    </div>
</x-app-layout>