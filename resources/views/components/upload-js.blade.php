@props(['subProjectId', 'complianceId', 'phaseId'])

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
    const fileInput = document.getElementById('file-input');
    const uploadTableBody = document.querySelector('#upload-table tbody');
    const viewTableBody = document.getElementById('view-table-body');

    const getIcon = filename => {
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
                </tr>`;
        });
        document.getElementById('upload-table').classList.remove('d-none');
    });

    // Remove file from selection
    uploadTableBody.addEventListener('click', e => {
        if (e.target.classList.contains('remove-file')) {
            const idx = e.target.dataset.index;
            const dt = new DataTransfer();
            Array.from(fileInput.files).forEach((file, i) => i != idx && dt.items.add(file));
            fileInput.files = dt.files;
            e.target.closest('tr').remove();
            if (!uploadTableBody.children.length) document.getElementById('upload-table').classList.add(
                'd-none');
        }
    });
    document.querySelectorAll('.save-row').forEach(btn => {
        btn.addEventListener('click', async () => {
            const row = btn.closest('tr');
            const entryId = row.dataset.entryId;

            const formData = new FormData();
            formData.append('entry_id', entryId);
            formData.append('sub_package_project_id', "{{ $subProjectId }}");
            formData.append('social_compliance_id', "{{ $complianceId }}");
            formData.append('contraction_phase_id', "{{ $phaseId }}");
            formData.append('yes_no', row.querySelector('select[name="yes_no"]').value);
            formData.append('remarks', row.querySelector('input[name="remarks"]').value);
            formData.append('validity_date', row.querySelector('input[name="validity_date"]')
                ?.value || '');
            formData.append('date_of_entry', row.querySelector('input[name="date_of_entry"]')
            .value);

            // Append files from modal input if any
            const fileInput = document.getElementById('file-input');
            Array.from(fileInput.files).forEach(file => {
                formData.append('photos_documents_case_studies[]', file);
            });

            try {
                const res = await fetch("{{ route('admin.social_safeguard_entries.save') }}", {
                    method: 'POST',
                    headers: {
                        'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]')
                            .getAttribute('content')
                    },
                    body: formData
                });

                const data = await res.json();

                if (data.status === 'success') {
                    // Show a toast/alert (optional)
                    alert('Entry saved successfully.');

                    // Option 1: Reload page to reflect changes
                    window.location.reload();

                    // Option 2: OR you can update only the row dynamically (more complex)
                } else {
                    alert(data.message || 'Failed to save entry.');
                }
            } catch (err) {
                console.error(err);
                alert('Error saving entry.');
            }
        });
    });


    // Open modal and populate view
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

            // Show modal
            new bootstrap.Modal(document.getElementById('uploadModal')).show();
        });
    });

    // Upload form
    document.getElementById('upload-form').addEventListener('submit', async e => {
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
        formData.append('sub_package_project_id', "{{ $subProjectId }}");
        formData.append('safeguard_compliance_id', "{{ $complianceId }}");
        formData.append('contraction_phase_id', "{{ $phaseId }}");

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
            alert('Upload failed.');
        }
    });
</script>
