<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name') }}</title>

    <link rel="icon" href="" type="image/ico" />
    <link rel="stylesheet" href="{{ asset('asset/vendors/bootstrap/dist/css/bootstrap.min.css') }}">
    <link rel="stylesheet" href="{{ asset('asset/vendors/font-awesome/css/font-awesome.min.css') }}">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css">
    <link rel="stylesheet" href="{{ asset('asset/build/css/custom.min.css') }}?ver=1.5.1">
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
     <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/select2-bootstrap-5-theme@1.3.0/dist/select2-bootstrap-5-theme.min.css"
        rel="stylesheet" />

         <script src="https://cdnjs.cloudflare.com/ajax/libs/tinymce/6.8.2/tinymce.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet">

    <style>
        .form-group {
            position: relative;
        }

        body {
            zoom: 75%;
        }

        input[type=number]::-webkit-outer-spin-button,
        input[type=number]::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }

        input[type=number] {
            -moz-appearance: textfield;
        }

        input[type="file"] {
            cursor: pointer;
        }

        input[type="checkbox"]+label {
            cursor: pointer;
        }

        .d-flex {
            display: flex;
        }

        .d-flex.colm {
            flex-direction: column;
        }

        .d-flex.center {
            align-items: center;
            justify-content: center;
        }

        .d-flex.aic {
            align-items: center;
        }

        .d-flex.jcse {
            justify-content: flex-end;
        }

        :root {
            --clr-err: #f62447;
            --clr-info: #009eff;
            --clr-warn: #ffc800;
        }

        .popup.fixed {
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            z-index: 1050;
            display: none;
            position: fixed;
            background: rgba(0, 0, 0, 0.4);
        }

        .popup.busy img {
            width: 36px;
        }

        .popup.dialog>.box {
            border: none;
            height: auto;
            padding: 0;
            min-width: 480px;
            border-top: 6px solid black;
            box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.75);
            border-radius: 4px;
        }

        .dialog .box .content {
            border-bottom: 1px solid gray;
            padding: 10px 15px;
        }

        .dialog .box .content .img {
            /* width: 52px;
                font-size: 48px; */
        }

        .dialog .box.err .content .img {
            color: var(--clr-err);
        }

        .dialog .box.info .content .img {
            color: var(--clr-info);
        }

        .dialog .box.warn .content .img {
            color: var(--clr-warn);
        }

        .dialog .box .content .img>img {
            width: 64px;
            height: 64px;
        }

        .dialog .box .content h1 {
            font-size: 2em;
        }

        .dialog .box .foot {
            padding: 10px 15px;
        }

        .dialog .box .foot button {
            margin: 0;
            border: 1px solid gray;
            padding: 6px 25px;
            transition: 200ms ease-in-out;
            line-height: normal;
            border-radius: 2px;
        }

        .dialog .box .foot button:hover {
            color: white;
            background: gray;
        }

        .dialog .box.err {
            border-color: var(--clr-err);
        }

        .dialog .box.warn {
            border-color: var(--clr-warn);
        }

        .dialog .box.info {
            border-color: var(--clr-info);
        }

        .dialog .box.info .foot button.btn-ok {
            background: var(--clr-info);
            border-color: var(--clr-info);
        }

        .dialog .box.warn .foot button.btn-ok {
            background: var(--clr-warn);
            border-color: var(--clr-warn);
        }

        .dialog .box.err .foot button.btn-ok {
            color: white;
            background: var(--clr-err);
            border-color: var(--clr-err);
        }

        .dialog .box.err .foot button.btn-ok:hover {
            background: #f70931;
        }

        .dialog .box.info .foot button.btn-ok:hover {
            background: #007cc9;
        }


        .row h4 {
            font-weight: bolder !important;
            text-transform: uppercase;
        }

        .modal-backdrop {
            width: 100% !important;
            height: 100% !important;
        }

        .table tbody tr:hover {
            background-color: #e9ecef;
        }

        .table tr td {
            font-size: 18px !important;
        }

        .table tr th {
            font-size: 18px !important;
        }

        .table thead {
            background-color: green;
            color: white;
            text-align: center;
        }

        .table tr td {
            font-size: 14px;
        }

        .nav>li>a {
            font-size: 16px;
        }

       

        .menu_section h3 {
            font-size: 14px !important;
            margin-bottom: 15px !important;
        }

        label {
            font-size: 15px !important;
        }

        .btn-xs {
            padding: 5px 8px !important;
            font-size: 10px;
        }

        .select {
            font-size: 15px;
            border-radius: 5px;
            padding: 5px 10px;
        }

        .select option {
            background-color: white !important;
            color: black;
        }

        .modal-content {
            border-radius: 1.4rem !important;
        }

        .control-label {
            font-size: 17px !important;
            font-weight: bold !important;
            margin-bottom: 2px;
        }

        .form-control {
            border-radius: 7px !important;
        }

        .form-control.disabled {
            background-color: #e9ecef;
        }

        .custom-toast-width {
            width: 600px !important;
            white-space: nowrap;
            /* Ensure text appears on one line  */
        }

        .x_title h2 {
            font-weight: 500 !important;
            font-size: 25px !important;
        }

        .breadcrumb {
            width: 100% !important;
        }

        .x_title h2 .fa-bars {
            margin-right: 15px !important;
        }

        .form-group {
            margin-bottom: 15px;
        }

        div.dataTables_wrapper div.dataTables_processing {
            display: none !important;
        }

        @media screen and (zoom: 0.75) {
            .ui-datepicker {
                font-size: 12px !important;
            }

            .ui-datepicker {
                zoom: 1.33 !important;
            }

            .ui-datepicker.ui-widget {
                margin-top: -10px !important;
            }
        }
    </style>
    @vite(['resources/css/app.css', 'resources/js/app.js'])
    @livewireStyles
    <!-- Font Awesome 6 Free CDN -->
  
    @yield('header_styles')
</head>

<body class="nav-md">

    <x-loader></x-loader>

    <div class="container body">
        <div class="main_container">

            <x-admin.sidebar></x-admin.sidebar>
            <x-admin.header></x-admin.header>

           <div class="right_col" role="main" style="min-height: 100vh;">
    {{ $slot }}
</div>



@yield('modal')

<!-- loader -->
<x-admin.footer></x-admin.footer>
            <x-admin.loader></x-admin.loader>
        </div>
    </div>

    <link rel="preload" href="{{ asset('assets/img/svg/img_loader.svg') }}" as="image" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <script src="{{ asset('asset/vendors/bootstrap/dist/js/bootstrap.bundle.min.js') }}"></script>

    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap4.min.js"></script>

    <script src="{{ asset('asset/build/js/custom.js') }}"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.4.1/js/dataTables.buttons.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.4.1/js/buttons.html5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.4.1/js/buttons.print.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.min.js"></script>

    <script src="{{ asset('asset/custom.js') }}?ver=1.1.0"></script>

       <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

     <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/air-datepicker@3.5.3/air-datepicker.min.css">
    <script src="{{ asset('assets/js/mis/scripts.js') }}?ver=1.6.2"></script>
    @stack('modals')
    @livewireScripts
    @yield('script')
</body>

</html>

