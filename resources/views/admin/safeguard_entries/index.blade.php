<x-app-layout>
    <div class="container-fluid">

        <!-- Header & Breadcrumb -->
        <x-admin.breadcrumb-header 
            icon="fas fa-shield-alt text-primary" 
            title="Safeguard Entries Management"
            :breadcrumbs="[
                ['route' => 'dashboard', 'label' => '<i class=\'fas fa-home\'></i>'],
                ['label' => 'Admin'],
                ['label' => 'Safeguard Entries'],
            ]" 
        />

        <!-- Alerts -->
        @foreach (['success', 'error'] as $msg)
            @if(session($msg))
                <div class="row mb-3">
                    <div class="col-12">
                        <x-alert type="{{ $msg === 'success' ? 'success' : 'danger' }}" :message="session($msg)" dismissible />
                    </div>
                </div>
            @endif
        @endforeach

        @if($subProject)
            <!-- Project Info -->
            <div class="card shadow-sm mb-4">
                <div class="card-header bg-info text-white">
                    <h5 class="mb-0"><i class="fas fa-project-diagram me-2"></i> Project: {{ $subProject->name }}</h5>
                </div>
            </div>

            <!-- Import Section -->
            <div class="card shadow-sm mb-4">
                <div class="card-header bg-success text-white">
                    <h5 class="mb-0"><i class="fas fa-file-import me-2"></i> Import Safeguard Entries</h5>
                </div>
                <div class="card-body">
                    <form method="POST" action="{{ route('admin.safeguard_entries.import') }}" enctype="multipart/form-data">
                        @csrf
                        <input type="hidden" name="sub_package_project_id" value="{{ $selectedProjectId }}">
                        <div class="row g-3">

                            <!-- Compliance -->
                            <div class="col-md-4">
                                <label for="safeguard_compliance_id" class="form-label">Compliance <span class="text-danger">*</span></label>
                                <select name="safeguard_compliance_id" id="safeguard_compliance_id" class="form-select" required>
                                    <option value="">-- Select Compliance --</option>
                                    @foreach ($safeguardCompliances as $compliance)
                                       <option value="{{ $compliance->id }}" 
    data-phases='@json($compliance->contraction_phases)'>
    {{ $compliance->name }}
</option>

                                    @endforeach
                                </select>
                            </div>

                            <!-- Phase -->
                            <div class="col-md-4">
                                <label for="contraction_phase_id" class="form-label">Construction Phase <span class="text-danger">*</span></label>
                                <select name="contraction_phase_id" id="contraction_phase_id" class="form-select" required>
                                    <option value="">-- Select Phase --</option>
                                </select>
                            </div>

                            <!-- Excel Upload -->
                            <div class="col-md-4">
                                <label for="file" class="form-label">Excel File <span class="text-danger">*</span></label>
                                <input type="file" name="file" id="file" class="form-control" accept=".xlsx,.xls,.csv" required>
                                <small class="text-muted">Upload Excel file with safeguard entry data</small>
                            </div>
                        </div>

                        <div class="mt-3 d-flex gap-2">
                            <button type="submit" class="btn btn-success"><i class="fas fa-upload me-1"></i> Upload</button>
                            <a href="/safeguard_entries_demo.xlsx" class="btn btn-success"><i class="fas fa-file-excel me-1"></i> Download Template</a>
                        </div>
                    </form>
                </div>
            </div>

            <!-- Filter Section -->
        <div class="card shadow-sm mb-4">
    <div class="card-header bg-light">
        <h6 class="mb-0"><i class="fas fa-filter me-2"></i> Filter Entries</h6>
    </div>
    <div class="card-body">
        <form method="GET" action="{{ route('admin.safeguard_entries.index') }}">
            <input type="hidden" name="sub_package_project_id" value="{{ $selectedProjectId }}">
            <div class="row g-3">

                <!-- Compliance Filter -->
                <div class="col-md-4">
                    <label for="filter_safeguard_compliance_id" class="form-label">Compliance</label>
                    <select name="safeguard_compliance_id" id="filter_safeguard_compliance_id" class="form-select">
                        <option value="">-- All Compliances --</option>
                        @foreach ($safeguardCompliances as $compliance)
                           <option value="{{ $compliance->id }}" 
    data-phases='@json($compliance->contraction_phases)'
    {{ request('safeguard_compliance_id') == $compliance->id ? 'selected' : '' }}>
    {{ $compliance->name }}
</option>

                        @endforeach
                    </select>
                </div>

                <!-- Phase Filter -->
                <div class="col-md-4">
                    <label for="filter_contraction_phase_id" class="form-label">Phase</label>
                    <select name="contraction_phase_id" id="filter_contraction_phase_id" class="form-select" {{ !request('safeguard_compliance_id') ? 'disabled' : '' }}>
                        <option value="">-- All Phases --</option>
                        {{-- Options will be populated dynamically --}}
                    </select>
                </div>

                <div class="col-md-4 d-flex align-items-end gap-2">
                    <button type="submit" class="btn btn-primary"><i class="fas fa-filter me-1"></i> Apply</button>
                    <a href="{{ route('admin.safeguard_entries.index', ['sub_package_project_id' => $selectedProjectId]) }}" class="btn btn-secondary"><i class="fas fa-times me-1"></i> Reset</a>
                </div>

            </div>
        </form>
    </div>
</div>

