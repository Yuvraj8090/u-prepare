<x-app-layout>
    <div class="container mx-auto py-6">
        <div class="row g-4">

            {{-- Departments Budget --}}
            <div class="col-md-6">
                @php
                    $total_budget = $departments->sum(fn($d) => $d->budget ?? 0);
                @endphp

                <x-admin.chart-card id="departments_budget" title="Departments Budget" :headers="['Department', 'Budget']" :rows="array_merge(
                    $departments->map(fn($d) => [$d->name, formatPriceToCR($d->budget ?? 0)])->toArray(),
                    [['Total', formatPriceToCR($total_budget)]],
                )"
                    :labels="$departments->pluck('name')->push('Total')->toArray()" :data="$departments->pluck('budget')->map(fn($v) => $v ?? 0)->toArray()" type="pie" />

            </div>

            {{-- Package Components Budget --}}
            <div class="col-md-6">
                @php
                    $total_component_budget = $components->sum(fn($c) => $c->budget ?? 0);
                @endphp

                <x-admin.chart-card id="components_budget" title="Package Components Budget" :headers="['Component', 'Budget']"
                    :rows="array_merge(
                        $components->map(fn($c) => [$c->name, formatPriceToCR($c->budget ?? 0)])->toArray(),
                        [['Total', formatPriceToCR($total_component_budget)]],
                    )" :labels="$components->pluck('name')->push('Total')->toArray()" :data="$components
                        ->pluck('budget')
                        ->map(fn($v) => $v ?? 0)
                        ->toArray()" type="pie" />

            </div>

            {{-- Department-wise Project Stats --}}
            <div class="col-md-6">
                <x-admin.chart-card id="departments_projects" title="Department-wise Project Stats" :headers="['Department', 'Projects', 'Signed Contracts', 'Contract Value']"
                    :rows="$departments
                        ->map(
                            fn($d) => [
                                $d->name,
                                $d->projects_count ?? 0,
                                $d->signed_contracts_count ?? 0,
                                formatPriceToCR($d->total_contract_value),
                            ],
                        )
                        ->toArray()" :labels="$departments->pluck('name')->toArray()" :data="$departments->pluck('projects_count')->map(fn($v) => $v ?? 0)->toArray()" :data="$departments->pluck('signed_contracts_count')->map(fn($v) => $v ?? 0)->toArray()" />
            </div>

            {{-- Department-wise Financial Progress --}}
            <div class="col-md-6">
                @php
                    $total_finance = $departments->sum(fn($d) => $d->total_finance ?? 0);
                @endphp

                <x-admin.chart-card id="departments_financial_progress" title="Department-wise Financial Progress"
                    :headers="['Department', 'Financial Progress']" :rows="array_merge(
                        $departments->map(fn($d) => [$d->name, formatPriceToCR($d->total_finance ?? 0)])->toArray(),
                        [['Total', formatPriceToCR($total_finance)]],
                    )" :labels="$departments->pluck('name')->push('Total')->toArray()" :data="$departments->map(fn($d) => $d->total_finance ?? 0)->toArray()" type="pie" />


            </div>
            <div class="card shadow-sm mt-4">

                <div class="card-body">
                    <x-admin.data-table :headers="[
                        'ID',
                        'Name',
                        'LOA Issued',
                        'Contract Signed',
                        'Start Date Given',
                        'LOA to be issued',
                        'Contract Signing Pending',
                        'To be Re-bidded',
                    ]" id="type-of-procurement-table" :excel="true"
                        :print="true" :pageLength="10">
                        @foreach ($typeOfprocurement as $type)
                            <tr>
                                <td>{{ $type->id }}</td>
                                <td>{{ $type->name }}</td>
                                <td>{{ $type->description }}</td>
                                <td>{{ $type->description }}</td>
                                <td>{{ $type->description }}</td>
                                <td>{{ $type->description }}</td>
                                <td>{{ $type->description }}</td>
                                <td>{{ $type->description }}</td>

                            </tr>
                        @endforeach
                    </x-admin.data-table>
                </div>
            </div>

        </div>
    </div>
</x-app-layout>
