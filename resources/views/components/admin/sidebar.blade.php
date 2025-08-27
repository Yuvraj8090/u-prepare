<style>
    ul.nav.side-menu li a {
        font-size: 15px !important;
        padding: 8px 12px !important;
        display: flex;
        align-items: center;
    }

    ul.nav.child_menu li {
        padding-left: 30px !important;
        font-size: 14px;
    }

    .nav.side-menu i {
        width: 20px;
        text-align: center;
        margin-right: 8px;
    }
</style>

@php
    $user = auth()->user();
@endphp

<div class="col-md-3 left_col menu_fixed">
    <div class="left_col scroll-view">

        <!-- Logo -->
        <div class="navbar nav_title">
            <a href="{{ route('dashboard') }}" class="site_title">
                <i class="fa fa-institution"></i> <span>{{ env('APP_NAME') }}</span>
            </a>
        </div>

        <!-- Profile -->
        <div class="profile clearfix text-center mt-3">
            @php
                $nameParts = explode(' ', trim($user->name));
                $initials =
                    count($nameParts) > 1
                        ? strtoupper($nameParts[0][0] . $nameParts[1][0])
                        : strtoupper(substr($nameParts[0], 0, 2));
            @endphp

            <img id="profileImage" style="height:150px; width:auto; display: block; margin: 0 auto;"
                src="{{ $user->profile_photo_url }}" alt="Profile" class="img-circle profile_img h-30"
                onerror="this.style.display='none'; document.getElementById('initialsDiv').style.display='flex';">

            <div id="initialsDiv"
                style="height:50px; width:50px; background-color: #ADD8E6; color: white; border-radius: 50%;
                font-size: 25px; font-weight: bold; display: none; align-items: center; justify-content: center;
                margin: 0 auto; user-select:none;">
                {{ $initials }}
            </div>

            <h5 class="mt-2">{{ ucfirst($user->name) }}</h5>
        </div>

        <br />
        <div class="mx-2">
            <button id="clearCacheBtn" class="btn btn-primary w-100 mt-3">🔄 Clear Cache</button>
            <div id="cacheResult" class="mt-2 text-sm "></div>
        </div>

        <script>
            document.getElementById('clearCacheBtn').addEventListener('click', function() {
                if (!confirm('Are you sure you want to clear the website cache?')) return;

                fetch('{{ route('admin.clear.cache') }}', {
                        method: 'POST',
                        headers: {
                            'X-CSRF-TOKEN': '{{ csrf_token() }}',
                            'Accept': 'application/json',
                            'Content-Type': 'application/json'
                        },
                    })
                    .then(response => response.json())
                    .then(data => {
                        const resultDiv = document.getElementById('cacheResult');
                        resultDiv.style.color = 'white';

                        if (data.status === 'success') {
                            resultDiv.textContent = (data.message || 'Cache cleared successfully.') +
                                ' Page will reload in 2 seconds...';
                            setTimeout(() => location.reload(), 2000);
                        } else {
                            resultDiv.textContent = data.message || 'Something went wrong.';
                        }
                    })
                    .catch(() => {
                        const resultDiv = document.getElementById('cacheResult');
                        resultDiv.textContent = 'Request failed.';
                        resultDiv.style.color = 'red';
                    });
            });
        </script>

        <!-- Sidebar Menu -->
        <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
            <div class="menu_section">
                <ul class="nav side-menu">

                    {{-- Dashboard --}}
                    @if (canRoute('dashboard'))
                        <li class="{{ request()->routeIs('dashboard') ? 'active' : '' }}">
                            <a href="{{ route('dashboard') }}"><i class="fa fa-home"></i> Dashboard</a>
                        </li>
                    @endif

                    {{-- Packages --}}
                    @if (canRoute('admin.procurement-details.index') || canRoute('admin.package-projects.index') || canRoute('admin.procurement-work-programs.index') || canRoute('admin.contracts.index'))
                        <li class="{{ request()->routeIs('admin.procurement-details.*') || request()->routeIs('admin.package-projects.*') ||request()->routeIs('admin.package-project-assignments.*') || request()->routeIs('admin.procurement-work-programs.*') ? 'active' : '' }}">
                            <a><i class="fa fa-book"></i> Packages <span class="fa fa-chevron-down"></span></a>
                            <ul class="nav child_menu">
                                @if (canRoute('admin.package-projects.index'))
                                    <li><a href="{{ route('admin.package-projects.index') }}"><i class="fa fa-archive"></i> Create Packages</a></li>
                                @endif
                                @if (canRoute('admin.procurement-details.index'))
                                    <li><a href="{{ route('admin.procurement-details.index') }}"><i class="fa fa-list"></i> Procurement Details</a></li>
                                @endif
                                @if (canRoute('admin.contracts.index'))
                                    <li><a href="{{ route('admin.contracts.index') }}"><i class="fa fa-list"></i> Manage Contracts</a></li>
                                @endif
                                @if (canRoute('admin.package-project-assignments.index'))
                                    <li><a href="{{ route('admin.package-project-assignments.index') }}"><i class="fa fa-list"></i> Assignments</a></li>
                                @endif
                            </ul>
                        </li>
                    @endif

                    {{-- Safeguard --}}
                    @if (canRoute('admin.safeguard-compliances.index') || canRoute('admin.safeguard_entries.index') || canRoute('admin.social_safeguard_entries.index'))
                        <li>
                            <a><i class="fa fa-shield-alt"></i> Safeguard <span class="fa fa-chevron-down"></span></a>
                            <ul class="nav child_menu">
                                @if (canRoute('admin.safeguard-compliances.index'))
                                    <li><a href="{{ route('admin.safeguard-compliances.index') }}"><i class="fa fa-check-circle"></i> Compliance</a></li>
                                @endif
                                @if (canRoute('admin.safeguard_entries.index'))
                                    <li><a href="{{ route('admin.safeguard_entries.index') }}"><i class="fa fa-shield"></i> Safeguard Entries</a></li>
                                @endif
                                @if (canRoute('admin.social_safeguard_entries.index'))
                                    <li><a href="{{ route('admin.social_safeguard_entries.index') }}"><i class="fa fa-users"></i> Social Safeguards</a></li>
                                @endif
                            </ul>
                        </li>
                    @endif

                    {{-- Progress Updates --}}
                    @if (canRoute('admin.financial-progress-updates.index2') || canRoute('admin.physical_boq_progress.index') || canRoute('admin.physical_epc_progress.index'))
                        <li class="{{ request()->routeIs('admin.financial-progress-updates.*') || request()->routeIs('admin.physical_boq_progress.*') || request()->routeIs('admin.physical_epc_progress.*') ? 'active' : '' }}">
                            <a><i class="fa fa-chart-line"></i> Progress Updates <span class="fa fa-chevron-down"></span></a>
                            <ul class="nav child_menu">
                                @if (canRoute('admin.financial-progress-updates.index2'))
                                    <li><a href="{{ route('admin.financial-progress-updates.index2') }}"><i class="fa fa-coins"></i> Financial Progress</a></li>
                                @endif
                                @if (canRoute('admin.physical_boq_progress.index'))
                                    <li><a href="{{ route('admin.physical_boq_progress.index') }}"><i class="fa fa-cubes"></i> Physical BOQ Progress</a></li>
                                @endif
                                @if (canRoute('admin.physical_epc_progress.index'))
                                    <li><a href="{{ route('admin.physical_epc_progress.index') }}"><i class="fa fa-industry"></i> Physical EPC Progress</a></li>
                                @endif
                            </ul>
                        </li>
                    @endif

                    {{-- BOQ Entry --}}
                    @if (canRoute('admin.boqentry.index') || canRoute('admin.boqentry.create'))
                        <li class="{{ request()->routeIs('admin.boqentry.*') ? 'active' : '' }}">
                            <a><i class="fa fa-file-alt"></i> BOQ Entry <span class="fa fa-chevron-down"></span></a>
                            <ul class="nav child_menu">
                                @if (canRoute('admin.boqentry.index'))
                                    <li><a href="{{ route('admin.boqentry.index') }}"><i class="fa fa-list"></i> List BOQ</a></li>
                                @endif
                                @if (canRoute('admin.boqentry.create'))
                                    <li><a href="{{ route('admin.boqentry.create') }}"><i class="fa fa-plus-circle"></i> Create BOQ</a></li>
                                @endif
                            </ul>
                        </li>
                    @endif

                    {{-- EPC --}}
                    @if (canRoute('admin.epcentry_data.index') || canRoute('admin.epcentry_data.create') || canRoute('admin.already_define_epc.index'))
                        <li class="{{ request()->routeIs('admin.epcentry_data.*') || request()->routeIs('admin.already_define_epc.*') ? 'active' : '' }}">
                            <a><i class="fa fa-industry"></i> EPC <span class="fa fa-chevron-down"></span></a>
                            <ul class="nav child_menu">
                                @if (canRoute('admin.epcentry_data.index'))
                                    <li><a href="{{ route('admin.epcentry_data.index') }}"><i class="fa fa-list"></i> EPC Entries</a></li>
                                @endif
                                @if (canRoute('admin.epcentry_data.create'))
                                    <li><a href="{{ route('admin.epcentry_data.create') }}"><i class="fa fa-plus-circle"></i> Add EPC</a></li>
                                @endif
                                @if (canRoute('admin.already_define_epc.index'))
                                    <li><a href="{{ route('admin.already_define_epc.index') }}"><i class="fa fa-check"></i> Already Defined EPC</a></li>
                                @endif
                            </ul>
                        </li>
                    @endif

                    {{-- Work Services --}}
                    @if (canRoute('admin.work_services.index'))
                        <li class="{{ request()->routeIs('admin.work_services.*') ? 'active' : '' }}">
                            <a href="{{ route('admin.work_services.index') }}"><i class="fa fa-cogs"></i> Work Services</a>
                        </li>
                    @endif

                    {{-- Contraction Phases --}}
                    @if (canRoute('admin.contraction-phases.index'))
                        <li class="{{ request()->routeIs('admin.contraction-phases.*') ? 'active' : '' }}">
                            <a href="{{ route('admin.contraction-phases.index') }}"><i class="fa fa-project-diagram"></i> Contraction Phases</a>
                        </li>
                    @endif

                    {{-- Admin Panel --}}
                    @if (canRoute('admin.users.index') || canRoute('admin.roles.index') || canRoute('admin.role_routes.index') || canRoute('admin.departments.index') || canRoute('admin.package-components.index') || canRoute('admin.designations.index') || canRoute('admin.projects-category.index') || canRoute('admin.contractors.index'))
                        <li class="{{ request()->routeIs('admin.users.*') || request()->routeIs('admin.roles.*') || request()->routeIs('admin.role_routes.*') || request()->routeIs('admin.departments.*') || request()->routeIs('admin.package-components.*') || request()->routeIs('admin.designations.*') || request()->routeIs('admin.projects-category.*') || request()->routeIs('admin.contractors.*') ? 'active' : '' }}">
                            <a><i class="fa fa-user-shield"></i> Admin Panel <span class="fa fa-chevron-down"></span></a>
                            <ul class="nav child_menu">
                                @if (canRoute('admin.users.index'))
                                    <li><a href="{{ route('admin.users.index') }}"><i class="fa fa-user"></i> Users</a></li>
                                @endif
                                @if (canRoute('admin.roles.index'))
                                    <li><a href="{{ route('admin.roles.index') }}"><i class="fa fa-id-badge"></i> Roles</a></li>
                                @endif
                                @if (canRoute('admin.role_routes.index'))
                                    <li><a href="{{ route('admin.role_routes.index') }}"><i class="fa fa-id-badge"></i> Permission Routes</a></li>
                                @endif
                                @if (canRoute('admin.designations.index'))
                                    <li><a href="{{ route('admin.designations.index') }}"><i class="fa fa-briefcase"></i> Designations</a></li>
                                @endif
                                @if (canRoute('admin.projects-category.index'))
                                    <li><a href="{{ route('admin.projects-category.index') }}"><i class="fa fa-tags"></i> Project Categories</a></li>
                                @endif
                                @if (canRoute('admin.departments.index'))
                                    <li><a href="{{ route('admin.departments.index') }}"><i class="fa fa-building"></i> Departments</a></li>
                                @endif
                                @if (canRoute('admin.package-components.index'))
                                    <li><a href="{{ route('admin.package-components.index') }}"><i class="fa fa-cubes"></i> Components</a></li>
                                @endif
                                @if (canRoute('admin.contractors.index'))
                                    <li><a href="{{ route('admin.contractors.index') }}"><i class="fa fa-user-tie"></i> Contractors</a></li>
                                @endif
                            </ul>
                        </li>
                    @endif

                    {{-- Media --}}
                    @if (canRoute('admin.media.index') || canRoute('admin.media.gallery'))
                        <li class="{{ request()->routeIs('admin.media.*') ? 'active' : '' }}">
                            <a><i class="fa fa-photo-video"></i> Media <span class="fa fa-chevron-down"></span></a>
                            <ul class="nav child_menu">
                                @if (canRoute('admin.media.index'))
                                    <li><a href="{{ route('admin.media.index') }}"><i class="fa fa-folder"></i> Media Files</a></li>
                                @endif
                                @if (canRoute('admin.media.gallery'))
                                    <li><a href="{{ route('admin.media.gallery') }}"><i class="fa fa-images"></i> Gallery</a></li>
                                @endif
                            </ul>
                        </li>
                    @endif

                    {{-- Type of Procurements --}}
                    @if (canRoute('admin.type-of-procurements.index'))
                        <li class="{{ request()->routeIs('admin.type-of-procurements.*') ? 'active' : '' }}">
                            <a href="{{ route('admin.type-of-procurements.index') }}"><i class="fa fa-list-alt"></i> Packages Type</a>
                        </li>
                    @endif

                    {{-- Super Admin --}}
                    @if (canRoute('admin.project.index'))
                        <li class="{{ request()->routeIs('admin.project.*') ? 'active' : '' }}">
                            <a><i class="fa fa-industry"></i> Super Admin <span class="fa fa-chevron-down"></span></a>
                            <ul class="nav child_menu">
                                <li><a href="{{ route('admin.project.index') }}"><i class="fa fa-tasks"></i> Projects</a></li>
                            </ul>
                        </li>
                    @endif

                    {{-- Website Management --}}
                    @if (canRoute('admin.pages.list') || canRoute('admin.slides.index') || canRoute('admin.leaders.index') || canRoute('admin.videos.index') || canRoute('admin.navbar-items.index'))
                        <li class="{{ request()->routeIs('admin.pages.*') || request()->routeIs('admin.navbar-items.*') || request()->routeIs('admin.slides.*') || request()->routeIs('admin.leaders.*') || request()->routeIs('admin.videos.*') ? 'active' : '' }}">
                            <a><i class="fa fa-industry"></i> Website Management <span class="fa fa-chevron-down"></span></a>
                            <ul class="nav child_menu">
                                @if (canRoute('admin.pages.list'))
                                    <li><a href="{{ route('admin.pages.list') }}"><i class="fa fa-file-alt"></i> Pages</a></li>
                                @endif
                                @if (canRoute('admin.slides.index'))
                                    <li><a href="{{ route('admin.slides.index') }}"><i class="fa fa-file-alt"></i> Slides Management</a></li>
                                @endif
                                @if (canRoute('admin.leaders.index'))
                                    <li><a href="{{ route('admin.leaders.index') }}"><i class="fas fa-user-tie"></i> Leaders Management</a></li>
                                @endif
                                @if (canRoute('admin.videos.index'))
                                    <li><a href="{{ route('admin.videos.index') }}"><i class="fas fa-video"></i> Videos Management</a></li>
                                @endif
                                @if (canRoute('admin.navbar-items.index'))
                                    <li><a href="{{ route('admin.navbar-items.index') }}"><i class="fa fa-bars"></i> Navbar Items</a></li>
                                @endif
                            </ul>
                        </li>
                    @endif

                </ul>
            </div>
        </div>

        <!-- Footer -->
        <div class="sidebar-footer hidden-small">
            <a data-toggle="tooltip" title="Logout" href="#"
                onclick="event.preventDefault(); document.getElementById('logout-form').submit();">
                <span class="glyphicon glyphicon-off"></span>
            </a>
            <form id="logout-form" action="{{ url('logout') }}" method="POST" class="d-none">@csrf</form>
        </div>

    </div>
</div>
