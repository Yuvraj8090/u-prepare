<x-app-layout>
    <div class="container-fluid">
        <x-admin.breadcrumb-header icon="fas fa-plus-circle text-primary" title="Assign Project" :breadcrumbs="[
            ['route' => 'dashboard', 'label' => '<i class=\'fas fa-home\'></i> Dashboard'],
            ['route' => 'admin.package-project-assignments.index', 'label' => 'Assignments'],
            ['label' => 'Assign Project'],
        ]" />
        <div class="card shadow-sm">
            <div class="card-header">
                <h5 class="mb-0">Assign Project</h5>
            </div>
            <form method="POST" action="{{ route('admin.package-project-assignments.store') }}">
                @csrf
                <div class="card-body">
                    <div class="mb-3">
                        <label class="form-label">Select Project</label>
                        <select name="package_project_id" class="form-control" required>
                            <option value="">-- Choose Project --</option>
                            @foreach ($projects as $project)
                                <option value="{{ $project->id }}">{{ $project->package_name }}</option>
                            @endforeach
                        </select>
                        @error('package_project_id')
                            <small class="text-danger">{{ $message }}</small>
                        @enderror
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Assign to Department</label>
                        <select name="sub_department_id" id="sub_department_id" class="form-control">
                            <option value="">-- None --</option>
                            @foreach ($subDepartments as $subDept)
                                <option value="{{ $subDept->id }}">{{ $subDept->name }}</option>
                            @endforeach
                        </select>
                        @error('sub_department_id')
                            <small class="text-danger">{{ $message }}</small>
                        @enderror
                        <small class="text-muted">If selected, project will be assigned to all users in this
                            sub-department.</small>
                    </div>
                    <div class="text-center my-2">
                        <span class="badge bg-secondary">OR</span>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Assign to User</label>
                        <select name="assigned_to" id="assigned_to" class="form-control">
                            <option value="">-- None --</option>
                            @foreach ($users as $user)
                                <option value="{{ $user->id }}">{{ $user->name }}</option>
                            @endforeach
                        </select>
                        @error('assigned_to')
                            <small class="text-danger">{{ $message }}</small>
                        @enderror
                        <small class="text-muted">If selected, project will be assigned only to this user.</small>
                    </div>
                </div>
                <div class="card-footer">
                    <button class="btn btn-primary">
                        <i class="fas fa-save"></i> Assign
                    </button>
                </div>
            </form>
        </div>
    </div>
</x-app-layout>
