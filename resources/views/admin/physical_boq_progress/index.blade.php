<x-app-layout>
    <div class="container py-5">
        {{-- Page Header --}}
        <h2 class="mb-4 text-primary fw-bold">Physical Progress Update</h2>

        {{-- Flash Messages --}}
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
                        <input type="text" class="form-control"
                            value="{{ optional($subProject)->name ?? 'No project selected' }}" readonly>
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
                    <table class="table table-bordered table-hover align-middle text-center">
                        <thead class="table-dark">
                            <tr>
                                <th rowspan="2">S.No.</th>
                                <th rowspan="2">Item</th>
                                <th rowspan="2">Unit</th>
                                <th rowspan="2">BOQ Qty</th>
                                <th rowspan="2">Rate (₹)</th>
                                <th rowspan="2">BOQ Amount (₹)</th>
                                <th colspan="2">Since Previous</th>
                                <th colspan="2">Current Day
                                    ({{ \Carbon\Carbon::parse($selectedDate)->format('d M Y') }})</th>
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
                                    <tr class="table-primary fw-bold">
                                        <td>{{ $parentSlNo }}</td>
                                        <td class="text-start">{{ $parentEntry->item_description }}</td>
                                        <td>{{ $parentEntry->unit }}</td>
                                        <td class="text-end">{{ $parentEntry->qty }}</td>
                                        <td class="text-end">{{ formatPrice($parentEntry->rate) }}</td>
                                        <td class="text-end">{{ formatPrice($parentEntry->amount) }}</td>

                                        @foreach (['since_previous', 'current_day', 'up_to_date'] as $key)
                                            <td>
                                                <input type="number" step="0.01" min="0"
                                                    name="entries[{{ $parentEntry->id }}][{{ $key }}][qty]"
                                                    class="form-control qty-input" data-rate="{{ $parentEntry->rate }}"
                                                    value="{{ $physicalProgress[$parentEntry->id]->$key->qty ?? 0 }}"
                                                    {{ $key != 'current_day' ? 'readonly' : '' }}>
                                            </td>
                                            <td>
                                                <input type="number" step="0.01" min="0"
                                                    name="entries[{{ $parentEntry->id }}][{{ $key }}][amount]"
                                                    class="form-control amount-input"
                                                    value="{{ $physicalProgress[$parentEntry->id]->$key->amount ?? 0 }}"
                                                    readonly>
                                            </td>
                                        @endforeach
                                    </tr>

                                    {{-- Child Entries --}}
                                    @foreach ($entries as $entry)
                                        @if ($entry->sl_no != $parentSlNo && $entry->qty > 0)
                                            <tr>
                                                <td class="ps-4">{{ $entry->sl_no }}</td>
                                                <td class="text-start">{{ $entry->item_description }}</td>
                                                <td>{{ $entry->unit }}</td>
                                                <td class="text-end">{{ $entry->qty }}</td>
                                                <td class="text-end">{{ formatPrice($entry->rate) }}</td>
                                                <td class="text-end">{{ formatPrice($entry->amount) }}</td>

                                                @foreach (['since_previous', 'current_day', 'up_to_date'] as $key)
                                                    <td>
                                                        <input type="number" step="0.01" min="0"
                                                            name="entries[{{ $entry->id }}][{{ $key }}][qty]"
                                                            class="form-control qty-input"
                                                            data-rate="{{ $entry->rate }}"
                                                            value="{{ $physicalProgress[$entry->id]->$key->qty ?? 0 }}"
                                                            {{ $key != 'current_day' ? 'readonly' : '' }}>
                                                    </td>
                                                    <td>
                                                        <input type="number" step="0.01" min="0"
                                                            name="entries[{{ $entry->id }}][{{ $key }}][amount]"
                                                            class="form-control amount-input"
                                                            value="{{ $physicalProgress[$entry->id]->$key->amount ?? 0 }}"
                                                            readonly>
                                                    </td>
                                                @endforeach
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

    {{-- Scripts --}}
    <script>
        // Redirect on date change
        document.getElementById('progress_date').addEventListener('change', function() {
            const selectedDate = this.value;
            const projectId = "{{ $subProject->id }}";
            window.location.href = "{{ route('admin.boqentry.physical-progress') }}?sub_package_project_id=" +
                projectId + "&date=" + selectedDate;
        });

        // Auto-calculate Amount
        document.addEventListener('input', function(e) {
            if (e.target.classList.contains('qty-input')) {
                const rate = parseFloat(e.target.dataset.rate) || 0;
                const amountField = e.target.closest('td').nextElementSibling.querySelector('.amount-input');
                if (amountField) {
                    amountField.value = (parseFloat(e.target.value) * rate).toFixed(2);
                }
            }
        });

        // AJAX Form Submit
        document.getElementById('physical-progress-form').addEventListener('submit', function(e) {
            e.preventDefault();
            const formData = new FormData(this);

            fetch("{{ route('admin.boqentry.save-physical-progress') }}", {
                    method: "POST",
                    body: formData,
                    headers: {
                        'X-CSRF-TOKEN': '{{ csrf_token() }}'
                    }
                })
                .then(res => res.json())
                .then(data => {
                    const flash = document.getElementById('flash-messages');
                    if (data.status === 'success') {
                        flash.innerHTML =
                            `<div class="alert alert-success alert-dismissible fade show">${data.message}<button type="button" class="btn-close" data-bs-dismiss="alert"></button></div>`;
                    } else {
                        flash.innerHTML =
                            `<div class="alert alert-danger alert-dismissible fade show">${data.message}<button type="button" class="btn-close" data-bs-dismiss="alert"></button></div>`;
                    }
                })
                .catch(err => console.error(err));
        });
    </script>

    {{-- Styles --}}
    <style>
        .table-primary td {
            background-color: #e0f7fa;
        }

        .table-secondary th {
            background-color: #b2ebf2;
        }

        .table-hover tbody tr:hover {
            background-color: rgba(0, 0, 0, 0.05);
        }

        .ps-4 {
            padding-left: 2rem !important;
        }

        .card-header {
            border-radius: 0.375rem 0.375rem 0 0 !important;
        }
    </style>
</x-app-layout>
