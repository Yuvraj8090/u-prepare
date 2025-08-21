@props([
    'id' => 'chart_table',
    'title' => 'Chart & Table',
    'headers' => [], // Table headers
    'rows' => [], // Table rows (array of arrays)
    'labels' => [], // Chart labels
    'data' => [], // Chart data
    'chartTypes' => ['PieChart', 'BarChart', 'ColumnChart', 'LineChart'],
    'excel' => true,
    'print' => true,
    'pageLength' => 10,
    'lengthMenu' => [5, 10, 25, 50, -1],
    'lengthMenuLabels' => ['5', '10', '25', '50', 'All'],
    'searchPlaceholder' => 'Search...',
    'resourceName' => 'entries',
])

<div class="row">
    <div class="col-12">
        <div class="card shadow mb-4">
            <div class="card-header d-flex justify-content-between align-items-center bg-success text-white">
                <h5 class="mb-0 h1">{{ $title }}</h5>
                <select class="form-select form-select-sm w-auto bg-light text-dark"
                    onchange="drawChart_{{ $id }}(this.value)">
                    @foreach ($chartTypes as $type)
                        <option value="{{ $type }}">{{ $type }}</option>
                    @endforeach
                </select>
            </div>

            <div class="card-body">
                <div class="row">
                    <!-- Chart -->
                    <div class="col-md-12 mb-4">
                        <div id="{{ $id }}_chart" style="height:400px;"></div>
                    </div>

                    <!-- Data Table Component -->
                    <div class="col-md-12">
                        <x-admin.data-table 
                            :id="$id.'_table'"
                            :headers="$headers"
                            :excel="$excel"
                            :print="$print"
                            :pageLength="$pageLength"
                            :lengthMenu="$lengthMenu"
                            :lengthMenuLabels="$lengthMenuLabels"
                            :title="$title"
                            :searchPlaceholder="$searchPlaceholder"
                            :resourceName="$resourceName"
                        >
                            @foreach ($rows as $row)
                                <tr>
                                    @foreach ($row as $col)
                                        <td>{{ $col }}</td>
                                    @endforeach
                                </tr>
                            @endforeach
                        </x-admin.data-table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Google Charts -->
<script type="text/javascript">
    google.charts.load('current', { packages: ['corechart'] });
    google.charts.setOnLoadCallback(init_{{ $id }});

    let data_{{ $id }};

    function init_{{ $id }}() {
        if (!@json($labels).length) return;

        let headers = ['Label', 'Value'];
        let rows = [
            @foreach ($labels as $i => $label)
                ['{{ $label }}', {{ $data[$i] ?? 0 }}]
                @if (!$loop->last),@endif
            @endforeach
        ];

        data_{{ $id }} = google.visualization.arrayToDataTable([headers, ...rows]);
        drawChart_{{ $id }}('{{ $chartTypes[0] }}');
    }

    function drawChart_{{ $id }}(chartType) {
        if (!data_{{ $id }}) return;
        let chart;
        const options = {
            title: '{{ $title }}',
            width: '100%',
            height: 400
        };

        switch (chartType) {
            case 'PieChart':
                chart = new google.visualization.PieChart(document.getElementById('{{ $id }}_chart'));
                options.pieHole = 0.3;
                break;
            case 'BarChart':
                chart = new google.visualization.BarChart(document.getElementById('{{ $id }}_chart'));
                break;
            case 'ColumnChart':
                chart = new google.visualization.ColumnChart(document.getElementById('{{ $id }}_chart'));
                break;
            case 'LineChart':
                chart = new google.visualization.LineChart(document.getElementById('{{ $id }}_chart'));
                break;
        }
        chart.draw(data_{{ $id }}, options);
    }
</script>
