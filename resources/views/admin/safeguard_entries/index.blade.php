<x-app-layout>
    <div class="container-fluid">

        <!-- Header & Breadcrumb -->
        <x-admin.breadcrumb-header icon="fas fa-shield-alt text-primary" title="Safeguard Entries Management"
            :breadcrumbs="[
                ['route' => 'dashboard', 'label' => '<i class=\'fas fa-home\'></i>'],
                ['label' => 'Admin'],
                ['label' => 'Safeguard Entries'],
            ]" />

        <!-- Alerts -->
        @foreach (['success', 'error'] as $msg)
            @if (session($msg))
                <div class="row mb-3">
                    <div class="col-md-12">
                        <x-alert type="{{ $msg === 'success' ? 'success' : 'danger' }}" :message="session($msg)" dismissible />
                    </div>
                </div>
            @endif
        @endforeach

        @if ($subProject)

            <!-- Project Info -->
            <div class="card shadow-sm mb-4">
                <div class="card-header bg-info text-white">
                    <h5 class="mb-0">Project: {{ $subProject->name }}</h5>
                </div>
            </div>

            <!-- Import Section -->
           <div class="d-flex justify-content-between align-items-center">
                

                <div class="accordion shadow-sm mb-4" id="safeguardAccordion">
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingImport">
                            <button class="accordion-button collapsed btn  bg-success text-white fw-semibold "
                                type="button" data-bs-toggle="collapse" data-bs-target="#collapseImport"
                                aria-expanded="false" aria-controls="collapseImport">
                                <i class="fas fa-file-import me-2"></i> Import Safeguard Entries
                            </button>
                        </h2>
                        <div id="collapseImport" class="accordion-collapse collapse" aria-labelledby="headingImport"
                            data-bs-parent="#safeguardAccordion">
                            <div class="accordion-body">
                                <form method="POST" action="{{ route('admin.safeguard_entries.import') }}"
                                    enctype="multipart/form-data">
                                    @csrf
                                    <input type="hidden" name="sub_package_project_id"
                                        value="{{ $selectedProjectId }}">

                                    <div class="row g-3">
                                        <div class="col-md-4">
                                            <x-bootstrap.dropdown name="safeguard_compliance_id"
                                                label="Safeguard Compliance" :options="$safeguardCompliances->pluck('name', 'id')" required />
                                        </div>

                                        <div class="col-md-4">
                                            <x-bootstrap.dropdown name="contraction_phase_id" label="Construction Phase"
                                                :options="$contractionPhases->pluck('name', 'id')" required />
                                        </div>

                                        <div class="col-md-4">
                                            <x-input type="file" name="file" label="Excel File"
                                                accept=".xlsx,.xls,.csv" required />
                                            <div class="form-text">Upload Excel file with Safeguard Entry data</div>
                                        </div>
                                    </div>

                                    <div class="mt-3">
                                        <button type="submit" class="btn btn-success">
                                            <i class="fas fa-upload me-1"></i> Upload
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <a href="/safeguard_entries_demo.xlsx" class="btn btn-success" download>
                        <i class="fas fa-file-excel me-1"></i> Download Upload Format
                    </a>
                </div>
            </div>


            <!-- Filter Form -->
            <div class="card shadow-sm mb-4">
                <div class="card-header bg-light">
                    <h6 class="mb-0"><i class="fas fa-filter me-2"></i> Filter Entries</h6>
                </div>
                <div class="card-body">
                    <form method="GET" action="{{ route('admin.safeguard_entries.index') }}">
                        <input type="hidden" name="sub_package_project_id" value="{{ $selectedProjectId }}">

                        <div class="row g-3">
                            <div class="col-md-4">
                                <x-bootstrap.dropdown name="safeguard_compliance_id" label="Safeguard Compliance"
                                    :items="$safeguardCompliances
                                        ->map(fn($p) => ['value' => $p->id, 'label' => $p->name])
                                        ->toArray()" :selected="request('safeguard_compliance_id')" placeholder="-- All Compliances --" />
                            </div>

                            <div class="col-md-4">
                                <x-bootstrap.dropdown id="phaseDropdown" name="contraction_phase_id"
                                    label="Construction Phase" :items="$contractionPhases
                                        ->map(fn($p) => ['value' => $p->id, 'label' => $p->name])
                                        ->toArray()" :selected="request('contraction_phase_id')"
                                    placeholder="-- Select Phase --" required />

                            </div>

                            <div class="col-md-4 d-flex align-items-end">
                                <button type="submit" class="btn btn-primary me-2">
                                    <i class="fas fa-filter me-1"></i> Apply
                                </button>
                                <a href="{{ route('admin.safeguard_entries.index', ['sub_package_project_id' => $selectedProjectId]) }}"
                                    class="btn btn-secondary">
                                    <i class="fas fa-times me-1"></i> Reset
                                </a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

            <!-- Entries Table -->
            <div class="card shadow-sm">
                <div class="card-header bg-white d-flex justify-content-between align-items-center">
                    <h5 class="mb-0 text-primary"><i class="fas fa-list me-2"></i> Entries for: {{ $subProject->name }}
                    </h5>
                    <a href="{{ route('admin.safeguard_entries.create', ['sub_package_project_id' => $selectedProjectId]) }}"
                        class="btn btn-success btn-sm">
                        <i class="fas fa-plus-circle me-1"></i> Add New Entry
                    </a>
                </div>
                <div class="card-body">
                    @if (!empty($entries) && count($entries))
                        <form id="bulkDeleteForm" method="POST" action="">
                            @csrf
                            @method('DELETE')

                            <div class="mb-3 d-flex justify-content-between align-items-center">
                                <button type="submit" class="btn btn-danger btn-sm" id="bulkDeleteBtn" disabled>
                                    <i class="fas fa-trash-alt me-1"></i> Delete Selected
                                </button>
                                <div>
                                    <label class="mb-0"><input type="checkbox" id="selectAllCheckbox"> Select
                                        All</label>
                                </div>
                            </div>

                            <x-admin.data-table id="entries-table" :headers="[
                                'Select',
                                'Sl. No.',
                                'Description',
                                'Compliance & Phase',
                                'Validity',
                                'Actions',
                            ]" :excel="true"
                                :print="true" :pageLength="10">

                                @foreach ($entries as $slNo => $group)
                                    @foreach ($group as $entry)
                                        @php
                                            $isParent = !Str::contains($entry->sl_no, '.');
                                        @endphp

                                        <tr class="{{ $isParent ? 'table-primary fw-bold' : '' }}">
                                            <td><input type="checkbox" class="entryCheckbox" name="ids[]"
                                                    value="{{ $entry->id }}"></td>
                                            <td class="{{ !$isParent ? 'ps-4' : '' }}">{{ $entry->sl_no }}</td>
                                            <td>{{ $entry->item_description }}</td>
                                            <td>
                                                {{ optional($entry->safeguardCompliance)->name }}
                                                @if ($entry->contractionPhase)
                                                    ({{ $entry->contractionPhase->name }})
                                                @endif
                                            </td>
                                            <td>
                                                @if ($entry->is_validity)
                                                    <span class="badge bg-success">Required</span>
                                                @else
                                                    <span class="badge bg-danger">Not Required</span>
                                                @endif
                                            </td>
                                            <td>
                                                <div class="d-flex">
                                                    <a href="{{ route('admin.safeguard_entries.edit', $entry->id) }}"
                                                        class="btn btn-sm btn-outline-warning me-2">
                                                        <i class="fas fa-edit me-1"></i> Edit
                                                    </a>
                                                    <form method="POST"
                                                        action="{{ route('admin.safeguard_entries.destroy', $entry->id) }}">
                                                        @csrf @method('DELETE')
                                                        <button class="btn btn-sm btn-outline-danger"
                                                            onclick="return confirm('Delete this entry?')">
                                                            <i class="fas fa-trash-alt me-1"></i> Delete
                                                        </button>
                                                    </form>
                                                </div>
                                            </td>
                                        </tr>
                                    @endforeach
                                @endforeach
                            </x-admin.data-table>
                        </form>
                    @else
                        <p class="text-muted mb-0">No entries found for this project.</p>
                    @endif
                </div>
            </div>
        @endif
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const checkboxes = document.querySelectorAll('.entryCheckbox');
            const bulkDeleteBtn = document.getElementById('bulkDeleteBtn');
            const selectAll = document.getElementById('selectAllCheckbox');

            function toggleBulkButton() {
                bulkDeleteBtn.disabled = !Array.from(checkboxes).some(cb => cb.checked);
            }

            selectAll.addEventListener('change', () => {
                checkboxes.forEach(cb => cb.checked = selectAll.checked);
                toggleBulkButton();
            });

            checkboxes.forEach(cb => cb.addEventListener('change', toggleBulkButton));
        });
    </script>
</x-app-layout>
