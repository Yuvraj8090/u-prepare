<div class="row">
    <div class="col-md-12">
        <div class="card shadow-sm mb-4">
            <div class="card-header bg-white border-0 d-flex justify-content-between align-items-center">
                <h6 class="text-secondary mb-0 h4">
                    <i class="fas fa-tasks me-2"></i>
                    Work Programs
                </h6>


                <div class="d-flex">
                    @php $docCount = 0; @endphp

                @foreach ($workPrograms as $program)
                    @if ($program->procurement_bid_document)
                        @php $docCount++; @endphp
                        <li class="mb-2">
                            <a href="{{ asset('storage/' . $program->procurement_bid_document) }}" target="_blank"
                                class="btn btn-outline-primary btn-sm">
                                <i class="fas fa-file-pdf me-2"></i> Bid Document
                            </a>
                        </li>
                    @endif

                    @if ($program->pre_bid_minutes_document)
                        @php $docCount++; @endphp
                        <li class="mb-2">
                            <a href="{{ asset('storage/' . $program->pre_bid_minutes_document) }}" target="_blank"
                                class="btn btn-outline-success btn-sm">
                                <i class="fas fa-file-alt me-2"></i> Pre-Bid Minutes
                            </a>
                        </li>
                    @endif
                @endforeach

                @if ($docCount === 0)
                    <p class="text-muted fst-italic">No documents uploaded.</p>
                @endif
                </div>

            </div>

            <div class="card-body">
                @if ($workPrograms->isEmpty())
                    <div class="alert alert-info mb-0">
                        No work programs found for this Package & Procurement Detail.
                    </div>
                @else
                    <x-admin.data-table id="work-programs-table" :headers="['#', 'Name', 'Weightage (%)', 'Days', 'Start Date', 'Planned Date']" :excel="true" :print="true"
                        :pageLength="10" :resourceName="'work-programs'">

                        @foreach ($workPrograms as $i => $program)
                            <tr>
                                <td>{{ $i + 1 }}</td>
                                <td>{{ $program->name_work_program }}</td>
                                <td>{{ $program->weightage }}%</td>
                                <td>{{ $program->days ?? 'N/A' }}</td>
                                <td>{{ $program->start_date ? \Carbon\Carbon::parse($program->start_date)->format('d M Y') : 'N/A' }}
                                </td>
                                <td>{{ $program->planned_date ? \Carbon\Carbon::parse($program->planned_date)->format('d M Y') : 'N/A' }}
                                </td>
                            </tr>
                        @endforeach

                    </x-admin.data-table>
                @endif
            </div>
        </div>
    </div>
</div>
