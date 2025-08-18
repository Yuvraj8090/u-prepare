@props([
    'title' => 'Chart Title',
    'labels' => [],
    'data' => [],
    'chartTypes' => ['PieChart', 'BarChart', 'ColumnChart', 'LineChart'],
])

<div class="card mb-4 shadow-sm">
    <div class="card-header d-flex justify-content-between align-items-center">
        <h5 class="mb-0">{{ $title }}</h5>
        <select class="form-select form-select-sm w-auto" onchange="drawChart_{{ $attributes->get('id') }}(this.value)">
            @foreach($chartTypes as $type)
                <option value="{{ $type }}">{{ $type }}</option>
            @endforeach
        </select>
    </div>
    <div class="card-body">
        <div id="{{ $attributes->get('id') }}_chart" style="height:400px;"></div>
        <div id="{{ $attributes->get('id') }}_table" style="margin-top:20px;"></div>
    </div>
</div>

<script type="text/javascript">
    google.charts.load('current', { packages: ['corechart', 'table'] });
    google.charts.setOnLoadCallback(init_{{ $attributes->get('id') }});

    let data_{{ $attributes->get('id') }};

    function init_{{ $attributes->get('id') }}() {
        data_{{ $attributes->get('id') }} = google.visualization.arrayToDataTable([
            ['Label', 'Value'],
            @foreach($labels as $i => $label)
                ['{{ $label }}', {{ $data[$i] ?? 0 }}]@if(!$loop->last),@endif
            @endforeach
        ]);

        drawChart_{{ $attributes->get('id') }}('{{ $chartTypes[0] }}');

        // Draw Table
        const table = new google.visualization.Table(document.getElementById('{{ $attributes->get('id') }}_table'));
        table.draw(data_{{ $attributes->get('id') }}, { showRowNumber: true, width: '100%', height: '200px' });
    }

    function drawChart_{{ $attributes->get('id') }}(chartType) {
        let chart;
        const options = { title: '{{ $title }}', width: '100%', height: 400 };

        switch(chartType) {
            case 'PieChart':
                chart = new google.visualization.PieChart(document.getElementById('{{ $attributes->get('id') }}_chart'));
                options.pieHole = 0.4;
                break;
            case 'BarChart':
                chart = new google.visualization.BarChart(document.getElementById('{{ $attributes->get('id') }}_chart'));
                break;
            case 'ColumnChart':
                chart = new google.visualization.ColumnChart(document.getElementById('{{ $attributes->get('id') }}_chart'));
                break;
            case 'LineChart':
                chart = new google.visualization.LineChart(document.getElementById('{{ $attributes->get('id') }}_chart'));
                break;
            default:
                chart = new google.visualization.PieChart(document.getElementById('{{ $attributes->get('id') }}_chart'));
        }

        chart.draw(data_{{ $attributes->get('id') }}, options);
    }
</script>

