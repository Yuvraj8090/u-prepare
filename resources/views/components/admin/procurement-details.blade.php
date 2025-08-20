<div class="row mt-3">
    <!-- HPC and DEC Approvals -->
    <div class="col-md-12 mb-4">
        <div class="card h-100">
            <div class="card-header bg-light">
                <h6 class="mb-0">

                    <span class="form-label text-muted h2"> Procuremnt Details </span>
                </h6>
            </div>
            <div class="card-body">

                <div class="row mb-4">
                    <div class="col-md-4">
                        <p for="method_of_procurement" class="form-label h3">Method of Procurement </p>
                        <p class="fw-semibold">{{ $procurementDetail->method_of_procurement ?? 'Not specified' }}</p>

                    </div>

                    <div class="col-md-4">
                        <p class="form-label h3">Type of Procurement</p>
                        <p class="fw-semibold">{{ $procurementDetail->typeOfProcurement?->name ?? '-' }}</p>

                    </div>

                    <div class="col-md-4">
                        <p for="publication_date" class="form-label h3">Bid Publication Date</p>

                        <p class="fw-semibold">
                            @if ($procurementDetail->publication_date)
                                {{ formatDate($procurementDetail->publication_date) }}
                            @else
                                Not specified
                            @endif
                        </p>
                    </div>

                </div>

                <div class="row mb-4">

                    <div class="col-md-4">
                        <p for="tender_fee" class="form-label h3">Tender Fee (₹)</p>
                        <p class="fw-semibold">
                            @if ($procurementDetail->tender_fee)
                                ₹{{ number_format($procurementDetail->tender_fee, 2) }}
                            @else
                                Not specified
                            @endif
                        </p>
                    </div>

                    <div class="col-md-4">
                        <p for="earnest_money_deposit" class="form-label h3">EMD Value (₹)</p>
                        <p class="fw-semibold">
                            @if ($procurementDetail->earnest_money_deposit)
                                ₹{{ number_format($procurementDetail->earnest_money_deposit, 2) }}
                            @else
                                Not specified
                            @endif
                        </p>
                    </div>


                    <div class="col-md-4">
                        <p for="emd_validity_days" class="form-label h3">EMD Validity <span class="h5">
                                (in Days) </span> </p>
                        <p class="fw-semibold">
                            @if ($procurementDetail->emd_validity_days)
                                {{ $procurementDetail->emd_validity_days }} days
                            @else
                                Not specified
                            @endif
                        </p>
                    </div>
                </div>

                <div class="row mb-4">

                    <div class="col-md-4">
                        <p for="bid_validity_days" class="form-label h3">Bid Validity <span class="h5">
                                (in Days) </span> </p>
                        <p class="fw-semibold">
                            @if ($procurementDetail->bid_validity_days)
                                {{ $procurementDetail->bid_validity_days }} days
                            @else
                                Not specified
                            @endif
                        </p>
                    </div>

                    <div class="col-md-4">
                        <p for="publication_document" class="form-label h3"> Bid Publication Document</p>
                        @if ($procurementDetail->publication_document_path)
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
                        @endif
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
