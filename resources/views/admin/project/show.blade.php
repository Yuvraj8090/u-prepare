<x-app-layout>
    <div class="container-fluid">
        <!-- Breadcrumb -->
        <div class="row mb-4">
            <div class="col-md-12 d-flex justify-content-between align-items-center">
                <h4 class="mb-0">
                    <i class="fas fa-project-diagram text-primary me-2"></i> Project Details
                </h4>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb mb-0">
                        <li class="breadcrumb-item"><a href="{{ route('dashboard') }}"><i class="fas fa-home"></i></a></li>
                        <li class="breadcrumb-item">Admin</li>
                        <li class="breadcrumb-item"><a href="{{ route('admin.project.index') }}">Projects</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Details</li>
                    </ol>
                </nav>
            </div>
        </div>

        <div class="card shadow-sm">
            <div class="card-header bg-white d-flex justify-content-between align-items-center">
                <h5 class="mb-0 text-primary">
                    <i class="fas fa-info-circle me-2"></i> {{ $project->name }}
                </h5>
                <div>
                    <a href="{{ route('admin.project.edit', $project) }}" class="btn btn-sm btn-outline-primary">
                        <i class="fas fa-edit me-1"></i> Edit
                    </a>
                </div>
            </div>

            <div class="card-body">
                <div class="row">
                    <div class="col-md-6">
                        <div class="mb-3">
                            <h6 class="text-muted">Project Name</h6>
                            <p>{{ $project->name }}</p>
                        </div>
                    </div>
                    
                    <div class="col-md-6">
                        <div class="mb-3">
                            <h6 class="text-muted">Budget</h6>
                            <p>{{ $project->budget ? '$' . number_format($project->budget, 2) : 'Not specified' }}</p>
                        </div>
                    </div>
                </div>
                
                <div class="row">
                    <div class="col-md-6">
                        <div class="mb-3">
                            <h6 class="text-muted">Created At</h6>
                            <p>{{ $project->created_at->format('M d, Y h:i A') }}</p>
                        </div>
                    </div>
                    
                    <div class="col-md-6">
                        <div class="mb-3">
                            <h6 class="text-muted">Last Updated</h6>
                            <p>{{ $project->updated_at->format('M d, Y h:i A') }}</p>
                        </div>
                    </div>
                </div>
                
                <div class="d-flex justify-content-end mt-4">
                    <a href="{{ route('admin.project.index') }}" class="btn btn-light">
                        <i class="fas fa-arrow-left me-1"></i> Back to Projects
                    </a>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>