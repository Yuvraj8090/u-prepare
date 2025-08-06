<x-app-layout>
    <div class="container-fluid">
        <!-- Breadcrumbs and Header -->
        <div class="row mb-4">
            <div class="col-md-12">
                <div class="d-flex justify-content-between align-items-center">
                    <h4 class="mb-0">
                        <i class="fas fa-boxes me-2 text-primary"></i>
                        Package Project Details
                    </h4>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb mb-0">
                            <li class="breadcrumb-item"><a href="{{ route('dashboard') }}"><i class="fas fa-home"></i></a></li>
                            <li class="breadcrumb-item">Admin</li>
                            <li class="breadcrumb-item"><a href="{{ route('admin.package-projects.index') }}">Package Projects</a></li>
                            <li class="breadcrumb-item active">Details</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>

        <!-- Main Content Card -->
        <div class="card shadow-sm">
            <div class="card-header bg-white d-flex justify-content-between align-items-center py-3">
                <h5 class="mb-0 text-primary">
                    <i class="fas fa-info-circle me-2"></i>
                    {{ $packageProject->package_name }} ({{ $packageProject->package_number }})
                </h5>
                <div>
                    <a href="{{ route('admin.package-projects.edit', $packageProject) }}" class="btn btn-sm btn-outline-primary me-2">
                        <i class="fas fa-edit me-1"></i> Edit
                    </a>
                    <a href="{{ route('admin.package-projects.index') }}" class="btn btn-sm btn-outline-secondary">
                        <i class="fas fa-arrow-left me-1"></i> Back to List
                    </a>
                </div>
            </div>
            <div class="card-body">
                <!-- Basic Information Section -->
                <div class="mb-5">
                    <h6 class="mb-3 text-muted border-bottom pb-2">
                        <i class="fas fa-info-circle me-2"></i> Basic Information
                    </h6>
                    
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label class="form-label text-muted">Project</label>
                            <p class="form-control-static">
                                {{ $packageProject->project->name ?? 'N/A' }}
                                @if($packageProject->project)
                                    (Budget: ₹{{ number_format($packageProject->project->budget, 2) }})
                                @endif
                            </p>
                        </div>
                        
                        <div class="col-md-6 mb-3">
                            <label class="form-label text-muted">Package Number</label>
                            <p class="form-control-static">{{ $packageProject->package_number }}</p>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label class="form-label text-muted">Estimated Budget</label>
                            <p class="form-control-static">₹{{ number_format($packageProject->estimated_budget_incl_gst, 2) }}</p>
                        </div>
                        
                        <div class="col-md-6 mb-3">
                            <label class="form-label text-muted">Created At</label>
                            <p class="form-control-static">{{ $packageProject->created_at->format('d M Y, h:i A') }}</p>
                        </div>
                    </div>
                </div>
                
                <!-- Classification Section -->
                <div class="mb-5">
                    <h6 class="mb-3 text-muted border-bottom pb-2">
                        <i class="fas fa-tags me-2"></i> Classification
                    </h6>
                    
                    <div class="row">
                        <div class="col-md-4 mb-3">
                            <label class="form-label text-muted">Category</label>
                            <p class="form-control-static">{{ $packageProject->category->name ?? 'N/A' }}</p>
                        </div>
                        
                        <div class="col-md-4 mb-3">
                            <label class="form-label text-muted">Sub Category</label>
                            <p class="form-control-static">{{ $packageProject->subCategory->name ?? 'N/A' }}</p>
                        </div>
                        
                        <div class="col-md-4 mb-3">
                            <label class="form-label text-muted">Department</label>
                            <p class="form-control-static">{{ $packageProject->department->name ?? 'N/A' }}</p>
                        </div>
                    </div>
                </div>
                
                <!-- Location Information -->
                <div class="mb-5">
                    <h6 class="mb-3 text-muted border-bottom pb-2">
                        <i class="fas fa-map-marker-alt me-2"></i> Location Information
                    </h6>
                    
                    <div class="row">
                        <div class="col-md-4 mb-3">
                            <label class="form-label text-muted">District</label>
                            <p class="form-control-static">{{ $packageProject->district->name ?? 'N/A' }}</p>
                        </div>
                        
                        <div class="col-md-4 mb-3">
                            <label class="form-label text-muted">Block</label>
                            <p class="form-control-static">{{ $packageProject->block->name ?? 'N/A' }}</p>
                        </div>
                        
                        <div class="col-md-4 mb-3">
                            <label class="form-label text-muted">Vidhan Sabha</label>
                            <p class="form-control-static">{{ $packageProject->vidhanSabha->name ?? 'N/A' }}</p>
                        </div>
                    </div>
                </div>
                
                <!-- Approval Status Section -->
                <div class="row">
                    <!-- DEC Approval -->
                    <div class="col-md-6 mb-4">
                        <div class="card h-100">
                            <div class="card-header bg-light">
                                <h6 class="mb-0">
                                    <i class="fas fa-check-circle me-2 {{ $packageProject->dec_approved ? 'text-success' : 'text-secondary' }}"></i> 
                                    DEC Approval Status
                                </h6>
                            </div>
                            <div class="card-body">
                                <div class="mb-3">
                                    <label class="form-label text-muted">Status</label>
                                    <p class="form-control-static">
                                        @if($packageProject->dec_approved)
                                            <span class="badge bg-success">Approved</span>
                                        @else
                                            <span class="badge bg-secondary">Pending</span>
                                        @endif
                                    </p>
                                </div>
                                
                                @if($packageProject->dec_approved)
                                    <div class="mb-3">
                                        <label class="form-label text-muted">Approval Date</label>
                                        <p class="form-control-static">{{ formatDate($packageProject->dec_approval_date) ?? 'N/A' }}</p>
                                    </div>
                                    
                                    <div class="mb-3">
                                        <label class="form-label text-muted">Letter Number</label>
                                        <p class="form-control-static">{{ $packageProject->dec_letter_number ?? 'N/A' }}</p>
                                    </div>
                                    
                                    @if($packageProject->dec_document_path)
                                        <div class="mb-0">
                                            <label class="form-label text-muted">Approval Document</label>
                                            <p class="form-control-static">
                                                <a href="{{ Storage::url($packageProject->dec_document_path) }}" 
                                                   target="_blank" 
                                                   class="btn btn-sm btn-outline-primary">
                                                    <i class="fas fa-file-pdf me-1"></i> View Document
                                                </a>
                                            </p>
                                        </div>
                                    @endif
                                @endif
                            </div>
                        </div>
                    </div>
                    
                    <!-- HPC Approval -->
                    <div class="col-md-6 mb-4">
                        <div class="card h-100">
                            <div class="card-header bg-light">
                                <h6 class="mb-0">
                                    <i class="fas fa-check-circle me-2 {{ $packageProject->hpc_approved ? 'text-success' : 'text-secondary' }}"></i> 
                                    HPC Approval Status
                                </h6>
                            </div>
                            <div class="card-body">
                                <div class="mb-3">
                                    <label class="form-label text-muted">Status</label>
                                    <p class="form-control-static">
                                        @if($packageProject->hpc_approved)
                                            <span class="badge bg-success">Approved</span>
                                        @else
                                            <span class="badge bg-secondary">Pending</span>
                                        @endif
                                    </p>
                                </div>
                                
                                @if($packageProject->hpc_approved)
                                    <div class="mb-3">
                                        <label class="form-label text-muted">Approval Date</label>
                                        <p class="form-control-static">{{ formatDate($packageProject->hpc_approval_date) ?? 'N/A' }}</p>
                                    </div>
                                    
                                    <div class="mb-3">
                                        <label class="form-label text-muted">Letter Number</label>
                                        <p class="form-control-static">{{ $packageProject->hpc_letter_number ?? 'N/A' }}</p>
                                    </div>
                                    
                                    @if($packageProject->hpc_document_path)
                                        <div class="mb-0">
                                            <label class="form-label text-muted">Approval Document</label>
                                            <p class="form-control-static">
                                                <a href="{{ Storage::url($packageProject->hpc_document_path) }}" 
                                                   target="_blank" 
                                                   class="btn btn-sm btn-outline-primary">
                                                    <i class="fas fa-file-pdf me-1"></i> View Document
                                                </a>
                                            </p>
                                        </div>
                                    @endif
                                @endif
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- Additional Notes -->
                @if($packageProject->notes)
                    <div class="mb-4">
                        <h6 class="mb-3 text-muted border-bottom pb-2">
                            <i class="fas fa-sticky-note me-2"></i> Additional Notes
                        </h6>
                        <div class="bg-light p-3 rounded">
                            {!! nl2br(e($packageProject->notes)) !!}
                        </div>
                    </div>
                @endif
            </div>
        </div>
    </div>
</x-app-layout>