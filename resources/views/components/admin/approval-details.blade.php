<div class="row mt-3">
            <!-- HPC and DEC Approvals -->
            <div class="col-md-3 mb-4">
                <div class="card h-100">
                    <div class="card-header bg-light">
                        <h6 class="mb-0">
                            <i
                                class="fas fa-check-circle me-2 h2 {{ $packageProject->dec_approved ? 'text-success' : 'text-secondary' }}"></i>
                            <span class="form-label text-muted h2"> Approval Details </span>
                        </h6>
                    </div>
                    <div class="card-body">

                        @if ($packageProject->dec_approved)

                            <div class="row">
                                <div class="col-md-8">
                                    <div class="mb-1">
                                        <p class="form-control-static">
                                            <span class="form-label text-muted h3">DEC Letter No. </span>
                                            <span class="form-label text-muted h4">
                                                {{ $packageProject->dec_letter_number ?? 'N/A' }} </span>
                                        </p>
                                    </div>

                                    <div class="mb-1">
                                        <p class="form-control-static">
                                            <span class="form-label text-muted h3">Approval Date : </span>
                                            <span class="form-label text-muted h4">
                                                {{ formatDate($packageProject->dec_approval_date) ?? 'N/A' }} </span>
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

                            <hr />
                        @endif

                        @if ($packageProject->hpc_approved)
                            <div class="row mt-3">
                                <div class="col-md-8">

                                    <div class="mb-1">
                                        <p class="form-control-static">
                                            <span class="form-label text-muted h3"> HPC Letter No.</span>
                                            <span class="form-label text-muted h4">
                                                {{ $packageProject->hpc_letter_number ?? 'N/A' }} </span>
                                        </p>
                                    </div>


                                    <div class="mb-1">
                                        <p class="form-control-static">
                                            <span class="form-label text-muted h3"> Approval Date : </span>
                                            <span class="form-label text-muted h4">
                                                {{ formatDate($packageProject->hpc_approval_date) ?? 'N/A' }} </span>
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