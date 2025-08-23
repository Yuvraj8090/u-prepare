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

        <div class="card shadow-sm border-0">
            <div class="card-body">
                <form action="{{ route('admin.package-components.update', $packageComponent->id) }}" method="POST">
                    @csrf
                    @method('PUT')

                    {{-- Name --}}
                    <div class="mb-3">
                        <label class="form-label fw-semibold">Name <span class="text-danger">*</span></label>
                        <input 
                            type="text" 
                            name="name" 
                            class="form-control @error('name') is-invalid @enderror" 
                            value="{{ old('name', $packageComponent->name) }}" 
                            required
                        >
                        @error('name') 
                            <div class="invalid-feedback">{{ $message }}</div> 
                        @enderror
                    </div>

                    {{-- Budget --}}
                    <div class="mb-3">
                        <label class="form-label fw-semibold">Budget (₹)</label>
                        <input 
                            type="number" 
                            step="0.01" 
                            name="budget" 
                            class="form-control @error('budget') is-invalid @enderror" 
                            value="{{ old('budget', $packageComponent->budget) }}"
                        >
                        @error('budget') 
                            <div class="invalid-feedback">{{ $message }}</div> 
                        @enderror
                    </div>

                    {{-- Description --}}
                    <div class="mb-3">
                        <label class="form-label fw-semibold">Description</label>
                        <textarea 
                            name="description" 
                            id="description" 
                            rows="4" 
                            class="form-control @error('description') is-invalid @enderror"
                        >{{ old('description', $packageComponent->description ?? '') }}</textarea>
                        @error('description') 
                            <div class="invalid-feedback">{{ $message }}</div> 
                        @enderror
                    </div>

                    {{-- Actions --}}
                    <div class="d-flex gap-2">
                        <button type="submit" class="btn btn-primary">
                            <i class="fas fa-save"></i> Update
                        </button>
                        <a href="{{ route('admin.package-components.index') }}" class="btn btn-secondary">
                            <i class="fas fa-times"></i> Cancel
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</x-app-layout>
