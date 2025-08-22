<x-app-layout>
    <div class="container-fluid">

        <!-- Breadcrumb -->
        <x-admin.breadcrumb-header 
            icon="fas fa-file-alt text-primary" 
            title="Grievance Management" 
            :breadcrumbs="[
                ['route' => 'dashboard', 'label' => '<i class=\'fas fa-home\'></i>'], 
                ['label' => 'Admin'],
                ['label' => 'Grievances']
            ]"  
        /> 

        <!-- Summary Cards -->
        <div class="row g-3 mb-4">
            <div class="col-md-3">
                <div class="card shadow-sm border-start border-primary border-4">
                    <div class="card-body text-center">
                        <h6 class="text-muted mb-2">Total Grievances</h6>
                        <h3 class="fw-bold">{{ $total }}</h3>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card shadow-sm border-start border-warning border-4">
                    <div class="card-body text-center">
                        <h6 class="text-muted mb-2">Pending Grievances</h6>
                        <h3 class="fw-bold">{{ $pending }}</h3>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card shadow-sm border-start border-success border-4">
                    <div class="card-body text-center">
                        <h6 class="text-muted mb-2">Resolved Grievances</h6>
                        <h3 class="fw-bold">{{ $resolved }}</h3>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card shadow-sm border-start border-danger border-4">
                    <div class="card-body text-center">
                        <h6 class="text-muted mb-2">Rejected Grievances</h6>
                        <h3 class="fw-bold">{{ $rejected }}</h3>
                    </div>
                </div>
            </div>
        </div>

        <!-- Filters -->
        <div class="card shadow-sm mb-4">
            <div class="card-body">
                <form method="GET" action="{{ route('admin.grievances.index') }}" class="row g-3">
                    <!-- Search -->
                    <div class="col-md-3">
                        <input type="text" name="search" value="{{ request('search') }}" 
                               class="form-control" placeholder="Search by name...">
                    </div>

                    <!-- District -->
                    <div class="col-md-2">
                        <select name="district" class="form-select">
                            <option value="">Select District</option>
                            @foreach ($districts as $district)
                                <option value="{{ $district }}" {{ request('district') == $district ? 'selected' : '' }}>
                                    {{ $district }}
                                </option>
                            @endforeach
                        </select>
                    </div>

                    <!-- Related To -->
                    <div class="col-md-2">
                        <select name="related_to" class="form-select">
                            <option value="">Related to</option>
                            @foreach ($relatedToOptions as $option)
                                <option value="{{ $option }}" {{ request('related_to') == $option ? 'selected' : '' }}>
                                    {{ $option }}
                                </option>
                            @endforeach
                        </select>
                    </div>

                    <!-- Status -->
                    <div class="col-md-2">
                        <select name="status" class="form-select">
                            <option value="">Select Status</option>
                            <option value="pending" {{ request('status') == 'pending' ? 'selected' : '' }}>Pending</option>
                            <option value="in-progress" {{ request('status') == 'in-progress' ? 'selected' : '' }}>In Progress</option>
                            <option value="resolved" {{ request('status') == 'resolved' ? 'selected' : '' }}>Resolved</option>
                            <option value="rejected" {{ request('status') == 'rejected' ? 'selected' : '' }}>Rejected</option>
                        </select>
                    </div>

                    <!-- Year -->
                    <div class="col-md-1">
                        <select name="year" class="form-select">
                            <option value="">Year</option>
                            @for ($y = now()->year; $y >= now()->year - 5; $y--)
                                <option value="{{ $y }}" {{ request('year') == $y ? 'selected' : '' }}>{{ $y }}</option>
                            @endfor
                        </select>
                    </div>

                    <!-- Month -->
                    <div class="col-md-1">
                        <select name="month" class="form-select">
                            <option value="">Month</option>
                            @for ($m = 1; $m <= 12; $m++)
                                <option value="{{ $m }}" {{ request('month') == $m ? 'selected' : '' }}>
                                    {{ \Carbon\Carbon::create()->month($m)->format('M') }}
                                </option>
                            @endfor
                        </select>
                    </div>

                    <div class="col-md-1 d-grid">
                        <button type="submit" class="btn btn-primary">
                            <i class="fas fa-search"></i>
                        </button>
                    </div>
                </form>
            </div>
        </div>

        <!-- Grievances DataTable -->
        <div class="card shadow-sm">
            <div class="card-header bg-white d-flex justify-content-between align-items-center">
                <h5 class="mb-0 h4">
                    <i class="fas fa-table me-2"></i> Grievances List
                </h5>
            </div>
            <div class="card-body">
                <x-admin.data-table 
                    id="grievances-table" 
                    :headers="['#', 'Grievance No.', 'Related To', 'Department', 'Status', 'Registered At', 'Resolved At']" 
                    :excel="true" 
                    :print="true" 
                    title="Grievances Export" 
                    searchPlaceholder="Search grievances..." 
                    resourceName="grievances" 
                    :pageLength="10"
                >
                    @foreach ($grievances as $grievance)
                        <tr>
                            <!-- Index -->
                            <td>{{ $loop->iteration }}</td>

                            <!-- Grievance No -->
                            <td><strong>GR{{ str_pad($grievance->id, 5, '0', STR_PAD_LEFT) }}</strong></td>

                            <!-- Related To -->
                            <td>{{ $grievance->grievance_related_to }}</td>

                            <!-- Department -->
                            <td>{{ $grievance->project ?? '—' }}</td>

                            <!-- Status -->
                            <td>
                                @php
                                    $statusColors = [
                                        'pending' => 'warning',
                                        'in-progress' => 'info',
                                        'resolved' => 'success',
                                        'rejected' => 'danger',
                                    ];
                                @endphp
                                <span class="badge bg-{{ $statusColors[$grievance->status] ?? 'secondary' }}">
                                    {{ ucfirst($grievance->status) }}
                                </span>
                            </td>

                            <!-- Registered At -->
                            <td>{{ $grievance->created_at->format('d M, Y') }}</td>

                            <!-- Resolved At -->
                            <td>
                                @if($grievance->status === 'resolved' && $grievance->updated_at)
                                    {{ $grievance->updated_at->format('d M, Y') }}
                                @else
                                    N/A
                                @endif
                            </td>
                        </tr>
                    
                    @endforeach
                </x-admin.data-table>
            </div>
        </div>
    </div>
</x-app-layout>
