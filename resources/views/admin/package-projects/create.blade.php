<x-app-layout>
    <div class="container-fluid">
        <!-- Breadcrumb -->
        <x-admin.breadcrumb-header icon="fas fa-boxes text-primary" title="Package Projects Management"
            :breadcrumbs="[
                ['route' => 'dashboard', 'label' => '<i class=\'fas fa-home\'></i>'],
                ['label' => 'Admin'],
                ['label' => 'Packages', 'route' => 'admin.package-projects.index'],
                ['label' => 'Create Package'],
            ]" />

        <!-- Session Alerts -->
        @if (session('success'))
            <div class="row mb-3">
                <div class="col-md-12">
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        <i class="fas fa-check-circle me-2"></i>
                        {{ session('success') }}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </div>
            </div>
        @endif

        @if (session('error'))
            <div class="row mb-3">
                <div class="col-md-12">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <i class="fas fa-exclamation-circle me-2"></i>
                        {{ session('error') }}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </div>
            </div>
        @endif

        @if ($errors->any())
            <div class="row mb-3">
                <div class="col-md-12">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <i class="fas fa-exclamation-triangle me-2"></i>
                        <strong>Whoops!</strong> There were some problems with your input.
                        <ul class="mt-2 mb-0">
                            @foreach ($errors->all() as $error)
                                <li>{{ $error }}</li>
                            @endforeach
                        </ul>
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </div>
            </div>
        @endif



        <!-- Form Card -->

        <form action="{{ route('admin.package-projects.store') }}" method="POST" enctype="multipart/form-data"
            class="needs-validation" novalidate>
            @csrf


            <div class="card shadow-sm mb-6">
                <div class="card-header bg-white d-flex justify-content-between align-items-center py-3">
                    <h5 class="mb-0 text-primary">
                        <i class="fas fa-plus-circle me-2"></i>
                        Create Package
                    </h5>
                    <a href="{{ route('admin.package-projects.index') }}" class="btn btn-sm btn-outline-info">
                        <i class="fas fa-arrow-left me-1"></i> Back
                    </a>

                    <div class="col-md-6 d-none mb-3">
                        <label for="project_id" class="form-label">Related Project</label>
                        <select name="project_id" id="project_id" class="form-select" disabled>

                            @foreach ($projects as $project)
                                <option value="{{ $project->id }}" @selected(old('project_id') == $project->id)>
                                    {{ $project->name }} (Budget: ₹{{ number_format($project->budget, 2) }})
                                </option>
                            @endforeach
                        </select>
                    </div>
                </div>
                <div class="card-body">
                    <!-- Category and Department Section -->

                    <div class="row">
                        <div class="col-md-3">
                            <p for="package_category_id" class="form-label h3">Package Category</p>
                            <select name="package_category_id" id="package_category_id" class="form-select">
                                <option value="">Select Category</option>
                                @foreach ($categories as $category)
                                    <option value="{{ $category->id }}" @selected(old('package_category_id') == $category->id)>
                                        {{ $category->name }}
                                    </option>
                                @endforeach
                            </select>
                        </div>

                        <div class="col-md-3">
                            <p for="package_sub_category_id" class="form-label h3">Sub Category</p>
                            <select name="package_sub_category_id" id="package_sub_category_id" class="form-select">
                                <option value="">Select Sub Category</option>
                                @foreach ($subCategories as $subCategory)
                                    <option value="{{ $subCategory->id }}" @selected(old('package_sub_category_id') == $subCategory->id)>
                                        {{ $subCategory->name }}
                                    </option>
                                @endforeach
                            </select>
                        </div>

                        <div class="col-md-3">
                            <p for="department_id" class="form-label h3">Department</p>
                            <select name="department_id" id="department_id" class="form-select">
                                <option value="">Select Department</option>
                                @foreach ($departments as $department)
                                    <option value="{{ $department->id }}" @selected(old('department_id') == $department->id)>
                                        {{ $department->name }}
                                    </option>
                                @endforeach
                            </select>
                        </div>

                        <div class="col-md-3">
                            <p for="package_component_id" class="form-label h3">Package under Component </p>
                            <select name="package_component_id" id="package_component_id" class="form-select">
                                <option value="">Select Package Component</option>
                                @foreach ($components as $component)
                                    <option value="{{ $component->id }}" @selected(old('package_component_id') == $component->id)>
                                        {{ $component->name }}
                                    </option>
                                @endforeach
                            </select>
                        </div>
                    </div>

                    <!-- Basic Information Section -->

                    <div class="row ">
                        <div class="col-md-12 ">
                            <p for="package_name" class="form-label h3">Package Name <span class="text-danger">*</span>
                            </p>
                            <textarea type="text" class="form-control" id="package_name" name="package_name" value="{{ old('package_name') }}"
                                required> </textarea>
                            <div class="invalid-feedback">Please provide a package name.</div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <p for="package_number" class="form-label h3">Package Number <span
                                    class="text-danger">*</span></p>
                            <input type="text" class="form-control" id="package_number" name="package_number"
                                value="{{ old('package_number') }}" required>
                            <div class="invalid-feedback">Please provide a package number.</div>
                        </div>

                        <div class="col-md-6 mb-3">
                            <p for="estimated_budget_incl_gst" class="form-label h3">Sanctioned Cost (₹) <span
                                    class="text-danger">*</span></p>
                            <input type="number" step="0.01" class="form-control" id="estimated_budget_incl_gst"
                                name="estimated_budget_incl_gst" value="{{ old('estimated_budget_incl_gst') }}"
                                required />
                            <div class="invalid-feedback">Please provide a valid budget amount.</div>
                        </div>
                    </div>
                </div>

            </div>

            <div class="card shadow-sm mb-6">


                <div class="card-body">

                    <!-- Location Information -->
                    <div class="row ">

                        <div class="col-md-3">
                            <p for="vidhan_sabha_id" class="form-label h3">Vidhan Sabha Constituency</p>
                            <select name="vidhan_sabha_id" id="vidhan_sabha_id" class="form-select">
                                <option value="">Select Constituency</option>
                                @foreach ($constituencies as $constituency)
                                    <option value="{{ $constituency->id }}" @selected(old('vidhan_sabha_id') == $constituency->id)>
                                        {{ $constituency->name }}
                                    </option>
                                @endforeach
                            </select>
                        </div>

                        <div class="col-md-3">
                            <p for="vidhan_sabha_id" class="form-label h3"> Lok Sabha Constituency</p>
                            <select name="vidhan_sabha_id" id="vidhan_sabha_id" class="form-select">
                                <option value=""> Select Package Loksabha </option>
                                @foreach ($constituencies as $constituency)
                                    <option value="{{ $constituency->id }}" @selected(old('vidhan_sabha_id') == $constituency->id)>
                                        lopk Sabha from DB
                                    </option>
                                @endforeach
                            </select>
                        </div>


                        <div class="col-md-3">
                            <p for="district_id" class="form-label h3">District</p>
                            <select name="district_id" id="district_id" class="form-select">
                                <option value="">Select District</option>
                                @foreach ($districts as $district)
                                    <option value="{{ $district->id }}" @selected(old('district_id') == $district->id)>
                                        {{ $district->name }}
                                    </option>
                                @endforeach
                            </select>
                        </div>

                        <div class="col-md-3">
                            <p for="block_id" class="form-label h3">Block</p>
                            <select name="block_id" id="block_id" class="form-select">
                                <option value="">Select Block</option>
                                @foreach ($blocks as $block)
                                    <option value="{{ $block->id }}" @selected(old('block_id') == $block->id)>
                                        {{ $block->name }}
                                    </option>
                                @endforeach
                            </select>
                        </div>

                    </div>
                </div>
            </div>


            <!-- Approval Sections -->
            <div class="row">

                <!-- DEC Approval -->
                <div class="col-md-6">
                    <div class="card h-100">
                        <div class="card-header bg-light">
                            <h6 class="mb-0">
                                <i class="fas fa-check-circle me-2 text-primary"></i> DEC Approval
                            </h6>
                        </div>
                        <div class="card-body">

