<x-app-layout>
    <div class="container-fluid">

        <!-- Breadcrumb -->
        <x-admin.breadcrumb-header 
            icon="fas fa-file-contract text-primary" 
            title="Procurement Details" 
            :breadcrumbs="[
                ['route' => 'dashboard', 'label' => '<i class=\'fas fa-home\'></i>'], 
                ['route' => 'admin.package-projects.index', 'label' => 'Package Projects'], 
                ['label' => 'Procurement Details']
            ]"  
        /> 

        <!-- Card -->
        <div class="card shadow-sm">
            <div class="card-header bg-white d-flex justify-content-between align-items-center">
                <h5 class="mb-0 h4">
                    <i class="fas fa-list me-2"></i> Procurement Status by Package Project
                </h5>
                <a href="{{ route('admin.package-projects.index') }}" class="btn btn-sm btn-secondary">
                    <i class="fas fa-arrow-left me-1"></i> Back to Packages
                </a>
            </div>

            <div class="card-body">
                <x-admin.data-table 
                    id="procurement-table" 
                    :headers="['#', 'Package Project', 'Method', 'Type', 'Status', 'Actions']"
                    :excel="false" 
                    :print="false" 
                    title="Procurement Details Export"
                    searchPlaceholder="Search procurement details..."
                    resourceName="procurement-details"
                    :pageLength="10"
                >
                    @forelse($packageProjects as $index => $project)
                        <tr>
                            <!-- Index -->
                            <td>{{ $packageProjects instanceof \Illuminate\Pagination\LengthAwarePaginator ? $packageProjects->firstItem() + $index : $index + 1 }}</td>

                            <!-- Package Project -->
                            <td>
                                <a href="{{ route('admin.package-projects.show', $project) }}" class="text-primary fw-semibold">
                                    {{ $project->package_name }} ({{ $project->package_number }})
                                </a>
                            </td>

                            <!-- Method -->
                            <td>{{ $project->procurementDetail?->method_of_procurement ?? '-' }}</td>

                            <!-- Type -->
                           <td>{{ $project->procurementDetail?->typeOfProcurement?->name ?? '-' }}</td>
                            <!-- Status -->
                            <td>
                                @if($project->procurementDetail)
                                    <span class="badge bg-success">Created</span>
                                @else
                                    <span class="badge bg-secondary">Not Created</span>
                                @endif
                            </td>

                            <!-- Actions -->
                            <td>
                                <div class="d-flex gap-2 justify-content-end">
                                    @if($project->procurementDetail)
                                        <a href="{{ route('admin.procurement-details.show', $project->procurementDetail) }}" 
                                           class="btn btn-sm btn-outline-info" title="View">
                                            <i class="fas fa-eye"></i>
                                        </a>
                                        <a href="{{ route('admin.procurement-details.edit', $project->procurementDetail) }}" 
                                           class="btn btn-sm btn-outline-primary" title="Edit">
                                            <i class="fas fa-edit"></i>
                                        </a>
                                    @else
                                        <a href="{{ route('admin.procurement-details.create', $project) }}" 
                                           class="btn btn-sm btn-outline-success" title="Create">
                                            <i class="fas fa-plus"></i> Create
                                        </a>
                                    @endif
                                </div>
                            </td>
                        </tr>
                    @empty
                        <tr>
                            <td colspan="6" class="text-center py-4 text-muted">
                                <i class="fas fa-info-circle me-2"></i> No package projects found
                            </td>
                        </tr>
                    @endforelse
                </x-admin.data-table>

                <!-- Pagination Info -->
                @if($packageProjects instanceof \Illuminate\Pagination\LengthAwarePaginator)
                    <div class="d-flex justify-content-between align-items-center mt-3">
                        <div class="text-muted small">
                            Showing {{ $packageProjects->firstItem() }} to {{ $packageProjects->lastItem() }} of {{ $packageProjects->total() }} entries
                        </div>
                        <div>
                            {{ $packageProjects->links() }}
                        </div>
                    </div>
                @endif
            </div>
        </div>
    </div>
</x-app-layout>
