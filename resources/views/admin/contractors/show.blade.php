
<x-app-layout>
    <div class="container-fluid">
        <!-- Header + Breadcrumb -->
        <div class="row mb-4">
            <div class="col-md-12 d-flex justify-content-between align-items-center">
                <h4 class="mb-0">
                    <i class="fas fa-building me-2 text-primary"></i>
                    Contractor Details
                </h4>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb mb-0">
                        <li class="breadcrumb-item"><a href="{{ route('dashboard') }}"><i class="fas fa-home"></i></a></li>
                        <li class="breadcrumb-item">Admin</li>
                        <li class="breadcrumb-item"><a href="{{ route('admin.contractors.index') }}">Contractors</a></li>
                        <li class="breadcrumb-item active">Details</li>
                    </ol>
                </nav>
            </div>
        </div>

        <!-- Details Card -->
        <div class="card shadow-sm">
            <div class="card-header bg-white d-flex justify-content-between align-items-center">
                <h5 class="mb-0 text-primary">
                    <i class="fas fa-eye me-2"></i>
                    {{ $contractor->company_name }}
                </h5>
                <div>
                    <a href="{{ route('admin.contractors.edit', $contractor) }}" class="btn btn-sm btn-outline-primary me-2">
                        <i class="fas fa-edit me-1"></i> Edit
                    </a>
                    <a href="{{ route('admin.contractors.index') }}" class="btn btn-sm btn-outline-secondary">
                        <i class="fas fa-arrow-left me-1"></i> Back
                    </a>
                </div>
            </div>

            <div class="card-body">
                <div class="row">
                    <!-- Left Column -->
                    <div class="col-md-6">
                        <div class="mb-3">
                            <h6 class="text-muted">Company Information</h6>
                            <hr class="mt-1 mb-2">
                            <dl class="row">
                                <dt class="col-sm-4">Company Name</dt>
                                <dd class="col-sm-8">{{ $contractor->company_name }}</dd>

                                <dt class="col-sm-4">GST Number</dt>
                                <dd class="col-sm-8">{{ $contractor->gst_no ?? 'N/A' }}</dd>
                            </dl>
                        </div>

                        <div class="mb-3">
                            <h6 class="text-muted">Contact Information</h6>
                            <hr class="mt-1 mb-2">
                            <dl class="row">
                                <dt class="col-sm-4">Authorized Person</dt>
                                <dd class="col-sm-8">{{ $contractor->authorized_personnel_name }}</dd>

                                <dt class="col-sm-4">Phone</dt>
                                <dd class="col-sm-8">{{ $contractor->phone ?? 'N/A' }}</dd>

                                <dt class="col-sm-4">Email</dt>
                                <dd class="col-sm-8">{{ $contractor->email ?? 'N/A' }}</dd>
                            </dl>
                        </div>
                    </div>

                    <!-- Right Column -->
                    <div class="col-md-6">
                        <div class="mb-3">
                            <h6 class="text-muted">Address</h6>
                            <hr class="mt-1 mb-2">
                            <p>{{ $contractor->address ?? 'N/A' }}</p>
                        </div>

                       
                    </div>
                </div>
            </div>

            <div class="card-footer bg-white d-flex justify-content-between align-items-center">
                <small class="text-muted">Last updated: {{ $contractor->updated_at->diffForHumans() }}</small>
                <div>
                    <form action="{{ route('admin.contractors.destroy', $contractor) }}" method="POST" class="d-inline">
                        @csrf
                        @method('DELETE')
                        <button type="submit" class="btn btn-sm btn-outline-danger" 
                            onclick="return confirm('Are you sure you want to delete this contractor?')">
                            <i class="fas fa-trash-alt me-1"></i> Delete
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>
