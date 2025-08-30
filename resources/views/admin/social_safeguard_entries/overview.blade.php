<x-app-layout>
    <div class="container-fluid">

        <!-- Breadcrumb -->
        <x-admin.breadcrumb-header icon="fas fa-project-diagram text-primary" title="Package Safeguard Overview"
            :breadcrumbs="[
                ['route' => 'dashboard', 'label' => '<i class=\'fas fa-home\'></i>'],
                ['label' => 'Admin'],
                ['label' => 'SafeGuard Entry'],
            ]" />

        <!-- Data Table -->
        <div class="card shadow-sm border-0">
            <div class="card-body">
                <x-admin.data-table id="sub-project-overview-table" 
                    :headers="array_merge(['#', 'Sub-Project'], $safeguardCompliances->pluck('name')->toArray())" 
                    :excel="true" 
                    :print="true"
                    title="Sub-Project Safeguard Overview" 
                    searchPlaceholder="Search sub-projects..."
                    resourceName="sub-projects" 
                    :pageLength="10">
                    
                    @foreach ($subProjects as $index => $project)
                        <tr>
                            <td>{{ $index + 1 }}</td>
                            <td>{{ $project->name }}</td>

                            @foreach ($safeguardCompliances as $compliance)
                                @php
                                    $done = $statusMap[$project->id][$compliance->id] ?? false;

                                    // Check if current user can access this compliance
                                   $canAccess = auth()->user()->role_id == 1 || auth()->user()->role_id == $compliance->role_id;

                                    // First phase (or default to 1)
                                    $phase = $compliance->contractionPhases->first()?->id ?? 1;
                                @endphp
                                <td>
                                    @if ($canAccess)
                                        <a href="{{ route('admin.social_safeguard_entries.index', [
                                            'project_id' => $project->id,
                                            'compliance_id' => $compliance->id,
                                            'phase_id' => $phase,
                                            'date_of_entry' => $date,
                                        ]) }}"
                                            class="btn btn-sm {{ $done ? 'btn-success' : 'btn-warning' }}">
                                            {{ $done ? '✔ Done' : 'Update' }}
                                        </a>
                                    @else
                                        <button class="btn btn-sm btn-secondary" disabled title="Not authorized">
                                            {{ $done ? '✔ Done' : 'Update' }}
                                        </button>
                                    @endif
                                </td>
                            @endforeach
                        </tr>
                    @endforeach
                </x-admin.data-table>
            </div>
        </div>
    </div>
</x-app-layout>
