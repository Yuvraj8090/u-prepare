<div class="row">
    <div class="col-12">
        <div class="card mb-4">
            <div class="card-header bg-light">

                <div class="row">
                    <div class="col-md-6">

                        <h6 class="mb-0">
                            <i
                                class="fas fa-check-circle me-2 h2 
                                {{ $procurementDetail->method_of_procurement ? 'text-success' : 'text-secondary' }}"></i>
                            <span class="form-label text-muted h2"> Procurement Details </span>
                        </h6>
                    </div>
                    <div class="col-md-6">
                        @if ($procurementDetail->publication_document_path)
                            <div class="mt-3 pull-right">
                                <a href="{{ asset('storage/' . $procurementDetail->publication_document_path) }}"
                                    target="_blank" class="btn btn-outline-primary">
                                    <i class="fas fa-file-pdf me-2"></i> View Bid Publication Document
                                </a>
                            </div>
                        @endif
                    </div>
                </div>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-md-6">
                        <dl class="row mb-0">
                            <dt class="col-sm-5 text-muted h3">Method</dt>
                            <dd class="col-sm-7 h4">
                                {{ $procurementDetail->method_of_procurement }}</dd>

                            <dt class="col-sm-5 text-muted h3">Type</dt>
                            <dd class="col-sm-7 h4">
                                {{ $procurementDetail->type_of_procurement }}</dd>

                            <dt class="col-sm-5 text-muted h3">Publication Date</dt>
                            <dd class="col-sm-7 h4">
                                {{ optional($procurementDetail->publication_date)->format('d M Y') ?? 'N/A' }}
                            </dd>
                        </dl>
                    </div>
                    <div class="col-md-6">
                        <dl class="row mb-0">
                            <dt class="col-sm-5 text-muted h3">Tender Fee</dt>
                            <dd class="col-sm-7 h4">
                                ₹ {{ number_format($procurementDetail->tender_fee, 2) }}
                            </dd>
                            <dt class="col-sm-5 text-muted h3">EMD Amount</dt>
                            <dd class="col-sm-7 h4">
                                ₹ {{ number_format($procurementDetail->earnest_money_deposit, 2) }}
                            </dd>
                            <dt class="col-sm-5 text-muted h3">Bid Validity</dt>
                            <dd class="col-sm-7 h4">
                                {{ $procurementDetail->bid_validity_days }} days</dd>
                        </dl>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
