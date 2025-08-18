<x-app-layout>
    <div class="container-fluid">

        <!-- Breadcrumb -->
        <x-admin.breadcrumb-header icon="fas fa-boxes text-primary" title="Package Projects Management"
            :breadcrumbs="[
                ['route' => 'dashboard', 'label' => '<i class=\'fas fa-home\'></i>'],
                ['label' => 'Admin'],
                ['label' => 'Package Projects'],
            ]" />

        <!-- Success/Error Alerts -->
        @if (session('success'))
            <x-alert type="success" :message="session('success')" dismissible class="mb-3" />
        @endif

        @if (session('error'))
            <x-alert type="danger" :message="session('error')" dismissible class="mb-3" />
        @endif

        <!-- Table Card -->
        <div class="card shadow-sm border-0">
            <div class="card-header bg-white d-flex justify-content-between align-items-center">
                <h5 class="mb-0 h4">
                    <i class="fas fa-list me-2 text-primary"></i> Package Projects List
                </h5>
                <a href="{{ route('admin.package-projects.create') }}" class="btn btn-sm btn-primary">
                    <i class="fas fa-plus-circle me-1"></i> Create Package Project
                </a>
            </div>

            <div class="card-body">
                <x-admin.data-table 
                    id="package-projects-table" 
                    :headers="[
                        'Package Name & Number', 
                        'Category / Department', 
                        'Budget (₹)', 
                        'Location', 
                        'Procurement Details', 
                        'Contracts', 
                        'Approvals & Status', 
                        'Actions'
                    ]" 
                    :excel="true" 
                    :print="true" 
                    title="Package Projects Export" 
                    searchPlaceholder="Search package projects..." 
                    resourceName="package-projects" 
                    :pageLength="10"
                >
                    @foreach ($packageProjects as $project)
                        <tr>
                            <!-- Package Name & Number -->
                            <td>
                                <div class="fw-bold text-primary">
                                    <a href="{{ route('admin.package-projects.show', $project->id) }}" class="text-decoration-none">
                                        {{ $project->package_name }}
                                    </a>
                                </div>
                                <div class="small text-muted">
                                    <i class="fas fa-hashtag"></i> {{ $project->package_number ?? 'N/A' }}
                                </div>
                            </td>

                            <!-- Category / Department -->
                            <td>
                                @if($project->subCategory?->name)
                                    <span class="badge bg-info text-white">
                                        <i class="fas fa-tag"></i> {{ $project->subCategory->name }}
                                    </span>
                                @endif
                                @if($project->category?->name)
                                    <span class="badge bg-primary text-white">
                                        <i class="fas fa-layer-group"></i> {{ $project->category->name }}
                                    </span>
                                @endif
                                @if($project->department?->name)
                                    <span class="badge bg-success text-white">
                                        <i class="fas fa-building"></i> {{ $project->department->name }}
                                    </span>
                                @endif
                            </td>

                            <td>
                                @if ($project->category?->name)
                                    <i class="fas fa-tags"></i> {{ $project->category->name }}
                                @endif
                            </td>
                            <td>
                                @if ($project->subCategory?->name)
                                    <i class="fas fa-tag"></i> {{ $project->subCategory->name }}
                                @endif

                            </td>

                            <!-- Sanction Budget -->
                            <td class="align-middle">
                                <div class="fw-bold text-success">
                                    {{ formatPriceToCR($project->estimated_budget_incl_gst)  }} 
                                </div>
                                @if($project->workPrograms->isNotEmpty())
                                    <div class="small text-muted">
                                        {{ $project->workPrograms->count() }} Work Program(s)
                                    </div>
                                @endif
                            </td>

                            <!-- Location -->
                            <td>
                                <div class="fw-semibold">
                                    {{ $project->district?->name ?? 'N/A' }}
                                </div>

                                @if ($project->block?->name)
                                    <div class="small text-muted">
                                        BLock : <i class="fas fa-map-marker-alt"></i> {{ $project->block->name }}
                                    </div>
                                @endif
                            </td>

                            <!-- Procurement -->
                            <td>
                                @if($project->procurementDetail)
                                    <div class="fw-semibold">{{ $project->procurementDetail->method_of_procurement }}</div>
                                    <span class="badge bg-secondary mb-1">{{ $project->procurementDetail->type_of_procurement }}</span>
                                    @if($project->procurementDetail->tender_fee)
                                        <div class="small text-muted">
                                            Fee: ₹ {{ number_format($project->procurementDetail->tender_fee, 2) }}
                                        </div>
                                    @endif
                                @else
                                    <span class="badge bg-warning text-dark">
                                        <i class="fas fa-exclamation-circle"></i> Not Configured
                                    </span>
                                @endif
                            </td>

                            <!-- Contracts -->
                            <td>
                                @if($project->contracts->isNotEmpty())
                                    <div class="dropdown">
                                        <button class="btn btn-sm btn-outline-info dropdown-toggle" type="button"
                                            data-bs-toggle="dropdown" aria-expanded="false">
                                            {{ $project->contracts->count() }} Contract(s)
                                        </button>
                                        <ul class="dropdown-menu shadow-sm p-2" style="min-width: 300px;">
                                            @foreach ($project->contracts as $contract)
                                                <li class="mb-2 p-2 border-bottom">
                                                    <div class="fw-bold">#{{ $contract->contract_number }}</div>
                                                    <div class="small">
                                                        <span class="text-success fw-semibold">
                                                            ₹{{ number_format($contract->contract_value, 2) }}
                                                        </span>
                                                        @if ($contract->contractor)
                                                            <div class="text-muted">
                                                                <i class="fas fa-industry"></i>
                                                                {{ $contract->contractor->company_name }}
                                                            </div>
                                                        @endif
                                                        @if ($contract->subProjects->isNotEmpty())
                                                            <div class="mt-1">
                                                                <span class="badge bg-info">
                                                                    {{ $contract->subProjects->count() }} Sub-projects
                                                                </span>
                                                            </div>
                                                        @endif
                                                    </div>
                                                </li>
                                            @endforeach
                                        </ul>
                                    </div>
                                @else
                                    <span class="badge bg-secondary">
                                        <i class="fas fa-times-circle"></i> No Contracts
                                    </span>
                                @endif
                            </td>

                            <!-- Approvals & Status -->
                            <td>
                                <div class="d-flex flex-column gap-1">
                                    <span class="badge bg-{{ $project->dec_approved ? 'success' : 'secondary' }}">
                                        DEC: {{ $project->dec_approved ? 'Approved' : 'Pending' }}
                                    </span>
                                    <span class="badge bg-{{ $project->hpc_approved ? 'success' : 'secondary' }}">
                                        HPC: {{ $project->hpc_approved ? 'Approved' : 'Pending' }}
                                    </span>
                                    <span class="badge bg-{{ $project->is_active ? 'success' : 'danger' }}">
                                        {{ $project->is_active ? 'Active' : 'Inactive' }}
                                    </span>
                                </div>
                            </td>

                            <!-- Actions -->
                            <td class="text-end">
                                <div class="btn-group" role="group">
                                    <a href="{{ route('admin.package-projects.show', $project->id) }}" 
                                       class="btn btn-sm btn-outline-info" 
                                       title="View" data-bs-toggle="tooltip">
                                        <i class="fas fa-eye"></i>
                                    </a>
                                    <a href="{{ route('admin.package-projects.edit', $project->id) }}" 
                                       class="btn btn-sm btn-outline-primary" 
                                       title="Edit" data-bs-toggle="tooltip">
                                        <i class="fas fa-edit"></i>
                                    </a>
                                    <form action="{{ route('admin.package-projects.destroy', $project->id) }}" 
                                          method="POST" 
                                          onsubmit="return confirm('Are you sure you want to delete this package project?')">
                                        @csrf
                                        @method('DELETE')
                                        <button type="submit" 
                                                class="btn btn-sm btn-outline-danger" 
                                                title="Delete"
                                                data-bs-toggle="tooltip">
                                            <i class="fas fa-trash-alt"></i>
                                        </button>
                                    </form>
                                </div>
                            </td>
                        </tr>
                    @endforeach
                </x-admin.data-table>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
            tooltipTriggerList.map(function (tooltipTriggerEl) {
                return new bootstrap.Tooltip(tooltipTriggerEl);
            });
        });
    </script>
</x-app-layout>
