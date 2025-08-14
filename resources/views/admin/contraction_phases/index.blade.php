<x-app-layout>
    <div class="container-fluid">
        <!-- Breadcrumb -->
        <div class="row mb-4">
            <div class="col-md-12 d-flex justify-content-between align-items-center">
                <h4 class="mb-0">
                    <i class="fas fa-layer-group text-primary me-2"></i> Construction Phases Management
                </h4>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb mb-0">
                        <li class="breadcrumb-item"><a href="{{ route('dashboard') }}"><i class="fas fa-home"></i></a></li>
                        <li class="breadcrumb-item">Admin</li>
                        <li class="breadcrumb-item active" aria-current="page">Construction Phases</li>
                    </ol>
                </nav>
            </div>
        </div>

        <!-- Alerts -->
        @if (session('success'))
            <x-alert type="success" :message="session('success')" dismissible />
        @endif
        @if (session('error'))
            <x-alert type="danger" :message="session('error')" dismissible />
        @endif

        <!-- Table -->
       <!-- Table -->
<div class="card shadow-sm">
    <div class="card-header bg-white d-flex justify-content-between align-items-center">
        <h5 class="mb-0 text-primary">
            <i class="fas fa-list me-2"></i> Construction Phase List
        </h5>
        <a href="{{ route('admin.contraction-phases.create') }}" class="btn btn-sm btn-primary">
            <i class="fas fa-plus-circle me-1"></i> Create Construction Phase
        </a>
    </div>
    <div class="card-body">
        <x-admin.data-table id="contraction-phases-table"
            :headers="['ID', 'Name', 'Is One Time', 'Created At', 'Actions']"
            :excel="true"
            :print="true"
            title="Construction Phases Export"
            searchPlaceholder="Search phases..."
            resourceName="contraction-phases"
            :pageLength="10">
            @foreach ($phases as $phase)
                <tr>
                    <td>{{ $phase->id }}</td>
                    <td>{{ $phase->name }}</td>
                    <td>
                        @if($phase->is_one_time)
                            <span class="badge bg-success">Yes</span>
                        @else
                            <span class="badge bg-secondary">No</span>
                        @endif
                    </td>
                    <td>{{ $phase->created_at->format('M d, Y h:i A') }}</td>
                    <td>
                        <div class="d-flex justify-content-end gap-2">
                            <a href="{{ route('admin.contraction-phases.edit', $phase) }}"
                                class="btn btn-sm btn-outline-primary">
                                <i class="fas fa-edit me-1"></i> Edit
                            </a>
                            <form action="{{ route('admin.contraction-phases.destroy', $phase) }}" method="POST"
                                onsubmit="return confirm('Delete this contraction phase?')">
                                @csrf @method('DELETE')
                                <button type="submit" class="btn btn-sm btn-outline-danger">
                                    <i class="fas fa-trash-alt me-1"></i> Delete
                                </button>
                            </form>
                        </div>
                    </td>
                </tr>
            @endforeach
        </x-admin.data-table>
    </div>
</div>

    </div>
</x-app-layout>
