
{{-- resources/views/admin/package_components/show.blade.php --}}
<x-app-layout>
    <div class="container-fluid">
        <x-admin.breadcrumb-header 
            icon="fas fa-eye text-primary" 
            title="View Package Component" 
            :breadcrumbs="[
                ['route' => 'dashboard', 'label' => '<i class=\'fas fa-home\'></i>'], 
                ['label' => 'Admin'],
                ['route' => 'admin.package-components.index', 'label' => 'Package Components'],
                ['label' => 'Details']
            ]"  
        /> 

        <div class="card shadow-sm">
            <div class="card-body">
                <h4 class="fw-bold">{{ $packageComponent->name }}</h4>
                <p class="text-success">
                    Budget: ₹{{ number_format($packageComponent->budget ?? 0, 2) }}
                </p>
                <p class="text-muted">
                    Created At: {{ $packageComponent->created_at?->format('d M, Y H:i') }}
                </p>
                <p class="text-muted">
                    Updated At: {{ $packageComponent->updated_at?->format('d M, Y H:i') }}
                </p>

                <a href="{{ route('admin.package-components.edit', $packageComponent->id) }}" class="btn btn-primary">
                    <i class="fas fa-edit"></i> Edit
                </a>
                <a href="{{ route('admin.package-components.index') }}" class="btn btn-secondary">Back</a>
            </div>
        </div>
    </div>
</x-app-layout>
