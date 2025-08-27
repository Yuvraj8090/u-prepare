<div class="card">
            <div class="card-header bg-white py-3">
                <p class="mb-0 h2">
                    <i class="fas fa-info-circle me-2 "></i> Package Name : {{ $packageProject->package_name }}
                </p>
                <br />
                <hr />
                <p class="mb-0 h3">
                    <i class="fas fa-info-circle me-2"></i> Package No : {{ $packageProject->package_number }}
                </p>

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
                                {{ formatPriceToCR($packageProject->estimated_budget_incl_gst) }}
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