<!-- Scripts -->
<script>
document.addEventListener('DOMContentLoaded', function() {
    function setupDynamicPhaseLoader(complianceSelectId, phaseSelectId, requestPhaseId = null) {
        const complianceSelect = document.getElementById(complianceSelectId);
        const phaseSelect = document.getElementById(phaseSelectId);

        if (!complianceSelect || !phaseSelect) return;

        function populatePhases() {
            const selectedOption = complianceSelect.options[complianceSelect.selectedIndex];
            const phases = JSON.parse(selectedOption.dataset.phases || '[]');

            phaseSelect.innerHTML = '<option value="">-- Select Phase --</option>';
            if(phases.length > 0) {
                phaseSelect.disabled = false;
                phases.forEach((phase, i) => {
                    const opt = document.createElement('option');
                    opt.value = phase.id;
                    opt.textContent = phase.name;

                    // Auto-select logic
                    if(requestPhaseId && requestPhaseId == phase.id) {
                        opt.selected = true;
                    } else if(!requestPhaseId && i === 0) {
                        opt.selected = true;
                    }

                    phaseSelect.appendChild(opt);
                });
            } else {
                phaseSelect.disabled = true;
            }
        }

        complianceSelect.addEventListener('change', populatePhases);

        if(complianceSelect.value) populatePhases();
    }

    // Import form
    setupDynamicPhaseLoader('safeguard_compliance_id', 'contraction_phase_id');

    // Filter form (with request phase pre-select)
    setupDynamicPhaseLoader('filter_safeguard_compliance_id', 'filter_contraction_phase_id', "{{ request('contraction_phase_id') }}");
});
</script>



            <!-- Entries Table -->
            <div class="card shadow-sm mb-4">
                <div class="card-header bg-white d-flex justify-content-between align-items-center">
                    <h5 class="mb-0 text-primary"><i class="fas fa-list me-2"></i> Entries for {{ $subProject->name }}</h5>
                    <a href="{{ route('admin.safeguard_entries.create', ['sub_package_project_id' => $selectedProjectId]) }}" class="btn btn-success btn-sm">
                        <i class="fas fa-plus-circle me-1"></i> Add New Entry
                    </a>
                </div>
                <div class="card-body">
                    @if($entries->isNotEmpty())
                        <form id="bulkDeleteForm" method="POST" action="{{ route('admin.safeguard_entries.bulkDelete') }}">
                            @csrf
                            @method('DELETE')

                            <div class="mb-3 d-flex justify-content-between align-items-center">
                                <button type="submit" class="btn btn-danger btn-sm" id="bulkDeleteBtn" disabled>
                                    <i class="fas fa-trash-alt me-1"></i> Delete Selected
                                </button>
                                <div>
                                    <label><input type="checkbox" id="selectAllCheckbox"> Select All</label>
                                </div>
                            </div>

                            <x-admin.data-table 
                                id="entries-table"
                                :headers="['Select','Sl. No.','Description','Compliance & Phase','Validity','Actions']"
                                :excel="true" :print="true" :pageLength="10">

                                @foreach ($entries as $group)
                                    @foreach ($group as $entry)
                                        @php $isParent = !Str::contains($entry->sl_no, '.'); @endphp
                                        <tr class="{{ $isParent ? 'table-primary fw-bold' : '' }}">
                                            <td><input type="checkbox" class="entryCheckbox" name="ids[]" value="{{ $entry->id }}"></td>
                                            <td class="{{ !$isParent ? 'ps-4' : '' }}">{{ $entry->sl_no }}</td>
                                            <td>{{ $entry->item_description }}</td>
                                            <td>{{ optional($entry->safeguardCompliance)->name }} @if($entry->contractionPhase) ({{ $entry->contractionPhase->name }}) @endif</td>
                                            <td>
                                                <span class="badge {{ $entry->is_validity ? 'bg-success' : 'bg-danger' }}">
                                                    {{ $entry->is_validity ? 'Required' : 'Not Required' }}
                                                </span>
                                            </td>
                                            <td class="d-flex gap-2">
                                                <a href="{{ route('admin.safeguard_entries.edit', $entry->id) }}" class="btn btn-sm btn-outline-warning"><i class="fas fa-edit me-1"></i> Edit</a>
                                                <form method="POST" action="{{ route('admin.safeguard_entries.destroy', $entry->id) }}">
                                                    @csrf @method('DELETE')
                                                    <button class="btn btn-sm btn-outline-danger" onclick="return confirm('Delete this entry?')">
                                                        <i class="fas fa-trash-alt me-1"></i> Delete
                                                    </button>
                                                </form>
                                            </td>
                                        </tr>
                                    @endforeach
                                @endforeach
                            </x-admin.data-table>
                        </form>
                    @else
                        <p class="text-muted">No entries found for this project.</p>
                    @endif
                </div>
            </div>
        @endif
    </div>

    <!-- Scripts -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Bulk Delete
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

            // Dynamic Phase Population
            const complianceSelect = document.getElementById('safeguard_compliance_id');
            const phaseSelect = document.getElementById('contraction_phase_id');

            function populatePhases() {
                const selectedOption = complianceSelect.options[complianceSelect.selectedIndex];
                const phases = JSON.parse(selectedOption.dataset.phases || '[]');
                phaseSelect.innerHTML = '<option value="">-- Select Phase --</option>';
                if(phases.length > 0) phases.forEach((phase, i) => {
                    const opt = document.createElement('option');
                    opt.value = phase.id;
                    opt.textContent = phase.name;
                    if(i === 0) opt.selected = true;
                    phaseSelect.appendChild(opt);
                });
            }

            complianceSelect.addEventListener('change', populatePhases);
            if(complianceSelect.value) populatePhases();
        });
    </script>
</x-app-layout>
