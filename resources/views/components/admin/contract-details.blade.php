<div class="row">


    <div class="col-md-12">
        <h6 class="card-header bg-light text-secondary mb-3 h2"><i class="fas fa-file-signature me-2"></i> Contract Details
        </h6>
        <ul class="list-group list-group-flush">
            <li class="list-group-item d-flex justify-content-between align-items-center">
                <p class="mb-0 d-flex align-items-cente h3">
                    <i class="fas fa-hashtag text-primary me-2"></i> Contract No
                </p>
                <span class="fw-bold h4">{{ $contract->contract_number }}</span>
            </li>
            <li class="list-group-item d-flex justify-content-between align-items-center">
                <p class="mb-0 d-flex align-items-center h3">
                    <i class="fas fa-money-bill-wave text-success me-2"></i> Contract Value
                </p>
                <span class="fw-bold text-success h4">₹{{ number_format($contract->contract_value, 2) }}</span>
            </li>
            <li class="list-group-item d-flex justify-content-between align-items-center">
                <p class="mb-0 d-flex align-items-center h3">
                    <i class="fas fa-shield-alt text-warning me-2"></i> Permormance Guarantee
                </p>
                <span class="fw-bold h4">₹{{ number_format($contract->security ?? 0, 2) }}</span>
            </li>
            <li class="list-group-item d-flex justify-content-between align-items-center">
                <p class="mb-0 d-flex align-items-center h3">
                    <i class="fas fa-calendar-check text-info me-2"></i> Signing Date
                </p>
                <span class="fw-bold h4">
                    {{ optional($contract->signing_date)->format('d M Y') ?? 'N/A' }}</span>
            </li>
            <li class="list-group-item d-flex justify-content-between align-items-center">
                <p class="mb-0 d-flex align-items-center h3">
                    <i class="fas fa-calendar-check text-info me-2"></i> Commencement Date :
                </p>
                <span class="fw-bold h4">
                    {{ optional($contract->commencement_date)->format('d M Y') ?? 'N/A' }}</span>
            </li>
            <li class="list-group-item d-flex justify-content-between align-items-center">
                <p class="mb-0 d-flex align-items-center h3">
                    <i class="fas fa-calendar-check text-info me-2"></i> Initial Completion Date :
                </p>
                <span class="fw-bold h4">
                    {{ optional($contract->initial_completion_date)->format('d M Y') ?? 'N/A' }}</span>
            </li>
            <li class="list-group-item d-flex justify-content-between align-items-center">
                <p class="mb-0 d-flex align-items-center h3">
                    <i class="fas fa-calendar-check text-info me-2"></i> Revised Completion Date :
                </p>
                <span class="fw-bold h4">
                    {{ optional($contract->revised_completion_date)->format('d M Y') ?? 'N/A' }}</span>
            </li>
        </ul>
    </div>
</div>
