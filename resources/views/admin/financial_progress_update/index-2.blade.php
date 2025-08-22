<x-app-layout>
    <div class="container py-5">

        <x-admin.breadcrumb-header 
            icon="fas fa-file-invoice-dollar text-primary" 
            :title="'Financial Progress Updates'" 
            :breadcrumbs="[
                ['route' => 'dashboard', 'label' => '<i class=\'fas fa-home\'></i> Dashboard'],
                ['label' => 'Financial Progress Updates'],
            ]" 
        />

        @if (session('success'))
            <div class="row mb-3">
                <div class="col-md-12">
                    <x-alert type="success" :message="session('success')" dismissible />
                </div>
            </div>
        @endif

        @if (session('error'))
            <div class="row mb-3">
                <div class="col-md-12">
                    <x-alert type="danger" :message="session('error')" dismissible />
                </div>
            </div>
        @endif

        <!-- Loop SubProjects -->
        @foreach($subProjects as $subProject)
            <div class="card shadow-sm mb-4">
                <div class="card-header bg-white d-flex justify-content-between align-items-center">
                    <h5 class="mb-0 text-primary">
                        <i class="fas fa-folder-open me-2"></i> {{ $subProject->name }}
                    </h5>
                    <a href="{{ route('admin.financial-progress-updates.create', ['sub_package_project_id' => $subProject->id]) }}"
                        class="btn btn-primary btn-sm">
                        <i class="fas fa-plus-circle me-1"></i> Add Progress
                    </a>
                </div>

                <div class="card-body">
                    <x-admin.data-table 
                        :headers="[
                            '#',
                            'Bill Serial No',
                            'No. of Bills',
                            'Finance Amount (₹)',
                            'Media',
                            'Submit Date',
                            'Actions',
                        ]" 
                        id="financialTable_" 
                        :excel="true" 
                        :print="true"
                        :pageLength="10"
                    >
                      @foreach ($subProjects as $progress)
                      
                            <tr>
                              
                                <td>{{ $progress->name}} </td>
                             
                                <td>{{ number_format($progress->contract_value, 2) }}</td>
                                
                               
                                <td>
                                    <a href="{{ route('admin.financial-progress-updates.index', ['sub_package_project_id' => $progress->id]) }}">
                                        Update 
                                       
                                    </a>
                                </td>
                            </tr>
                       @endforeach
                    </x-admin.data-table>
                </div>
            </div>
        @endforeach
    </div>

    <!-- Media Modal -->
  
</x-app-layout>
