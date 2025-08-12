<x-app-layout>
    <div class="container-fluid">
        <!-- Breadcrumb -->
        <div class="row mb-4">
            <div class="col-md-12 d-flex justify-content-between align-items-center">
                <h4 class="mb-0">
                    <i class="fas fa-shield-alt text-primary me-2"></i> Safeguard Compliances Management
                </h4>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb mb-0">
                        <li class="breadcrumb-item"><a href="{{ route('dashboard') }}"><i class="fas fa-home"></i></a></li>
                        <li class="breadcrumb-item">Admin</li>
                        <li class="breadcrumb-item active" aria-current="page">Safeguard Compliances</li>
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
        <div class="card shadow-sm">
            <div class="card-header bg-white d-flex justify-content-between align-items-center">
                <h5 class="mb-0 text-primary">
                    <i class="fas fa-list me-2"></i> Safeguard Compliance List
                </h5>
                <a href="{{ route('admin.safeguard-compliances.create') }}" class="btn btn-sm btn-primary">
                    <i class="fas fa-plus-circle me-1"></i> Create Safeguard Compliance
                </a>
            </div>
            <div class="card-body">
                <x-admin.data-table id="safeguard-compliances-table"
                    :headers="['ID', 'Name', 'Created At', 'Actions']"
                    :excel="true"
                    :print="true"
                    title="Safeguard Compliances Export"
                    searchPlaceholder="Search compliances..."
                    resourceName="safeguard-compliances"
                    :pageLength="10">
                    @foreach ($compliances as $compliance)
                        <tr>
                            <td>{{ $compliance->id }}</td>
                            <td>{{ $compliance->name }}</td>
                            <td>{{ $compliance->created_at->format('M d, Y h:i A') }}</td>
                            <td>
                                <div class="d-flex justify-content-end gap-2">
                                    <a href="{{ route('admin.safeguard-compliances.edit', $compliance) }}"
                                        class="btn btn-sm btn-outline-primary">
                                        <i class="fas fa-edit me-1"></i> Edit
                                    </a>
                                    <form action="{{ route('admin.safeguard-compliances.destroy', $compliance) }}" method="POST"
                                        onsubmit="return confirm('Delete this safeguard compliance?')">
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
