<x-guest-layout>

    <style>
        main {
            display: flex;
            align-items: center;
            min-height: calc(100vh - 437px);
        }

        [type="checkbox"] {
            height: 1rem;
            widows: 1rem;
            display: inline-block;
            border-width: 1px;
            background-color: #f3f4f6;
            background-origin: border-box;
        }

        .login-sideimg {
            width: 90%;
            height: 520px;
            position: relative;
        }

        .login-sideimg>img {
            position: absolute;
            object-fit: cover;
        }

        .login-card {
            border: 4px solid black;
            background: #f3f4f6;
        }

        .login-head>h2 {
            font-size: 1.5rem;
        }

        .login-head>h4 {
            font-size: 1rem;
        }

        .login-body {
            min-width: 380px;
            border-radius: 6px;
        }

        .text-sm {
            font-size: .875rem;
            line-height: 1.25rem
        }

        .text-xs {
            font-size: .75rem;
            line-height: 1rem;
        }

        .text-gray-600 {
            --tw-text-opacity: 1;
            color: rgb(75 85 99 / var(--tw-text-opacity))
        }

        .rounded-md {
            border-radius: .375rem;
        }

        .bg-gray-800,
        .bg-gray-800:active {
            --tw-bg-opacity: 1;
            background-color: rgb(31 41 55 / var(--tw-bg-opacity));
        }

        .bg-gray-800:hover {
            --tw-bg-opacity: 1;
            background-color: rgb(55 65 81 / var(--tw-bg-opacity));
        }

        .uppercase {
            text-transform: uppercase;
        }

        .underline {
            text-decoration-line: underline
        }

        .inline-flex {
            display: inline-flex;
        }

        .items-center {
            align-items: center;
        }

        .ml-3 {
            margin-left: 1rem !important;
        }

        .border-gray-300 {
            --tw-border-opacity: 1;
            border-color: rgb(209 213 219 / var(--tw-border-opacity));
        }

        .shadow-sm {
            --tw-shadow: 0 1px 2px 0 rgb(0 0 0 / .05);
            --tw-shadow-colored: 0 1px 2px 0 var(--tw-shadow-color);
            box-shadow: var(--tw-ring-offset-shadow, 0 0 #0000), var(--tw-ring-shadow, 0 0 #0000), var(--tw-shadow);
        }

        .text-indigo-600 {
            --tw-text-opacity: 1;
            color: rgb(79 70 229 / var(--tw-text-opacity));
        }

        .border-gray-300 {
            --tw-border-opacity: 1;
            border-color: rgb(209 213 219 / var(--tw-border-opacity));
        }

        .prel {
            position: relative;
        }

        .shp {
            top: 31px;
            right: 2px;
            cursor: pointer;
            padding: 4px 10px;
            position: absolute;
        }

        button.btn-login {
            color: var(--color-tblue) !important;
            background: white;
            transition: all 300ms ease-in;
            border-color: var(--color-tblue) !important;
        }

        button.btn-login:hover {
            color: white !important;
            background: var(--color-theme);
        }
    </style>

    <div class="container py-3">
        <div class="row">
            <div class="col-lg-5">
                <div class="login-sideimg">
                    <img class="w-100 h-100" src="{{ asset('assets/public/img/mis-login.jpeg') }}">
                </div>
            </div>

            <div class="col-lg-7">
                <div class="login-card h-100 d-flex flex-column align-items-center justify-content-center">
                    <div class="login-head text-center mb-3">
                        <h4>Uttarakhand Disaster Preparedness and Resilience Project</h4>
                        <h2 class="mb-0">(U-PREPARE)</h2>
                    </div>

                    <div class="login-body bg-white px-4 py-3">
                        <!-- Session Status -->

                        <x-validation-errors class="mb-4" />

                        @if (session('status'))
                            <div class="mb-4 font-medium text-sm text-green-600">
                                {{ session('status') }}
                            </div>
                        @endif

                        <form method="POST" action="{{ route('login') }}">
                            @csrf

                            <div>
                                <x-label for="login" value="{{ __('Email or Username') }}" />
                                <x-input id="login" class="block mt-1 w-full" type="text" name="login"
                                    :value="old('login')" required autofocus autocomplete="username" />
                            </div>

                            <div class="mt-4">
                                <x-label for="password" value="{{ __('Password') }}" />
                                <x-input id="password" class="block mt-1 w-full" type="password" name="password"
                                    required autocomplete="current-password" />
                            </div>

                            

                            <div class="d-flex items-center justify-content-between mt-4">
                                <label for="remember_me" class="flex items-center">
                                    <x-checkbox id="remember_me" name="remember" />
                                    <span class="ms-2 text-sm text-gray-600">{{ __('Remember me') }}</span>
                                </label>

                                <x-button class="btn-theme ms-4 ">
                                    {{ __('Log in') }}
                                </x-button>
                            </div>
                        </form>
                    </div>


                </div>

            </div>
        </div>
    </div>
    <script>
        $('.shp').on('click', function() {
            let $eye = $(this);
            let $inp = $eye.next();
            $eye.toggleClass('bi-eye');

            let $inpt = $eye.hasClass('bi-eye') ? 'text' : 'password';

            $inp.attr('type', $inpt);
        })
    </script>

</x-guest-layout>