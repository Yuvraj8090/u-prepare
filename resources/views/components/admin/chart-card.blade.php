@props([
    'title' => 'Chart Title',
    'labels' => [],
    'data' => [],
    'currency' => true
])

<div class="col-md-4 mb-4">
    <div class="card shadow-sm h-100">
        <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
            <span>{{ $title }}</span>
            <div class="dropdown chart-options">
                <button class="btn btn-sm btn-light dropdown-toggle py-0" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                    <i class="fas fa-chart-pie"></i>
                </button>
                <ul class="dropdown-menu dropdown-menu-end">
                    <li><a class="dropdown-item chart-type" data-type="pie">Pie Chart</a></li>
                    <li><a class="dropdown-item chart-type" data-type="donut">Donut Chart</a></li>
                    <li><a class="dropdown-item chart-type" data-type="bar">Bar Chart</a></li>
                    <li><a class="dropdown-item chart-type" data-type="line">Line Chart</a></li>
                    <li><a class="dropdown-item chart-type" data-type="radialBar">Radial Chart</a></li>
                </ul>
            </div>
        </div>

        <div class="card-body">
            <div id="chart-{{ \Illuminate\Support\Str::slug($title) }}" style="min-height:200px !important;height:200px !important"></div>
        </div>

        <div class="card-footer p-2 bg-light">
            <div class="table-responsive">
                <table class="table table-sm table-bordered mb-0">
                    <thead class="table-light">
                        <tr>
                            <th>Label</th>
                            <th class="text-end">Value</th>
                            <th class="text-end">%</th>
                        </tr>
                    </thead>
                    <tbody>
                        @php $total = array_sum($data); @endphp
                        @foreach($data as $key => $value)
                            <tr>
                                <td>{{ $labels[$key] ?? 'N/A' }}</td>
                                <td class="text-end">{{ $currency ? '₹ '.number_format($value,2) : $value }}</td>
                                <td class="text-end">{{ $total > 0 ? number_format(($value/$total)*100,1) : 0 }}%</td>
                            </tr>
                        @endforeach
                        <tr class="fw-bold bg-light">
                            <td>Total</td>
                            <td class="text-end">{{ $currency ? '₹ '.number_format($total,2) : $total }}</td>
                            <td class="text-end">100%</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>



<script src="https://cdn.jsdelivr.net/npm/apexcharts@3.41.0/dist/apexcharts.min.js"></script>

<script>
document.addEventListener('DOMContentLoaded', function(){
    const chartId = "#chart-{{ \Illuminate\Support\Str::slug($title) }}";
    const chartContainer = document.querySelector(chartId);

    // ApexCharts options
    let chartOptions = {
        chart: { type: 'pie', height: 200, animations: { enabled: true }, toolbar: { show: false } },
        series: @json($data),
        labels: @json($labels),
        colors: ['#3B82F6','#10B981','#F59E0B','#6366F1','#EC4899','#14B8A6','#F97316','#8B5CF6'],
        legend: { position:'bottom', fontSize:'12px', itemMargin:{horizontal:8, vertical:4} },
        dataLabels: { enabled:true, formatter: val => val.toFixed(1)+'%', dropShadow:{enabled:false} },
        tooltip: { y: { formatter: val => "{{ $currency ? '₹' : '' }}"+val.toLocaleString('en-IN') } }
    };

    const chart = new ApexCharts(chartContainer, chartOptions);
    chart.render();

    // Chart type switching
    chartContainer.closest('.card').querySelectorAll('.chart-type').forEach(item=>{
        item.addEventListener('click', function(e){
            e.preventDefault();
            const type = this.getAttribute('data-type');
            chart.updateOptions({ chart:{ type:type }, animations:{ enabled:true } });

            // Update icon
            const iconMap = { pie:'chart-pie', donut:'chart-pie', bar:'chart-bar', line:'chart-line', radialBar:'chart-pie' };
            const icon = this.closest('.dropdown').querySelector('i');
            icon.className = `fas fa-${iconMap[type] || 'chart-bar'}`;
        });
    });
});
</script>

