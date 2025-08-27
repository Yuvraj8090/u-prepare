<x-app-layout>
    <div class="container-fluid py-4">


        <!-- Breadcrumb -->
        <x-admin.breadcrumb-header icon="fas fa-file-contract text-primary"
            title="Package Contract Details | {{ $contract->contract_number }}" :breadcrumbs="[
                ['route' => 'dashboard', 'label' => '<i class=\'fas fa-home\'></i>'],
                ['label' => 'Admin'],
                ['label' => 'Contracts', 'route' => 'admin.contracts.index'],
                ['label' => 'Show'],
            ]" />


        <x-admin.package-card :packageProject="$contract->project" />


        <div class="row mt-4 mb-4">

            <div class="col-md-4">
                <x-admin.approval-details :packageProject="$contract->project" />


                <x-admin.contract-details :contract="$contract" />

                {{-- Contractor Info --}}
                <x-admin.contractor-info :contractor="$contract->contractor" />


            </div>

            <div class="col-md-8">

                @if ($contract->project && $contract->project->procurementDetail)
                    <x-admin.procurement-details :procurementDetail="$contract->project->procurementDetail" />
                @endif
                <x-admin.work-program :workPrograms="$contract->project->workPrograms" />
                {{-- Yuvraj Add Procurement Work Program   --}}




                <div class="card shadow-sm mb-4">
                    <div class="card-header bg-white d-flex justify-content-between align-items-center border-0">
                        <h6 class="text-secondary mb-3 h2">
                            <i class="fas fa-layer-group me-2"></i>
                            Sub-Projects ({{ $contract->count_sub_project }})
                        </h6>
                    </div>

                    <div class="card-body">
                        <div class="row">
                            @if ($contract->subProjects->isEmpty())
                                <p class="text-muted fst-italic">No sub-projects found.</p>
                            @else
                                <x-admin.data-table id="sub-projects-table" :headers="['#', 'Name', 'Contract Value (₹)', 'Actions']" :excel="true"
                                    :print="true" :pageLength="10" :resourceName="'sub-projects'">

                                    @foreach ($subProjectsData as $i => $sp)
                                        <tr>
                                            <td>{{ $i + 1 }}</td>
                                            <td>{{ $sp['name'] }}</td>
                                            <td class="text-end">₹{{ $sp['contractValue'] }}</td>
                                            <td>
                                                <div class="d-flex flex-wrap gap-2">
                                                    @foreach ($sp['actions'] as $action)
                                                        @if (canRoute($action['route_name']))
                                                            <a href="{{ route($action['route_name'], $action['params'] ?? []) }}"
                                                                class="btn btn-sm {{ $action['class'] }} d-flex align-items-center gap-1">
                                                                <i class="{{ $action['icon'] }}"></i>
                                                                <span>{{ $action['label'] }}</span>
                                                            </a>
                                                        @endif
                                                    @endforeach
                                                </div>
                                            </td>

                                        </tr>
                                    @endforeach

                                </x-admin.data-table>
                            @endif
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>
