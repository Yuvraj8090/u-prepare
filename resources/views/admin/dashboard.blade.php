<x-app-layout>
    <div class="container mx-auto py-6">
        <div class="row g-4">

            {{-- Departments Budget --}}
            <div class="col-md-6">
                <x-admin.chart-card 
                    id="departments_budget" 
                    title="Departments Budget" 
                    :headers="['Department', 'Budget']"
                    :rows="$departments->map(fn($d) => [$d->name, formatPriceToCR($d->budget ?? 0)])->toArray()"
                    :labels="$departments->pluck('name')->toArray()" 
                    :data="$departments->pluck('budget')->map(fn($v) => $v ?? 0)->toArray()" 
                />
            </div>

            {{-- Package Components Budget --}}
            <div class="col-md-6">
                <x-admin.chart-card 
                    id="components_budget" 
                    title="Package Components Budget" 
                    :headers="['Component', 'Budget']"
                    :rows="$components->map(fn($c) => [$c->name, formatPriceToCR($c->budget ?? 0)])->toArray()" 
                    :labels="$components->pluck('name')->toArray()" 
                    :data="$components->pluck('budget')->map(fn($v) => $v ?? 0)->toArray()" 
                />
            </div>

            {{-- Department-wise Project Stats --}}
            <div class="col-md-6">
                <x-admin.chart-card 
                    id="departments_projects" 
                    title="Department-wise Project Stats" 
                    :headers="['Department', 'Projects', 'Signed Contracts', 'Contract Value']"
                    :rows="$departments->map(fn($d) => [
                        $d->name,
                        $d->projects_count ?? 0,
                        $d->signed_contracts_count ?? 0,
                        formatPriceToCR($d->total_contract_value),
                    ])->toArray()"
                    :labels="$departments->pluck('name')->toArray()" 
                    :data="$departments->pluck('projects_count')->map(fn($v) => $v ?? 0)->toArray()"
                    :data="$departments->pluck('signed_contracts_count')->map(fn($v) => $v ?? 0)->toArray()"
                    :data="$departments->pluck('total_contract_value')->map(fn($v) => $v)->toArray()"
                   
                />
            </div>

            {{-- Department-wise Financial Progress --}}
            <div class="col-md-6">
                <x-admin.chart-card 
    id="departments_financial_progress" 
    title="Department-wise Financial Progress"
    :headers="['Department', 'Financial Progress']" 
    :rows="$departments->map(fn($d) => [
        $d->name,
        formatPriceToCR($d->total_finance ?? 0),
    ])->toArray()" 
    :labels="$departments->pluck('name')->toArray()" 
    :data="$departments->map(fn($d) => $d->total_finance ?? 0)->toArray()" 
    type="pie"
/>

            </div>

        </div>
    </div>
</x-app-layout>
