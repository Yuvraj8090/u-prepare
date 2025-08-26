@php
    $locale = app()->getLocale();
    $localePrefix = $locale === 'hi' ? 'hi' : 'en';
    $currentSlug = request()->segment(2) ?? request()->segment(1);
    $pageTitle = $page->translated_title ?? $page->title ?? 'Home';
@endphp

<nav class="navbar">
    <div class="container-xxl">
        <ul>
            {{-- Home --}}
            <li>
                <a href="{{ route('welcome.default') }}" 
                   @class(['active' => Route::currentRouteName() === 'welcome.default'])>
                    {{ __('HOME') }}
                </a>
            </li>

            {{-- Navbar Items --}}
            @foreach ($navbarItems as $item)
                @php
                    $itemTitle = $locale === 'hi' ? ($item['title_hi'] ?? $item['title']) : $item['title'];
                    $itemUrl = !empty($item['slug']) ? url($localePrefix . '/' . $item['slug']) : '#';
                    $hasChildren = !empty($item['children']);
                @endphp

                @if (!$hasChildren)
                    <li>
                        <a href="{{ $itemUrl }}" target="{{ $item['target'] ?? '_self' }}">
                            {{ $itemTitle }}
                        </a>
                    </li>
                @else
                    <li class="dropdown">
                        <a href="{{ $itemUrl }}" target="{{ $item['target'] ?? '_self' }}">
                            {{ $itemTitle }} <i class="bi bi-chevron-down"></i>
                        </a>
                        <ul>
                            @foreach ($item['children'] as $child)
                                @php
                                    $childTitle = $locale === 'hi' 
                                        ? ($child['translated_title'] ?? $child['title']) 
                                        : $child['title'];
                                    $childUrl = !empty($child['slug']) ? url($localePrefix . '/' . $child['slug']) : '#';
                                @endphp
                                <li>
                                    <a href="{{ $childUrl }}" target="{{ $child['target'] ?? '_self' }}">
                                        {{ $childTitle }}
                                    </a>
                                </li>
                            @endforeach
                        </ul>
                    </li>
                @endif
            @endforeach

            {{-- Login/Dashboard --}}
            <li>
                @guest
                    <a href="{{ route('login') }}">{{ __('MIS LOGIN') }}</a>
                @else
                    <a href="{{ route('dashboard') }}">{{ __('Dashboard') }}</a>
                @endguest
            </li>

            {{-- Search --}}
            <li>
                <a href="#" class="search"><i class="bi bi-search"></i></a>
                <div class="search-box d-none">
                    <form>
                        <input type="text" name="search" placeholder="{{ __('Search here...') }}">
                    </form>
                </div>
            </li>
        </ul>
    </div>
    <i class="bi bi-list mobile-nav-toggle"></i>
</nav>