<div class="row">
                                <div class="col-md-2 mb-3">


                            <div class="form-check form-switch">
                                <p for="dec_approval_date" class="form-label h3"> DEC Approved </p>

                                <input type="hidden" name="dec_approved" value="0">
                                <input class="form-check-input" type="checkbox" name="dec_approved"
                                    id="dec_approved" value="1">

                                <label class="form-check-label h3" for="dec_approved">Approved</label>
                            </div>
                                </div>

                            <div class="col-md-5 mb-3">
                                <p for="dec_approval_date" class="form-label h3">Approval Date</p>
                                <input type="date" class="form-control" id="dec_approval_date"
                                    name="dec_approval_date" value="{{ old('dec_approval_date') }}">
                            </div>

                            <div class="col-md-5 mb-3">
                                <p for="dec_letter_number" class="form-label h3">Letter Number</p>
                                <input type="text" class="form-control" id="dec_letter_number"
                                    name="dec_letter_number" value="{{ old('dec_letter_number') }}">
                            </div>

                            <div class="offset-2 col-md-10 mb-0">
                                <p for="dec_document_path" class="form-label h3">Approval Document
                                    (PDF)</p>
                                <input type="file" class="form-control" id="dec_document_path"
                                    name="dec_document_path" accept=".pdf">
                                <small class="text-muted">Max 2 MB PDF file</small>
                            </div>
                        </div>

                        </div>

                    </div>
                </div>


                <!-- HPC Approval -->
                <div class="col-md-6">
                    <div class="card h-100">
                        <div class="card-header bg-light">
                            <h6 class="mb-0">
                                <i class="fas fa-check-circle me-2 text-primary"></i> HPC Approval
                            </h6>
                        </div>
                        <div class="card-body">

                            <div class="row">
                                <div class="col-md-2 mb-3">
                                    <div class="form-check form-switch mb-3">
                                        
                                <p for="dec_approval_date" class="form-label h3">HPC Approved </p>

                                        <input type="hidden" name="hpc_approved" value="0">
                                        <input class="form-check-input" type="checkbox" name="hpc_approved"
                                            id="hpc_approved" value="1">

                                        <label class="form-check-label h3" for="hpc_approved">Approved</label>
                                    </div>

                                </div>
                                <div class="col-md-5 mb-3">
                                    <p for="hpc_approval_date" class="form-label h3">Approval Date</p>
                                    <input type="date" class="form-control" id="hpc_approval_date"
                                        name="hpc_approval_date" value="{{ old('hpc_approval_date') }}">
                                </div>


                                <div class="col-md-5 mb-3">
                                    <p for="hpc_letter_number" class="form-label h3">Letter Number</p>
                                    <input type="text" class="form-control" id="hpc_letter_number"
                                        name="hpc_letter_number" value="{{ old('hpc_letter_number') }}">
                                </div>

                                <div class="offset-2  col-md-10 mb-0">
                                <p for="hpc_document_path" class="form-label h3">Approval Document
                                    (PDF)</p>
                                <input type="file" class="form-control" id="hpc_document_path"
                                    name="hpc_document_path" accept=".pdf">
                                <small class="text-muted">Max 2MB PDF file</small>
                            </div>
                            </div>

                           
                        </div>
                    </div>
                </div>
            </div>

            <!-- Form Actions -->
            <div class="d-flex justify-content-end border-top pt-4">
                <button type="reset" class="btn btn-outline-secondary me-3">
                    <i class="fas fa-undo me-1"></i> Reset
                </button>
                <button type="submit" class="btn btn-primary">
                    <i class="fas fa-save me-1"></i> Create Package Project
                </button>
            </div>

        </form>

        <!-- Bootstrap Validation Script -->
        <script>
            (function() {
                'use strict'

                // Fetch all the forms we want to apply custom Bootstrap validation styles to
                var forms = document.querySelectorAll('.needs-validation')

                // Loop over them and prevent submission
                Array.prototype.slice.call(forms)
                    .forEach(function(form) {
                        form.addEventListener('submit', function(event) {
                            if (!form.checkValidity()) {
                                event.preventDefault()
                                event.stopPropagation()
                            }

                            form.classList.add('was-validated')
                        }, false)
                    })
            })()
        </script>
</x-app-layout>
