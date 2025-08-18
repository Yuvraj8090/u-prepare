<x-app-layout>
    
<div class="container">
    <x-admin.chart-card 
        id="departmentChart"
        title="Projects by Department"
        :labels="array_keys($projectsByDepartment->toArray())"
        :data="$projectsByDepartment->pluck('budget')->toArray()"
    />

    <x-admin.chart-card 
        id="monthlyBudgetChart"
        title="Monthly Budget"
        :labels="array_keys($monthlyBudget->toArray())"
        :data="$monthlyBudget->values()->toArray()"
    />

    <x-admin.chart-card 
        id="budgetVsActualChart"
        title="Budget vs Actual Spending"
        :labels="$budgetVsActual->pluck('name')->toArray()"
        :data="$budgetVsActual->pluck('budget')->toArray()"
    />
</div>

</x-app-layout>