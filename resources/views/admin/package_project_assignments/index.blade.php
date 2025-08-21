<x-app-layout>
    <div class="container-fluid">
        <x-admin.breadcrumb-header icon="fas fa-tasks text-primary" title="Project Assignments" :breadcrumbs="[
            ['route' => 'dashboard', 'label' => '<i class=\'fas fa-home\'></i>'],
            ['label' => 'Admin'],
            ['label' => 'Assignments'],
        ]" />
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
        <div class="card shadow-sm">
            <div class="card-header bg-white d-flex justify-content-between align-items-center">
                <h5 class="mb-0 text-primary">
                    <i class="fas fa-list me-2"></i> Assignments List
                </h5>
                <a href="{{ route('admin.package-project-assignments.create') }}" class="btn btn-sm btn-primary">
                    <i class="fas fa-plus-circle me-1"></i> Assign Project
                </a>
            </div>
            <div class="card-body">
                <x-admin.data-table id="assignments-table" :headers="['#', 'Project', 'Assigned To', 'Assigned By', 'Actions']" :excel="true" :print="true"
                    title="Assignments Export" searchPlaceholder="Search assignments..." resourceName="assignments"
                    :pageLength="10">
                    @foreach ($assignments as $assignment)
                        <tr>
                            <td>{{ $loop->iteration }}</td>
                            <td style="max-width: 350px;">
                                <a href="{{ route('admin.package-projects.show', $assignment->project->id) }}"
                                    class="badge bg-light text-dark text-truncate d-inline-block text-decoration-none"
                                    style="max-width: 100%; cursor: pointer;"
                                    title="{{ $assignment->project->package_name ?? 'N/A' }}">
                                    {{ $assignment->project->package_name ?? 'N/A' }}
                                </a>
                            </td>
                            <td>
                                <span class="badge bg-light text-primary">
                                    {{ $assignment->assignee->name ?? 'N/A' }}
                                </span>
                            </td>
                            <td>
                                <span class="badge bg-light text-info">
                                    {{ $assignment->assigner->name ?? 'N/A' }}
                                </span>
                            </td>
                            <td>
                                <div class="d-flex justify-content-end gap-2">
                                    <form action="{{ route('admin.package-project-assignments.destroy', $assignment) }}"
                                        method="POST"
                                        onsubmit="return confirm('Are you sure you want to remove this assignment?')">
                                        @csrf
                                        @method('DELETE')
                                        <button type="submit" class="btn btn-sm btn-outline-danger">
                                            <i class="fas fa-trash-alt me-1"></i> Remove
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
