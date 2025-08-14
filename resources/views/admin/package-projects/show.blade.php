<x-app-layout>
    <div class="container-fluid">
        <!-- Breadcrumb -->
        <x-admin.breadcrumb-header icon="fas fa-info-circle text-info" title="Projects" :breadcrumbs="[
            ['route' => 'dashboard', 'label' => '<i class=\'fas fa-home\'></i>'],
            [
                'route' => 'admin.package-projects.index',
                'label' => ' <i class=\'fas fa-project-diagram \'></i> Packages',
            ],
            ['class' => 'active', 'label' => 'Packages'],
        ]" />

        <div class="card h-100">
            <div class="card-header bg-white d-flex justify-content-between align-items-center py-3">
                <p class="mb-0 h3">
                    <i class="fas fa-info-circle me-2 "></i> Package Name : {{ $packageProject->package_name }}
                    <br />
                    <i class="fas fa-info-circle me-2"></i> Package No : {{ $packageProject->package_number }}
                </p>
                {{-- <div>
                    <a href="{{ route('admin.package-projects.edit', $packageProject) }}"
                        class="btn btn-sm btn-outline-primary">
                        <i class="fas fa-edit me-1"></i> Edit
                    </a>
                </div> --}}
                <a href="{{ route('admin.package-projects.index') }}" class="btn btn-sm btn-info">
                    <i class="fas fa-arrow-left me-1"></i> Back to View All Packages
                </a>
            </div>

            <div class="card-body">
                <div class="row">

                    <div class="col-md-3 mb-3">
                        <p class="form-control-static">
                            <span class="form-label text-muted h3"> Implementation Agency : </span>
                            <span class="form-label text-muted h4">
                                {{ $packageProject->department->name ?? 'N/A' }}
                            </span>
                        </p>
                    </div>

                    <div class="col-md-3 mb-3">
                        <p class="form-control-static">
                            <span class="form-label text-muted h3"> Category : </span>
                            <span class="form-label text-muted h4"> {{ $packageProject->category->name ?? 'N/A' }}
                            </span>
                        </p>
                    </div>

                    <div class="col-md-3 mb-3">
                        <p class="form-control-static">
                            <span class="form-label text-muted h3"> Sub Category : </span>
                            <span class="form-label text-muted h4">
                                {{ $packageProject->subCategory->name ?? 'N/A' }} </span>
                        </p>
                    </div>

                    <div class="col-md-3 mb-3">
                        <p class="form-control-static">
                            <span class="form-label text-muted h3"> Sanction Cost : (Including GST)</span>
                            <span class="form-label text-muted h4"> ₹
                                {{ number_format($packageProject->estimated_budget_incl_gst, 2) }} </span>
                        </p>
                    </div>
                </div>


          

            <div class="row">
                <div class="col-md-3 mb-3">
                    <p class="form-control-static">
                        <span class="form-label text-muted h3"> District  : </span>
                        <span class="form-label text-muted h4"> {{ $packageProject->district->name ?? 'N/A' }} </span>
                    </p>
                </div>

                <div class="col-md-3 mb-3">
                    <p class="form-control-static">
                        <span class="form-label text-muted h3"> Block : </span>
                        <span class="form-label text-muted h4"> {{ $packageProject->block->name ?? 'N/A' }} </span>
                    </p>
                </div>

                <div class="col-md-3 mb-3">
                    <p class="form-control-static">
                        <span class="form-label text-muted h3"> Vidhan Sabha : </span>
                        <span class="form-label text-muted h4">  {{ $packageProject->vidhanSabha->name ?? 'N/A' }} </span>
                    </p>
                </div>
            </div>


              </div>
              <!-- End: Card Body -->
        </div>
        <!-- End: Card  -->



        <!-- Approval Status Section -->
        <div class="row">
            <!-- DEC Approval -->
            <div class="col-md-6 mb-4">
                <div class="card h-100">
                    <div class="card-header bg-light">
                        <h6 class="mb-0">
                            <i
                                class="fas fa-check-circle me-2 {{ $packageProject->dec_approved ? 'text-success' : 'text-secondary' }}"></i>
                            DEC Approval Status
                        </h6>
                    </div>
                    <div class="card-body">
                        <div class="mb-3">
                            <label class="form-label text-muted">Status</label>
                            <p class="form-control-static">
                                @if ($packageProject->dec_approved)
                                    <span class="badge bg-success">Approved</span>
                                @else
                                    <span class="badge bg-secondary">Pending</span>
                                @endif
                            </p>
                        </div>

                        @if ($packageProject->dec_approved)
                            <div class="mb-3">
                                <label class="form-label text-muted">Approval Date</label>
                                <p class="form-control-static">
                                    {{ formatDate($packageProject->dec_approval_date) ?? 'N/A' }}</p>
                            </div>

                            <div class="mb-3">
                                <label class="form-label text-muted">Letter Number</label>
                                <p class="form-control-static">
                                    {{ $packageProject->dec_letter_number ?? 'N/A' }}</p>
                            </div>

                            @if ($packageProject->dec_document_path)
                                <div class="mb-0">
                                    <label class="form-label text-muted">Approval Document</label>
                                    <p class="form-control-static">
                                        <a href="{{ Storage::url($packageProject->dec_document_path) }}"
                                            target="_blank" class="btn btn-sm btn-outline-primary">
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
                            <i
                                class="fas fa-check-circle me-2 {{ $packageProject->hpc_approved ? 'text-success' : 'text-secondary' }}"></i>
                            HPC Approval Status
                        </h6>
                    </div>
                    <div class="card-body">
                        <div class="mb-3">
                            <label class="form-label text-muted">Status</label>
                            <p class="form-control-static">
                                @if ($packageProject->hpc_approved)
                                    <span class="badge bg-success">Approved</span>
                                @else
                                    <span class="badge bg-secondary">Pending</span>
                                @endif
                            </p>
                        </div>

                        @if ($packageProject->hpc_approved)
                            <div class="mb-3">
                                <label class="form-label text-muted">Approval Date</label>
                                <p class="form-control-static">
                                    {{ formatDate($packageProject->hpc_approval_date) ?? 'N/A' }}</p>
                            </div>

                            <div class="mb-3">
                                <label class="form-label text-muted">Letter Number</label>
                                <p class="form-control-static">
                                    {{ $packageProject->hpc_letter_number ?? 'N/A' }}</p>
                            </div>

                            @if ($packageProject->hpc_document_path)
                                <div class="mb-0">
                                    <label class="form-label text-muted">Approval Document</label>
                                    <p class="form-control-static">
                                        <a href="{{ Storage::url($packageProject->hpc_document_path) }}"
                                            target="_blank" class="btn btn-sm btn-outline-primary">
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





        <!-- Main Content Card -->
        <div class="card shadow-sm">

            <div class="card-body">
                <!-- Basic Information Section -->
                <div class="mb-5">
                    <h6 class="mb-3 text-muted border-bottom pb-2">
                        <i class="fas fa-info-circle me-2"></i> Package Information
                    </h6>

                    <div class="row">

                        <div class="col-md-4 mb-3">
                            <label class="form-label text-muted">Created At</label>
                            <p class="form-control-static">{{ $packageProject->created_at->format('d M Y, h:i A') }}
                            </p>
                        </div>

                    </div>

                </div>



                <!-- Additional Notes -->
                @if ($packageProject->notes)
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

</x-app-layout>
