<x-app-layout>
<div class="container py-5">
    <h2 class="mb-4 text-primary fw-bold">Physical Progress Update</h2>

    <div id="flash-messages"></div>

    {{-- Project Info --}}
    <div class="card shadow mb-4">
        <div class="card-header bg-primary text-white">
            <h5 class="mb-0">Selected Project</h5>
        </div>
        <div class="card-body">
            <div class="row g-3">
                <div class="col-md-5">
                    <label class="form-label">Project Name:</label>
                    <input type="text" class="form-control" value="{{ optional($subProject)->name ?? 'No project selected' }}" readonly>
                </div>
                <div class="col-md-3">
                    <label class="form-label">Select Date:</label>
                    <input type="date" class="form-control" id="progress_date" value="{{ $selectedDate }}">
                </div>
            </div>
        </div>
    </div>

    @if ($subProject && $boqEntries->isNotEmpty())
    <form id="physical-progress-form">
        @csrf
        <input type="hidden" name="sub_package_project_id" value="{{ $subProject->id }}">
        <input type="hidden" name="progress_date" value="{{ $selectedDate }}">

        <div class="table-responsive">
            <table class="table table-bordered align-middle text-center">
                <thead class="table-dark">
                    <tr>
                        <th rowspan="2">S.No.</th>
                        <th rowspan="2">Item</th>
                        <th rowspan="2">Unit</th>
                        <th rowspan="2">BOQ Qty</th>
                        <th rowspan="2">Rate (₹)</th>
                        <th rowspan="2">BOQ Amount (₹)</th>
                        <th colspan="2">Since Previous</th>
                        <th colspan="2">Current Day ({{ \Carbon\Carbon::parse($selectedDate)->format('d M Y') }})</th>
                        <th colspan="2">Up to Date</th>
                    </tr>
                    <tr class="table-secondary">
                        <th>Qty</th>
                        <th>Amount (₹)</th>
                        <th>Qty</th>
                        <th>Amount (₹)</th>
                        <th>Qty</th>
                        <th>Amount (₹)</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($boqEntries as $parentSlNo => $entries)
                        @php $parentEntry = $entries->firstWhere('sl_no', $parentSlNo); @endphp
                        @if ($parentEntry->qty > 0)
                        <tr class="table-primary fw-bold" data-entry-id="{{ $parentEntry->id }}">
                            <td>{{ $parentSlNo }}</td>
                            <td class="text-start">{{ $parentEntry->item_description }}</td>
                            <td>{{ $parentEntry->unit }}</td>
                            <td class="text-end">{{ $parentEntry->qty }}</td>
                            <td class="text-end">{{ formatPrice($parentEntry->rate) }}</td>
                            <td class="text-end">{{ formatPrice($parentEntry->amount) }}</td>

                            <td>{{ $physicalProgress[$parentEntry->id]->since_previous->qty }}</td>
                            <td>{{ $physicalProgress[$parentEntry->id]->since_previous->amount }}</td>

                            <td>
                                <input type="hidden" name="entries[{{ $parentEntry->id }}][boq_entry_id]" value="{{ $parentEntry->id }}">
                                <input type="number" step="0.01" min="0" name="entries[{{ $parentEntry->id }}][current_day][qty]" class="form-control qty-input" data-rate="{{ $parentEntry->rate }}" data-entry-id="{{ $parentEntry->id }}" value="{{ $physicalProgress[$parentEntry->id]->current_day->qty }}">
                            </td>
                            <td>
                                <input type="hidden" name="entries[{{ $parentEntry->id }}][current_day][amount]" class="form-control amount-input" value="{{ $physicalProgress[$parentEntry->id]->current_day->amount }}" readonly>
                            </td>

                            <td>{{ $physicalProgress[$parentEntry->id]->up_to_date->qty }}</td>
                            <td>{{ $physicalProgress[$parentEntry->id]->up_to_date->amount }}</td>
                        </tr>

                        {{-- Child Entries --}}
                        @foreach ($entries as $entry)
                            @if ($entry->sl_no != $parentSlNo && $entry->qty > 0)
                            <tr data-entry-id="{{ $entry->id }}">
                                <td class="ps-4">{{ $entry->sl_no }}</td>
                                <td class="text-start">{{ $entry->item_description }}</td>
                                <td>{{ $entry->unit }}</td>
                                <td class="text-end">{{ $entry->qty }}</td>
                                <td class="text-end">{{ formatPrice($entry->rate) }}</td>
                                <td class="text-end">{{ formatPrice($entry->amount) }}</td>

                                <td>{{ $physicalProgress[$entry->id]->since_previous->qty }}</td>
                                <td>{{ $physicalProgress[$entry->id]->since_previous->amount }}</td>

                                <td>
                                    <input type="hidden" name="entries[{{ $entry->id }}][boq_entry_id]" value="{{ $entry->id }}">
                                    <input type="number" step="0.01" min="0" name="entries[{{ $entry->id }}][current_day][qty]" class="form-control qty-input" data-rate="{{ $entry->rate }}" data-entry-id="{{ $entry->id }}" value="{{ $physicalProgress[$entry->id]->current_day->qty }}">
                                </td>
                                <td>
                                    <input type="hidden" name="entries[{{ $entry->id }}][current_day][amount]" class="form-control amount-input" value="{{ $physicalProgress[$entry->id]->current_day->amount }}" readonly>
                                </td>

                                <td>{{ $physicalProgress[$entry->id]->up_to_date->qty }}</td>
                                <td>{{ $physicalProgress[$entry->id]->up_to_date->amount }}</td>
                            </tr>
                            @endif
                        @endforeach
                        @endif
                    @endforeach
                </tbody>
            </table>
        </div>

        <div class="mt-3 text-end">
            <button type="submit" class="btn btn-primary">
                <i class="fas fa-save me-1"></i> Save Progress
            </button>
        </div>
    </form>
    @endif
