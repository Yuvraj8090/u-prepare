<x-app-layout>
    <div class="container-fluid">
        <!-- Breadcrumb -->
        <div class="row mb-4">
            <div class="col-md-12 d-flex justify-content-between align-items-center">
                <h4 class="mb-0">
                    <i class="fas fa-project-diagram text-primary me-2"></i> Add EPC Entry
                </h4>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb mb-0">
                        <li class="breadcrumb-item"><a href="{{ route('dashboard') }}"><i class="fas fa-home"></i></a></li>
                        <li class="breadcrumb-item">Admin</li>
                        <li class="breadcrumb-item"><a href="{{ route('admin.epcentry_data.index') }}">EPC Entries</a>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">Add</li>
                    </ol>
                </nav>
            </div>
        </div>

        <div class="card shadow-sm">
            <div class="card-header bg-white">
                <h5 class="mb-0 text-primary">
                    <i class="fas fa-plus me-2"></i> Add EPC Entry
                </h5>
            </div>

            <div class="card-body">
                @if (session('success'))
                    <div class="alert alert-success alert-dismissible fade show">
                        {{ session('success') }}
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                @endif

                @if ($errors->any())
                    <div class="alert alert-danger">
                        <strong>There were some problems with your input:</strong>
                        <ul class="mb-0">
                            @foreach ($errors->all() as $error)
                                <li>{{ $error }}</li>
                            @endforeach
                        </ul>
                    </div>
                @endif

                <form action="{{ route('admin.epcentry_data.store') }}" method="POST">
                    @csrf

                    @if (request()->has('sub_package_project_id') && $subProject)
                        <div class="mb-3">
                            <label class="form-label">Project</label>
                            <input type="text" class="form-control" value="{{ $subProject->name }}" readonly>
                            <input type="hidden" name="sub_package_project_id" value="{{ $subProject->id }}">
                        </div>
                    @endif

                    <div class="mb-3">
                        <label for="sl_no" class="form-label">SL No <span class="text-danger">*</span></label>
                        <input type="text" id="sl_no" name="sl_no"
                            class="form-control @error('sl_no') is-invalid @enderror" value="{{ old('sl_no') }}"
                            required>
                        @error('sl_no')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>

                    <div class="mb-3">
                        <label for="activity_name" class="form-label">Activity Name <span
                                class="text-danger">*</span></label>
                        <textarea id="activity_name" name="activity_name" class="form-control @error('activity_name') is-invalid @enderror"
                            required>{{ old('activity_name') }}</textarea>
                        @error('activity_name')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>

                    <div class="mb-3">
                        <label for="stage_name" class="form-label">Stage Name</label>
                        <input type="text" id="stage_name" name="stage_name"
                            class="form-control @error('stage_name') is-invalid @enderror"
                            value="{{ old('stage_name') }}">
                        @error('stage_name')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>

                    <div class="mb-3">
                        <label for="item_description" class="form-label">Item Description (Comma Separated) <span
                                class="text-danger">*</span></label>
                        <textarea id="item_description" name="item_description"
                            class="form-control @error('item_description') is-invalid @enderror" required>{{ old('item_description') }}</textarea>
                        @error('item_description')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>

                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="percent" class="form-label">Percent</label>
                            <input type="number" step="0.01" id="percent" name="percent"
                                class="form-control @error('percent') is-invalid @enderror"
                                value="{{ old('percent') }}">
                            @error('percent')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>

                        <div class="col-md-6">
                            <label for="amount" class="form-label">Amount</label>
                            <input type="number" step="0.01" id="amount" name="amount"
                                class="form-control @error('amount') is-invalid @enderror" value="{{ old('amount') }}">
                            @error('amount')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>
                    </div>

                    <div class="d-flex justify-content-end">
                        <a href="{{ route('admin.epcentry_data.index', ['sub_package_project_id' => $subProject->id]) }}"
                            class="btn btn-light me-2">
                            <i class="fas fa-times me-1"></i> Cancel
                        </a>

                        <button type="submit" class="btn btn-primary">
                            <i class="fas fa-save me-1"></i> Save Entry
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</x-app-layout>
