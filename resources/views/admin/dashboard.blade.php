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

<<<<<<< Updated upstream
<<<<<<< Updated upstream
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
=======
=======
>>>>>>> Stashed changes
        <div class="row">
            <!-- Department Budget Card -->
            <div class="col-md-4 mb-4">
                <div class="card shadow-sm h-100">
                    <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
                        <span>Department Budget</span>
                        <div class="dropdown chart-options">
                            <button class="btn btn-sm btn-light dropdown-toggle py-0" type="button" id="deptChartOptions" data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="fas fa-chart-pie"></i>
                            </button>
                            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="deptChartOptions">
                                <li><a class="dropdown-item chart-type" data-type="pie">Pie Chart</a></li>
                                <li><a class="dropdown-item chart-type" data-type="donut">Donut Chart</a></li>
                                <li><a class="dropdown-item chart-type" data-type="bar">Bar Chart</a></li>
                                <li><a class="dropdown-item chart-type" data-type="radial">Radial Chart</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="card-body">
                        <div id="department-chart" style="height:200px;"></div>
                    </div>
                    <div class="card-footer p-2 bg-light">
                        <div class="table-responsive">
                            <table class="table table-sm table-bordered mb-0">
                                <thead class="table-light">
                                    <tr>
                                        <th>Department</th>
                                        <th class="text-end">Budget (₹)</th>
                                        <th class="text-end">%</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach($departments as $dept)
                                        <tr>
                                            <td>{{ $dept->name }}</td>
                                            <td class="text-end">₹ {{ formatToCr($dept->budget, 2) }}</td>
                                            <td class="text-end">{{ number_format(($dept->budget/$totalDepartmentBudget)*100, 1) }}%</td>
                                        </tr>
                                    @endforeach
                                    <tr class="fw-bold bg-light">
                                        <td>Total</td>
                                        <td class="text-end">₹ {{ formatToCr($totalDepartmentBudget, 2) }}</td>
                                        <td class="text-end">100%</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Component Budget Card -->
            <div class="col-md-4 mb-4">
                <div class="card shadow-sm h-100">
                    <div class="card-header bg-success text-white d-flex justify-content-between align-items-center">
                        <span>Component Budget</span>
                        <div class="dropdown chart-options">
                            <button class="btn btn-sm btn-light dropdown-toggle py-0" type="button" id="compChartOptions" data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="fas fa-chart-pie"></i>
                            </button>
                            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="compChartOptions">
                                <li><a class="dropdown-item chart-type" data-type="pie">Pie Chart</a></li>
                                <li><a class="dropdown-item chart-type" data-type="donut">Donut Chart</a></li>
                                <li><a class="dropdown-item chart-type" data-type="bar">Bar Chart</a></li>
                                <li><a class="dropdown-item chart-type" data-type="radial">Radial Chart</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="card-body">
                        <div id="component-chart" style="height:200px;"></div>
                    </div>
                    <div class="card-footer p-2 bg-light">
                        <div class="table-responsive">
                            <table class="table table-sm table-bordered mb-0">
                                <thead class="table-light">
                                    <tr>
                                        <th>Component</th>
                                        <th class="text-end">Budget (₹)</th>
                                        <th class="text-end">%</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach($components as $comp)
                                        <tr>
                                            <td>{{ $comp->name }}</td>
                                            <td class="text-end">₹ {{ formatToCr($comp->budget, 2) }}</td>
                                            <td class="text-end">{{ number_format(($comp->budget/$totalComponentBudget)*100, 1) }}%</td>
                                        </tr>
                                    @endforeach
                                    <tr class="fw-bold bg-light">
                                        <td>Total</td>
                                        <td class="text-end">₹ {{ formatToCr($totalComponentBudget, 2) }}</td>
                                        <td class="text-end">100%</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Project Budget Card -->
            <div class="col-md-4 mb-4">
                <div class="card shadow-sm h-100">
                    <div class="card-header bg-warning text-dark d-flex justify-content-between align-items-center">
                        <span>Project Budget by Department</span>
                        <div class="dropdown chart-options">
                            <button class="btn btn-sm btn-light dropdown-toggle py-0" type="button" id="projChartOptions" data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="fas fa-chart-pie"></i>
                            </button>
                            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="projChartOptions">
                                <li><a class="dropdown-item chart-type" data-type="pie">Pie Chart</a></li>
                                <li><a class="dropdown-item chart-type" data-type="donut">Donut Chart</a></li>
                                <li><a class="dropdown-item chart-type" data-type="bar">Bar Chart</a></li>
                                <li><a class="dropdown-item chart-type" data-type="radial">Radial Chart</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="card-body">
                        <div id="project-chart" style="height:200px;"></div>
                    </div>
                    <div class="card-footer p-2 bg-light">
                        <div class="table-responsive">
                            <table class="table table-sm table-bordered mb-0">
                                <thead class="table-light">
                                    <tr>
                                        <th>Department</th>
                                        <th class="text-end">Project Budget (₹)</th>
                                        <th class="text-end">%</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach($projectsByDepartment as $dept => $data)
                                        <tr>
                                            <td>{{ $dept }}</td>
                                            <td class="text-end">₹ {{ formatToCr($data['budget'], 2) }}</td>
                                            <td class="text-end">{{ number_format(($data['budget']/$totalProjectBudget)*100, 1) }}%</td>
                                        </tr>
                                    @endforeach
                                    <tr class="fw-bold bg-light">
                                        <td>Total</td>
                                        <td class="text-end">₹ {{ formatToCr($totalProjectBudget, 2) }}</td>
                                        <td class="text-end">100%</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
