<x-app-layout>
    <div class="container-fluid">
        <!-- Breadcrumb -->
        <div class="row mb-4">
            <div class="col-md-12 d-flex justify-content-between align-items-center">
                <h4 class="mb-0"><i class="fas fa-plus-circle text-primary me-2"></i> Create Construction Phase</h4>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb mb-0">
                        <li class="breadcrumb-item"><a href="{{ route('dashboard') }}"><i class="fas fa-home"></i></a></li>
                        <li class="breadcrumb-item"><a href="{{ route('admin.contraction-phases.index') }}">Construction
                                Phases</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Create</li>
                    </ol>
                </nav>
            </div>
        </div>

        <!-- Form -->
        <div class="card shadow-sm">
            <div class="card-body">
                <form action="{{ route('admin.contraction-phases.store') }}" method="POST">
                    @csrf

                    <!-- Phase Name -->
                    <div class="mb-3">
                        <label class="form-label">Phase Name</label>
                        <input type="text" name="name" value="{{ old('name') }}" class="form-control" required>
                        @error('name')
                            <div class="text-danger small">{{ $message }}</div>
                        @enderror
                    </div>

                    <!-- Is One Time -->
                    <div class="form-check mb-3">
                        <input class="form-check-input" type="checkbox" name="is_one_time" id="is_one_time"
                            {{ old('is_one_time') ? 'checked' : '' }}>
                        <label class="form-check-label" for="is_one_time">
                            Is One Time
                        </label>
                        @error('is_one_time')
                            <div class="text-danger small">{{ $message }}</div>
                        @enderror
                    </div>

                    <!-- Buttons -->
                    <button type="submit" class="btn btn-primary">Save</button>
                    <a href="{{ route('admin.contraction-phases.index') }}" class="btn btn-secondary">Cancel</a>
                </form>

            </div>
        </div>
    </div>
</x-app-layout>
