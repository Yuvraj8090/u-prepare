
<x-app-layout>
    <div class="container-fluid">
        <!-- Breadcrumb -->
        <div class="row mb-4">
            <div class="col-md-12 d-flex justify-content-between align-items-center">
                <h4 class="mb-0">
                    <i class="fas fa-file-contract text-primary me-2"></i> Contracts Management
                </h4>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb mb-0">
                        <li class="breadcrumb-item"><a href="{{ route('dashboard') }}"><i class="fas fa-home"></i></a></li>
                        <li class="breadcrumb-item">Admin</li>
                        <li class="breadcrumb-item active" aria-current="page">Contracts</li>
                    </ol>
                </nav>
            </div>
        </div>

        <!-- Flash Messages -->
        @if (session('success'))
            <div class="row mb-3">
                <div class="col-md-12">
                    <x-alert type="success" :message="session('success')" dismissible />
                </div>
            </div>
        @endif

        @if (session('error'))
            <div class="row mb-3">
                <div class="col-md-12">
                    <x-alert type="danger" :message="session('error')" dismissible />
                </div>
            </div>
        @endif

        <!-- Data Table -->
        <div class="card shadow-sm">
            <div class="card-header bg-white d-flex justify-content-between align-items-center">
                <h5 class="mb-0 text-primary">
                    <i class="fas fa-list me-2"></i> Contracts Overview
                </h5>
                <a href="{{ route('admin.contracts.create') }}" class="btn btn-primary btn-sm">
                    <i class="fas fa-plus-circle me-1"></i> Add New Contract
                </a>
            </div>

            <div class="card-body">
                <x-admin.data-table id="contracts-table" 
                                  :headers="['Contract #', 'Project', 'Contractor', 'Value', 'Signing Date', 'Actions']" 
                                  :excel="true" 
                                  :print="true"
                                  title="Contracts Export"
                                  searchPlaceholder="Search contracts..."
                                  resourceName="contracts"
                                  :pageLength="10">

                    @foreach ($contracts as $contract)
                        <tr>
                            <td>{{ $contract->contract_number }}</td>
                            <td>
                                {{ $contract->project->package_name ?? 'N/A' }}
                                @if($contract->project)
                                    <br>
                                    <small class="text-muted">{{ $contract->project->package_number ?? '' }}</small>
                                @endif
                            </td>
                            <td>{{ $contract->contractor->company_name ?? 'N/A' }}</td>
                            <td>₹{{ number_format($contract->contract_value, 2) }}</td>
                            <td>
                                @if($contract->signing_date)
                                    <span class="badge bg-light text-dark">
                                        {{ $contract->signing_date->format('d M Y') }}
                                    </span>
                                @else
                                    N/A
                                @endif
                            </td>
                            <td>
                                <div class="d-flex justify-content-end gap-2">
                                    <a href="{{ route('admin.contracts.show', $contract) }}" 
                                       class="btn btn-sm btn-outline-info">
                                        <i class="fas fa-eye me-1"></i> View
                                    </a>
                                    <a href="{{ route('admin.contracts.edit', $contract) }}" 
                                       class="btn btn-sm btn-outline-primary">
                                        <i class="fas fa-edit me-1"></i> Edit
                                    </a>
                                    <form action="{{ route('admin.contracts.destroy', $contract) }}" method="POST">
                                        @csrf
                                        @method('DELETE')
                                        <button type="submit" class="btn btn-sm btn-outline-danger"
                                            onclick="return confirm('Are you sure you want to delete this contract?')">
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
