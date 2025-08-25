<x-app-layout>
    <div class="container-fluid">
        <!-- Breadcrumb -->
        <x-admin.breadcrumb-header
            icon="fas fa-plus-circle text-primary"
            title="Create Safeguard Compliance"
            :breadcrumbs="[
                ['route' => 'dashboard', 'label' => '<i class=\'fas fa-home\'></i>'],
                ['route' => 'admin.safeguard-compliances.index', 'label' => 'Safeguard Compliances'],
                ['label' => 'Create']
            ]"
        />

        <!-- Form -->
        <div class="card shadow-sm">
            <div class="card-body">
                <form action="{{ route('admin.safeguard-compliances.store') }}" method="POST">
                    @csrf
                    <div class="mb-3">
                        <label class="form-label">Compliance Name</label>
                        <input type="text" name="name" value="{{ old('name') }}" class="form-control" required>
                        @error('name') <div class="text-danger small">{{ $message }}</div> @enderror
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Allowed Role</label>
                        <select name="role_id" class="form-control">
                            <option value="">-- Select Role --</option>
                            @foreach($roles as $role)
                                <option value="{{ $role->id }}" {{ old('role_id') == $role->id ? 'selected' : '' }}>
                                    {{ $role->name }}
                                </option>
                            @endforeach
                        </select>
                        @error('role_id') <div class="text-danger small">{{ $message }}</div> @enderror
                    </div>

                    <button type="submit" class="btn btn-primary">Save</button>
                    <a href="{{ route('admin.safeguard-compliances.index') }}" class="btn btn-secondary">Cancel</a>
                </form>
            </div>
        </div>
    </div>
</x-app-layout>
