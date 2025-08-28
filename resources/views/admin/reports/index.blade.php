<x-app-layout>
    <div class="container-fluid">

        <!-- Breadcrumb -->
        <x-admin.breadcrumb-header icon="fas fa-file-contract text-primary" title="Reports" :breadcrumbs="[
            ['route' => 'dashboard', 'label' => '<i class=\'fas fa-home\'></i>'],
            ['label' => 'Admin'],
            ['label' => 'Reports'],
        ]" />

        <!-- Data Table -->
        <div class="card shadow-sm">
            <div class="card-header bg-white">
                <h5 class="mb-0 text-primary">
                    <i class="fas fa-list me-2"></i> Report Overview
                </h5>
            </div>

            <div class="card-body">
                <x-admin.data-table id="package-projects-table" :headers="[
                    'Package',
                    'Package No.',
                    'Category / Sub Category',
                    'Estimated Budget (₹ incl. GST)',
                    'Sanction Budget (₹)',
                    'District / Block',
                    'Procurement',
                    'Contracts',
                    'Sub Projects',
                ]" :excel="true" :print="true"
                    resourceName="Reports" :pageLength="10">

                    @foreach ($packageProjects as $project)
                        <tr>
                            <!-- Package -->
                            <td>
                                <div class="fw-bold text-primary">{{ $project->package_name }}</div>
                                <small class="text-muted">Status: {{ $project->status }}</small>
                            </td>

                            <!-- Package No. -->
                            <td>#{{ $project->package_number }}</td>

                            <!-- Category -->
                            <td>
                                {{ $project->category->name ?? 'N/A' }}
                                @if ($project->subCategory)
                                    <br><small class="text-muted">({{ $project->subCategory->name }})</small>
                                @endif
                            </td>

                            <!-- Estimated Budget -->
                            <td class="fw-bold text-success">
                                {{ formatPriceToCR($project->estimated_budget_incl_gst) }}
                            </td>

                            <!-- Sanction Budget -->
                            <td>
                                {{ formatPriceToCR($project->dec_approved ? $project->estimated_budget_incl_gst : 0) }}
                                <br>
                                @if ($project->dec_approved)
                                    <span class="badge bg-success">Approved</span>
                                @else
                                    <span class="badge bg-warning">Pending</span>
                                @endif
                            </td>

                            <!-- District / Block -->
                            <td>
                                {{ $project->district->name ?? 'N/A' }}
                                @if ($project->block)
                                    <div class="small text-muted">Block: {{ $project->block->name }}</div>
                                @endif
                            </td>

                            <!-- Procurement -->
                            <td>
                                @if ($project->procurementDetail)
                                    <span class="badge bg-success">Completed</span>
                                    <div class="small">Method: {{ $project->procurementDetail->method_of_procurement }}
                                    </div>
                                @else
                                    <span class="badge bg-secondary">Pending</span>
                                @endif
                            </td>

                            <!-- Contracts -->
                            <td>
                                @if ($project->contracts->count() > 0)
                                    <ul class="list-group list-group-flush">
                                        @foreach ($project->contracts as $contract)
                                            <li class="list-group-item px-2 py-1">
                                                <div class="fw-bold text-primary">
                                                    #{{ $contract->contract_number }}
                                                </div>
                                                <small>Value:
                                                    ₹{{ number_format($contract->contract_value, 2) }}</small><br>
                                                <small>Financial: {{ $contract->financial_progress ?? 0 }}%</small><br>
                                                <small>Physical: {{ $contract->physical_progress ?? 0 }}%</small>
                                            </li>
                                        @endforeach
                                    </ul>
                                @else
                                    <span class="badge bg-secondary">No Contracts</span>
                                @endif
                            </td>

                            <!-- Sub Projects -->
                            <td>
                                @if ($project->subProjects->count() > 0)
                                    <ul class="list-group list-group-flush">
                                        @foreach ($project->subProjects as $sub)
                                            <li class="small px-2 py-1">
                                                {{ $sub->name ?? 'Unnamed' }} —
                                                <span class="text-muted">Fin:
                                                    {{ $sub->financial_progress ?? 0 }}%,</span>
                                                <span class="text-muted">Phy:
                                                    {{ $sub->physical_progress ?? 0 }}%</span>
                                            </li>
                                        @endforeach
                                    </ul>
                                @else
                                    <span class="badge bg-secondary">No Sub Projects</span>
                                @endif
                            </td>
                        </tr>
                    @endforeach

                </x-admin.data-table>
            </div>
        </div>
    </div>
</x-app-layout>
