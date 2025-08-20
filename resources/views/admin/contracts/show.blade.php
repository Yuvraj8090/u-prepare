<x-app-layout>
    <div class="container-fluid py-4">


        <!-- Breadcrumb -->
        <x-admin.breadcrumb-header icon="fas fa-file-contract text-primary"
            title="Package Contract Details | {{ $contract->contract_number }}" :breadcrumbs="[
                ['route' => 'dashboard', 'label' => '<i class=\'fas fa-home\'></i>'],
                ['label' => 'Admin'],
                ['label' => 'Contracts', 'route' => 'admin.contracts.index'],
                ['label' => 'Show'],
            ]" />


        <x-admin.package-card :packageProject="$contract->project" />


        <div class="row mt-4 mb-4">

            <div class="col-md-4">
                <x-admin.approval-details :packageProject="$contract->project" />


                <x-admin.contract-details :contract="$contract" />

                {{-- Contractor Info --}}
                <x-admin.contractor-info :contractor="$contract->contractor" />

            </div>

            <div class="col-md-8">

                @if ($contract->project && $contract->project->procurementDetail)
                    <div class="card mb-4">
                        <div class="card-header bg-light">

                            <div class="row">
                                <div class="col-md-6">

                                      <h6 class="mb-0">
                                <i class="fas fa-check-circle me-2 h2 
                                {{ $contract->project->procurementDetail->method_of_procurement ? 'text-success' : 'text-secondary' }}"></i>
                                <span class="form-label text-muted h2"> Procurement Details </span>
                            </h6>
                                </div>
                                <div class="col-md-6">
                                        @if ($contract->project->procurementDetail->publication_document_path)
                                            <div class="mt-3 pull-right">
                                                <a href="{{ asset('storage/' . $contract->project->procurementDetail->publication_document_path) }}"
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
                                            {{ $contract->project->procurementDetail->method_of_procurement }}</dd>

                                        <dt class="col-sm-5 text-muted h3">Type</dt>
                                        <dd class="col-sm-7 h4">
                                            {{ $contract->project->procurementDetail->type_of_procurement }}</dd>

                                        <dt class="col-sm-5 text-muted h3">Publication Date</dt>
                                        <dd class="col-sm-7 h4">
                                            {{ optional($contract->project->procurementDetail->publication_date)->format('d M Y') ?? 'N/A' }}
                                        </dd>
                                    </dl>
                                </div>
                                <div class="col-md-6">
                                    <dl class="row mb-0">
                                        <dt class="col-sm-5 text-muted h3">Tender Fee</dt>
                                        <dd class="col-sm-7 h4">
                                            ₹ {{ number_format($contract->project->procurementDetail->tender_fee, 2) }}
                                        </dd>

                                        <dt class="col-sm-5 text-muted h3">EMD Amount</dt>
                                        <dd class="col-sm-7 h4">
                                            ₹ {{ number_format($contract->project->procurementDetail->earnest_money_deposit, 2) }}
                                        </dd>

                                        <dt class="col-sm-5 text-muted h3">Bid Validity</dt>
                                        <dd class="col-sm-7 h4">
                                            {{ $contract->project->procurementDetail->bid_validity_days }} days</dd>
                                    </dl>
                                </div>
                            </div>
                        </div>
                    </div>
                @endif

                {{-- Yuvraj Add Procurement Work Program   --}}

                <div class="card shadow-sm mb-4">
                    <div class="card-header bg-white d-flex justify-content-between align-items-center border-0">
                         <h6 class="text-secondary mb-3 h2">
                                <i class="fas fa-layer-group me-2"></i>
                                Sub-Projects ({{ $contract->count_sub_project }})
                            </h6>
                    </div>

                    <div class="card-body">
                        <div class="row">
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
                                                    <small>₹{{ $sp['financeTotal'] }}
                                                        ({{ $sp['financePercent'] }}%)</small>
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
                                                    <small>₹{{ $sp['physicalValue'] }}
                                                        ({{ $sp['physicalPercent'] }}%)</small>
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
                    </div>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>
