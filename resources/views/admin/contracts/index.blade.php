<x-app-layout>
    <div class="container-fluid">
        <!-- Breadcrumb -->
        <x-admin.breadcrumb-header icon="fas fa-file-contract text-primary" title="Contracts Management"
            :breadcrumbs="[
                ['route' => 'dashboard', 'label' => '<i class=\'fas fa-home\'></i>'],
                ['label' => 'Admin'],
                ['label' => 'Contracts'],
            ]" />

        <!-- Flash Messages -->
        @if (session('success'))
            <div class="row mb-3">
                <div class="col-md-12">
                    <x-alert type="success" :message="session('success')" dismissible />
                </div>
            </div>
        @endif
        @if (session('error'))
            <div class="row mb-3">
                <div class="col-md-12">
                    <x-alert type="danger" :message="session('error')" dismissible />
                </div>
            </div>
        @endif

        <!-- Summary Cards -->
        <div class="row mb-4">
            <div class="col-md-3">
                <div class="card shadow-sm border-0 bg-primary text-white">
                    <div class="card-body d-flex align-items-center justify-content-between">
                        <div>
                            <h6>Total Contracts</h6>
                            <h4>{{ $contracts->count() }}</h4>
                        </div>
                        <i class="fas fa-file-contract fa-2x"></i>
                    </div>
                </div>
            </div>

            <div class="col-md-3">
                <div class="card shadow-sm border-0 bg-success text-white">
                    <div class="card-body d-flex align-items-center justify-content-between">
                        <div>
                            <h6>Active Securities</h6>
                            <h4>{{ $contracts->sum(fn($c) => $c->active_securities?->count() ?? 0) }}</h4>
                        </div>
                        <i class="fas fa-shield-alt fa-2x"></i>
                    </div>
                </div>
            </div>

            <div class="col-md-3">
                <div class="card shadow-sm border-0 bg-danger text-white">
                    <div class="card-body d-flex align-items-center justify-content-between">
                        <div>
                            <h6>Expired Securities</h6>
                            <h4>{{ $contracts->sum(fn($c) => $c->expired_securities?->count() ?? 0) }}</h4>
                        </div>
                        <i class="fas fa-exclamation-triangle fa-2x"></i>
                    </div>
                </div>
            </div>
        </div>

        <!-- Data Table -->
        <div class="card shadow-sm">
            <div class="card-header bg-white d-flex justify-content-between align-items-center">
                <h5 class="mb-0 text-primary">
                    <i class="fas fa-list me-2"></i> Contracts Overview
                </h5>
                <a href="{{ route('admin.contracts.create') }}" class="btn btn-primary btn-sm">
                    <i class="fas fa-plus-circle me-1"></i> Add New Contract
                </a>
            </div>

            <div class="card-body">
                <x-admin.data-table id="package-projects-table" :headers="[
                    'Package',
                    'Category',
                    'Sanction Budget (₹)',
                    'District',
                    'Procurement',
                    'Contracts',
                    'Securities',
                    'Actions',
                ]" :excel="true" :print="true"
                    title="Package Projects Export" searchPlaceholder="Search package projects..."
                    resourceName="package-projects" :pageLength="10">

                    @foreach ($packageProjects as $project)
                        <tr>
                            <!-- Package Name & Number -->
                            <td style="max-width: 250px;">
                                <a href="{{ route('admin.package-projects.show', $project->id) }}"
                                    title="{{ $project->package_name }}"
                                    class="fw-bold text-primary text-truncate d-block">
                                    {{ $project->package_name }}
                                </a>
                                <span class="text-muted small d-block text-truncate"
                                    title="{{ $project->package_number }}">
                                    <i class="fas fa-hashtag"></i> {{ $project->package_number }}
                                </span>

                                <div class="d-flex flex-wrap gap-1 mt-1">
                                    <span class="badge bg-{{ $project->dec_approved ? 'warning' : 'secondary' }}"
                                        title="DEC Approval Status">
                                        <i class="fas fa-check-circle"></i> DEC:
                                        {{ $project->dec_approved ? 'Approved' : 'Pending' }}
                                    </span>

                                    <span class="badge bg-{{ $project->hpc_approved ? 'info' : 'secondary' }}"
                                        title="HPC Approval Status">
                                        <i class="fas fa-check-circle"></i> HPC:
                                        {{ $project->hpc_approved ? 'Approved' : 'Pending' }}
                                    </span>

                                    @if ($project->department?->name)
                                        <span class="badge bg-success text-white" title="Implementing Agency">
                                            <i class="fas fa-building"></i> {{ $project->department->name }}
                                        </span>
                                    @endif
                                </div>
                            </td>

                            <!-- Category / Subcategory -->
                            <td style="max-width: 150px;">
                                @if ($project->category?->name)
                                    <span class="fw-bold text-truncate d-block" title="{{ $project->category->name }}">
                                        <i class="fas fa-tags"></i> {{ $project->category->name }}
                                    </span>
                                @endif
                                @if ($project->subCategory?->name)
                                    <span class="text-muted small d-block text-truncate"
                                        title="{{ $project->subCategory->name }}">
                                        ({{ $project->subCategory->name }})
                                    </span>
                                @endif
                            </td>

                            <!-- Sanction Budget -->
                            <td class="align-middle text-success fw-bold">
                                {{ formatPriceToCR($project->estimated_budget_incl_gst) }}
                            </td>

                            <!-- Location -->
                            <td style="max-width: 150px;">
                                <div class="text-truncate" title="{{ $project->district?->name ?? 'N/A' }}">
                                    {{ $project->district?->name ?? 'N/A' }}
                                </div>
                                @if ($project->block?->name)
                                    <div class="text-muted small text-truncate"
                                        title="Block: {{ $project->block->name }}">
                                        Block: <i class="fas fa-map-marker-alt"></i> {{ $project->block->name }}
                                    </div>
                                @endif
                            </td>

                            <!-- Procurement -->
                            <td class="align-middle" style="max-width: 150px;">
                                @if ($project->procurementDetail)
                                    <span class="badge bg-success text-dark mb-1" title="Procurement Completed">
                                        <i class="fas fa-check-circle"></i> Completed
                                    </span>
                                    <div class="text-truncate"
                                        title="Method: {{ $project->procurementDetail->method_of_procurement }}">
                                        Method: {{ $project->procurementDetail->method_of_procurement }}
                                    </div>
                                    <div class="text-truncate"
                                        title="Type: {{ $project->procurementDetail->typeOfProcurement?->name }}">
                                        Type: {{ $project->procurementDetail->typeOfProcurement?->name }}
                                    </div>
                                @else
                                    <span class="badge bg-warning text-dark" title="Procurement Pending">
                                        <i class="fas fa-exclamation-circle"></i> Pending
                                    </span>
                                @endif
                            </td>

                            <!-- Contracts -->
                            <td class="align-middle" style="max-width: 180px;">
                                @if ($project->contracts->isNotEmpty())
                                    <div class="dropdown">
                                        <button class="btn btn-sm btn-outline-info dropdown-toggle w-100" type="button"
                                            data-bs-toggle="dropdown" aria-expanded="false">
                                            {{ $project->contracts->count() }} Contract(s)
                                        </button>
                                        <ul class="dropdown-menu shadow-sm p-2" style="min-width: 300px;">
                                            @foreach ($project->contracts as $contract)
                                                <li class="list-group-item d-flex justify-content-between align-items-center"
                                                    title="Contract No: {{ $contract->contract_number }}">
                                                    <span class="text-truncate" style="max-width: 120px;">
                                                        <i class="fas fa-hashtag text-primary me-1"></i>
                                                        {{ $contract->contract_number }}
                                                    </span>
                                                    <span class="fw-bold text-truncate" style="max-width: 120px;"
                                                        title="Contract Value: ₹{{ number_format($contract->contract_value, 2) }}">
                                                        ₹{{ number_format($contract->contract_value, 2) }}
                                                    </span>
                                                </li>
                                            @endforeach
                                        </ul>
                                    </div>
                                @else
                                    <span class="badge bg-secondary" title="No Contracts Available">
                                        <i class="fas fa-times-circle"></i> No Contracts
                                    </span>
                                @endif
                            </td>

                            <td>
                                @foreach ($project->contracts as $contract)
                                    @php
                                        $activeCount = $contract->active_securities?->count() ?? 0;
                                        $expiredCount = $contract->expired_securities?->count() ?? 0;
                                    @endphp

                                    @if ($activeCount > 0)
                                        <span class="badge bg-success">
                                            <i class="fas fa-shield-alt"></i> Active: {{ $activeCount }}
                                        </span>
                                    @endif

                                    @if ($expiredCount > 0)
                                        <span class="badge bg-danger">
                                            <i class="fas fa-exclamation-circle"></i> Expired: {{ $expiredCount }}
                                        </span>
                                    @endif
                                @endforeach
                            </td>


                            <!-- Actions -->
                            <td class="align-middle text-center" style="min-width: 120px;">
                                @if ($project->contracts->isNotEmpty())
                                    <div class="d-flex flex-column gap-2">
                                        <div class="d-flex justify-content-center gap-1">
                                            <a href="{{ route('admin.contracts.show', $contract) }}"
                                                class="btn btn-sm btn-outline-info" title="View Contract Details">
                                                <i class="fas fa-eye"></i>
                                            </a>
                                            <a href="{{ route('admin.contracts.edit', $contract) }}"
                                                class="btn btn-sm btn-outline-primary"
                                                title="Edit Contract Information">
                                                <i class="fas fa-edit"></i>
                                            </a>
                                            <form action="{{ route('admin.contracts.destroy', $contract) }}"
                                                method="POST" class="d-inline">
                                                @csrf
                                                @method('DELETE')
                                                <button type="submit" class="btn btn-sm btn-outline-danger"
                                                    onclick="return confirm('Are you sure you want to delete this contract?')"
                                                    title="Delete This Contract Permanently">
                                                    <i class="fas fa-trash-alt"></i>
                                                </button>
                                            </form>
                                        </div>
                                        <a href="{{ route('admin.contracts.securities.index', $contract) }}"
                                            class="btn btn-sm btn-outline-success"
                                            title="Manage Securities for This Contract">
                                            <i class="fas fa-shield-alt"></i>
                                        </a>
                                    </div>
                                @else
                                    <a href="{{ route('admin.contracts.create', ['package_project_id' => $project->id]) }}"
                                        class="btn btn-sm btn-outline-primary" title="Create a New Contract">
                                        <i class="fas fa-plus"></i>
                                    </a>
                                @endif
                            </td>
                        </tr>
                    @endforeach
                </x-admin.data-table>
            </div>
        </div>
    </div>
</x-app-layout>
