<x-app-layout>
    <div class="container-fluid">
        <!-- Breadcrumb -->
        <div class="row mb-4">
            <div class="col-md-12 d-flex justify-content-between align-items-center">
                <h4 class="mb-0"><i class="fas fa-edit text-primary me-2"></i> Edit Safeguard Compliance</h4>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb mb-0">
                        <li class="breadcrumb-item"><a href="{{ route('dashboard') }}"><i class="fas fa-home"></i></a></li>
                        <li class="breadcrumb-item"><a href="{{ route('admin.safeguard-compliances.index') }}">Safeguard Compliances</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Edit</li>
                    </ol>
                </nav>
            </div>
        </div>

        <!-- Form -->
        <div class="card shadow-sm">
            <div class="card-body">
                <form action="{{ route('admin.safeguard-compliances.update', $safeguardCompliance) }}" method="POST">
                    @csrf @method('PUT')
                    <div class="mb-3">
                        <label class="form-label">Compliance Name</label>
                        <input type="text" name="name" value="{{ old('name', $safeguardCompliance->name) }}" class="form-control" required>
                        @error('name') <div class="text-danger small">{{ $message }}</div> @enderror
                    </div>
                    <button type="submit" class="btn btn-primary">Update</button>
                    <a href="{{ route('admin.safeguard-compliances.index') }}" class="btn btn-secondary">Cancel</a>
                </form>
            </div>
        </div>
    </div>
</x-app-layout>
