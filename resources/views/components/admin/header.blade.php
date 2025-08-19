<div class="top_nav">
  <div class="nav_menu">
    <div class="nav toggle">
      <a id="menu_toggle"><i class="fa fa-bars"></i></a>
    </div>
    
    <!--<div class="navbar-brand text-center">-->
    <!--  <span class="text-dark">Department Name</span>-->
    <!--</div>-->
    
    <nav class="nav navbar-nav">
     @php
                $nameParts = explode(' ', trim(auth()->user()->name));
                $initials =
                    count($nameParts) > 1
                        ? strtoupper($nameParts[0][0] . $nameParts[1][0])
                        : strtoupper(substr($nameParts[0], 0, 2));
            @endphp
      <ul class="navbar-right">
        <li class="nav-item dropdown open" style="padding-left: 15px;">
          <a href="javascript:;" class="user-profile dropdown-toggle" aria-haspopup="true" id="navbarDropdown" data-toggle="dropdown" aria-expanded="false">
            <img src="{{ auth()->user()->profile_photo_url }}" alt="" onerror="this.style.display='none'; document.getElementById('initialsDiv2').style.display='flex';"> <b style="font-weight:500;" >
                <div id="initialsDiv2"
                style="height:50px; width:50px; background-color: #ADD8E6; color: white; border-radius: 50%; 
                font-size: 15px; font-weight: bold; display: none; align-items: center; justify-content: center; 
                margin: 0 auto; user-select:none;">
                {{ $initials }}
            </div>
               {{ ucfirst(auth()->user()->name) }} (DEPARTMENT : {{auth()->user()->department?->name}})</b>
          </a>
          <div class="dropdown-menu dropdown-usermenu pull-right" aria-labelledby="navbarDropdown">
            <!-- <a class="dropdown-item" href="javascript:;"> Profile</a> -->
            <!-- <a class="dropdown-item" href="javascript:;">
                        <span class="badge bg-red pull-right">50%</span>
                        <span>Settings</span>
                      </a> -->
            <!-- <a class="dropdown-item" href="javascript:;">Help</a> -->

            <form id="logout-form" action="{{ url('logout') }}" method="POST" style="display: none;">
              @csrf
            </form>

            <a class="dropdown-item" href="{{ url('logout') }}" onclick="event.preventDefault(); document.getElementById('logout-form').submit();">
              <i class="fa fa-sign-out pull-right"></i> Log Out
            </a>
          </div>
        </li>
 
      </ul>
    </nav>
  </div>
</div>

