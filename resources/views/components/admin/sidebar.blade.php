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
                $initials = count($nameParts) > 1
                    ? strtoupper($nameParts[0][0] . $nameParts[1][0])
                    : strtoupper(substr($nameParts[0], 0, 2));
            @endphp

            <img id="profileImage" style="height:150px; width:auto; display: block; margin: 0 auto;"
                src="{{ $user->profile_photo_url }}" alt="Profile" class="img-circle profile_img h-30"
                onerror="this.style.display='none'; document.getElementById('initialsDiv').style.display='flex';">

            <div id="initialsDiv"
                style="height:150px; width:150px; background-color: #ADD8E6; color: white; border-radius: 50%; 
                font-size: 72px; font-weight: bold; display: none; align-items: center; justify-content: center; 
                margin: 0 auto; user-select:none;">
                {{ $initials }}
            </div>

            <h5 class="mt-2">{{ ucfirst($user->name) }}</h5>
        </div>

        <br />

        <!-- Sidebar Menu -->
        <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
            <div class="menu_section active">
                <ul class="nav side-menu">

                    <!-- Dashboard -->
                    <li><a href="{{ route('dashboard') }}"><i class="fa fa-home"></i> Dashboard</a></li>

                    <!-- Pages -->
                    <li><a href="{{ route('admin.pages.list') }}"><i class="fa fa-file-alt"></i> Pages</a></li>

                    <!-- Projects -->
                    <li><a href="{{ route('admin.project.index') }}"><i class="fa fa-tasks"></i> Projects</a></li>

                    <!-- Package Projects -->
                    <li><a href="{{ route('admin.package-projects.index') }}"><i class="fa fa-archive"></i> Package Projects</a></li>

                    <!-- Procurement -->
                    <li>
                        <a><i class="fa fa-book"></i> Procurement <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                            <li><a href="{{ route('admin.procurement-details.index') }}"><i class="fa fa-list"></i> Procurement Details</a></li>
                            <li><a href="{{ route('admin.procurement-work-programs.index') }}"><i class="fa fa-calendar"></i> Work Programs</a></li>
                        </ul>
                    </li>

                    <!-- Contracts -->
                    <li>
                        <a><i class="fa fa-file-contract"></i> Contracts <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                            <li><a href="{{ route('admin.contracts.index') }}"><i class="fa fa-list"></i> Manage Contracts</a></li>
                            <li><a href="{{ route('admin.contractors.index') }}"><i class="fa fa-user-tie"></i> Contractors</a></li>
                        </ul>
                    </li>

                    <!-- Progress Updates -->
                    <li>
                        <a><i class="fa fa-chart-line"></i> Progress Updates <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                            <li><a href="{{ route('admin.financial-progress-updates.index') }}"><i class="fa fa-coins"></i> Financial Progress</a></li>
                            <li><a href="{{ route('admin.physical_boq_progress.index') }}"><i class="fa fa-cubes"></i> Physical BOQ Progress</a></li>
                            <li><a href="{{ route('admin.physical_epc_progress.index') }}"><i class="fa fa-industry"></i> Physical EPC Progress</a></li>
                        </ul>
                    </li>

                    <!-- Safeguard -->
                    <li>
                        <a><i class="fa fa-shield-alt"></i> Safeguard <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                            <li><a href="{{ route('admin.safeguard-compliances.index') }}"><i class="fa fa-check-circle"></i> Compliance</a></li>
                            <li><a href="{{ route('admin.safeguard_entries.index') }}"><i class="fa fa-shield"></i> Safeguard Entries</a></li>
                            <li><a href="{{ route('admin.social_safeguard_entries.index') }}"><i class="fa fa-users"></i> Social Safeguards</a></li>
                        </ul>
                    </li>

                    <!-- BOQ -->
                    <li>
                        <a><i class="fa fa-file-alt"></i> BOQ Entry <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                            <li><a href="{{ route('admin.boqentry.index') }}"><i class="fa fa-list"></i> List BOQ</a></li>
                            <li><a href="{{ route('admin.boqentry.create') }}"><i class="fa fa-plus-circle"></i> Create BOQ</a></li>
                        </ul>
                    </li>

                    <!-- EPC -->
                    <li>
                        <a><i class="fa fa-industry"></i> EPC <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                            <li><a href="{{ route('admin.epcentry_data.index') }}"><i class="fa fa-list"></i> EPC Entries</a></li>
                            <li><a href="{{ route('admin.epcentry_data.create') }}"><i class="fa fa-plus-circle"></i> Add EPC</a></li>
                            <li><a href="{{ route('admin.already_define_epc.index') }}"><i class="fa fa-check"></i> Already Defined EPC</a></li>
                        </ul>
                    </li>

                    <!-- Work Services -->
                    <li><a href="{{ route('admin.work_services.index') }}"><i class="fa fa-cogs"></i> Work Services</a></li>

                    <!-- Admin -->
                    <li>
                        <a><i class="fa fa-user-shield"></i> Admin Panel <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                            <li><a href="{{ route('admin.users.index') }}"><i class="fa fa-user"></i> Users</a></li>
                            <li><a href="{{ route('admin.roles.index') }}"><i class="fa fa-id-badge"></i> Roles</a></li>
                            <li><a href="{{ route('admin.departments.index') }}"><i class="fa fa-building"></i> Departments</a></li>
                            <li><a href="{{ route('admin.designations.index') }}"><i class="fa fa-briefcase"></i> Designations</a></li>
                            <li><a href="{{ route('admin.projects-category.index') }}"><i class="fa fa-tags"></i> Project Categories</a></li>
                        </ul>
                    </li>

                    <!-- Navbar Items -->
                    <li><a href="{{ route('admin.navbar-items.index') }}"><i class="fa fa-bars"></i> Navbar Items</a></li>

                    <!-- Media -->
                    <li>
                        <a><i class="fa fa-photo-video"></i> Media <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                            <li><a href="{{ route('admin.media.index') }}"><i class="fa fa-folder"></i> Media Files</a></li>
                            <li><a href="{{ route('admin.media.gallery') }}"><i class="fa fa-images"></i> Gallery</a></li>
                        </ul>
                    </li>

                    <!-- Settings -->
                    <li>
                        <a><i class="fa fa-cog"></i> Settings <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                            <li><a href="{{ route('profile.show') }}"><i class="fa fa-user-circle"></i> My Profile</a></li>
                        </ul>
                    </li>

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
