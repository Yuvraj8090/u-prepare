
<x-app-layout>
    <div class="container-fluid">
        <!-- Header + Breadcrumb -->
        <div class="row mb-4">
            <div class="col-md-12 d-flex justify-content-between align-items-center">
                <h4 class="mb-0">
                    <i class="fas fa-file-contract text-primary me-2"></i> Create Contract
                </h4>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb mb-0">
                        <li class="breadcrumb-item"><a href="{{ route('dashboard') }}"><i class="fas fa-home"></i></a></li>
                        <li class="breadcrumb-item">Admin</li>
                        <li class="breadcrumb-item"><a href="{{ route('admin.contracts.index') }}">Contracts</a></li>
                        <li class="breadcrumb-item active">Create</li>
                    </ol>
                </nav>
            </div>
        </div>

        <!-- Flash Messages -->
        @if ($errors->any())
            <div class="row mb-3">
                <div class="col-md-12">
                    <x-alert type="danger" dismissible>
                        <ul class="mb-0">
                            @foreach ($errors->all() as $error)
                                <li>{{ $error }}</li>
                            @endforeach
                        </ul>
                    </x-alert>
                </div>
            </div>
        @endif

        <!-- Form Card -->
        <div class="card shadow-sm">
            <div class="card-header bg-white d-flex justify-content-between align-items-center">
                <h5 class="mb-0 text-primary">
                    <i class="fas fa-plus-circle me-2"></i> New Contract Details
                </h5>
                <a href="{{ route('admin.contracts.index') }}" class="btn btn-sm btn-outline-secondary">
                    <i class="fas fa-arrow-left me-1"></i> Back to Contracts
                </a>
            </div>

            <div class="card-body">
                <form action="{{ route('admin.contracts.store') }}" method="POST">
                    @csrf

                    <div class="row g-3">
                        <!-- Basic Contract Info -->
                        <div class="col-md-6">
                            <x-label for="contract_number" value="Contract Number" required />
                            <x-input id="contract_number" name="contract_number" 
                                value="{{ old('contract_number') }}" 
                                placeholder="CT-2023-001" 
                                required />
                        </div>

                        <div class="col-md-6">
                            <x-label for="project_id" value="Project" required />
                            <select name="project_id" id="project_id" required 
                                class="form-select @error('project_id') is-invalid @enderror">
                                <option value="">Select Project</option>
                                @foreach($projects as $project)
                                <option value="{{ $project->id }}" @selected(old('project_id') == $project->id)>
                                    {{ $project->package_name }} ({{ $project->package_number }})
                                </option>
                                @endforeach
                            </select>
                        </div>

                        <div class="col-md-6">
                            <x-label for="contract_value" value="Contract Value (₹)" required />
                            <div class="input-group">
                                <span class="input-group-text">₹</span>
                                <x-input type="number" step="0.01" min="0" 
                                    id="contract_value" name="contract_value" 
                                    value="{{ old('contract_value') }}" 
                                    placeholder="1000000.00" 
                                    required />
                            </div>
                        </div>

                        <div class="col-md-6">
                            <x-label for="security" value="Security Deposit (₹)" />
                            <div class="input-group">
                                <span class="input-group-text">₹</span>
                                <x-input type="number" step="0.01" min="0" 
                                    id="security" name="security" 
                                    value="{{ old('security', 0) }}" 
                                    placeholder="100000.00" />
                            </div>
                        </div>

                        <!-- Date Fields -->
                        <div class="col-md-4">
                            <x-label for="signing_date" value="Signing Date" />
                            <x-input type="date" id="signing_date" name="signing_date" 
                                value="{{ old('signing_date') }}" />
                        </div>

                        <div class="col-md-4">
                            <x-label for="commencement_date" value="Commencement Date" />
                            <x-input type="date" id="commencement_date" name="commencement_date" 
                                value="{{ old('commencement_date') }}" />
                        </div>

                        <div class="col-md-4">
                            <x-label for="initial_completion_date" value="Initial Completion Date" />
                            <x-input type="date" id="initial_completion_date" name="initial_completion_date" 
                                value="{{ old('initial_completion_date') }}" />
                        </div>

                        <div class="col-md-6">
                            <x-label for="revised_completion_date" value="Revised Completion Date" />
                            <x-input type="date" id="revised_completion_date" name="revised_completion_date" 
                                value="{{ old('revised_completion_date') }}" />
                        </div>

                        <div class="col-md-6">
                            <x-label for="actual_completion_date" value="Actual Completion Date" />
                            <x-input type="date" id="actual_completion_date" name="actual_completion_date" 
                                value="{{ old('actual_completion_date') }}" />
                        </div>

                        <!-- Contract Document -->
                        <div class="col-12">
                            <x-label for="contract_document" value="Contract Document" />
                            <div class="input-group">
                                <span class="input-group-text">documents/</span>
                                <x-input id="contract_document" name="contract_document" 
                                    value="{{ old('contract_document') }}" 
                                    placeholder="contract123.pdf" />
                            </div>
                            <small class="text-muted">Enter the filename only, path will be prefixed automatically</small>
                        </div>

                        <!-- Contractor Section -->
                        <div class="col-12">
                            <div class="card border">
                                <div class="card-header bg-light">
                                    <h6 class="mb-0">
                                        <i class="fas fa-user-tie me-2"></i> Contractor Information
                                    </h6>
                                </div>
                                <div class="card-body">
                                    <div class="row g-3">
                                        <div class="col-md-6">
                                            <x-label for="contractor_id" value="Select Existing Contractor" />
                                            <select name="contractor_id" id="contractor_id" 
                                                class="form-select @error('contractor_id') is-invalid @enderror">
                                                <option value="">-- Select Contractor --</option>
                                                @foreach($contractors as $contractor)
                                                <option value="{{ $contractor->id }}" @selected(old('contractor_id') == $contractor->id)>
                                                    {{ $contractor->company_name }} ({{ $contractor->gst_no ?? 'No GST' }})
                                                </option>
                                                @endforeach
                                            </select>
                                        </div>

                                        <div class="col-md-12">
                                            <div class="alert alert-info mb-0">
                                                <i class="fas fa-info-circle me-2"></i> 
                                                If contractor not listed above, fill the details below to create a new one
                                            </div>
                                        </div>

                                        <!-- New Contractor Fields -->
                                        <div class="col-md-6">
                                            <x-label for="contractor_company_name" value="Company Name" />
                                            <x-input id="contractor_company_name" name="contractor[company_name]" 
                                                value="{{ old('contractor.company_name') }}" 
                                                placeholder="Enter company name" />
                                        </div>

                                        <div class="col-md-6">
                                            <x-label for="contractor_authorized_personnel_name" value="Authorized Personnel" />
                                            <x-input id="contractor_authorized_personnel_name" name="contractor[authorized_personnel_name]" 
                                                value="{{ old('contractor.authorized_personnel_name') }}" 
                                                placeholder="Enter authorized person name" />
                                        </div>

                                        <div class="col-md-4">
                                            <x-label for="contractor_phone" value="Phone" />
                                            <x-input id="contractor_phone" name="contractor[phone]" 
                                                value="{{ old('contractor.phone') }}" 
                                                placeholder="Enter phone number" />
                                        </div>

                                        <div class="col-md-4">
                                            <x-label for="contractor_email" value="Email" />
                                            <x-input type="email" id="contractor_email" name="contractor[email]" 
                                                value="{{ old('contractor.email') }}" 
                                                placeholder="Enter email address" />
                                        </div>

                                        <div class="col-md-4">
                                            <x-label for="contractor_gst_no" value="GST Number" />
                                            <x-input id="contractor_gst_no" name="contractor[gst_no]" 
                                                value="{{ old('contractor.gst_no') }}" 
                                                placeholder="29GGGGG1314R9Z6" />
                                        </div>

                                        <div class="col-12">
                                            <x-label for="contractor_address" value="Address" />
                                            <textarea id="contractor_address" name="contractor[address]" rows="2" 
                                                class="form-control @error('contractor.address') is-invalid @enderror"
                                                placeholder="Enter company address">{{ old('contractor.address') }}</textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="mt-4 d-flex justify-content-end border-top pt-3">
                        <button type="reset" class="btn btn-outline-secondary me-2">
                            <i class="fas fa-undo me-1"></i> Reset
                        </button>
                        <button type="submit" class="btn btn-primary">
                            <i class="fas fa-save me-1"></i> Create Contract
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</x-app-layout>
