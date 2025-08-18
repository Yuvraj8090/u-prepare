<x-app-layout>
    <div class="container-fluid">
        <!-- Breadcrumb -->
        <div class="row mb-4">
            <div class="col-md-12 d-flex justify-content-between align-items-center">
                <h4 class="mb-0">
                    <i class="fas fa-building text-primary me-2"></i> Departments Management
                </h4>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb mb-0">
                        <li class="breadcrumb-item"><a href="{{ route('dashboard') }}"><i class="fas fa-home"></i></a></li>
                        <li class="breadcrumb-item">Admin</li>
                        <li class="breadcrumb-item active" aria-current="page">Departments</li>
                    </ol>
                </nav>
            </div>
        </div>
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
        <!-- Departments Table -->
        <div class="card shadow-sm">
            <div class="card-header bg-white d-flex justify-content-between align-items-center">
                <h5 class="mb-0 text-primary">
                    <i class="fas fa-list me-2"></i> Department List
                </h5>
                <a href="{{ route('admin.departments.create') }}" class="btn btn-sm btn-primary">
                    <i class="fas fa-plus-circle me-1"></i> Create Department
                </a>
            </div>

            <div class="card-body">
                <x-admin.data-table id="departments-table" :headers="['ID', 'Name', 'Budget', 'Actions']" :excel="true" :print="true"
                    title="Departments Export" searchPlaceholder="Search departments..." resourceName="departments"
                    :pageLength="10">
                    @foreach ($departments as $department)
                        <tr>
                            <td>{{ $department->id }}</td>
                            <td>{{ $department->name }}</td>
<<<<<<< Updated upstream
<<<<<<< Updated upstream
                            <td> ₹ {{ formatPriceToCR($department->budget) }}</td>
=======
                            <td> ₹ {{ formatPriceToCR($department->budget) }}</td>
>>>>>>> Stashed changes
=======
                            <td> ₹ {{ formatPriceToCR($department->budget) }}</td>
>>>>>>> Stashed changes
                            <td>
                                <div class="d-flex justify-content-end gap-2">
                                    <a href="{{ route('admin.departments.edit', $department) }}"
                                        class="btn btn-sm btn-outline-primary">
                                        <i class="fas fa-edit me-1"></i> Edit
                                    </a>

                                    <form action="{{ route('admin.departments.destroy', $department) }}" method="POST"
                                        onsubmit="return confirm('Are you sure you want to delete this department?')">
                                        @csrf
                                        @method('DELETE')
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
