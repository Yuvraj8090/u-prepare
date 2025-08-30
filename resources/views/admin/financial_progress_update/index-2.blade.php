<x-app-layout>
    <div class="container py-5">

        <!-- Breadcrumb -->
        <x-admin.breadcrumb-header icon="fas fa-file-invoice-dollar text-primary" :title="'Update Project Progress'" :breadcrumbs="[
            ['route' => 'dashboard', 'label' => '<i class=\'fas fa-home\'></i> Dashboard'],
            ['label' => 'Update Progress'],
        ]" />

        <!-- Flash Messages -->
        @if (session('success'))
            <x-alert type="success" :message="session('success')" dismissible />
        @endif
        @if (session('error'))
            <x-alert type="danger" :message="session('error')" dismissible />
        @endif

        <!-- Project Progress Table -->
        <div class="card shadow-lg border-0 mb-4">
            <div class="card-header bg-gradient d-flex justify-content-between align-items-center"
                style="background: linear-gradient(90deg, #0d6efd, #0dcaf0);">
                <h5 class="mb-0 text-white fw-bold">
                    <i class="fas fa-chart-line me-2"></i> Project Progress Updates
                </h5>
            </div>

            <div class="card-body">
                <x-admin.data-table :headers="[
                    'Sub Project',
                    'Contract Value',
                    'Financial Progress',
                    'Physical Progress',
                    'Tests / Reports',
                    'Actions',
                ]" id="progressTable" :excel="true" :print="true"
                    :pageLength="10">
                    @foreach ($subProjects as $progress)
                        <tr class="align-middle">

                            <!-- Sub Project -->
                            <td>
                                <span class="fw-bold text-dark">
                                    <i class="fas fa-folder-open text-primary me-1"></i>
                                    {{ $progress->name }}
                                </span>
                            </td>

                            <!-- Contract Value -->
                            <td>{{ formatPriceToCR($progress->contract_value) }}</td>

                            <!-- Financial Progress -->
                            <td>
                                <div title="{{ $progress->financial_progress_percentage }}% Financial"
                                    class="progress shadow-sm"
                                    style="height: 22px; border-radius: 12px;cursor: pointer;">
                                    <div class="progress-bar bg-success progress-bar-striped progress-bar-animated fw-bold"
                                        role="progressbar"
                                        style="width: {{ $progress->financial_progress_percentage }}%;"
                                        aria-valuenow="{{ $progress->financial_progress_percentage }}" aria-valuemin="0"
                                        aria-valuemax="100">
                                        {{ round($progress->financial_progress_percentage, 2) }}%
                                    </div>
                                </div>
                            </td>

                            <!-- Physical Progress -->
                            <td>
                                @if ($progress->physical_progress_percentage > 0)
                                    <div title="{{ $progress->physical_progress_percentage }}% Physical"
                                        class="progress shadow-sm"
                                        style="height: 22px; border-radius: 12px;cursor: pointer;">
                                        <div class="progress-bar bg-primary progress-bar-striped progress-bar-animated fw-bold"
                                            role="progressbar"
                                            style="width: {{ $progress->physical_progress_percentage }}%;"
                                            aria-valuenow="{{ $progress->physical_progress_percentage }}"
                                            aria-valuemin="0" aria-valuemax="100">
                                            {{ round($progress->physical_progress_percentage, 2) }}%
                                        </div>
                                    </div>
                                @else
                                    <span class="text-muted fst-italic">No Data</span>
                                @endif
                            </td>

                            <!-- Tests / Reports -->
                            <!-- Tests / Reports -->
                            <td>
                                @php
                                    $totalTests = $progress->tests()->count();
                                    $completedTests = $progress->tests()->has('report')->count();
                                    $pendingTests = $totalTests - $completedTests;
                                @endphp

                                @if ($totalTests > 0)
                                    @if ($completedTests > 0)
                                        <span class="badge bg-success">{{ $completedTests }} Completed</span>
                                    @endif
                                    @if ($pendingTests > 0)
                                        <span class="badge bg-warning text-dark ms-1">{{ $pendingTests }}
                                            Pending</span>
                                    @endif
                                @else
                                    <span class="badge bg-secondary">No Test</span>
                                @endif
                            </td>


                            <!-- Actions -->
                            <!-- Actions -->
                            <td>
                                <div class="d-flex flex-wrap gap-2">

                                    {{-- Financial Update --}}
                                    @if (canRoute('admin.financial-progress-updates.index'))
                                        <a href="{{ route('admin.financial-progress-updates.index', ['sub_package_project_id' => $progress->id]) }}"
                                            class="btn btn-sm btn-success shadow-sm d-flex align-items-center px-3 py-2"
                                            data-bs-toggle="tooltip" title="Update Financial Progress">
                                            <i class="fas fa-money-bill-wave me-1"></i> Financial
                                        </a>
                                    @endif

                                    {{-- Physical Update --}}
                                    @if ($progress->type_of_procurement_name === 'EPC' && canRoute('admin.physical_epc_progress.index'))
                                        <a href="{{ route('admin.physical_epc_progress.index', ['sub_package_project_id' => $progress->id]) }}"
                                            class="btn btn-sm btn-primary shadow-sm d-flex align-items-center px-3 py-2"
                                            data-bs-toggle="tooltip" title="Update EPC Progress">
                                            <i class="fas fa-hard-hat me-1"></i> EPC
                                        </a>
                                    @elseif(canRoute('admin.physical_boq_progress.index'))
                                        <a href="{{ route('admin.physical_boq_progress.index', ['sub_package_project_id' => $progress->id]) }}"
                                            class="btn btn-sm btn-info shadow-sm d-flex align-items-center px-3 py-2"
                                            data-bs-toggle="tooltip" title="Update BOQ Progress">
                                            <i class="fas fa-list-alt me-1"></i> BOQ
                                        </a>
                                    @endif

                                    {{-- Test Management --}}
                                    @if (canRoute('admin.sub_package_project_tests.index'))
                                        <a href="{{ route('admin.sub_package_project_tests.index', $progress->id) }}"
                                            class="btn btn-sm btn-warning shadow-sm d-flex align-items-center px-3 py-2"
                                            data-bs-toggle="tooltip" title="Manage Tests">
                                            <i class="fas fa-vial me-1"></i> Create Tests
                                        </a>
                                    @endif
                                   <a href="{{ route('admin.social_safeguard_entries.index', [
                                        'project_id' => $progress->id,
                                        'compliance_id' => 1,  {{-- Or dynamic --}}
                                        'phase_id' => 1         {{-- Optional --}}
                                    ]) }}"
                                       class="btn btn-sm btn-warning shadow-sm d-flex align-items-center px-3 py-2"
                                       data-bs-toggle="tooltip" title="Manage Safeguard">
                                        <i class="fas fa-vial me-1"></i> Safeguard
                                    </a>


                                    {{-- Test Reports --}}
                                    @if (canRoute('admin.sub_package_project_test_reports.index'))
                                        <a href="{{ route('admin.sub_package_project_test_reports.index', $progress->id) }}"
                                            class="btn btn-sm btn-info shadow-sm d-flex align-items-center px-3 py-2"
                                            data-bs-toggle="tooltip" title="Submit/View Test Reports">
                                            <i class="fas fa-file-alt me-1"></i>Test Reports
                                        </a>
                                    @endif

                                </div>
                            </td>


                        </tr>
                    @endforeach
                </x-admin.data-table>
            </div>
        </div>

    </div>

    <script>
        document.addEventListener("DOMContentLoaded", function() {
            var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
            tooltipTriggerList.map(function(tooltipTriggerEl) {
                return new bootstrap.Tooltip(tooltipTriggerEl)
            })
        });
    </script>

</x-app-layout>
