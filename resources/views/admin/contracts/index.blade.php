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
                    'Sanction Budge (₹)',
                    'District',
                    'Procurement',
                    'Contracts',
                    
                    'Actions',
                ]" :excel="true" :print="true"
                    title="Package Projects Export" searchPlaceholder="Search package projects..."
                    resourceName="package-projects" :pageLength="10">

                    @foreach ($packageProjects as $project)
                        <tr>
                            <!-- Package Name & Number -->
                            <td>

                                <div class="d-flex flex-column">
                                    <!-- Main Title -->
                                    <a href="{{ route('admin.package-projects.show', $project->id) }}"
                                        title="{{ $project->package_name }}"
                                        class="fw-bold text-primary mb-1 text-truncate" style="max-width: 450px;">
                                        {{ $project->package_name }}
                                    </a>

                                    <!-- Package Number -->
                                    <span class="text-muted small mb-1">
                                        <i class="fas fa-hashtag"></i> {{ $project->package_number }}
                                    </span>

                                    <div class="d-flex flex-wrap gap-1 mb-1">

                                        <span class="badge bg-{{ $project->dec_approved ? 'warning' : 'secondary' }}">
                                            <i class="fas fa-check-circle"></i> DEC:
                                            {{ $project->dec_approved ? 'Approved' : 'Pending' }}
                                        </span>


                                        <span class="badge bg-{{ $project->hpc_approved ? 'info' : 'secondary' }}">
                                            <i class="fas fa-check-circle"></i> HPC:
                                            {{ $project->hpc_approved ? 'Approved' : 'Pending' }}
                                        </span>


                                        <!-- Implementation Agency -->
                                        @if ($project->department?->name)
                                            <span class="badge bg-success text-white">
                                                <i class="fas fa-building"></i> {{ $project->department->name }}
                                            </span>
                                        @endif
                                    </div>

                            </td>

                            <!-- Category / Department -->
                            <td>
                                @if ($project->category?->name)
                                    <span class="font-weight-bold"> <i class="fas fa-tags"></i>
                                        {{ $project->category->name }} </span>
                                @endif

                                @if ($project->subCategory?->name)
                                    ( {{ $project->subCategory->name }} )
                                @endif

                            </td>

                            <!-- Sanction Budget -->
                            <td class="align-middle">
                                <div class="fw-bold text-success">
                                    {{ formatPriceToCR($project->estimated_budget_incl_gst) }}
                                </div>
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
                            <td class="align-middle">
                                @if ($project->procurementDetail)
                                    <span class="badge bg-success text-dark">
                                        <i class="fas fa-exclamation-circle"></i> Completed
                                    </span>

                                    <div class="fw-semibold">
                                        Method : {{ $project->procurementDetail->method_of_procurement }}
                                    </div>

                                    <div class="fw-semibold">
                                        Type : {{ $project->procurementDetail->typeOfProcurement?->name }}
                                    </div>
                                @else
                                    <span class="badge bg-warning text-dark">
                                        <i class="fas fa-exclamation-circle"></i> Pending
                                    </span>
                                @endif
                            </td>

                            <!-- Contracts -->
                            <td class="align-middle">
                                @if ($project->contracts->isNotEmpty())
                                    <div class="dropdown">
                                        <button class="btn btn-sm btn-outline-info dropdown-toggle" type="button"
                                            data-bs-toggle="dropdown" aria-expanded="false">
                                            {{ $project->contracts->count() }} Contract(s)
                                        </button>
                                        <ul class="dropdown-menu shadow-sm p-2" style="min-width: 300px;">
                                            @foreach ($project->contracts as $contract)
                                                <li
                                                    class="list-group-item d-flex justify-content-between align-items-center"  title="Contract No: {{ $contract->contract_number }}">
                                                    <p class="mb-0 d-flex align-items-cente h5">
                                                        <i class="fas fa-hashtag text-primary me-2"></i> Contract No
                                                    </p>
                                                   <span class="fw-bold h6 d-inline-block text-truncate" style="max-width: 110px;" >
    {{ $contract->contract_number }}
</span>

                                                </li>
                                                <li
                                                    class="list-group-item d-flex justify-content-between align-items-center">
                                                    <p class="mb-0 d-flex align-items-cente h5">
                                                        <i class="fas text-primary me-2"> ₹ </i> Contract Value
                                                    </p>
                                                    <span class="fw-bold h6"> ₹
                                                        {{ number_format($contract->contract_value, 2) }} </span>
                                                </li>
                                                <li
                                                    class="list-group-item d-flex justify-content-between align-items-center">
                                                    <p class="mb-0 d-flex align-items-cente h5">
                                                        <i class="fas fa-industry text-primary me-2"></i> Firm Name
                                                    </p>
                                                    @if ($contract->contractor)
                                                        <span class="fw-bold h6">
                                                            {{ $contract->contractor->company_name }} </span>
                                                    @endif
                                                </li>
                                                <li
                                                    class="list-group-item d-flex justify-content-between align-items-center">
                                                    <p class="mb-0 d-flex align-items-cente h5">
                                                        <i class="fas fa-boxes  text-primary me-2"></i> Sub - Projects
                                                    </p>
                                                    @if ($contract->subProjects->isNotEmpty())
                                                        <span class="fw-bold h6">
                                                            {{ $contract->subProjects->count() }} </span>
                                                    @endif
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
                            

                            <!-- Actions -->
                            <td class="align-middle">
                                @if ($project->contracts->isNotEmpty())
                                    <div class="d-flex justify-content-end gap-2">
                                        <a href="{{ route('admin.contracts.show', $contract) }}"
                                            class="btn btn-sm btn-outline-info">
                                            <i class="fas fa-eye me-1"></i> View
                                        </a>
                                        <a href="{{ route('admin.contracts.edit', $contract) }}"
                                            class="btn btn-sm btn-outline-primary">
                                            <i class="fas fa-edit me-1"></i> Edit
                                        </a>
                                        <form action="{{ route('admin.contracts.destroy', $contract) }}"
                                            method="POST">
                                            @csrf
                                            @method('DELETE')
                                            <button type="submit" class="btn btn-sm btn-outline-danger"
                                                onclick="return confirm('Are you sure you want to delete this contract?')">
                                                <i class="fas fa-trash-alt me-1"></i> Delete
                                            </button>
                                        </form>
                                    </div>
                                @else
                                    <a href="{{ route('admin.contracts.create', [
                                        'package_project_id' => $project->id,
                                    ]) }}"
                                        class="btn btn-sm btn-outline-primary" title="Create">
                                        <i class="fas fa-plus "></i> </a>
                                @endif
                            </td>
                        </tr>
                    @endforeach
                </x-admin.data-table>
            </div>
        </div>
    </div>
</x-app-layout>
