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
                <x-admin.data-table id="sub-project-overview-table" :headers="array_merge(['#', 'Sub-Project'], $safeguardCompliances->pluck('name')->toArray())" :excel="true" :print="true"
                    title="Sub-Project Safeguard Overview" searchPlaceholder="Search sub-projects..."
                    resourceName="sub-projects" :pageLength="10">
                    @foreach ($subProjects as $index => $project)
                        <tr>
                            <td>{{ $index + 1 }}</td>
                            <td>{{ $project->name }}</td>

                            @foreach ($safeguardCompliances as $compliance)
                                <td>
                                    @php
                                        $done = $statusMap[$project->id][$compliance->id] ?? false;
                                        $phase = $contractionPhases->first()?->id ?? 1;
                                    @endphp
                                    <a href="{{ route('admin.social_safeguard_entries.index', [
                                        'sub_package_project_id' => $project->id,
                                        'safeguard_compliance_id' => $compliance->id,
                                        'contraction_phase_id' => $phase,
                                        'date_of_entry' => $date,
                                    ]) }}"
                                        class="btn btn-sm {{ $done ? 'btn-success' : 'btn-warning' }}">
                                        {{ $done ? '✔ Done' : 'Update' }}
                                    </a>
                                </td>
                            @endforeach
                        </tr>
                    @endforeach
                </x-admin.data-table>
            </div>
        </div>
    </div>
</x-app-layout>
