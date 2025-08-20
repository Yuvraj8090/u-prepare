<x-app-layout>
    <div class="container-fluid">
        <!-- Breadcrumbs and Header -->
        <div class="row mb-4">
            <div class="col-md-12">
                <div class="d-flex justify-content-between align-items-center">
                    <h4 class="mb-0">
                        <i class="fas fa-shield-alt me-2 text-success"></i>
                        Assign Routes to Role
                    </h4>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#"><i class="fas fa-home"></i></a></li>
                            <li class="breadcrumb-item">Admin</li>
                            <li class="breadcrumb-item"><a href="{{ route('admin.role_routes.index') }}">Role Routes</a></li>
                            <li class="breadcrumb-item active">Assign</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>

        <!-- Alerts -->
        @if(session('success'))
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                <i class="fas fa-check-circle me-2"></i>{{ session('success') }}
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        @endif

        @if(session('error'))
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <i class="fas fa-exclamation-circle me-2"></i>{{ session('error') }}
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        @endif

        @if($errors->any())
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <i class="fas fa-exclamation-triangle me-2"></i><strong>Whoops!</strong> Please fix the errors below.
                <ul class="mt-2 mb-0">
                    @foreach($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        @endif

        <!-- Form Card -->
        <div class="card shadow-sm">
            <div class="card-header bg-white d-flex justify-content-between align-items-center">
                <h5 class="mb-0 text-success">
                    <i class="fas fa-plus-circle me-2"></i> Assign Role Routes
                </h5>
                <a href="{{ route('admin.role_routes.index') }}" class="btn btn-sm btn-outline-secondary">
                    <i class="fas fa-arrow-left me-1"></i> Back
                </a>
            </div>

            <div class="card-body">
                <form action="{{ route('admin.role_routes.store') }}" method="POST">
                    @csrf

                    <!-- Select Role -->
                    <div class="mb-3">
                        <label for="role_id" class="form-label fw-bold">Select Role</label>
                        <select name="role_id" id="role_id" class="form-control" required {{ isset($selectedRole) ? 'readonly disabled' : '' }}>
                            <option value="">-- Choose Role --</option>
                            @foreach($roles as $role)
                                <option value="{{ $role->id }}" 
                                    {{ (isset($selectedRole) && $selectedRole->id == $role->id) ? 'selected' : '' }}>
                                    {{ $role->name }}
                                </option>
                            @endforeach
                        </select>

                        @if(isset($selectedRole))
                            <!-- preserve role_id when disabled -->
                            <input type="hidden" name="role_id" value="{{ $selectedRole->id }}">
                        @endif
                    </div>

                    <!-- Routes Table with Checkboxes -->
                   <!-- Routes Table with Checkboxes -->
<div class="table-responsive">
    <table class="table table-bordered align-middle">
        <thead class="table-light">
            <tr>
                <th width="50">
                    <input type="checkbox" id="select-all">
                </th>
                <th>Route Name</th>
            </tr>
        </thead>
        <tbody>
            @forelse($routes as $route)
                <tr>
                    <td>
                        <input type="checkbox" 
                               name="route_names[]" 
                               value="{{ $route }}"
                               {{ in_array($route, old('route_names', $selectedRoutes ?? [])) ? 'checked' : '' }}>
                    </td>
                    <td>{{ $route }}</td>
                </tr>
            @empty
                <tr>
                    <td colspan="2" class="text-center text-muted">No routes found.</td>
                </tr>
            @endforelse
        </tbody>
    </table>
</div>


                    <div class="d-flex justify-content-end border-top pt-3">
                        <button type="submit" class="btn btn-primary">
                            <i class="fas fa-save me-1"></i> Save Assignments
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Select All Script -->
    <script>
        document.getElementById('select-all')?.addEventListener('change', function(e) {
            document.querySelectorAll('input[name="route_names[]"]').forEach(cb => cb.checked = e.target.checked);
        });
    </script>
</x-app-layout>
