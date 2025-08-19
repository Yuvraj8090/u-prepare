<x-app-layout>
    <div class="container-fluid">
        <!-- Breadcrumb -->
        <x-admin.breadcrumb-header
    icon="fas fa-file-contract text-primary"
    title="Create Procurement Details"
    :breadcrumbs="[
        ['route' => 'dashboard', 'label' => '<i class=\'fas fa-home\'></i>'],
        ['label' => 'Admin'],
        ['route' => 'admin.package-projects.index', 'label' => 'Package Projects'],
        ['route' => 'admin.package-projects.show', 'params' => $packageProject, 'label' => 'Package #' . $packageProject->id],
        ['label' => 'Create Procurement']
    ]"
/>


        <!-- Main Card -->
        <div class="card shadow-sm">
            <div class="card-header bg-white">
                <h5 class="mb-0 text-primary">
                    <i class="fas fa-plus-circle me-2"></i> New Procurement Details
                </h5>
                <div class="small text-muted mt-1">
                    For Package: #{{ $packageProject->id }} - {{ $packageProject->package_name }}
                </div>
            </div>

            <div class="card-body">
                <form action="{{ route('admin.procurement-details.store', $packageProject) }}" method="POST" enctype="multipart/form-data">
                    @csrf

                    <div class="row mb-4">
                        <div class="col-md-6">
                            <label for="method_of_procurement" class="form-label">Method of Procurement *</label>
                            <select class="form-select @error('method_of_procurement') is-invalid @enderror" 
                                    id="method_of_procurement" name="method_of_procurement" required>
                                <option value="">Select Method</option>
                                @foreach($methodsOfProcurement as $method)
                                    <option value="{{ $method }}" {{ old('method_of_procurement') == $method ? 'selected' : '' }}>
                                        {{ $method }}
                                    </option>
                                @endforeach
                            </select>
                            @error('method_of_procurement')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>

                        <div class="col-md-6">
                            <label for="type_of_procurement" class="form-label">Type of Procurement *</label>
                            <select class="form-select @error('type_of_procurement') is-invalid @enderror" 
                                    id="type_of_procurement" name="type_of_procurement" required>
                                <option value="">Select Type</option>
                                <option value="Item Wise" {{ old('type_of_procurement') == 'Item Wise' ? 'selected' : '' }}>Item Wise</option>
                                <option value="EPC" {{ old('type_of_procurement') == 'EPC' ? 'selected' : '' }}>EPC</option>
                                <option value="Others" {{ old('type_of_procurement') == 'Others' ? 'selected' : '' }}>Others</option>
                            </select>
                            @error('type_of_procurement')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>
                    </div>

                    <div class="row mb-4">
                        <div class="col-md-4">
                            <label for="publication_date" class="form-label">Publication Date</label>
                            <input type="date" class="form-control @error('publication_date') is-invalid @enderror" 
                                   id="publication_date" name="publication_date" value="{{ old('publication_date') }}">
                            @error('publication_date')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>

                        <div class="col-md-4">
                            <label for="tender_fee" class="form-label">Tender Fee (₹)</label>
                            <input type="number" step="0.01" class="form-control @error('tender_fee') is-invalid @enderror" 
                                   id="tender_fee" name="tender_fee" value="{{ old('tender_fee') }}">
                            @error('tender_fee')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>

                        <div class="col-md-4">
                            <label for="earnest_money_deposit" class="form-label">EMD (₹)</label>
                            <input type="number" step="0.01" class="form-control @error('earnest_money_deposit') is-invalid @enderror" 
                                   id="earnest_money_deposit" name="earnest_money_deposit" value="{{ old('earnest_money_deposit') }}">
                            @error('earnest_money_deposit')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>
                    </div>

                    <div class="row mb-4">
                        <div class="col-md-6">
                            <label for="bid_validity_days" class="form-label">Bid Validity (Days)</label>
                            <input type="number" class="form-control @error('bid_validity_days') is-invalid @enderror" 
                                   id="bid_validity_days" name="bid_validity_days" value="{{ old('bid_validity_days') }}">
                            @error('bid_validity_days')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>

                        <div class="col-md-6">
                            <label for="emd_validity_days" class="form-label">EMD Validity (Days)</label>
                            <input type="number" class="form-control @error('emd_validity_days') is-invalid @enderror" 
                                   id="emd_validity_days" name="emd_validity_days" value="{{ old('emd_validity_days') }}">
                            @error('emd_validity_days')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>
                    </div>

                    <div class="mb-4">
                        <label for="publication_document" class="form-label">Publication Document</label>
                        <input type="file" class="form-control @error('publication_document') is-invalid @enderror" 
                               id="publication_document" name="publication_document">
                        <div class="form-text">Accepted formats: PDF, DOC, DOCX (Max: 2MB)</div>
                        @error('publication_document')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>

                    <div class="d-flex justify-content-end border-top pt-4">
                        <a href="{{ route('admin.package-projects.show', $packageProject) }}" class="btn btn-light me-3">
                            <i class="fas fa-times me-1"></i> Cancel
                        </a>
                        <button type="submit" class="btn btn-primary">
                            <i class="fas fa-save me-1"></i> Create Procurement
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</x-app-layout>