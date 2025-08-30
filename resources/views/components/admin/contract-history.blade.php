<div class="row">
    <div class="col-md-12">
        <div class="card shadow-sm">
            <div class="card-header bg-light fw-bold">
                Contract Amendment 
            </div>

            <div class="card-body">
                @if ($updates->isEmpty())
                    <p class="text-muted mb-0">No updates have been recorded for this contract.</p>
                @else
                    <x-admin.data-table
                        id="contract-history-table"
                        :headers="[
                            '#',
                            'Old Value',
                            'New Value',
                            'Old Initial Completion Date',
                            'New Initial Completion Date',
                            'Old Actual Completion Date',
                            'New Actual Completion Date',
                            'Changed At',
                            'Update Document',   {{-- ✅ new column --}}
                        ]"
                        :excel="true"
                        :print="true"
                        title="Contract Update History Export"
                        searchPlaceholder="Search history..."
                        resourceName="contract-updates"
                        :pageLength="10"
                    >
                        @foreach ($updates as $index => $update)
                            <tr>
                                <td>{{ $index + 1 }}</td>
                                <td>₹{{ $update->old_contract_value ? number_format($update->old_contract_value, 2) : '—' }}</td>
                                <td>₹{{ $update->new_contract_value ? number_format($update->new_contract_value, 2) : '—' }}</td>
                                <td>{{ $update->old_initial_completion_date?->format('d M Y') ?? '—' }}</td>
                                <td>{{ $update->new_initial_completion_date?->format('d M Y') ?? '—' }}</td>
                                <td>{{ $update->old_actual_completion_date?->format('d M Y') ?? '—' }}</td>
                                <td>{{ $update->new_actual_completion_date?->format('d M Y') ?? '—' }}</td>
                                <td>{{ $update->changed_at?->format('d M Y H:i') }}</td>
                                
                                {{-- ✅ Show update document --}}
                                <td>
                                    @if ($update->update_document)
                                        <a href="{{ asset('storage/' . $update->update_document) }}" 
                                           target="_blank" 
                                           class="btn btn-sm btn-outline-primary">
                                            View
                                        </a>
                                    @else
                                        <span class="text-muted">—</span>
                                    @endif
                                </td>
                            </tr>
                        @endforeach
                    </x-admin.data-table>
                @endif
            </div>
        </div>
    </div>
</div>
