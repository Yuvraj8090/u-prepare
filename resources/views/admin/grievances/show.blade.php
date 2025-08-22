<x-app-layout>
    <style>
        .h4 { font-size: 18px!important; font-weight: 550; }
        .timeline h2 { font-size: 1.25rem; }
        .timeline p { font-size: 1rem; }
        .bsb-timeline-1 { --bsb-tl-color: #cfe3ff; --bsb-tl-circle-size: 18px; --bsb-tl-circle-color: #0d6ef6; --bsb-tl-circle-offset: 9px; }
        .bsb-timeline-1 .timeline { margin:0; padding:0; position:relative; list-style:none; }
        .bsb-timeline-1 .timeline::after { top:0; left:0; width:2px; bottom:0; content:""; position:absolute; margin-left:-1px; background-color:var(--bsb-tl-color);}
        .bsb-timeline-1 .timeline>.timeline-item { position:relative; }
        .bsb-timeline-1 .timeline>.timeline-item::before { top:0; left:calc(var(--bsb-tl-circle-offset)*-2); width:var(--bsb-tl-circle-size); height:var(--bsb-tl-circle-size); content:""; position:absolute; border-radius:50%; background-color:var(--bsb-tl-circle-color);}
        .bsb-timeline-1 .timeline>.timeline-item .timeline-content { padding:0 0 2rem 2.5rem;}
    </style>

    <div class="container-fluid">

        {{-- Breadcrumb --}}
        <x-admin.breadcrumb-header 
            icon="fas fa-file-alt text-primary" 
            title="Grievance Details" 
            :breadcrumbs="[
                ['route' => 'dashboard', 'label' => '<i class=\'fas fa-home\'></i>'], 
                ['route' => 'admin.grievances.index', 'label' => 'Grievances'],
                ['label' => 'Details']
            ]"  
        /> 

        {{-- Applicant Details --}}
        <section class="card shadow-sm mb-4">
            <div class="card-header bg-light fw-bold">
                <i class="fas fa-user text-primary me-2"></i> Applicant Details
            </div>
            <div class="card-body row">
                <div class="col-md-4"><h6 class="text-muted">Name</h6><h5>{{ $grievance->full_name ?? '—' }}</h5></div>
                <div class="col-md-4"><h6 class="text-muted">Mobile</h6><h5>{{ $grievance->mobile ?? '—' }}</h5></div>
                <div class="col-md-4"><h6 class="text-muted">Email</h6><h5>{{ $grievance->email ?? '—' }}</h5></div>
            </div>
        </section>

        {{-- Grievance Info --}}
        <section class="card shadow-sm mb-4">
            <div class="card-header bg-light fw-bold">
                <i class="fas fa-info-circle text-primary me-2"></i> Grievance Information
            </div>
            <div class="card-body">
                <h6 class="text-muted">Related To</h6>
                <h5>{{ $grievance->grievance_related_to ?? '—' }}</h5>
                <h6 class="mt-3 text-muted">Nature of Complaint</h6>
                <p>{{ $grievance->nature_of_complaint ?? '—' }}</p>
                <h6 class="mt-3 text-muted">Status</h6>
                <span class="badge bg-{{ $grievance->status == 'resolved' ? 'success' : ($grievance->status == 'pending' ? 'warning' : 'secondary') }}">
                    {{ ucfirst($grievance->status) }}
                </span>
            </div>
        </section>

        {{-- Assignment --}}
        <section class="card shadow-sm mb-4">
            <div class="card-header bg-light fw-bold">
                <i class="fas fa-users text-primary me-2"></i> Assignments
            </div>
            <div class="card-body">
                <form class="ajax-form mb-3" data-method="POST" data-action="{{ route('admin.grievances.assignments.store', $grievance->id) }}">
                    @csrf
                    <div class="row g-2">
                        <div class="col-md-5">
                            <select name="assigned_to" class="form-control">
                                @foreach($users as $user)
                                    <option value="{{ $user->id }}">{{ $user->name }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-md-5">
                            <input type="text" name="department" class="form-control" placeholder="Department">
                        </div>
                        <div class="col-md-2">
                            <button type="submit" class="btn btn-success w-100"><i class="fas fa-plus"></i> Assign</button>
                        </div>
                    </div>
                </form>

                <ul class="list-group">
                    @forelse($grievance->assignments as $assign)
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            <span>
                                <strong>{{ $assign->assignedUser->name ?? '—' }}</strong> 
                                ({{ $assign->department }}) 
                                <small class="text-muted">by {{ $assign->assignedByUser->name ?? 'System' }}</small>
                            </span>
                            <button class="btn btn-danger btn-sm ajax-delete" 
                                data-url="{{ route('admin.grievances.assignments.destroy', $assign->id) }}">
                                <i class="fas fa-trash"></i>
                            </button>
                        </li>
                    @empty
                        <p class="text-muted">No assignments yet.</p>
                    @endforelse
                </ul>
            </div>
        </section>

        {{-- Preliminary & Final Action --}}
        <div class="row">
            <div class="col-md-6">
                <section class="card shadow-sm mb-4">
                    <div class="card-header bg-light fw-bold">Preliminary Action Taken</div>
                    <div class="card-body text-center">
                        <p class="text-muted">Coming Soon</p>
                        <button class="btn btn-primary btn-patr" data-bs-toggle="modal" data-bs-target="#actionModal">Submit</button>
                    </div>
                </section>
            </div>
            <div class="col-md-6">
                <section class="card shadow-sm mb-4">
                    <div class="card-header bg-light fw-bold">Final Action Taken</div>
                    <div class="card-body text-center">
                        <p class="text-muted">Coming Soon</p>
                        <button class="btn btn-primary btn-fatr" data-bs-toggle="modal" data-bs-target="#actionModal">Submit</button>
                    </div>
                </section>
            </div>
        </div>

        {{-- Logs Timeline --}}
        <section class="card shadow-sm">
            <div class="card-header bg-light fw-bold">
                <i class="fas fa-history text-primary me-2"></i> Grievance Logs
            </div>
            <div class="card-body">
                <form class="ajax-form mb-3" data-method="POST" data-action="{{ route('admin.grievances.logs.store', $grievance->id) }}">
                    @csrf
                    <div class="row g-2">
                        <div class="col-md-4">
                            <input type="text" name="title" class="form-control" placeholder="Log Title">
                        </div>
                        <div class="col-md-6">
                            <input type="text" name="remark" class="form-control" placeholder="Remark">
                        </div>
                        <div class="col-md-2">
                            <button type="submit" class="btn btn-primary w-100"><i class="fas fa-plus"></i> Add</button>
                        </div>
                    </div>
                </form>

                <div class="bsb-timeline-1 py-4">
                    <ul class="timeline">
                        @forelse($grievance->logs as $log)
                            <li class="timeline-item">
                                <div class="timeline-content">
                                    <div class="card border-0 shadow-sm mb-3">
                                        <div class="card-body">
                                            <h6 class="text-muted">{{ $log->created_at->format('d M Y, h:i A') }}</h6>
                                            <h5 class="fw-bold">{{ $log->title }}</h5>
                                            <p class="mb-1"><strong>Remark:</strong> {{ $log->remark ?? '—' }}</p>
                                            <p class="mb-0"><strong>By:</strong> {{ $log->user->name ?? 'System' }}</p>
                                            <button class="btn btn-danger btn-sm mt-2 ajax-delete" 
                                                data-url="{{ route('admin.grievances.logs.destroy', $log->id) }}">
                                                <i class="fas fa-trash"></i> Delete
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        @empty
                            <p class="text-muted">No logs available.</p>
                        @endforelse
                    </ul>
                </div>
            </div>
        </section>
    </div>

    {{-- Action Modal --}}
    <div class="modal fade" id="actionModal">
        <div class="modal-dialog modal-dialog-centered">
            <form class="modal-content ajax-form" data-method="POST" data-action="#" enctype="multipart/form-data">
                @csrf
                <input type="hidden" name="grievance_id" value="{{ $grievance->id }}">
                <input type="hidden" name="type" value="">
                <div class="modal-header">
                    <h5 class="modal-title">Action Taken Report</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label>Comment</label>
                        <textarea name="remark" class="form-control"></textarea>
                    </div>
                    <div class="mb-3">
                        <label>Attach Document</label>
                        <input type="file" name="document" class="form-control">
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Submit Report</button>
                </div>
            </form>
        </div>
    </div>

    {{-- Scripts --}}
    <script>
        $(document).on('submit', '.ajax-form', function(e) {
            e.preventDefault();
            let form = $(this);
            let action = form.data('action');
            let method = form.data('method');
            let formData = new FormData(this);

            $.ajax({
                url: action,
                type: method,
                data: formData,
                processData: false,
                contentType: false,
                success: function(res) {
                    if(res.success){
                        toastr.success(res.message ?? "Saved successfully");
                        setTimeout(()=>location.reload(), 800);
                    } else {
                        toastr.warning(res.message ?? "Something went wrong!");
                    }
                },
                error: function(xhr) {
                    let msg = xhr.responseJSON?.message || "Unexpected error occurred.";
                    toastr.error(msg);
                }
            });
        });

        $(document).on('click','.ajax-delete',function(e){
            e.preventDefault();
            if(!confirm("Are you sure to delete?")) return;
            let url = $(this).data('url');
            $.ajax({
                url: url,
                type: 'DELETE',
                data: {_token:'{{ csrf_token() }}'},
                success: function(res){
                    if(res.success){
                        toastr.success(res.message ?? "Deleted successfully");
                        setTimeout(()=>location.reload(), 800);
                    } else {
                        toastr.warning(res.message ?? "Delete failed");
                    }
                },
                error: function(xhr){
                    toastr.error("Delete failed");
                }
            });
        });

        // Modal switch preliminary / final
        let $modal = $('#actionModal');
        let $type = $modal.find('input[name="type"]');
        $('.btn-patr').on('click',()=>{$type.val('preliminary');$modal.find('.modal-title').text('Preliminary Action Taken Report');});
        $('.btn-fatr').on('click',()=>{$type.val('final');$modal.find('.modal-title').text('Final Action Taken Report');});
    </script>
</x-app-layout>
