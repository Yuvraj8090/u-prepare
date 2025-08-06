<x-app-layout>
    <div class="container-fluid">
        <!-- Breadcrumb -->
        <div class="row mb-4">
            <div class="col-md-12 d-flex justify-content-between align-items-center">
                <h4 class="mb-0">
                    <i class="fas fa-boxes text-primary me-2"></i> Package Projects Management
                </h4>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb mb-0">
                        <li class="breadcrumb-item"><a href="{{ route('dashboard') }}"><i class="fas fa-home"></i></a></li>
                        <li class="breadcrumb-item">Admin</li>
                        <li class="breadcrumb-item active" aria-current="page">Package Projects</li>
                    </ol>
                </nav>
            </div>
        </div>

        <!-- Success/Error Messages -->
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

        <!-- Package Projects Table -->
        <div class="card shadow-sm">
            <div class="card-header bg-white d-flex justify-content-between align-items-center">
                <h5 class="mb-0 text-primary">
                    <i class="fas fa-list me-2"></i> Package Projects List
                </h5>
                <a href="{{ route('admin.package-projects.create') }}" class="btn btn-sm btn-primary">
                    <i class="fas fa-plus-circle me-1"></i> Create Package Project
                </a>
            </div>

            <div class="card-body">
                <x-admin.data-table id="package-projects-table" 
                    :headers="['Package Name', 'Package Number', 'Budget (₹)', 'District', 'Status', 'Actions']" 
                    :excel="true" :print="true" title="Package Projects Export" 
                    searchPlaceholder="Search package projects..." resourceName="package-projects" :pageLength="10">
                    @foreach ($packageProjects as $project)
                        <tr>
                            <td>
                                <a href="{{ route('admin.package-projects.show', $project->id) }}" class="text-primary">
                                    {{ $project->package_name }}
                                </a>
                                <div class="small text-muted">
                                    {{ $project->category?->name ?? 'N/A' }}
                                </div>
                            </td>
                            <td>{{ $project->package_number }}</td>
                            <td>
                                ₹{{ number_format($project->estimated_budget_incl_gst, 2) }}
                            </td>
                            <td>
                                {{ $project->district?->name ?? 'N/A' }}
                                <div class="small text-muted">
                                    {{ $project->block?->name ?? '' }}
                                </div>
                            </td>
                            <td>
                                <div class="d-flex flex-column">
                                    <span class="badge bg-{{ $project->dec_approved ? 'success' : 'secondary' }} mb-1">
                                        DEC: {{ $project->dec_approved ? 'Approved' : 'Pending' }}
                                    </span>
                                    <span class="badge bg-{{ $project->hpc_approved ? 'success' : 'secondary' }}">
                                        HPC: {{ $project->hpc_approved ? 'Approved' : 'Pending' }}
                                    </span>
                                </div>
                            </td>
                            <td>
                                <div class="d-flex justify-content-end gap-2">
                                    <a href="{{ route('admin.package-projects.edit', $project->id) }}"
                                        class="btn btn-sm btn-outline-primary"
                                        title="Edit">
                                        <i class="fas fa-edit"></i>
                                    </a>

                                    <a href="{{ route('admin.package-projects.show', $project->id) }}"
                                        class="btn btn-sm btn-outline-info"
                                        title="View Details">
                                        <i class="fas fa-eye"></i>
                                    </a>

                                    <form action="{{ route('admin.package-projects.destroy', $project->id) }}"
                                        method="POST"
                                        onsubmit="return confirm('Are you sure you want to delete this package project?')">
                                        @csrf
                                        @method('DELETE')
                                        <button type="submit" class="btn btn-sm btn-outline-danger" title="Delete">
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
</x-app-layout>