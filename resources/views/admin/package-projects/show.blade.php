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
            <div class="card-header bg-white py-3">
                <p class="mb-0 h2">
                    <i class="fas fa-info-circle me-2 "></i> Package Name : {{ $packageProject->package_name }}
                </p>
                <br/>
                <hr /> 
                 <p class="mb-0 h3">
<i class="fas fa-info-circle me-2"></i> Package No : {{ $packageProject->package_number }}
                </p>
                {{-- <a href="{{ route('admin.package-projects.index') }}" class="btn btn-sm btn-info">
                    <i class="fas fa-arrow-left me-1"></i> Back to View All Packages
                </a> --}}
            </div>

            <div class="card-body  mb-3">
                <div class="row">

                    <div class="col-md-3 mb-3">
                        <p class="form-control-static ">
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
                            <span class="form-label text-muted h4"> 
                                  {{ formatPriceToCR($packageProject->estimated_budget_incl_gst)  }}  
                             </span>
                        </p>
                    </div>
                </div>




                <div class="row  ">
                    <div class="col-md-3 mb-3">
                        <p class="form-control-static">
                            <span class="form-label text-muted h3"> District : </span>
                            <span class="form-label text-muted h4"> {{ $packageProject->district->name ?? 'N/A' }}
                            </span>
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
                            <span class="form-label text-muted h4"> {{ $packageProject->vidhanSabha->name ?? 'N/A' }}
                            </span>
                        </p>
                    </div>
                </div>


            </div>
            <!-- End: Card Body -->
        </div>
        <!-- End: Card  -->



        <!-- Approval Status Section -->
        <div class="row mt-3">
            <!-- HPC and DEC Approvals -->
            <div class="col-md-3 mb-4">
                <div class="card h-100">
                    <div class="card-header bg-light">
                        <h6 class="mb-0">
                            <i class="fas fa-check-circle me-2 h2 {{ $packageProject->dec_approved ? 'text-success' : 'text-secondary' }}"></i>
                             <span class="form-label text-muted h2">  Approval Details </span>
                        </h6>
                    </div>
                    <div class="card-body">

                        @if ($packageProject->dec_approved)

                            <div class="row">
                                <div class="col-md-8">
                                    <div class="mb-1">
                                        <p class="form-control-static">
                                            <span class="form-label text-muted h3">DEC Letter No. </span>
                                            <span class="form-label text-muted h4"> {{ $packageProject->dec_letter_number ?? 'N/A' }} </span>
                                        </p>
                                    </div>

                                    <div class="mb-1">
                                        <p class="form-control-static">
                                            <span class="form-label text-muted h3">Approval Date : </span>
                                            <span class="form-label text-muted h4"> {{ formatDate($packageProject->dec_approval_date) ?? 'N/A' }} </span>
                                        </p>
                                    </div>

                                </div>
                                <div class="col-md-4">
                                    @if ($packageProject->dec_document_path)
                                        <div class="mb-3">
                                            <p class="form-control-static">
                                                <span class="form-label text-muted"> </span>

                                                <a href="{{ Storage::url($packageProject->dec_document_path) }}"
                                                    target="_blank" class="btn btn-sm btn-outline-primary">
                                                    <i class="fas fa-file-pdf me-1"></i> View DEC Doc
                                                </a>
                                            </p>
                                        </div>
                                    @endif
                                </div>
                            </div>

                            <hr/>
                        @endif

                        @if ($packageProject->hpc_approved)
                            <div class="row mt-3">
                                <div class="col-md-8">

                                    <div class="mb-1">
                                        <p class="form-control-static">
                                           <span class="form-label text-muted h3"> HPC Letter No.</span>
                                           <span class="form-label text-muted h4"> {{ $packageProject->hpc_letter_number ?? 'N/A' }} </span>
                                        </p>
                                    </div>


                                    <div class="mb-1">
                                        <p class="form-control-static">
                                            <span class="form-label text-muted h3"> Approval Date : </span>
                                            <span class="form-label text-muted h4"> {{ formatDate($packageProject->hpc_approval_date) ?? 'N/A' }} </span>
                                        </p>
                                    </div>

                                </div>

                                <div class="col-md-4">


                                    @if ($packageProject->hpc_document_path)
                                        <div class="mb-1">
                                            <p class="form-control-static">
                                                <label class="form-label text-muted"> </label>
                                                <a href="{{ Storage::url($packageProject->hpc_document_path) }}"
                                                    target="_blank" class="btn btn-sm btn-outline-primary">
                                                    <i class="fas fa-file-pdf me-1"></i> View HPC Doc
                                                </a>
                                            </p>
                                        </div>
                                    @endif
                                </div>
                            </div>
                        @endif
                    </div>
                </div>
            </div>
        </div>

</x-app-layout>
