<x-app-layout>
   <div class="container py-5">
      <x-admin.breadcrumb-header icon="fas fa-file-invoice-dollar text-primary" :title="'Update Financial Progress'" :breadcrumbs="[
         ['route' => 'dashboard', 'label' => '<i class=\'fas fa-home\'></i> Dashboard'],
         ['label' => 'Update Financial Progress '],
         ]" />
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
      <div class="card shadow-sm mb-4">
         <div class="card-header bg-white d-flex justify-content-between align-items-center">
            <h5 class="mb-0 text-primary">
               <i class="fas fa-folder-open me-2"></i> Update Financial Progress
            </h5>
         </div>
         <div class="card-body">
            <x-admin.data-table :headers="[
               'Sub Project',
               'Contract Value',
               'Financial Progress',
               
               'Actions',
               ]" id="financialTable_" :excel="true" :print="true"
               :pageLength="10">
               @foreach ($subProjects as $progress)
               <tr>
                  <td>{{ $progress->name }} </td>
                  <td>{{ formatPriceToCR($progress->contract_value) }}</td>
                   <td>
                                                <div class="mb-1">
                                                    <small>{{ formatPriceToCR($progress->total_finance_amount) }}
     <br>
     ( {{ round($progress->financial_progress_percentage, 2) }}%)

                                                    </small>
                                                </div>
                                               
                                            </td>

                                            <!-- Physical Progress -->
                                            
                  <td>
                     <a
                        href="{{ route('admin.financial-progress-updates.index', ['sub_package_project_id' => $progress->id]) }}">
                     Update
                     </a>
                  </td>
               </tr>
               @endforeach
            </x-admin.data-table>
         </div>
      </div>
   </div>
</x-app-layout>