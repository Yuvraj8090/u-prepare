<x-app-layout>
    <div class="container-fluid">
        <!-- Breadcrumbs & Header -->
        <x-admin.breadcrumb-header icon="fas fa-boxes text-primary" title="Edit Package Project" :breadcrumbs="[
            ['route' => 'dashboard', 'label' => '<i class=\'fas fa-home\'></i>'],
            ['label' => 'Admin'],
            ['route' => 'admin.package-projects.index', 'label' => 'Package Projects'],
            ['label' => 'Edit'],
        ]" />

        <!-- Alerts -->
        @foreach (['success', 'error'] as $msg)
            @if (session($msg))
                <div class="row mb-3">
                    <div class="col-md-12">
                        <div class="alert alert-{{ $msg === 'success' ? 'success' : 'danger' }} alert-dismissible fade show"
                            role="alert">
                            <i class="fas fa-{{ $msg === 'success' ? 'check-circle' : 'exclamation-circle' }} me-2"></i>
                            {{ session($msg) }}
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    </div>
                </div>
            @endif
        @endforeach
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
        <form action="{{ route('admin.package-projects.update', $packageProject) }}" method="POST"
            enctype="multipart/form-data" class="needs-validation" novalidate>
            @csrf
            @method('PUT')
            <div class="card shadow-sm">
                <div class="card-header bg-white d-flex justify-content-between align-items-center py-3">
                    <h5 class="mb-0 text-primary"><i class="fas fa-edit me-2"></i>Edit Package Project Details</h5>
                    <a href="{{ route('admin.package-projects.index') }}" class="btn btn-sm btn-outline-secondary">
                        <i class="fas fa-arrow-left me-1"></i> Back to List
                    </a>
                </div>

                <div class="card-body">


                    <!-- Basic Information -->

                    <div class="row">
                        <div class="col-md-3 mb-3">
                            <x-bootstrap.dropdown name="package_category_id" label="Package Category" :items="$categories
                                ->map(fn($category) => ['value' => $category->id, 'label' => $category->name])
                                ->toArray()"
                                :selected="old('package_category_id', $packageProject->package_category_id)" placeholder="Select Category" allowClear />
                        </div>

                        <div class="col-md-3 mb-3">
                            <x-bootstrap.dropdown name="package_sub_category_id" label="Sub Category" :items="$subCategories
                                ->map(fn($subCategory) => ['value' => $subCategory->id, 'label' => $subCategory->name])
                                ->toArray()"
                                :selected="old('package_sub_category_id', $packageProject->package_sub_category_id)" placeholder="Select Sub Category" allowClear />
                        </div>

                        <div class="col-md-3 mb-3">
                            <p for="department_id" class="form-label h3">Department</p>
                            <select name="department_id" id="department_id" class="form-select">
                                <option value="">Select Department</option>
                                @foreach ($departments as $department)
                                    <option value="{{ $department->id }}" @selected(old('department_id', $packageProject->department_id) == $department->id)>
                                        {{ $department->name }}
                                    </option>
                                @endforeach
                            </select>
                        </div>

                        <div class="col-md-3 mb-3">
                            <x-bootstrap.dropdown name="package_component_id" label="Package Component"
                                :items="$components
                                    ->map(fn($component) => ['value' => $component->id, 'label' => $component->name])
                                    ->toArray()" :selected="old('package_component_id', $packageProject->package_component_id)" placeholder="Select Package Component" allowClear />
                        </div>

                        <div class="col-md-2 mb-3 d-none">
                            <x-bootstrap.dropdown name="project_id" label="Related Project" :items="$projects
                                ->map(fn($project) => ['value' => $project->id, 'label' => $project->name])
                                ->toArray()"
                                :selected="old('project_id', $packageProject->project_id)" placeholder="Select a project" allowClear searchable disabled
                                class="w-100" />
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12 mb-3">
                            <p for="package_name" class="form-label h3">Package Name <span class="text-danger">*</span>
                            </p>
                            <textarea class="form-control" id="package_name" name="package_name" required>{{ old('package_name', $packageProject->package_name) }} </textarea>
                            <div class="invalid-feedback">Please provide a package name.</div>
                        </div>

                        <div class="col-md-6 mb-3">
                            <p for="package_number" class="form-label h3">Package Number <span
                                    class="text-danger">*</span></p>
                            <input type="text" class="form-control" id="package_number" name="package_number"
                                value="{{ old('package_number', $packageProject->package_number) }}" required>
                            <div class="invalid-feedback">Please provide a package number.</div>
                        </div>

                        <div class="col-md-6 mb-3">
                            <p for="estimated_budget_incl_gst" class="form-label h3">Estimated Budget (₹) <span
                                    class="text-danger">*</span></p>
                            <input type="number" step="0.01" class="form-control" id="estimated_budget_incl_gst"
                                name="estimated_budget_incl_gst"
                                value="{{ old('estimated_budget_incl_gst', $packageProject->estimated_budget_incl_gst) }}"
                                required>
                            <div class="invalid-feedback">Please provide a valid budget amount.</div>
                        </div>
                    </div>

                </div>
            </div>
            <!-- Location -->
            <div class="card shadow-sm mb-3">
                <div class="card-body">
                    <h6 class="mb-3 text-muted border-bottom pb-2"><i class="fas fa-map-marker-alt me-2"></i>Location
                        Information</h6>
                    <div class="row">
                        <div class="col-md-4 mb-3">
                            <label for="district_id" class="form-label">District</label>
                            <select name="district_id" id="district_id" class="form-select">
                                <option value="">Select District</option>
                                @foreach ($districts as $district)
                                    <option value="{{ $district->id }}" @selected(old('district_id', $packageProject->district_id) == $district->id)>
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
                                    <option value="{{ $block->id }}" @selected(old('block_id', $packageProject->block_id) == $block->id)>
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
                                    <option value="{{ $constituency->id }}" @selected(old('vidhan_sabha_id', $packageProject->vidhan_sabha_id) == $constituency->id)>
                                        {{ $constituency->name }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label for="lok_sabha_id" class="form-label">Lok Sabha</label>
                            <select name="lok_sabha_id" id="lok_sabha_id" class="form-select">
                                <option value="">Select Constituency</option>
                                @foreach ($assembly as $constituency)
                                    <option value="{{ $constituency->id }}" @selected(old('lok_sabha_id', $packageProject->lok_sabha_id) == $constituency->id)>
                                        {{ $constituency->name }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                </div>
            </div>
            <!-- DEC & HPC Approval Cards -->
            <div class="row">
                @foreach (['dec', 'hpc'] as $approval)
                    <div class="col-md-6 mb-4">
                        <div class="card h-100">
                            <div class="card-header bg-light">
                                <h6 class="mb-0"><i class="fas fa-check-circle me-2 text-primary"></i>
                                    {{ strtoupper($approval) }} Approval</h6>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-2 mb-3">
                                        <div class="form-check form-switch mb-3">
                                            <input type="hidden" name="{{ $approval }}_approved"
                                                value="0">
                                            <input class="form-check-input" type="checkbox"
                                                name="{{ $approval }}_approved"
                                                id="{{ $approval }}_approved" value="1"
                                                @checked(old("{$approval}_approved", $packageProject->{$approval . '_approved'} ?? false))>
                                            <label class="form-check-label"
                                                for="{{ $approval }}_approved">Approved</label>
                                        </div>
                                    </div>
                                    <div class="col-md-5 mb-3">
                                        <label for="{{ $approval }}_approval_date" class="form-label">Approval
                                            Date</label>
                                        <input type="date" class="form-control"
                                            id="{{ $approval }}_approval_date"
                                            name="{{ $approval }}_approval_date"
                                            value="{{ old("{$approval}_approval_date", optional($packageProject->{$approval . '_approval_date'})->format('Y-m-d') ?? '') }}">
                                    </div>
                                    <div class="col-md-5 mb-3">
                                        <label for="{{ $approval }}_letter_number" class="form-label">Letter
                                            Number</label>
                                        <input type="text" class="form-control"
                                            id="{{ $approval }}_letter_number"
                                            name="{{ $approval }}_letter_number"
                                            value="{{ old("{$approval}_letter_number", $packageProject->{$approval . '_letter_number'} ?? '') }}">
                                    </div>
                                    <div class="offset-2 col-md-10 mb-3">
                                        <label for="{{ $approval }}_document_path" class="form-label">Approval
                                            Document
                                            (PDF)
                                        </label>
                                        <input type="file" class="form-control"
                                            id="{{ $approval }}_document_path"
                                            name="{{ $approval }}_document_path" accept=".pdf">
                                        @if (isset($packageProject) && $packageProject->{$approval . '_document_path'})
                                            <div class="mt-2">
                                                <a href="{{ Storage::url($packageProject->{$approval . '_document_path'}) }}"
                                                    target="_blank" class="btn btn-sm btn-outline-primary">
                                                    <i class="fas fa-file-pdf me-1"></i> View Current Document
                                                </a>
                                            </div>
                                        @endif
                                        <small class="text-muted">Max 2MB PDF file</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>
            <!-- Form Actions -->
            <div class="d-flex justify-content-end border-top pt-4">
                <a href="{{ route('admin.package-projects.index') }}" class="btn btn-outline-secondary me-3">
                    <i class="fas fa-times me-1"></i> Cancel
                </a>
                <button type="submit" class="btn btn-primary">
                    <i class="fas fa-save me-1"></i> Update Package Project
                </button>
            </div>
        </form>
        <!-- Bootstrap Validation -->
        <script>
            (function() {
                'use strict';
                var forms = document.querySelectorAll('.needs-validation');
                Array.prototype.slice.call(forms).forEach(function(form) {
                    form.addEventListener('submit', function(event) {
                        if (!form.checkValidity()) {
                            event.preventDefault();
                            event.stopPropagation();
                        }
                        form.classList.add('was-validated');
                    }, false);
                });
            })();
        </script>
</x-app-layout>
