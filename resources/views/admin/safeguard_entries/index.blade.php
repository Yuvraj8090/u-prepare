<x-app-layout>
    <div class="container-fluid">
        <!-- Breadcrumb & Header -->
        <div class="row mb-4">
            <div class="col-md-12">
                <div class="d-flex justify-content-between align-items-center">
                    <h4 class="mb-0 text-primary">
                        <i class="fas fa-shield-alt me-2"></i> Safeguard Entries Management
                    </h4>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb mb-0">
                            <li class="breadcrumb-item"><a href="{{ route('dashboard') }}"><i class="fas fa-home"></i></a></li>
                            <li class="breadcrumb-item">Admin</li>
                            <li class="breadcrumb-item active">Safeguard Entries</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>

        <!-- Alerts -->
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

        @if ($subProject)
            <!-- Project Details -->
            <div class="card shadow-sm mb-4">
                <div class="card-header bg-info text-white">
                    <h5 class="mb-0">Project: {{ $subProject->name }}</h5>
                </div>
            </div>

            <!-- Import Excel -->
            <div class="card shadow-sm mb-5">
                <div class="card-header bg-success text-white">
                    <h5 class="mb-0"><i class="fas fa-file-import me-2"></i> Import Safeguard Entries</h5>
                </div>
                <div class="card-body">
                    <form method="POST" action="{{ route('admin.safeguard_entries.import') }}" enctype="multipart/form-data">
                        @csrf
                        <input type="hidden" name="sub_package_project_id" value="{{ $selectedProjectId }}">

                        <div class="row g-3">
                            <div class="col-md-4">
                                <label for="safeguard_compliance_id" class="form-label">Safeguard Compliance</label>
                                <select name="safeguard_compliance_id" id="safeguard_compliance_id" class="form-select" required>
                                    <option value="">-- Select Compliance --</option>
                                    @foreach ($safeguardCompliances as $compliance)
                                        <option value="{{ $compliance->id }}">{{ $compliance->name }}</option>
                                    @endforeach
                                </select>
                            </div>

                            <div class="col-md-4">
                                <label for="contraction_phase_id" class="form-label">Construction Phase</label>
                                <select name="contraction_phase_id" id="contraction_phase_id" class="form-select" required>
                                    <option value="">-- Select Phase --</option>
                                    @foreach ($contractionPhases as $phase)
                                        <option value="{{ $phase->id }}">{{ $phase->name }}</option>
                                    @endforeach
                                </select>
                            </div>

                            <div class="col-md-4">
                                <label for="file" class="form-label">Excel File</label>
                                <input type="file" name="file" id="file" class="form-control" accept=".xlsx,.xls,.csv" required>
                                <div class="form-text">Upload Excel file with Safeguard Entry data</div>
                            </div>
                        </div>

                        <div class="mt-3">
                            <button type="submit" class="btn btn-success">
                                <i class="fas fa-upload me-1"></i> Import
                            </button>
                        </div>
                    </form>
                </div>
            </div>

            <!-- Entries Table -->
            <div class="card shadow-sm">
                <div class="card-header bg-white d-flex justify-content-between align-items-center">
                    <h5 class="mb-0 text-primary">
                        <i class="fas fa-list me-2"></i> Entries for: {{ $subProject->name }}
                    </h5>
                    <a href="{{ route('admin.safeguard_entries.create', ['sub_package_project_id' => $selectedProjectId]) }}" class="btn btn-success btn-sm">
                        <i class="fas fa-plus-circle me-1"></i> Add New Entry
                    </a>
                </div>
                <div class="card-body">
                    @if ($entries->isNotEmpty())
                        <form id="bulkDeleteForm" method="POST" action="">
                            @csrf
                            @method('DELETE')

                            <div class="mb-3 d-flex justify-content-between align-items-center">
                                <button type="submit" class="btn btn-danger btn-sm" id="bulkDeleteBtn" disabled>
                                    <i class="fas fa-trash-alt me-1"></i> Delete Selected
                                </button>
                                <div>
                                    <label class="mb-0"><input type="checkbox" id="selectAllCheckbox"> Select All</label>
                                </div>
                            </div>

                            <x-admin.data-table :headers="['Select', 'Sl. No.', 'Description', 'Compliance', 'Phase', 'Actions']" id="entries-table" :excel="true" :print="true" :pageLength="10">
                                @foreach ($entries as $parentSlNo => $group)
                                    @php $parent = $group->first(); @endphp
                                    <tr class="table-primary fw-bold">
                                        <td><input type="checkbox" class="entryCheckbox" name="ids[]" value="{{ $parent->id }}"></td>
                                        <td>{{ $parentSlNo }}</td>
                                        <td>{{ $parent->item_description }}</td>
                                        <td>{{ optional($parent->safeguardCompliance)->name }}</td>
                                        <td>{{ optional($parent->contractionPhase)->name }}</td>
                                        <td>
                                            <div class="d-flex">
                                                <a href="{{ route('admin.safeguard_entries.edit', $parent->id) }}" class="btn btn-sm btn-outline-warning me-2"><i class="fas fa-edit me-1"></i> Edit</a>
                                                <form method="POST" action="{{ route('admin.safeguard_entries.destroy', $parent->id) }}">
                                                    @csrf @method('DELETE')
                                                    <button class="btn btn-sm btn-outline-danger" onclick="return confirm('Delete this entry?')">
                                                        <i class="fas fa-trash-alt me-1"></i> Delete
                                                    </button>
                                                </form>
                                            </div>
                                        </td>
                                    </tr>
                                    @foreach ($group as $entry)
                                        @if ($entry->sl_no != $parentSlNo)
                                            <tr>
                                                <td><input type="checkbox" class="entryCheckbox" name="ids[]" value="{{ $entry->id }}"></td>
                                                <td class="ps-4">{{ $entry->sl_no }}</td>
                                                <td>{{ $entry->item_description }}</td>
                                                <td>{{ optional($entry->safeguardCompliance)->name }}</td>
                                                <td>{{ optional($entry->contractionPhase)->name }}</td>
                                                <td>
                                                    <div class="d-flex">
                                                        <a href="{{ route('admin.safeguard_entries.edit', $entry->id) }}" class="btn btn-sm btn-outline-warning me-2"><i class="fas fa-edit me-1"></i> Edit</a>
                                                        <form method="POST" action="{{ route('admin.safeguard_entries.destroy', $entry->id) }}">
                                                            @csrf @method('DELETE')
                                                            <button class="btn btn-sm btn-outline-danger" onclick="return confirm('Delete this entry?')">
                                                                <i class="fas fa-trash-alt me-1"></i> Delete
                                                            </button>
                                                        </form>
                                                    </div>
                                                </td>
                                            </tr>
                                        @endif
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

    {{-- Bulk Select JS --}}
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
