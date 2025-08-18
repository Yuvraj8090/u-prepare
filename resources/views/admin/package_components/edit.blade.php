{{-- resources/views/admin/package_components/edit.blade.php --}}
<x-app-layout>
    <div class="container-fluid">
        <x-admin.breadcrumb-header 
            icon="fas fa-edit text-primary" 
            title="Edit Package Component" 
            :breadcrumbs="[
                ['route' => 'dashboard', 'label' => '<i class=\'fas fa-home\'></i>'], 
                ['label' => 'Admin'],
                ['route' => 'admin.package-components.index', 'label' => 'Package Components'],
                ['label' => 'Edit']
            ]"  
        /> 

        <div class="card shadow-sm">
            <div class="card-body">
                <form action="{{ route('admin.package-components.update', $packageComponent->id) }}" method="POST">
                    @csrf
                    @method('PUT')

                    <div class="mb-3">
                        <label class="form-label">Name <span class="text-danger">*</span></label>
                        <input type="text" name="name" class="form-control" required 
                               value="{{ old('name', $packageComponent->name) }}">
                        @error('name') <small class="text-danger">{{ $message }}</small> @enderror
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Budget (₹)</label>
                        <input type="number" step="0.01" name="budget" class="form-control" 
                               value="{{ old('budget', $packageComponent->budget) }}">
                        @error('budget') <small class="text-danger">{{ $message }}</small> @enderror
                    </div>

                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-save"></i> Update
                    </button>
                    <a href="{{ route('admin.package-components.index') }}" class="btn btn-secondary">Cancel</a>
                </form>
            </div>
        </div>
    </div>
</x-app-layout>
