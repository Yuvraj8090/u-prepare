<x-app-layout>
    <div class="container-fluid">
        <!-- Breadcrumb -->
        <div class="row mb-4">
            <div class="col-md-12 d-flex justify-content-between align-items-center">
                <h4 class="mb-0">
                    <i class="fas fa-layer-group text-primary me-2"></i> Procurement Work Programs
                </h4>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb mb-0">
                        <li class="breadcrumb-item"><a href="{{ route('dashboard') }}"><i class="fas fa-home"></i></a></li>
                        <li class="breadcrumb-item">Admin</li>
                        <li class="breadcrumb-item active" aria-current="page">Work Programs</li>
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
                    <i class="fas fa-table me-2"></i> Package Projects Overview
                </h5>
            </div>

            <div class="card-body">
                <x-admin.data-table 
                    id="work-programs-table"
                    :headers="['#', 'Package Name', 'Procurement Status', 'Work Program Status', 'Actions']"
                    :excel="true" 
                    :print="true"
                    title="Procurement Work Programs Export"
                    searchPlaceholder="Search packages..."
                    resourceName="procurement-work-programs"
                    :pageLength="10">

                    @foreach ($packageProjects as $index => $project)
                        <tr>
                            <td>{{ $index + 1 }}</td>

                            <td>
                                {{ $project->package_name }}
                                <br>
                                <small class="text-muted">{{ $project->package_number }}</small>
                            </td>

                            <td>
                                @if($project->procurementDetail)
                                    <span class="badge bg-success">Done</span>
                                @else
                                    <span class="badge bg-warning text-dark">Not Done</span>
                                @endif
                            </td>

                            <td>
                                @if($project->has_work_program)
                                    <span class="badge bg-info">Added</span>
                                @else
                                    <span class="badge bg-secondary">Not Added</span>
                                @endif
                            </td>

                            <td>
                                <div class="d-flex justify-content-end gap-2">
                                    <a href="{{ route('admin.procurement-work-programs.create', ['package_project_id' => $project->id]) }}"
                                        class="btn btn-sm {{ $project->has_work_program ? 'btn-outline-primary' : 'btn-outline-success' }}">
                                        <i class="fas fa-{{ $project->has_work_program ? 'edit' : 'plus' }} me-1"></i>
                                        {{ $project->has_work_program ? 'Edit' : 'Add' }}
                                    </a>
                                </div>
                            </td>
                        </tr>
                    @endforeach

                </x-admin.data-table>
            </div>
        </div>
    </div>
</x-app-layout>
