@props([
    'id' => 'dropdownMenu',
    'label' => 'Select',
    'items' => [], // array of ['value' => '', 'label' => '']
    'selected' => null,
    'name' => 'dropdown',
    'required' => false,
    'class' => '',
    'placeholder' => 'Select an option',
    'allowClear' => true,
    'searchable' => true,
])

    <!-- Select2 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    <!-- Select2 Bootstrap Theme -->
    <link href="https://cdn.jsdelivr.net/npm/select2-bootstrap-5-theme@1.3.0/dist/select2-bootstrap-5-theme.min.css" rel="stylesheet" />
    <style>
        .select2-container--bootstrap-5 .select2-selection {
            padding: 0.375rem 0.75rem !important;
            font-size: 1rem !important;
            line-height: 1.5 !important;
            color: #212529 !important;
            background-color: #fff !important;
            border: 1px solid #ced4da !important;
            border-radius: 0.375rem !important;
            transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out !important;
        }
        .select2-container--bootstrap-5 .select2-selection--single {
            height: auto !important;
            min-height: 38px !important;
        }
        .select2-container--bootstrap-5 .select2-selection--multiple {
            min-height: 38px !important;
        }
        .select2-container--bootstrap-5 .select2-selection:focus {
            border-color: #86b7fe !important;
            outline: 0 !important;
            box-shadow: 0 0 0 0.25rem rgba(13, 110, 253, 0.25) !important;
        }
    </style>

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Select2 JS -->
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            $('.select2-component').each(function() {
                $(this).select2({
                    theme: 'bootstrap-5',
                    placeholder: $(this).data('placeholder') || 'Select an option',
                    allowClear: $(this).data('allow-clear') === 'true',
                    minimumResultsForSearch: $(this).data('searchable') === 'true' ? 0 : -1,
                    width: '100%',
                    dropdownParent: $(this).parent()
                });
            });
        });
    </script>

<div class="mb-3">
    <label for="{{ $id }}" class="form-label fw-semibold">
        {{ $label }}{{ $required ? ' *' : '' }}
    </label>
    
    <select
        name="{{ $name }}"
        id="{{ $id }}"
        class="select2-component {{ $class }} @error($name) is-invalid @enderror"
        data-placeholder="{{ $placeholder }}"
        data-allow-clear="{{ $allowClear ? 'true' : 'false' }}"
        data-searchable="{{ $searchable ? 'true' : 'false' }}"
        {{ $required ? 'required' : '' }}
        {{ $attributes }}
    >
        <option value="">{{ $placeholder }}</option>
        @foreach($items as $item)
            <option 
                value="{{ $item['value'] }}" 
                {{ (string)$selected === (string)$item['value'] ? 'selected' : '' }}
                {{ isset($item['disabled']) && $item['disabled'] ? 'disabled' : '' }}
            >
                {{ $item['label'] }}
            </option>
        @endforeach
    </select>

</div>