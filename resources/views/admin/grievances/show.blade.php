<x-app-layout>
    <div class="container-fluid">

        <!-- Breadcrumb -->
        <x-admin.breadcrumb-header 
            icon="fas fa-file-alt text-primary" 
            title="Grievance Details" 
            :breadcrumbs="[
                ['route' => 'dashboard', 'label' => '<i class=\'fas fa-home\'></i>'], 
                ['label' => 'Admin'],
                ['route' => 'admin.grievances.index', 'label' => 'Grievances'],
                ['label' => 'Details']
            ]"  
        /> 

        <!-- Grievance Header -->
        <div class="card shadow-sm mb-4 border-start border-4 border-primary">
            <div class="card-body d-flex justify-content-between align-items-center">
                <h5 class="mb-0 fw-bold">
                    <i class="fas fa-hashtag text-primary me-2"></i>
                    Grievance No: <span class="text-dark">GR{{ str_pad($grievance->id, 5, '0', STR_PAD_LEFT) }}</span>
                </h5>
                <span class="badge bg-{{ [
                    'pending' => 'warning',
                    'in-progress' => 'info',
                    'resolved' => 'success',
                    'rejected' => 'danger',
                ][$grievance->status] ?? 'secondary' }} fs-6 px-3 py-2 shadow-sm text-white">
                    {{ ucfirst($grievance->status) }}
                </span>
            </div>
        </div>

        <!-- Applicant Details -->
        <section class="card shadow-sm mb-4">
            <div class="card-header bg-light fw-bold">
                <i class="fas fa-user me-2 text-primary"></i> Applicant Details
            </div>
            <div class="card-body">
                <div class="row mb-4">
                    <div class="col-md-4">
                        <h6 class="text-muted">Name</h6>
                        <h4 class="fw-bold text-dark">{{ $grievance->full_name ?? '—' }}</h4>
                    </div>
                    <div class="col-md-4">
                        <h6 class="text-muted">Mobile</h6>
                        <h4 class="fw-bold text-dark">{{ $grievance->mobile ?? '—' }}</h4>
                    </div>
                    <div class="col-md-4">
                        <h6 class="text-muted">Email</h6>
                        <h4 class="fw-bold text-dark">{{ $grievance->email ?? '—' }}</h4>
                    </div>
                </div>

                <div class="row mb-4">
                    <div class="col-md-4">
                        <h6 class="text-muted">District</h6>
                        <h4 class="fw-bold text-dark">{{ $grievance->district ?? '—' }}</h4>
                    </div>
                    <div class="col-md-4">
                        <h6 class="text-muted">Block</h6>
                        <h4 class="fw-bold text-dark">{{ $grievance->block ?? '—' }}</h4>
                    </div>
                    <div class="col-md-4">
                        <h6 class="text-muted">Village</h6>
                        <h4 class="fw-bold text-dark">{{ $grievance->village ?? '—' }}</h4>
                    </div>
                </div>

                <div class="row">
                    <div class="col-12">
                        <h6 class="text-muted">Address</h6>
                        <h4 class="fw-bold text-dark">{{ $grievance->address ?? '—' }}</h4>
                    </div>
                </div>
            </div>
        </section>

        <!-- Grievance Details -->
        <section class="card shadow-sm mb-4">
            <div class="card-header bg-light fw-bold">
                <i class="fas fa-info-circle me-2 text-primary"></i> Grievance Information
            </div>
            <div class="card-body">
                <div class="mb-4">
                    <h6 class="text-muted">Subject</h6>
                    <h4 class="fw-bold text-dark">{{ $grievance->grievance_related_to ?? '—' }}</h4>
                </div>
                <div class="mb-4">
                    <h6 class="text-muted">Description</h6>
                    <p class="fw-bold text-dark mb-2">{!! $grievance->description ?? '—' !!}</p>
                    <p class="fw-bold text-dark">{!! $grievance->detail_of_complaint ?? '—' !!}</p>
                </div>
                <div class="mb-4">
                    <h6 class="text-muted">Registered At</h6>
                    <h4 class="fw-bold text-dark">{{ $grievance->created_at->format('d M, Y h:i A') }}</h4>
                </div>
                @if($grievance->status === 'resolved' && $grievance->updated_at)
                    <div class="mb-4">
                        <h6 class="text-muted">Resolved At</h6>
                        <h4 class="fw-bold text-dark">{{ $grievance->updated_at->format('d M, Y h:i A') }}</h4>
                    </div>
                @endif
            </div>
        </section>

        <!-- Back Button -->
        <div class="d-flex justify-content-end">
            <a href="{{ route('admin.grievances.index') }}" class="btn btn-secondary btn-lg px-4 shadow-sm">
                <i class="fas fa-arrow-left me-2"></i> Back to List
            </a>
        </div>
    </div>
</x-app-layout>
