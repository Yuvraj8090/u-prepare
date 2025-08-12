<x-app-layout>
    <div class="container py-5">
        <h2 class="mb-4 text-primary fw-bold">EPC Entry Data Management</h2>

        {{-- Success --}}
        @if (session('success'))
            <div class="alert alert-success alert-dismissible fade show">
                {{ session('success') }}
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        @endif

        {{-- Error --}}
        @if (session('error'))
            <div class="alert alert-danger alert-dismissible fade show">
                {{ session('error') }}
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        @endif

        {{-- Validation Errors --}}
        @if ($errors->any())
            <div class="alert alert-danger alert-dismissible fade show">
                <ul class="mb-0">
                    @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        @endif

        {{-- Project Filter --}}
        

        {{-- Selected Project Info --}}
        @if ($subProject)
            <div class="card shadow mb-4">
                <div class="card-header bg-primary text-white">Selected Project</div>
                <div class="card-body">
                    <input type="text" class="form-control" value="{{ $subProject->name }}" readonly>
                </div>
            </div>
        @endif
{{-- Alerts for Missing Data --}}

{{-- Validation Warnings --}}
@if (!empty($warnings))
    <div class="alert alert-danger">
        <ul class="mb-0">
            @foreach ($warnings as $warning)
                <li>{{ $warning }}</li>
            @endforeach
        </ul>
    </div>
@endif

        {{-- Action Buttons --}}
        @if ($selectedProjectId)
            <div class="d-flex justify-content-between align-items-center mb-3">
                <a href="{{ route('admin.epcentry_data.create', ['sub_package_project_id' => $selectedProjectId]) }}"
                    class="btn btn-success">
                    <i class="fas fa-plus-circle me-1"></i> Add New EPC Entry
                </a>
                <button type="button" class="btn btn-danger" id="bulkDeleteBtn" disabled>
                    <i class="fas fa-trash-alt me-1"></i> Delete Selected
                </button>
            </div>
        @endif

        {{-- EPC Entries Table --}}
        @if ($epcEntries->isNotEmpty())
            <form id="bulkDeleteForm">
                @csrf
                <div class="table-responsive">
                    <table class="table table-bordered table-striped ">
                        <thead class="table-dark">
                            <tr>
                                <th style="width: 3%;"><input type="checkbox" id="selectAllHeader"></th>
                                <th>Sl No.</th>
                                <th>Item Description</th>
                                <th>Percent</th>
                                <th>Amount</th>
                                <th style="width: 15%;">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                           @foreach ($epcEntries as $groupKey => $groupItems)
    @foreach ($groupItems as $entry)
        <tr>
            <td><input type="checkbox" class="entryCheckbox" name="ids[]" value="{{ $entry->id }}"></td>
            <td>{{ $entry->sl_no }}</td>
            <td>{{ $entry->item_description }}</td>
            <td>{{ $entry->percent !== null ? $entry->percent . '%' : '' }}</td>
            <td>{{ $entry->amount }}</td>
            <td>
                <div class="d-flex gap-2">
                    <a href="{{ route('admin.epcentry_data.edit', $entry->id) }}"
                        class="btn btn-sm btn-warning">
                        <i class="fas fa-edit"></i> Edit
                    </a>
                    <form method="POST" action="{{ route('admin.epcentry_data.destroy', $entry->id) }}"
                        class="d-inline-block"
                        onsubmit="return confirm('Delete this entry?');">
                        @csrf
                        @method('DELETE')
                        <button class="btn btn-sm btn-danger" type="submit">
                            <i class="fas fa-trash-alt"></i> Delete
                        </button>
                    </form>
                </div>
            </td>
        </tr>
    @endforeach
@endforeach

                        </tbody>
                    </table>
                </div>
            </form>
        @else
            <div class="alert alert-info">No EPC entries found for this project.</div>
        @endif
    </div>

    {{-- Bulk Delete Script (same as BOQ but EPC route) --}}
    <script>
        $(document).ready(function() {
            const bulkDeleteBtn = $('#bulkDeleteBtn');
            const checkboxes = $('.entryCheckbox');
            const selectAllHeader = $('#selectAllHeader');

            function updateBulkDeleteButton() {
                bulkDeleteBtn.prop('disabled', $('.entryCheckbox:checked').length === 0);
            }

            function setAllCheckboxes(checked) {
                checkboxes.prop('checked', checked);
                bulkDeleteBtn.prop('disabled', !checked);
                selectAllHeader.prop('checked', checked);
            }

            selectAllHeader.on('change', function() {
                setAllCheckboxes(this.checked);
            });

            checkboxes.on('change', function() {
                const allChecked = checkboxes.length === $('.entryCheckbox:checked').length;
                selectAllHeader.prop('checked', allChecked);
                updateBulkDeleteButton();
            });

            bulkDeleteBtn.on('click', function() {
                const selectedIds = $('.entryCheckbox:checked').map(function() {
                    return $(this).val();
                }).get();

                if (selectedIds.length === 0) {
                    alert('Please select entries to delete.');
                    return;
                }

                if (!confirm('Are you sure you want to delete the selected entries?')) {
                    return;
                }

                $.ajax({
                    url: "{{ route('admin.epcentry_data.bulkDestroy') }}",
                    type: 'POST',
                    data: {
                        ids: selectedIds,
                        _method: 'DELETE',
                        _token: "{{ csrf_token() }}",
                    },
                    success: function(response) {
                        alert(response.message || 'Selected entries deleted successfully.');
                        location.reload();
                    },
                    error: function(xhr) {
                        alert('Error deleting entries: ' + (xhr.responseJSON?.message || xhr.statusText));
                    }
                });
            });

            updateBulkDeleteButton();
        });
    </script>

    <style>
        .table-hover tbody tr:hover {
            background-color: rgba(0, 0, 0, 0.05);
        }
        .table-primary td {
            background-color: #e7f5ff;
        }
        .table-striped tbody tr:nth-of-type(odd) {
            background-color: rgba(0, 0, 0, 0.02);
        }
        .table-striped tbody tr.table-primary:nth-of-type(odd) {
            background-color: #e7f5ff;
        }
        .card-header {
            border-radius: 0.375rem 0.375rem 0 0 !important;
        }
    </style>
</x-app-layout>
