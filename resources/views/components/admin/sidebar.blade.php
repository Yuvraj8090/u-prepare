<style>
    ul li a {
        font-size: 16px !important;
    }
    .nav.child_menu li {
        padding-left: 22px !important;
    }
</style>

@php
    $user = auth()->user();
@endphp

<div class="col-md-3 left_col menu_fixed">
    <div class="left_col scroll-view">
        <div class="navbar nav_title">
            <a href="{{ route('dashboard') }}" class="site_title">
                <i class="fa fa-institution"></i> <span>{{ env('APP_NAME') }}</span>
            </a>
        </div>

        <div class="profile clearfix text-center mt-3">
            <img style="width: 100px;" src="{{ $user->profile_image }}" alt="..." class="img-circle profile_img">
            <h5 class="mt-2">{{ ucfirst($user->name) }}</h5>
        </div>

        <br />

        <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
            <div class="menu_section active">
                <ul class="nav side-menu">

                    <li><a href="{{ url('/') }}"><i class="fa fa-globe"></i> Visit Website</a></li>
                    <li><a href="{{ route('dashboard') }}"><i class="fa fa-home"></i> Dashboard</a></li>

                    {{-- Project Monitoring --}}
                    <li><a href="{{ route('admin.project.index') }}"><i class="fa fa-tasks"></i> Project Monitoring</a></li>

                    {{-- Manage Projects --}}
                    <li>
                        <a><i class="fa fa-sitemap"></i> Manage Projects <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                            <li><a href="{{ route('admin.project.create') }}">Create</a></li>
                            <li><a href="{{ route('admin.project.index') }}">Edit</a></li>
                        </ul>
                    </li>

                    {{-- Procurement --}}
                   
                        <li>
                            <a><i class="fa fa-book"></i> Procurement <span class="fa fa-chevron-down"></span></a>
                            <ul class="nav child_menu">
                                <li><a href="{{ route('admin.procurement-details.index') }}">Manage Procurements</a></li>
                                <li><a href="{{ route('admin.package-projects.index') }}">Package Projects</a></li>
                                  <li><a href="{{ route('admin.procurement-work-programs.index') }}">Work programs</a></li>
                            </ul>
                        </li>
                   

                    {{-- Reports --}}
                    <li>
                        <a><i class="fa fa-bar-chart"></i> Reports <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                            <li><a href="{{ url('home/report/project-summary-report') }}">Summary</a></li>
                            <li><a href="{{ url('home/report/project-wise-report') }}">Finance - Project Wise</a></li>
                            <li><a href="{{ url('home/report/duration-report') }}">Finance - Duration Wise</a></li>
                            <li><a href="{{ url('home/report/admin-expense-report') }}">Admin Expenses</a></li>
                            <li><a href="{{ url('home/report/procurement-report') }}">Procurement</a></li>
                            <li><a href="{{ url('home/report/contract-report') }}">Contracts</a></li>
                            <li><a href="{{ url('home/report/execution-report') }}">Execution</a></li>
                              </ul>
                    </li>

                    {{-- Grievances --}}
                    <li>
                        <a><i class="fa fa-bullhorn"></i> Grievances <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                            <li><a href="{{ url('mis.grievance.record') }}">Record Grievance</a></li>
                            <li><a href="{{ url('mis.grievance.manage') }}">Manage Grievances</a></li>
                            <li><a href="{{ url('mis.grievances') }}">All Grievances</a></li>
                        </ul>
                    </li>

                    {{-- Role-based Logins --}}
                    @if(in_array($user->role->level, ['TWO', 'THREE', 'FOUR']))
                        <li>
                            <a><i class="fa fa-users"></i> Logins <span class="fa fa-chevron-down"></span></a>
                            <ul class="nav child_menu">
                                <li><a href="{{ url('manage-logins.create') }}">Create</a></li>
                                <li><a href="{{ url('manage-logins.index') }}">Manage</a></li>
                            </ul>
                        </li>
                    @endif

                    {{-- ATR Review --}}
                    <li>
                        <a><i class="fa fa-gear"></i> ATR Review <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                            <li><a href="{{ url('atr.entry.form') }}">Enter Monthly ATR</a></li>
                            <li><a href="{{ url('atr.report') }}">View Monthly ATR</a></li>
                        </ul>
                    </li>

                    {{-- Admin Section --}}
                    @if($user->hasRole('Admin'))
                        <li>
                            <a><i class="fa fa-shield"></i> Admin Panel <span class="fa fa-chevron-down"></span></a>
                            <ul class="nav child_menu">
                                <li><a href="{{ route('admin.users.index') }}">Users</a></li>
                                <li><a href="{{ route('admin.roles.index') }}">Roles</a></li>
                                <li><a href="{{ route('admin.departments.index') }}">Departments</a></li>
                                <li><a href="{{ route('admin.designations.index') }}">Designations</a></li>
                                <li><a href="{{ route('admin.projects-category.index') }}">Project Categories</a></li>
                                <li><a href="{{ url('mis/roles-permissions') }}">Roles Permissions</a></li>
                                <li><a href="{{ url('web-admin') }}">Website Management</a></li>
                            </ul>
                        </li>
                    @endif

                    {{-- Settings --}}
                    <li>
                        <a><i class="fa fa-cog"></i> Settings <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                            <li><a href="{{ url('profile') }}">My Profile</a></li>
                            <li><a href="{{ url('login.change-password') }}">Change Password</a></li>
                        </ul>
                    </li>

                </ul>
            </div>
        </div>

        {{-- Footer --}}
        <div class="sidebar-footer hidden-small">
            <a data-toggle="tooltip" title="Logout" onclick="event.preventDefault(); document.getElementById('logout-form').submit();">
                <span class="glyphicon glyphicon-off"></span>
            </a>
            <form id="logout-form" action="{{ url('logout') }}" method="POST" class="d-none">
                @csrf
            </form>
        </div>
    </div>
</div>
