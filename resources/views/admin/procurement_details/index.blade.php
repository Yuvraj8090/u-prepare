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
                        <li class="breadcrumb-item active" aria-current="page">Procurement Details</li>
                    </ol>
                </nav>
            </div>
        </div>

        <!-- Main Card -->
        <div class="card shadow-sm">
            <div class="card-header bg-white d-flex justify-content-between align-items-center">
                <h5 class="mb-0 text-primary">
                    <i class="fas fa-list me-2"></i> Procurement Status by Package Project
                </h5>
                <a href="{{ route('admin.package-projects.index') }}" class="btn btn-sm btn-secondary">
                    <i class="fas fa-arrow-left me-1"></i> Back to Packages
                </a>
            </div>

            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered table-hover align-middle">
                        <thead class="table-light">
                            <tr>
                                <th>#</th>
                                <th>Package Project</th>
                                <th>Method</th>
                                <th>Type</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse($packageProjects as $index => $project)
                                <tr>
                                    <td>{{ $packageProjects->firstItem() + $index }}</td>
                                    <td>
                                        <a href="{{ route('admin.package-projects.show', $project) }}" class="text-primary">
                                            {{ $project->package_name }} ({{ $project->package_number }})
                                        </a>
                                    </td>
                                    <td>{{ $project->procurementDetail?->method_of_procurement ?? '-' }}</td>
                                    <td>{{ $project->procurementDetail?->type_of_procurement ?? '-' }}</td>
                                    <td>
                                        @if($project->procurementDetail)
                                            <span class="badge bg-success">Created</span>
                                        @else
                                            <span class="badge bg-secondary">Not Created</span>
                                        @endif
                                    </td>
                                    <td>
                                        @if($project->procurementDetail)
                                            <a href="{{ route('admin.procurement-details.show', $project->procurementDetail) }}" 
                                               class="btn btn-sm btn-outline-info">
                                                <i class="fas fa-eye"></i>
                                            </a>
                                            <a href="{{ route('admin.procurement-details.edit', $project->procurementDetail) }}" 
                                               class="btn btn-sm btn-outline-primary">
                                                <i class="fas fa-edit"></i>
                                            </a>
                                        @else
                                            <a href="{{ route('admin.procurement-details.create', $project) }}" 
                                               class="btn btn-sm btn-outline-success">
                                                <i class="fas fa-plus"></i> Create
                                            </a>
                                        @endif
                                    </td>
                                </tr>
                            @empty
                                <tr>
                                    <td colspan="6" class="text-center py-4 text-muted">
                                        <i class="fas fa-info-circle me-2"></i> No package projects found
                                    </td>
                                </tr>
                            @endforelse
                        </tbody>
                    </table>
                </div>

                <div class="d-flex justify-content-between align-items-center mt-3">
                    <div class="text-muted small">
                        Showing {{ $packageProjects->firstItem() }} to {{ $packageProjects->lastItem() }} of {{ $packageProjects->total() }} entries
                    </div>
                    <div>
                        {{ $packageProjects->links() }}
                    </div>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>