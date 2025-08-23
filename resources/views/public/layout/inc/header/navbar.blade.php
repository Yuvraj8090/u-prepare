<nav class="navbar">
    <div class="container-xxl">
        <ul>
            <li>
                <a href="{{ route('welcome.default') }}" @class(['active' => Route::currentRouteName() == 'welcome.default'])>HOME</a>
            </li>

            @php
                $routeName = Route::currentRouteName();
                $pageName  = explode('public.page.', $routeName);
                $pageName  = count($pageName) == 2 ? $pageName[1] : NULL;
            @endphp

            <li class="dropdown">
                <a href="#" @class(['active'=> in_array($pageName, ['about', 'mission', 'history', 'objective', 'structure', 'team'])])>
                    <span>ABOUT</span>
                    <i class="bi bi-chevron-down"></i>
                </a>
                <ul>
                    <li>
                        <a href="{{ route('welcome.default') }}" @class(['active' => $routeName == 'welcome.default'])>About U-PREPARE</a>
                    </li>
                    <li>
                        <a href="{{ route('welcome.default') }}" @class(['active' => $routeName == 'welcome.default'])>Mission and Vision</a>
                    </li>
                    <li>
                        <a href="{{ route('welcome.default') }}" @class(['active' => $routeName == 'welcome.default'])>History</a>
                    </li>
                    <li>
                        <a href="{{ route('welcome.default') }}" @class(['active' => $routeName == 'welcome.default'])>Objectives</a>
                    </li>
                    <li>
                        <a href="{{ route('welcome.default') }}" @class(['active' => $routeName == 'welcome.default'])>Project Structure</a>
                    </li>
                   
                </ul>
            </li>

            <li class="dropdown">
                <a href="#" @class(['active'=> in_array($pageName, ['eninfrares', 'imempres', 'forestfire', 'projmanage', 'conemres'])])>
                    <span>COMPONENTS</span>
                    <i class="bi bi-chevron-down"></i>
                </a>
                <ul>
                    <li>
                        <a href="{{ route('welcome.default') }}" @class(['active' => $routeName == 'welcome.default'])>Enhancing Infrastructure Resilience</a>
                    </li>
                    <li>
                        <a href="{{ route('welcome.default') }}" @class(['active' => $routeName == 'welcome.default'])>Improving Emergency Preparedness and Response</a>
                    </li>
                    <li>
                        <a href="{{ route('welcome.default') }}" @class(['active' => $routeName == 'welcome.default'])>Preventing and Managing Forest and General Fires</a>
                    </li>
                    <li>
                        <a href="{{ route('welcome.default') }}" @class(['active' => $routeName == 'welcome.default'])>Project Management</a>
                    </li>
                    
                </ul>
            </li>

            <li class="dropdown">
                <a href="#" @class(['active' => Route::currentRouteName() == 'public.resources'])>
                    <span>RESOURCES</span>
                    <i class="bi bi-chevron-down"></i>
                </a>
                <ul>
                    <li>
                        <a href="#">Blogs</a>
                    </li>
                    <li>
                        <a href="#">Press releases</a>
                    </li>
                    <li>
                        <a href="#">News</a>
                    </li>
                    <li>
                        <a href="#">Gallery</a>
                    </li>
                </ul>
            </li>

            <li>
                <a href="#" @class(['active' => Route::currentRouteName() == 'public.project.status'])>PROJECT STATUS</a>
            </li>

            <li class="dropdown">
                <a href="#" @class(['active'=> in_array(Route::currentRouteName(), ['welcome.default', 'welcome.default'])])>
                    <span>GRIEVANCES </span>
                    <i class="bi bi-chevron-down"></i>
                </a>
                <ul>
                    <li>
                        <a href="{{ route('welcome.default') }}" @class(['active' => Route::currentRouteName() == 'welcome.default'])>Register</a>
                    </li>
                    <li>
                        <a href="{{ route('welcome.default') }}"  @class(['active' => Route::currentRouteName() == 'welcome.default'])>Status</a>
                    </li>
                </ul>
            </li>

            <li>
                @if(auth()->guest())
                    <a href="{{ route('login') }}" @class(['active' => Route::currentRouteName() == 'mis.login'])>MIS LOGIN</a>
                @else
                    <a href="{{ route('admin.dashboard') }}">Dashboard</a>
                @endif
            </li>

            <li>
                <a href="{{ route('admin.dashboard') }}" @class(['active'=> Route::currentRouteName() == 'admin.dashboard'])>CONTACT US</a>
            </li>

            <li class="prel">
                <a href="#" class="search">
                    <i class="bi bi-search m-0"></i>
                </a>
                <div class="pabs sinp-box d-none">
                    <form>
                        <input class="form-control" type="text" name="search" placeholder="Search here..." >
                    </form>
                </div>
            </li>
        </ul>
    </div>
    <i class="bi bi-list mobile-nav-toggle"></i>
</nav><!-- .navbar -->
