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
        <form id="filter-form" method="GET" class="row mb-4">
            <div class="col-md-2">
                <label class="form-label">Project Name</label>
                <select id="project-selector" class="form-select" disabled>
                    <option value="">-- Select Project --</option>
                    @foreach ($projects as $project)
                        <option value="{{ $project->id }}"
                            {{ request('sub_package_project_id') == $project->id ? 'selected' : '' }}>
                            {{ $project->name }}
                        </option>
                    @endforeach
                </select>
                <input type="hidden" name="sub_package_project_id" value="{{ request('sub_package_project_id') }}">
            </div>

            <div class="col-md-2">
                <label class="form-label">Safeguard Compliance</label>
                <select name="safeguard_compliance_id" class="form-select">
                    <option value="">-- All --</option>
                    @foreach ($safeguardCompliances as $compliance)
                        <option value="{{ $compliance->id }}"
                            {{ request('safeguard_compliance_id') == $compliance->id ? 'selected' : '' }}>
                            {{ $compliance->name }}
                        </option>
                    @endforeach
                </select>
            </div>

            <div class="col-md-2">
                <label class="form-label">Contraction Phase</label>
                <select name="contraction_phase_id" class="form-select">
                    <option value="">-- All --</option>
                    @foreach ($contractionPhases as $phase)
                        <option value="{{ $phase->id }}"
                            {{ request('contraction_phase_id') == $phase->id ? 'selected' : '' }}>
                            {{ $phase->name }}
                        </option>
                    @endforeach
                </select>
            </div>

            <div class="col-md-2">
                <label class="form-label">Date of Entry</label>
                <input type="date" name="date_of_entry" class="form-control"
                    value="{{ request('date_of_entry', now()->format('Y-m-d')) }}" required>
            </div>

            <div class="col-md-2 d-flex align-items-end">
                <button type="submit" class="btn btn-primary w-100">Filter</button>
            </div>
        </form>

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
                                <th>Photos/Documents</th>
                                <th>Remarks</th>
                                <th>Validity Till</th>
                                <th>Date of Entry</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($entries as $entry)
                                @php
                                    $social = $entry->social;
                                    $locked = $entry->is_locked;
                                @endphp
                                <tr data-entry-id="{{ $entry->id }}" data-social-id="{{ $social?->id }}">
                                    <td>{{ $entry->sl_no }}</td>
                                    <td class="text-start">{{ $entry->item_description }}</td>
                                    <td>
                                        <select name="yes_no" class="form-select" {{ $locked ? 'disabled' : '' }}>
                                            <option value="">Select</option>
                                            <option value="1"
                                                {{ $social && $social->yes_no == 1 ? 'selected' : '' }}>Yes</option>
                                            <option value="0"
                                                {{ $social && $social->yes_no == 0 ? 'selected' : '' }}>No</option>
                                            <option value="3"
                                                {{ $social && $social->yes_no == 3 ? 'selected' : '' }}>N/A</option>
                                        </select>
                                    </td>
                                    <td>
                                        <button type="button" class="btn btn-secondary btn-sm open-upload-modal"
                                            data-bs-toggle="modal" data-bs-target="#uploadModal"
                                            data-entry-id="{{ $entry->id }}" data-social-id="{{ $social?->id }}">
                                            <i class="fas fa-upload"></i> Upload/View
                                        </button>
                                        <div class="uploaded-files mt-1 d-none">
                                            @if ($social?->photos_documents_case_studies)
                                                <ul class="list-unstyled mb-0">
                                                    @foreach ($social->photos_documents_case_studies as $mediaId)
                                                        @php
                                                            $media = \App\Models\MediaFile::find($mediaId);
                                                            $icon = 'far fa-file';
                                                            if ($media) {
                                                                $ext = pathinfo($media->url, PATHINFO_EXTENSION);
                                                                switch (strtolower($ext)) {
                                                                    case 'pdf':
                                                                        $icon = 'far fa-file-pdf text-danger';
                                                                        break;
                                                                    case 'doc':
                                                                    case 'docx':
                                                                        $icon = 'far fa-file-word text-primary';
                                                                        break;
                                                                    case 'xls':
                                                                    case 'xlsx':
                                                                        $icon = 'far fa-file-excel text-success';
                                                                        break;
                                                                    case 'jpg':
                                                                    case 'jpeg':
                                                                    case 'png':
                                                                        $icon = 'far fa-file-image text-warning';
                                                                        break;
                                                                }
                                                            }
                                                        @endphp
                                                        @if ($media)
                                                            <li>
                                                                <i class="{{ $icon }}"></i>
                                                                <a href="{{ $media->url }}"
                                                                    target="_blank">{{ $media->meta_data['name'] ?? 'File' }}</a>
                                                            </li>
                                                        @endif
                                                    @endforeach
                                                </ul>
                                            @endif
                                        </div>
                                    </td>
                                    <td><input type="text" name="remarks" class="form-control"
                                            value="{{ $social->remarks ?? '' }}" {{ $locked ? 'readonly' : '' }}></td>
                                    <td>
                                        @if ($entry->is_validity)
                                            <input type="date" name="validity_date" class="form-control"
                                                value="{{ $social?->validity_date?->format('Y-m-d') ?? '' }}"
                                                {{ $locked ? 'readonly' : '' }}>
                                        @else
                                            <span class="text-muted">N/A</span>
                                        @endif
                                    </td>
                                    <td><input type="date" name="date_of_entry" class="form-control"
                                            value="{{ $social?->date_of_entry?->format('Y-m-d') ?? now()->format('Y-m-d') }}"
                                            {{ $locked ? 'readonly' : '' }}></td>
                                    <td>
                                        @if (!$locked)
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
            <div class="alert alert-warning">
                @if (request()->has('sub_package_project_id'))
                    No entries found for the selected filters.
                @else
                    Please select a project and date to view entries.
                @endif
            </div>
        @endif

        {{-- Upload Modal --}}
        <div class="modal fade" id="uploadModal" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title"><i class="fas fa-upload"></i> Media Manager</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body">
                        <ul class="nav nav-tabs" id="uploadTab" role="tablist">
                            <li class="nav-item">
                                <button class="nav-link active" id="upload-tab" data-bs-toggle="tab"
                                    data-bs-target="#upload" type="button">Upload</button>
                            </li>
                            <li class="nav-item">
                                <button class="nav-link" id="view-tab" data-bs-toggle="tab" data-bs-target="#view"
                                    type="button">View</button>
                            </li>
                        </ul>

                        <div class="tab-content mt-3">
                            <div class="tab-pane fade show active" id="upload">
                                <form id="upload-form">
                                    <input type="hidden" name="entry_id" id="modal-entry-id">
                                    <input type="hidden" name="social_id" id="modal-social-id">

                                    <table class="table table-bordered d-none" id="upload-table">
                                        <thead>
                                            <tr>
                                                <th>File Name</th>
                                                <th>Size</th>
                                                <th>Type</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody></tbody>
                                    </table>

                                    <input type="file" name="media_files[]" multiple class="form-control mb-3"
                                        id="file-input">
                                    <button type="submit" class="btn btn-primary">
                                        <i class="fas fa-cloud-upload-alt"></i> Upload
                                    </button>
                                </form>
                            </div>

                            <div class="tab-pane fade" id="view">
                                <table class="table table-bordered" id="view-table">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>File Name</th>
                                            <th>Type</th>
                                            <th>Preview</th>
                                        </tr>
                                    </thead>
                                    <tbody id="view-table-body"></tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        {{-- JS --}}
        <script>
            const fileInput = document.getElementById('file-input');
            const uploadTableBody = document.querySelector('#upload-table tbody');
            const viewTableBody = document.getElementById('view-table-body');

            const getIcon = (filename) => {
                const ext = filename.split('.').pop().toLowerCase();
                const icons = {
                    pdf: 'far fa-file-pdf text-danger',
                    doc: 'far fa-file-word text-primary',
                    docx: 'far fa-file-word text-primary',
                    xls: 'far fa-file-excel text-success',
                    xlsx: 'far fa-file-excel text-success',
                    jpg: 'far fa-file-image text-warning',
                    jpeg: 'far fa-file-image text-warning',
                    png: 'far fa-file-image text-warning'
                };
                return icons[ext] ?? 'far fa-file';
            };

            // Show selected files in Upload table
            fileInput.addEventListener('change', () => {
                uploadTableBody.innerHTML = '';
                Array.from(fileInput.files).forEach((file, index) => {
                    uploadTableBody.innerHTML += `
                        <tr>
                            <td>${file.name}</td>
                            <td>${(file.size / 1024).toFixed(2)} KB</td>
                            <td>${file.type}</td>
                            <td><button type="button" class="btn btn-sm btn-danger remove-file" data-index="${index}">Remove</button></td>
                        </tr>
                    `;
                });
            });

            uploadTableBody.addEventListener('click', e => {
                if (e.target.classList.contains('remove-file')) {
                    const idx = e.target.dataset.index;
                    const dt = new DataTransfer();
                    Array.from(fileInput.files).forEach((file, i) => i != idx && dt.items.add(file));
                    fileInput.files = dt.files;
                    e.target.closest('tr').remove();
                }
            });

            // Open modal & populate view tab
            document.querySelectorAll('.open-upload-modal').forEach(btn => {
                btn.addEventListener('click', () => {
                    const entryId = btn.dataset.entryId;
                    const socialId = btn.dataset.socialId;

                    if (!socialId) {
                        alert('Please save the entry before uploading files.');
                        btn.closest('tr').querySelector('.save-row')?.focus();
                        return;
                    }

                    document.getElementById('modal-entry-id').value = entryId;
                    document.getElementById('modal-social-id').value = socialId;

                    viewTableBody.innerHTML = '';
                    const uploadedFiles = btn.closest('tr').querySelectorAll('.uploaded-files ul li');
                    if (uploadedFiles.length) {
                        uploadedFiles.forEach(li => {
                            const name = li.querySelector('a').innerText;
                            const path = li.querySelector('a').href;
                            const icon = li.querySelector('i').className;
                            const ext = name.split('.').pop().toUpperCase();
                            viewTableBody.innerHTML += `<tr>
                                <td>${name}</td>
                                <td>-</td>
                                <td>${ext}</td>
                                <td><a href="${path}" target="_blank"><i class="${icon}"></i> View</a></td>
                            </tr>`;
                        });
                    } else {
                        viewTableBody.innerHTML =
                            `<tr><td colspan="4" class="text-center">No files uploaded yet.</td></tr>`;
                    }
                });
            });

            // Upload form
            document.getElementById('upload-form').addEventListener('submit', async (e) => {
                e.preventDefault();
                const entryId = document.getElementById('modal-entry-id').value;
                const socialId = document.getElementById('modal-social-id').value;
                if (!socialId) return alert('Cannot upload without saving the entry first.');

                const row = document.querySelector(`tr[data-entry-id="${entryId}"]`);
                const formData = new FormData(e.target);
                formData.append('social_id', socialId);
                formData.append('sl_no', row.children[0].innerText);
                formData.append('item_description', row.children[1].innerText);
                formData.append('yes_no', row.querySelector('select[name="yes_no"]').value);
                formData.append('remarks', row.querySelector('input[name="remarks"]').value);
                formData.append('validity_date', row.querySelector('input[name="validity_date"]')?.value || '');
                formData.append('date_of_entry', row.querySelector('input[name="date_of_entry"]').value);
                formData.append('project_id', "{{ request('sub_package_project_id') }}");
                formData.append('safeguard_compliance_id', "{{ request('safeguard_compliance_id') }}");
                formData.append('contraction_phase_id', "{{ request('contraction_phase_id') }}");

                try {
                    const res = await fetch("{{ route('admin.media_files.upload') }}", {
                        method: 'POST',
                        headers: {
                            'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute(
                                'content')
                        },
                        body: formData
                    });
                    const data = await res.json();
                    if (data.status === 'success') {
                        let rowUl = row.querySelector('.uploaded-files ul');
                        if (!rowUl) {
                            rowUl = document.createElement('ul');
                            rowUl.classList.add('list-unstyled', 'mb-0');
                            row.querySelector('.uploaded-files').innerHTML = '';
                            row.querySelector('.uploaded-files').appendChild(rowUl);
                        }

                        data.files.forEach(file => {
                            const icon = getIcon(file.name);
                            rowUl.insertAdjacentHTML('beforeend',
                                `<li><i class="${icon}"></i> <a href="${file.url}" target="_blank">${file.name}</a></li>`
                                );
                            viewTableBody.innerHTML += `<tr>
                                <td>${file.name}</td>
                                <td>-</td>
                                <td>${file.name.split('.').pop().toUpperCase()}</td>
                                <td><a href="${file.url}" target="_blank"><i class="${icon}"></i> View</a></td>
                            </tr>`;
                        });

                        bootstrap.Modal.getInstance(document.getElementById('uploadModal')).hide();
                    }
                } catch (err) {
                    console.error(err);
                }
            });
        </script>
</x-app-layout>
