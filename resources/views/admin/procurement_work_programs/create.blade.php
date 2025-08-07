<x-app-layout>
<div class="container-fluid">

    <!-- Header & Breadcrumb -->
    <div class="row mb-4">
        <div class="col-md-12 d-flex justify-content-between align-items-center">
            <h4 class="mb-0"><i class="fas fa-project-diagram me-2 text-primary"></i>Create Procurement Work Programs</h4>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb mb-0">
                    <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
                    <li class="breadcrumb-item active">Procurement Work Programs</li>
                </ol>
            </nav>
        </div>
    </div>

    <!-- Errors -->
    @if ($errors->any())
        <div class="alert alert-danger">
            <h5><strong>There were some problems with your input:</strong></h5>
            <ul class="mb-0">
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif

    <!-- Form -->
    <form action="{{ route('admin.procurement-work-programs.store') }}" method="POST">
        @csrf

        <!-- Shared Start Date -->
        <div class="mb-3 row">
            <label for="sharedStartDate" class="col-sm-2 col-form-label fw-semibold">Shared Start Date</label>
            <div class="col-sm-4">
                <input type="date" name="start_date[]" id="sharedStartDate" class="form-control" required
                    value="{{ old('start_date.0') }}">
            </div>
        </div>

        <!-- Hidden Fields -->
        <input type="hidden" name="package_project_id[]" value="{{ old('package_project_id.0', $selectedPackageProjectId) }}">
        @foreach ($procurementDetails as $detail)
            <input type="hidden" name="procurement_details_id[]" value="{{ old('procurement_details_id.0', $detail->id) }}">
        @endforeach

        <!-- Table -->
        <div class="card shadow-sm">
            <div class="card-header d-flex justify-content-between align-items-center">
                <strong>Work Program Details</strong>
                <button type="button" class="btn btn-success btn-sm" id="addRow">
                    <i class="fas fa-plus-circle me-1"></i> Add Row
                </button>
            </div>

            <div class="card-body table-responsive">
                <table class="table table-bordered align-middle mb-0">
                    <thead class="table-light text-center">
                        <tr>
                            <th>Name of Work Program</th>
                            <th>Weightage (%)</th>
                            <th>Days</th>
                            <th>Planned Date</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody id="workProgramTable">
                        @php
                            $oldPrograms = old('name_work_program', []);
                            $oldWeightages = old('weightage', []);
                            $oldDays = old('days', []);
                            $oldPlannedDates = old('planned_date', []);
                            $rowCount = max(count($oldPrograms), 1); // At least 1 row
                        @endphp

                        @for ($i = 0; $i < $rowCount; $i++)
                            <tr>
                                <td>
                                    <input type="text" name="name_work_program[]" class="form-control"
                                        value="{{ old('name_work_program.' . $i) }}" required>
                                </td>
                                <td>
                                    <input type="number" name="weightage[]" step="0.01" class="form-control"
                                        value="{{ old('weightage.' . $i) }}">
                                </td>
                                <td>
                                    <input type="number" name="days[]" class="form-control days-input"
                                        value="{{ old('days.' . $i) }}">
                                </td>
                                <td>
                                    <input type="date" name="planned_date[]" class="form-control planned-date-input"
                                        value="{{ old('planned_date.' . $i) }}">
                                </td>
                                <td class="text-center">
                                    <button type="button" class="btn btn-danger btn-sm removeRow">
                                        <i class="fas fa-trash"></i>
                                    </button>
                                </td>
                            </tr>
                        @endfor
                    </tbody>
                </table>
            </div>

            <div class="card-footer text-end">
                <button type="submit" class="btn btn-primary">
                    <i class="fas fa-save me-1"></i> Save All
                </button>
            </div>
        </div>
    </form>
</div>

<!-- Scripts -->
<script>
document.addEventListener('DOMContentLoaded', function () {
    const addRowBtn = document.getElementById('addRow');
    const tableBody = document.getElementById('workProgramTable');
    const sharedStartDateInput = document.getElementById('sharedStartDate');

    // Add new row
    addRowBtn.addEventListener('click', () => {
        const firstRow = tableBody.querySelector('tr');
        const newRow = firstRow.cloneNode(true);

        newRow.querySelectorAll('input').forEach(input => input.value = '');
        tableBody.appendChild(newRow);
        attachRowListeners(newRow);
    });

    // Remove row
    tableBody.addEventListener('click', function (e) {
        if (e.target.closest('.removeRow')) {
            const allRows = tableBody.querySelectorAll('tr');
            if (allRows.length > 1) {
                e.target.closest('tr').remove();
            } else {
                alert('At least one row is required.');
            }
        }
    });

    // Attach input listeners
    function attachRowListeners(row) {
        const daysInput = row.querySelector('.days-input');
        const plannedDateInput = row.querySelector('.planned-date-input');

        if (daysInput && plannedDateInput) {
            daysInput.addEventListener('input', () => {
                calculatePlannedDate(daysInput, plannedDateInput);
            });
            sharedStartDateInput.addEventListener('input', () => {
                calculatePlannedDate(daysInput, plannedDateInput);
            });
        }
    }

    // Calculate planned date
    function calculatePlannedDate(daysInput, plannedDateInput) {
        const days = parseInt(daysInput.value);
        const startDate = sharedStartDateInput.value;

        if (!isNaN(days) && startDate) {
            const base = new Date(startDate);
            base.setDate(base.getDate() + days);
            plannedDateInput.value = base.toISOString().split('T')[0];
        } else {
            plannedDateInput.value = '';
        }
    }

    // Initial attachment for all loaded rows
    tableBody.querySelectorAll('tr').forEach(attachRowListeners);

    // Recalculate planned dates when shared start date changes
    sharedStartDateInput.addEventListener('input', () => {
        tableBody.querySelectorAll('tr').forEach(row => {
            const daysInput = row.querySelector('.days-input');
            const plannedDateInput = row.querySelector('.planned-date-input');
            calculatePlannedDate(daysInput, plannedDateInput);
        });
    });
});
</script>
</x-app-layout>
