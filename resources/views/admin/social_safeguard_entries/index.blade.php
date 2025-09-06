<x-app-layout>
    <div class="container py-5">
        <h2 class="mb-4 text-primary fw-bold">Social Safeguard Entries</h2>

        {{-- Flash messages --}}
        @if (session()->has('message'))
            <div class="alert alert-{{ session('status') }} alert-dismissible fade show">
                {{ session('message') }}
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        @endif

        {{-- Filter Form --}}
        <div class="col-md-2">
            <label class="form-label">Safeguard Compliance</label>
            <select name="safeguard_compliance_id" class="form-select">
                <option value="{{ $compliance->id }}">{{ $compliance->name }}</option>
            </select>
        </div>
        <div class="row mb-4">
            <input type="hidden" id="project-id" value="{{ $subProject->id }}">
            <input type="hidden" id="compliance-id" value="{{ $compliance->id }}">

            <div class="col-md-2">
                <label class="form-label">Contraction Phase</label>
                <select id="phase-id" class="form-select">
                    <option value="">-- All --</option>
                    @foreach ($compliance->contractionPhases as $phase)
                        <option value="{{ $phase->id }}" {{ $phase->id == $phase_id ? 'selected' : '' }}>
                            {{ $phase->name }}
                        </option>
                    @endforeach
                </select>
            </div>

            <div class="col-md-2">
                <label class="form-label">Date of Entry</label>
                <input type="date" id="date-of-entry" class="form-control"
                    value="{{ request('date_of_entry', now()->format('Y-m-d')) }}">
            </div>

            <div class="col-md-2 d-flex align-items-end">
                <button id="filter-btn" class="btn btn-primary w-100">Filter</button>
            </div>
        </div>

        <script>
            document.getElementById('filter-btn').addEventListener('click', function() {
                const projectId = document.getElementById('project-id').value;
                const complianceId = document.getElementById('compliance-id').value;
                const phaseId = document.getElementById('phase-id').value || 0; // optional
                const dateOfEntry = document.getElementById('date-of-entry').value;

                // Use Laravel route template with placeholders
                let urlTemplate =
                    "{{ route('admin.social_safeguard_entries.index', ['project_id' => 'PROJECT_ID', 'compliance_id' => 'COMPLIANCE_ID', 'phase_id' => 'PHASE_ID']) }}";

                // Replace placeholders with actual values
                urlTemplate = urlTemplate
                    .replace('PROJECT_ID', projectId)
                    .replace('COMPLIANCE_ID', complianceId)
                    .replace('PHASE_ID', phaseId);

                // Append date_of_entry as query string
                urlTemplate += `?date_of_entry=${dateOfEntry}`;

                window.location.href = urlTemplate;
            });
        </script>

        {{-- Entries Table --}}
        @if ($entries->isNotEmpty())
            <form id="social-safeguard-form">
                <div class="table-responsive">
                    <table class="table table-bordered align-middle text-center">
                        <thead class="table-dark">
                            <tr>
                                <th>SL No</th>
                                <th>Item</th>
                                <th>Yes/No</th>
                                <th>Files</th>
                                <th>Remarks</th>
                                <th>Validity</th>
                                <th>Date of Entry</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($entries as $entry)
                                @php
                                    $allSlNos = collect($entries)->pluck('sl_no')->toArray();
                                    $isParent = collect($allSlNos)->contains(
                                        fn($sl) => Str::startsWith($sl, $entry->sl_no . '.'),
                                    );
                                    $level = substr_count($entry->sl_no, '.');
                                    $social = $entry->social;
                                    $locked = $entry->is_locked;
                                    $filesExist = $social && !empty($social->photos_documents_case_studies);
                                @endphp
                                <tr class="{{ $isParent ? 'table-secondary fw-bold' : '' }}"
                                    data-entry-id="{{ $entry->id }}" data-social-id="{{ $social?->id }}">

                                    {{-- SL No --}}
                                    <td>{{ $entry->sl_no }}</td>

                                    {{-- Item --}}
                                    <td class="text-start" style="padding-left: {{ $level * 20 }}px;">
                                        {{ $entry->item_description }}
                                    </td>

                                    {{-- Yes/No --}}
                                    <td>
                                        @if ($isParent)
                                            <span class="text-muted">—</span>
                                        @else
                                            <select name="yes_no" class="form-select" {{ $locked ? 'disabled' : '' }}>
                                                <option value="">Select</option>
                                                <option value="1" {{ $social?->yes_no == 1 ? 'selected' : '' }}>
                                                    Yes
                                                </option>
                                                <option value="0" {{ $social?->yes_no == 0 ? 'selected' : '' }}>No
                                                </option>
                                                <option value="3" {{ $social?->yes_no == 3 ? 'selected' : '' }}>
                                                    N/A
                                                </option>
                                            </select>
                                        @endif
                                    </td>

                                    {{-- Files --}}
                                    <td class="uploaded-files 
    @if($isParent) bg-light 
    @elseif($filesExist) bg-light-success 
    @else bg-light-danger 
    @endif">
    @if ($isParent)
        <span class="text-muted">—</span>
    @else
        @if ($filesExist)
            <ul class="list-unstyled mb-1 d-none">
                @foreach ($social->photos_documents_case_studies as $mediaId)
                    @php $media = \App\Models\MediaFile::find($mediaId); @endphp
                    @if ($media)
                        <li>
                            <i class="far fa-file"></i>
                            <a href="{{ Storage::url($media->path) }}" target="_blank">
                                {{ $media->meta_data['name'] ?? $media->id }}
                            </a>
                        </li>
                    @endif
                @endforeach
            </ul>
        @endif
        <button type="button" class="btn btn-sm btn-primary open-upload-modal mt-1"
            data-entry-id="{{ $entry->id }}"
            data-social-id="{{ $social?->id }}">
            {{ $filesExist ? 'Manage Files' : 'Upload File' }}
        </button>
    @endif