<<<<<<< Updated upstream
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes

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
<<<<<<< Updated upstream
<<<<<<< Updated upstream
 
=======
=======
>>>>>>> Stashed changes
    <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
    <!-- Chart Export Libraries -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
    
    <script>
        // Initialize all charts
        document.addEventListener('DOMContentLoaded', function() {
            // Department Chart
            const deptChart = new ApexCharts(document.querySelector("#department-chart"), {
                chart: { 
                    type: 'pie', 
                    height: 200,
                    animations: { enabled: true },
                    toolbar: { show: false }
                },
                series: @json($departments->pluck('budget')->map(fn($b) => (float)$b)),
                labels: @json($departments->pluck('name')),
                colors: ['#3B82F6', '#10B981', '#F59E0B', '#6366F1', '#EC4899', '#14B8A6', '#F97316', '#8B5CF6'],
                legend: { 
                    position: 'bottom',
                    fontSize: '12px',
                    itemMargin: { horizontal: 8, vertical: 4 }
                },
                dataLabels: { 
                    enabled: true,
                    formatter: function(val) { return parseFloat(val).toFixed(1) + '%' },
                    dropShadow: { enabled: false }
                },
                tooltip: {
                    y: {
                        formatter: function(val) {
                            return '₹' + val.toLocaleString('en-IN') + 
                                   ' (' + ((val/{{ $totalDepartmentBudget }})*100).toFixed(1) + '%)';
                        }
                    }
                }
            });
            deptChart.render();

            // Component Chart
            const compChart = new ApexCharts(document.querySelector("#component-chart"), {
                chart: { 
                    type: 'pie', 
                    height: 200,
                    animations: { enabled: true },
                    toolbar: { show: false }
                },
                series: @json($components->pluck('budget')->map(fn($b) => (float)$b)),
                labels: @json($components->pluck('name')),
                colors: ['#10B981', '#3B82F6', '#F59E0B', '#6366F1', '#EC4899', '#14B8A6', '#F97316', '#8B5CF6'],
                legend: { position: 'bottom' },
                dataLabels: { enabled: true },
                tooltip: {
                    y: {
                        formatter: function(val) {
                            return '₹' + val.toLocaleString('en-IN') + 
                                   ' (' + ((val/{{ $totalComponentBudget }})*100).toFixed(1) + '%)';
                        }
                    }
                }
            });
            compChart.render();

            // Project Chart
            const projChart = new ApexCharts(document.querySelector("#project-chart"), {
                chart: { 
                    type: 'pie', 
                    height: 200,
                    animations: { enabled: true },
                    toolbar: { show: false }
                },
                series: @json($projectsByDepartment->pluck('budget')),
                labels: @json($projectsByDepartment->keys()),
                colors: ['#F59E0B', '#3B82F6', '#10B981', '#6366F1', '#EC4899', '#14B8A6', '#F97316', '#8B5CF6'],
                legend: { position: 'bottom' },
                dataLabels: { enabled: true },
                tooltip: {
                    y: {
                        formatter: function(val) {
                            return '₹' + val.toLocaleString('en-IN') + 
                                   ' (' + ((val/{{ $totalProjectBudget }})*100).toFixed(1) + '%)';
                        }
                    }
                }
            });
            projChart.render();

            // S-Curve Chart
            const scurveChart = new ApexCharts(document.querySelector("#s-curve-chart"), {
                chart: { 
                    type: 'line', 
                    height: 300,
                    zoom: { enabled: true },
                    toolbar: { show: true }
                },
                series: [{
                    name: 'Cumulative Budget',
                    data: @json($sCurveData->pluck('cumulative_budget'))
                }],
                xaxis: { 
                    categories: @json($sCurveData->pluck('date')),
                    labels: {
                        formatter: function(value) {
                            return new Date(value).toLocaleDateString('en-US', {month: 'short', year: 'numeric'});
                        }
                    }
                },
                yaxis: {
                    labels: {
                        formatter: function(val) {
                            return '₹' + (val/10000000).toFixed(1) + ' Cr';
                        }
                    }
                },
                stroke: { 
                    curve: 'smooth',
                    width: 3
                },
                markers: { size: 5 },
                colors: ['#06B6D4'],
                grid: {
                    borderColor: '#f1f1f1',
                },
                tooltip: { 
                    y: { 
                        formatter: function(val) {
                            return '₹' + val.toLocaleString('en-IN') + 
                                   ' (' + ((val/{{ $totalProjectBudget }})*100).toFixed(1) + '%)';
                        } 
                    } 
                }
            });
            scurveChart.render();

            // Monthly Utilization Chart (sample data - replace with actual)
            const monthlyData = {
                categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
                allocated: [12000000, 15000000, 18000000, 21000000, 24000000, 27000000, 30000000, 33000000, 36000000, 39000000, 42000000, 45000000],
                utilized: [8000000, 12000000, 15000000, 14000000, 22000000, 25000000, 28000000, 31000000, 29000000, 35000000, 38000000, 40000000]
            };

            const monthlyChart = new ApexCharts(document.querySelector("#monthly-chart"), {
                chart: { 
                    type: 'bar', 
                    height: 250,
                    stacked: false,
                    toolbar: { show: true }
                },
                series: [
                    { name: 'Allocated', data: monthlyData.allocated },
                    { name: 'Utilized', data: monthlyData.utilized }
                ],
                xaxis: { categories: monthlyData.categories },
                yaxis: {
                    labels: {
                        formatter: function(val) {
                            return '₹' + (val/10000000).toFixed(1) + ' Cr';
                        }
                    }
                },
                colors: ['#3B82F6', '#10B981'],
                plotOptions: {
                    bar: {
                        horizontal: false,
                        columnWidth: '70%',
                        endingShape: 'rounded'
                    },
                },
                dataLabels: { enabled: false },
                legend: { position: 'top' },
                tooltip: {
                    y: {
                        formatter: function(val) {
                            return '₹' + val.toLocaleString('en-IN');
                        }
                    }
                }
            });
            monthlyChart.render();

            // Budget vs Actual Chart (sample data - replace with actual)
            const budgetData = {
                categories: @json($departments->pluck('name')),
                budget: @json($departments->pluck('budget')->map(fn($b) => (float)$b)),
                actual: @json($departments->pluck('budget')->map(fn($b) => (float)$b * 0.7)) // 70% of budget as sample
            };

            const budgetChart = new ApexCharts(document.querySelector("#budget-actual-chart"), {
                chart: { 
                    type: 'bar', 
                    height: 250,
                    toolbar: { show: true }
                },
                series: [
                    { name: 'Budget', data: budgetData.budget },
                    { name: 'Actual', data: budgetData.actual }
                ],
                xaxis: { categories: budgetData.categories },
                yaxis: {
                    labels: {
                        formatter: function(val) {
                            return '₹' + (val/10000000).toFixed(1) + ' Cr';
                        }
                    }
                },
                colors: ['#3B82F6', '#F59E0B'],
                plotOptions: {
                    bar: {
                        horizontal: false,
                        columnWidth: '70%',
                        endingShape: 'rounded'
                    },
                },
                dataLabels: { enabled: false },
                legend: { position: 'top' },
                tooltip: {
                    y: {
                        formatter: function(val) {
                            return '₹' + val.toLocaleString('en-IN');
                        }
                    }
                }
            });
            budgetChart.render();

            // Chart type switching functionality
            document.querySelectorAll('.chart-type').forEach(item => {
                item.addEventListener('click', function(e) {
                    e.preventDefault();
                    const type = this.getAttribute('data-type');
                    const chartContainer = this.closest('.card').querySelector('.card-body div');
                    const chartId = chartContainer.id;
                    let chart;
                    
                    // Determine which chart to update
                    switch(chartId) {
                        case 'department-chart':
                            chart = deptChart;
                            break;
                        case 'component-chart':
                            chart = compChart;
                            break;
                        case 'project-chart':
                            chart = projChart;
                            break;
                        case 's-curve-chart':
                            chart = scurveChart;
                            break;
                        case 'monthly-chart':
                            chart = monthlyChart;
                            break;
                        case 'budget-actual-chart':
                            chart = budgetChart;
                            break;
                    }
                    
                    // Update chart type with animation
                    chart.updateOptions({
                        chart: { type: type },
                        animations: { enabled: true }
                    });
                    
                    // Update dropdown icon
                    const iconMap = {
                        'pie': 'chart-pie',
                        'donut': 'chart-pie',
                        'bar': 'chart-bar',
                        'line': 'chart-line',
                        'area': 'chart-area',
                        'radial': 'chart-pie',
                        'scatter': 'chart-scatter',
                        'radar': 'chart-radar',
                        'heatmap': 'table'
                    };
                    
                    const dropdownBtn = this.closest('.dropdown').querySelector('.dropdown-toggle');
                    const icon = dropdownBtn.querySelector('i');
                    icon.className = `fas fa-${iconMap[type] || 'chart-bar'}`;
                });
            });

            // Export functionality
            document.getElementById('export-pdf').addEventListener('click', function(e) {
                e.preventDefault();
                // Implement PDF export using jsPDF and html2canvas
                alert('PDF export functionality would be implemented here');
            });
            
            document.getElementById('export-image').addEventListener('click', function(e) {
                e.preventDefault();
                // Implement image export using html2canvas
                alert('Image export functionality would be implemented here');
            });
            
            document.getElementById('export-csv').addEventListener('click', function(e) {
                e.preventDefault();
                // Implement CSV export
                alert('CSV export functionality would be implemented here');
            });
        });
    </script>

    <style>
        .card {
            border-radius: 0.5rem;
            overflow: hidden;
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        }
        .card-header {
            font-weight: 600;
            padding: 0.75rem 1.25rem;
        }
        .bg-purple {
            background-color: #8B5CF6 !important;
        }
        .bg-orange {
            background-color: #F97316 !important;
        }
        .chart-options .dropdown-toggle {
            padding: 0.15rem 0.5rem;
            font-size: 0.75rem;
        }
        .table th {
            font-weight: 500;
            font-size: 0.75rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        .table td {
            font-size: 0.85rem;
        }
        .apexcharts-tooltip {
            box-shadow: 0 4px 20px rgba(0,0,0,0.15) !important;
            border-radius: 0.5rem !important;
        }
    </style>
<<<<<<< Updated upstream
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
</x-app-layout>