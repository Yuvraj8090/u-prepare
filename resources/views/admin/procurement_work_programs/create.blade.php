<x-app-layout>
    <div class="container-fluid">
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

        @if(session('success'))
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                {{ session('success') }}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        @endif
        @if(session('error'))
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                {{ session('error') }}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        @endif
        @if($errors->any())
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <ul class="mb-0">@foreach($errors->all() as $error)<li>{{ $error }}</li>@endforeach</ul>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        @endif

        <form action="{{ route('admin.procurement-work-programs.store') }}" method="POST" enctype="multipart/form-data">
            @csrf
            <div class="mb-3 row">
                <label for="sharedStartDate" class="col-sm-2 col-form-label fw-semibold">Shared Start Date</label>
                <div class="col-sm-4">
                    <input type="date" name="start_date[]" id="sharedStartDate" class="form-control" required value="{{ old('start_date.0') }}">
                </div>
            </div>

            <input type="hidden" name="package_project_id[]" value="{{ old('package_project_id.0', $selectedPackageProjectId) }}">
            <input type="file" name="procurement_bid_document[]" accept=".pdf,.doc,.docx,.jpg,.png">
            <input type="file" name="pre_bid_minutes_document[]" accept=".pdf,.doc,.docx,.jpg,.png">

            @foreach ($procurementDetails as $detail)
                <input type="hidden" name="procurement_details_id[]" value="{{ old('procurement_details_id.0', $detail->id) }}">
            @endforeach

            <div class="card shadow-sm">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <strong>Work Program Details</strong>
                    <button type="button" class="btn btn-success btn-sm" id="addRow"><i class="fas fa-plus-circle me-1"></i> Add Row</button>
                </div>

                <div class="card-body table-responsive">
                    <table class="table table-bordered align-middle mb-0">
                        <thead class="table-light text-center">
                            <tr>
                                <th>Name of Work Program</th>
                                <th>Weightage (%)</th>
                                <th>Days</th>
                                <th style="display:none">Start Date</th>
                                <th>Planned Date</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody id="workProgramTable">
                            @php
                                $defaultPrograms = [
                                    'Preparation and Approval of Bid Document and Estimate',
                                    'Publication of Bids',
                                    'Opening of Technical Bids',
                                    'Technical Evaluation',
                                    'Notification of Award',
                                    'Contract',
                                ];
                                $oldPrograms = old('name_work_program', $defaultPrograms);
                            @endphp

                            @foreach ($oldPrograms as $i => $program)
                                <tr>
                                    <td><input type="text" name="name_work_program[]" class="form-control" value="{{ $program }}" required></td>
                                    <td><input type="number" name="weightage[]" step="0.01" class="form-control" value="{{ old('weightage.' . $i) }}"></td>
                                    <td><input type="number" name="days[]" class="form-control days-input" value="{{ old('days.' . $i) }}"></td>
                                    <td style="display:none"><input type="date" name="start_date[]" class="form-control" value="{{ old('start_date.' . $i) }}"></td>
                                    <td><input type="date" name="planned_date[]" class="form-control planned-date-input" value="{{ old('planned_date.' . $i) }}"></td>
                                    <td class="text-center"><button type="button" class="btn btn-danger btn-sm removeRow"><i class="fas fa-trash"></i></button></td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>

                <div class="card-footer text-end">
                    <button type="submit" class="btn btn-primary"><i class="fas fa-save me-1"></i> Save All</button>
                </div>
            </div>
        </form>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const addRowBtn = document.getElementById('addRow');
            const tableBody = document.getElementById('workProgramTable');
            const sharedStartDateInput = document.getElementById('sharedStartDate');

            function recalculateAllDates() {
                let currentStartDate = sharedStartDateInput.value;
                Array.from(tableBody.querySelectorAll('tr')).forEach(row => {
                    const startDateInput = row.querySelector('input[name="start_date[]"]');
                    const daysInput = row.querySelector('.days-input');
                    const plannedDateInput = row.querySelector('.planned-date-input');
                    const days = parseInt(daysInput.value);

                    startDateInput.value = currentStartDate || '';

                    if (!isNaN(days) && currentStartDate) {
                        const base = new Date(currentStartDate);
                        base.setDate(base.getDate() + days);
                        const plannedDate = base.toISOString().slice(0,10);
                        plannedDateInput.value = plannedDate;
                        currentStartDate = plannedDate;
                    } else {
                        plannedDateInput.value = '';
                        currentStartDate = '';
                    }
                });
            }

            addRowBtn.addEventListener('click', () => {
                const firstRow = tableBody.querySelector('tr');
                const newRow = firstRow.cloneNode(true);
                newRow.querySelectorAll('input').forEach(input => input.value = '');
                tableBody.appendChild(newRow);
                recalculateAllDates();
            });

            tableBody.addEventListener('click', e => {
                if (e.target.closest('.removeRow')) {
                    const rows = tableBody.querySelectorAll('tr');
                    if (rows.length > 1) {
                        e.target.closest('tr').remove();
                        recalculateAllDates();
                    } else alert('At least one row is required.');
                }
            });

            tableBody.addEventListener('input', e => {
                if (e.target.classList.contains('days-input')) recalculateAllDates();
            });

            sharedStartDateInput.addEventListener('input', recalculateAllDates);
            recalculateAllDates();
        });
    </script>
</x-app-layout>
