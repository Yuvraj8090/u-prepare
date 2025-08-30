<div class="row mb-4">
    <div class="col-md-12">
        <div class="card shadow-sm border-0 rounded-3">
            <div class="card-header bg-light d-flex justify-content-between align-items-center">
                <h5 class="mb-0 text-secondary fw-bold">
                    <i class="fas fa-file-signature me-2 text-primary"></i> Contract Details
                </h5>

                {{-- Amendment Badge --}}
                @if($contract->is_updated)
                    <span class="badge bg-warning text-dark px-3 py-2 rounded-pill">
                        <i class="fas fa-edit me-1"></i> Amended ({{ $contract->update_count }})
                    </span>
                @else
                    <span class="badge bg-success px-3 py-2 rounded-pill">
                        <i class="fas fa-check-circle me-1"></i> Original
                    </span>
                @endif
            </div>

            <ul class="list-group list-group-flush">
                <li class="list-group-item d-flex justify-content-between align-items-center">
                    <span class="text-muted"><i class="fas fa-hashtag text-primary me-2"></i> Contract No</span>
                    <span class="fw-bold text-dark">{{ $contract->contract_number }}</span>
                </li>

                <li class="list-group-item d-flex justify-content-between align-items-center">
                    <span class="text-muted"><i class="fas fa-money-bill-wave text-success me-2"></i> Contract Value</span>
                    <span class="fw-bold text-success">₹{{ number_format($contract->contract_value, 2) }}</span>
                </li>

                <li class="list-group-item d-flex justify-content-between align-items-center">
                    <span class="text-muted"><i class="fas fa-shield-alt text-warning me-2"></i> Performance Guarantee</span>
                    <span class="fw-bold text-dark">₹{{ number_format($contract->security ?? 0, 2) }}</span>
                </li>

                <li class="list-group-item d-flex justify-content-between align-items-center">
                    <span class="text-muted"><i class="fas fa-calendar-check text-info me-2"></i> Signing Date</span>
                    <span class="fw-bold">{{ optional($contract->signing_date)->format('d M Y') ?? 'N/A' }}</span>
                </li>

                <li class="list-group-item d-flex justify-content-between align-items-center">
                    <span class="text-muted"><i class="fas fa-calendar-day text-info me-2"></i> Commencement Date</span>
                    <span class="fw-bold">{{ optional($contract->commencement_date)->format('d M Y') ?? 'N/A' }}</span>
                </li>

                <li class="list-group-item d-flex justify-content-between align-items-center">
                    <span class="text-muted"><i class="fas fa-calendar-alt text-info me-2"></i> Initial Completion Date</span>
                    <span class="fw-bold">{{ optional($contract->initial_completion_date)->format('d M Y') ?? 'N/A' }}</span>
                </li>

                <li class="list-group-item d-flex justify-content-between align-items-center">
                    <span class="text-muted"><i class="fas fa-calendar-plus text-info me-2"></i> Revised Completion Date</span>
                    <span class="fw-bold">{{ optional($contract->revised_completion_date)->format('d M Y') ?? 'N/A' }}</span>
                </li>
            </ul>
        </div>
    </div>
</div>