</td>


                                    {{-- Remarks --}}
                                    <td>
                                        @if ($isParent)
                                            <span class="text-muted">—</span>
                                        @else
                                            <input type="text" name="remarks" class="form-control"
                                                value="{{ $social->remarks ?? '' }}" {{ $locked ? 'readonly' : '' }}>
                                        @endif
                                    </td>

                                    {{-- Validity --}}
                                    <td>
                                        @if ($isParent)
                                            <span class="text-muted">—</span>
                                        @elseif($entry->is_validity)
                                            <input type="date" name="validity_date" class="form-control"
                                                value="{{ $social?->validity_date?->format('Y-m-d') ?? '' }}"
                                                {{ $locked ? 'readonly' : '' }}>
                                        @else
                                            <span class="text-muted">N/A</span>
                                        @endif
                                    </td>

                                    {{-- Date of Entry --}}
                                    <td>
                                        @if ($isParent)
                                            <span class="text-muted">—</span>
                                        @else
                                            <input type="date" name="date_of_entry" class="form-control"
                                                value="{{ $social?->date_of_entry?->format('Y-m-d') ?? now()->format('Y-m-d') }}"
                                                max="{{ now()->format('Y-m-d') }}" {{ $locked ? 'readonly' : '' }}>
                                        @endif
                                    </td>

                                    {{-- Action --}}
                                    <td>
                                        @if (!$isParent && !$locked)
                                            <button type="button" class="btn btn-success btn-sm save-row">
                                                <i class="fas fa-save"></i> Save
                                            </button>
                                        @endif
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </form>
        @else
            <div class="alert alert-warning text-center">
                @if (request()->has('sub_package_project_id'))
                    No entries found for the selected filters.
                @else
                    Please select a project and date to view entries.
                @endif
            </div>
        @endif

        {{-- Upload Modal --}}
        <x-upload-modal />
    </div>

    {{-- JS Scripts --}}
    <x-upload-js :subProjectId="$subProject->id" :complianceId="$compliance->id" :phaseId="$phase_id" />
</x-app-layout>
