<x-app-layout>
    <div class="container-fluid">
        <!-- Breadcrumbs and Header -->
        <div class="row mb-4">
            <div class="col-md-12">
                <div class="d-flex justify-content-between align-items-center">
                    <h4 class="mb-0">
                        <i class="fas fa-boxes me-2 text-primary"></i>
                        Create New Package Project
                    </h4>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb mb-0">
                            <li class="breadcrumb-item"><a href="{{ route('dashboard') }}"><i class="fas fa-home"></i></a></li>
                            <li class="breadcrumb-item">Admin</li>
                            <li class="breadcrumb-item"><a href="{{ route('admin.package-projects.index') }}">Package Projects</a></li>
                            <li class="breadcrumb-item active">Create</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>

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
        <div class="card shadow-sm">
            <div class="card-header bg-white d-flex justify-content-between align-items-center py-3">
                <h5 class="mb-0 text-primary">
                    <i class="fas fa-plus-circle me-2"></i>
                    Package Project Details
                </h5>
                <a href="{{ route('admin.package-projects.index') }}" class="btn btn-sm btn-outline-secondary">
                    <i class="fas fa-arrow-left me-1"></i> Back to List
                </a>
            </div>
            <div class="card-body">
                <form action="{{ route('admin.package-projects.store') }}" method="POST" enctype="multipart/form-data" class="needs-validation" novalidate>
                    @csrf

                    <!-- Basic Information Section -->
                    <div class="mb-4">
                        <h6 class="mb-3 text-muted border-bottom pb-2">
                            <i class="fas fa-info-circle me-2"></i> Basic Information
                        </h6>
                        
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="project_id" class="form-label">Related Project</label>
                                <select name="project_id" id="project_id" class="form-select">
                                    
                                    @foreach ($projects as $project)
                                        <option value="{{ $project->id }}" @selected(old('project_id') == $project->id)>
                                            {{ $project->name }} (Budget: ₹{{ number_format($project->budget, 2) }})
                                        </option>
                                    @endforeach
                                </select>
                            </div>
                            
                            <div class="col-md-6 mb-3">
                                <label for="package_name" class="form-label">Package Name <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" id="package_name" name="package_name" 
                                    value="{{ old('package_name') }}" required>
                                <div class="invalid-feedback">Please provide a package name.</div>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="package_number" class="form-label">Package Number <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" id="package_number" name="package_number" 
                                    value="{{ old('package_number') }}" required>
                                <div class="invalid-feedback">Please provide a package number.</div>
                            </div>
                            
                            <div class="col-md-6 mb-3">
                                <label for="estimated_budget_incl_gst" class="form-label">Estimated Budget (₹) <span class="text-danger">*</span></label>
                                <input type="number" step="0.01" class="form-control" id="estimated_budget_incl_gst" 
                                    name="estimated_budget_incl_gst" value="{{ old('estimated_budget_incl_gst') }}" required>
                                <div class="invalid-feedback">Please provide a valid budget amount.</div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Category and Department Section -->
                    <div class="mb-4">
                        <h6 class="mb-3 text-muted border-bottom pb-2">
                            <i class="fas fa-tags me-2"></i> Classification
                        </h6>
                        
                        <div class="row">
                            <div class="col-md-4 mb-3">
                                <label for="package_category_id" class="form-label">Category</label>
                                <select name="package_category_id" id="package_category_id" class="form-select">
                                    <option value="">Select Category</option>
                                    @foreach ($categories as $category)
                                        <option value="{{ $category->id }}" @selected(old('package_category_id') == $category->id)>
                                            {{ $category->name }}
                                        </option>
                                    @endforeach
                                </select>
                            </div>
                            
                            <div class="col-md-4 mb-3">
                                <label for="package_sub_category_id" class="form-label">Sub Category</label>
                                <select name="package_sub_category_id" id="package_sub_category_id" class="form-select">
                                    <option value="">Select Sub Category</option>
                                    @foreach ($subCategories as $subCategory)
                                        <option value="{{ $subCategory->id }}" @selected(old('package_sub_category_id') == $subCategory->id)>
                                            {{ $subCategory->name }}
                                        </option>
                                    @endforeach
                                </select>
                            </div>
                            
                            <div class="col-md-4 mb-3">
                                <label for="department_id" class="form-label">Department</label>
                                <select name="department_id" id="department_id" class="form-select">
                                    <option value="">Select Department</option>
                                    @foreach ($departments as $department)
                                        <option value="{{ $department->id }}" @selected(old('department_id') == $department->id)>
                                            {{ $department->name }}
                                        </option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Location Information -->
                    <div class="mb-4">
                        <h6 class="mb-3 text-muted border-bottom pb-2">
                            <i class="fas fa-map-marker-alt me-2"></i> Location Information
                        </h6>
                        
                        <div class="row">
                            <div class="col-md-4 mb-3">
                                <label for="district_id" class="form-label">District</label>
                                <select name="district_id" id="district_id" class="form-select">
                                    <option value="">Select District</option>
                                    @foreach ($districts as $district)
                                        <option value="{{ $district->id }}" @selected(old('district_id') == $district->id)>
                                            {{ $district->name }}
                                        </option>
                                    @endforeach
                                </select>
                            </div>
                            
                            <div class="col-md-4 mb-3">
                                <label for="block_id" class="form-label">Block</label>
                                <select name="block_id" id="block_id" class="form-select">
                                    <option value="">Select Block</option>
                                    @foreach ($blocks as $block)
                                        <option value="{{ $block->id }}" @selected(old('block_id') == $block->id)>
                                            {{ $block->name }}
                                        </option>
                                    @endforeach
                                </select>
                            </div>
                            
                            <div class="col-md-4 mb-3">
                                <label for="vidhan_sabha_id" class="form-label">Vidhan Sabha Constituency</label>
                                <select name="vidhan_sabha_id" id="vidhan_sabha_id" class="form-select">
                                    <option value="">Select Constituency</option>
                                    @foreach ($constituencies as $constituency)
                                        <option value="{{ $constituency->id }}" @selected(old('vidhan_sabha_id') == $constituency->id)>
                                            {{ $constituency->name }}
                                        </option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Approval Sections -->
                    <div class="row">
                        <!-- DEC Approval -->
                        <div class="col-md-6 mb-4">
                            <div class="card h-100">
                                <div class="card-header bg-light">
                                    <h6 class="mb-0">
                                        <i class="fas fa-check-circle me-2 text-primary"></i> DEC Approval
                                    </h6>
                                </div>
                                <div class="card-body">
                                    <div class="form-check form-switch mb-3">
                                        <input class="form-check-input" type="checkbox" name="dec_approved" 
                                            id="dec_approved" @checked(old('dec_approved'))>
                                        <label class="form-check-label" for="dec_approved">Approved</label>
                                    </div>
                                    
                                    <div class="mb-3">
                                        <label for="dec_approval_date" class="form-label">Approval Date</label>
                                        <input type="date" class="form-control" id="dec_approval_date" 
                                            name="dec_approval_date" value="{{ old('dec_approval_date') }}">
                                    </div>
                                    
                                    <div class="mb-3">
                                        <label for="dec_letter_number" class="form-label">Letter Number</label>
                                        <input type="text" class="form-control" id="dec_letter_number" 
                                            name="dec_letter_number" value="{{ old('dec_letter_number') }}">
                                    </div>
                                    
                                    <div class="mb-0">
                                        <label for="dec_document_path" class="form-label">Approval Document (PDF)</label>
                                        <input type="file" class="form-control" id="dec_document_path" 
                                            name="dec_document_path" accept=".pdf">
                                        <small class="text-muted">Max 2MB PDF file</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <!-- HPC Approval -->
                        <div class="col-md-6 mb-4">
                            <div class="card h-100">
                                <div class="card-header bg-light">
                                    <h6 class="mb-0">
                                        <i class="fas fa-check-circle me-2 text-primary"></i> HPC Approval
                                    </h6>
                                </div>
                                <div class="card-body">
                                    <div class="form-check form-switch mb-3">
                                        <input class="form-check-input" type="checkbox" name="hpc_approved" 
                                            id="hpc_approved" @checked(old('hpc_approved'))>
                                        <label class="form-check-label" for="hpc_approved">Approved</label>
                                    </div>
                                    
                                    <div class="mb-3">
                                        <label for="hpc_approval_date" class="form-label">Approval Date</label>
                                        <input type="date" class="form-control" id="hpc_approval_date" 
                                            name="hpc_approval_date" value="{{ old('hpc_approval_date') }}">
                                    </div>
                                    
                                    <div class="mb-3">
                                        <label for="hpc_letter_number" class="form-label">Letter Number</label>
                                        <input type="text" class="form-control" id="hpc_letter_number" 
                                            name="hpc_letter_number" value="{{ old('hpc_letter_number') }}">
                                    </div>
                                    
                                    <div class="mb-0">
                                        <label for="hpc_document_path" class="form-label">Approval Document (PDF)</label>
                                        <input type="file" class="form-control" id="hpc_document_path" 
                                            name="hpc_document_path" accept=".pdf">
                                        <small class="text-muted">Max 2MB PDF file</small>
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
            </div>
        </div>
    </div>

    <!-- Bootstrap Validation Script -->
    <script>
        (function () {
            'use strict'
            
            // Fetch all the forms we want to apply custom Bootstrap validation styles to
            var forms = document.querySelectorAll('.needs-validation')
            
            // Loop over them and prevent submission
            Array.prototype.slice.call(forms)
                .forEach(function (form) {
                    form.addEventListener('submit', function (event) {
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