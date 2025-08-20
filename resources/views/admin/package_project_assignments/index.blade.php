<x-app-layout>
    <div class="container-fluid">
        <x-admin.breadcrumb-header 
            icon="fas fa-tasks text-primary"
            title="Project Assignments"
            :breadcrumbs="[['route' => 'dashboard', 'label' => '<i class=\'fas fa-home\'></i> Dashboard'], ['label' => 'Assignments']]"
        />

        <div class="card shadow-sm">
            <div class="card-header d-flex justify-content-between">
                <h5 class="mb-0">All Assignments</h5>
                <a href="{{ route('admin.package-project-assignments.create') }}" class="btn btn-primary btn-sm">
                    <i class="fas fa-plus-circle"></i> Assign Project
                </a>
            </div>
            <div class="card-body">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Project</th>
                            <th>Assigned To</th>
                            <th>Assigned By</th>
                            <th>Created At</th>
                            <th width="120">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($assignments as $assignment)
                            <tr>
                                <td>{{ $loop->iteration }}</td>
                                <td>{{ $assignment->project->package_name ?? 'N/A' }}</td>
                                <td>{{ $assignment->assignee->name ?? 'N/A' }}</td>
                                <td>{{ $assignment->assigner->name ?? 'N/A' }}</td>
                                <td>{{ $assignment->created_at->format('d M Y') }}</td>
                                <td>
                                    <form action="{{ route('admin.package-project-assignments.destroy', $assignment) }}" method="POST">
                                        @csrf
                                        @method('DELETE')
                                        <button class="btn btn-sm btn-danger" onclick="return confirm('Are you sure?')">
                                            <i class="fas fa-trash"></i> Remove
                                        </button>
                                    </form>
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>

                {{ $assignments->links() }}
            </div>
        </div>
    </div>
</x-app-layout>