</div>

{{-- Styles --}}
<style>
    .table-primary td { background-color: #e0f7fa; }
    .table-secondary th { background-color: #b2ebf2; }
    .ps-4 { padding-left: 2rem !important; }
</style>

{{-- Scripts --}}
<script>
    // Redirect on date change
    document.getElementById('progress_date').addEventListener('change', function() {
        const selectedDate = this.value;
        const projectId = "{{ $subProject->id }}";
        window.location.href = "{{ route('admin.physical_boq_progress.index') }}?sub_package_project_id=" + projectId + "&date=" + selectedDate;
    });

    // Auto-calculate Amount
    document.addEventListener('input', function(e) {
        if (e.target.classList.contains('qty-input')) {
            const rate = parseFloat(e.target.dataset.rate) || 0;
            const amountInput = e.target.closest('tr').querySelector('.amount-input');
            if (amountInput) {
                amountInput.value = (parseFloat(e.target.value) * rate).toFixed(2);
            }
            e.target.closest('tr').dataset.changed = 'true';
        }
    });

    // AJAX submit for changed rows
    document.getElementById('physical-progress-form').addEventListener('submit', function(e) {
        e.preventDefault();
        const form = this;
        const changedRows = Array.from(form.querySelectorAll('tr[data-changed="true"]'));
        if (!changedRows.length) { alert('No changes to save.'); return; }

        const formData = new FormData();
        formData.append('sub_package_project_id', form.querySelector('[name="sub_package_project_id"]').value);
        formData.append('progress_date', form.querySelector('[name="progress_date"]').value);

        changedRows.forEach(row => {
            const entryId = row.querySelector('.qty-input').dataset.entryId;
            const qty = row.querySelector('.qty-input').value;
            const amount = row.querySelector('.amount-input').value;
            const projectId = row.querySelector('.qty-input').dataset.sub_package_project_id;

            formData.append(`entries[${entryId}][boq_entry_id]`, entryId);
            formData.append(`entries[${entryId}][current_day][qty]`, qty);
            formData.append(`entries[${entryId}][current_day][amount]`, amount);
            formData.append(`entries[${entryId}][sub_package_project_id]`, projectId);
        });

        fetch("{{ route('admin.boqentry.save-physical-progress') }}", {
            method: "POST",
            headers: {'X-CSRF-TOKEN': '{{ csrf_token() }}'},
            body: formData
        })
        .then(res => res.json())
        .then(data => {
            const flash = document.getElementById('flash-messages');
            flash.innerHTML = `<div class="alert alert-${data.status === 'success' ? 'success' : 'danger'} alert-dismissible fade show">${data.message}<button type="button" class="btn-close" data-bs-dismiss="alert"></button></div>`;
            changedRows.forEach(row => row.dataset.changed = '');
        })
        .catch(console.error);
    });
</script>
</x-app-layout>
