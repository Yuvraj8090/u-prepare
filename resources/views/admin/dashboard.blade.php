<x-app-layout>
    <div class="container-fluid py-4">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2 class="mb-0">Dashboard Overview</h2>
            <div class="dropdown">
                <button class="btn btn-outline-secondary dropdown-toggle" type="button" id="exportDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                    <i class="fas fa-download me-1"></i> Export
                </button>
                <ul class="dropdown-menu" aria-labelledby="exportDropdown">
                    <li><a class="dropdown-item" href="#" id="export-pdf"><i class="fas fa-file-pdf me-2"></i>PDF</a></li>
                    <li><a class="dropdown-item" href="#" id="export-image"><i class="fas fa-file-image me-2"></i>Image</a></li>
                    <li><a class="dropdown-item" href="#" id="export-csv"><i class="fas fa-file-csv me-2"></i>CSV Data</a></li>
                </ul>
            </div>
        </div>

       <div class="row">
    <x-admin.chart-card 
        title="Department Budget" 
        :labels="$departments->pluck('name')->toArray()" 
        :data="$departments->pluck('budget')->map(fn($b)=> (float)$b)->toArray()" 
        currency="true" 
    />

    <x-admin.chart-card 
        title="Component Budget" 
        :labels="$components->pluck('name')->toArray()" 
        :data="$components->pluck('budget')->map(fn($b)=> (float)$b)->toArray()" 
        currency="true" 
    />
</div>

        <!-- S-Curve and Other Charts -->
        <div class="row mt-4">
            <div class="col-md-12 mb-4">
                <div class="card shadow-sm">
                    <div class="card-header bg-info text-white d-flex justify-content-between align-items-center">
                        <span>S-Curve (Cumulative Project Budget)</span>
                        <div class="dropdown chart-options">
                            <button class="btn btn-sm btn-light dropdown-toggle py-0" type="button" id="scurveChartOptions" data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="fas fa-chart-line"></i>
                            </button>
                            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="scurveChartOptions">
                                <li><a class="dropdown-item chart-type" data-type="line">Line Chart</a></li>
                                <li><a class="dropdown-item chart-type" data-type="area">Area Chart</a></li>
                                <li><a class="dropdown-item chart-type" data-type="bar">Bar Chart</a></li>
                                <li><a class="dropdown-item chart-type" data-type="scatter">Scatter Plot</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="card-body">
                        <div id="s-curve-chart" style="height:300px;"></div>
                    </div>
                    <div class="card-footer bg-light">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="d-flex align-items-center">
                                    <div class="bg-info rounded-circle me-2" style="width:15px; height:15px;"></div>
                                    <small>Cumulative Budget</small>
                                </div>
                            </div>
                            <div class="col-md-6 text-end">
                                <small class="text-muted">Last updated: {{ now()->format('M d, Y H:i') }}</small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Additional Charts Row -->
        <div class="row">
            <!-- Monthly Budget Utilization -->
            <div class="col-md-6 mb-4">
                <div class="card shadow-sm h-100">
                    <div class="card-header bg-purple text-white d-flex justify-content-between align-items-center">
                        <span>Monthly Budget Utilization</span>
                        <div class="dropdown chart-options">
                            <button class="btn btn-sm btn-light dropdown-toggle py-0" type="button" id="monthlyChartOptions" data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="fas fa-chart-bar"></i>
                            </button>
                            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="monthlyChartOptions">
                                <li><a class="dropdown-item chart-type" data-type="bar">Bar Chart</a></li>
                                <li><a class="dropdown-item chart-type" data-type="line">Line Chart</a></li>
                                <li><a class="dropdown-item chart-type" data-type="area">Area Chart</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="card-body">
                        <div id="monthly-chart" style="height:250px;"></div>
                    </div>
                </div>
            </div>

            <!-- Budget vs Actual -->
            <div class="col-md-6 mb-4">
                <div class="card shadow-sm h-100">
                    <div class="card-header bg-orange text-white d-flex justify-content-between align-items-center">
                        <span>Budget vs Actual Spending</span>
                        <div class="dropdown chart-options">
                            <button class="btn btn-sm btn-light dropdown-toggle py-0" type="button" id="budgetChartOptions" data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="fas fa-chart-bar"></i>
                            </button>
                            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="budgetChartOptions">
                                <li><a class="dropdown-item chart-type" data-type="bar">Bar Chart</a></li>
                                <li><a class="dropdown-item chart-type" data-type="radar">Radar Chart</a></li>
                                <li><a class="dropdown-item chart-type" data-type="heatmap">Heatmap</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="card-body">
                        <div id="budget-actual-chart" style="height:250px;"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- ApexCharts CDN -->
 
</x-app-layout>