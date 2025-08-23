<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\{View, Cache, App};
use App\Helpers\{StaticDataHelper, TranslationHelper};
use App\Models\{NavbarItem, Page, Slide, Leader, PackageComponent, Video, News};

class AppServiceProvider extends ServiceProvider
{
    public function register(): void
    {
        //
    }

    public function boot(): void
    {
        $this->registerViewComposers();

        // Share Static Citizen Corner + Past Projects globally
        view()->share('cc_items', StaticDataHelper::citizenCornerData());
        view()->share('pps_items', StaticDataHelper::pastProjectsData());
    }

    /**
     * Register all global view composers
     */
    protected function registerViewComposers(): void
    {
        View::composer('*', function ($view) {
            $this->shareNavbarItems($view);
            $this->shareAllSlides($view);
            $this->shareAllLeaders($view);
            $this->shareAllPackageComponents($view);
            $this->shareAllVideos($view);
            $this->shareAllNews($view); // ✅ Added news sharing
        });
    }

    /**
     * Share all videos globally
     */
    protected function shareAllVideos($view): void
    {
        $videos = Cache::remember('all_videos', now()->addMinutes(10), function () {
            return Video::where('status', true)->orderBy('order')->get();
        });

        $view->with('videos', $videos);
    }

    /**
     * Share all news globally
     */
    protected function shareAllNews($view): void
    {
        $news = Cache::remember('all_news', now()->addMinutes(10), function () {
            return News::orderBy('created_at', 'desc')->get();
        });

        $view->with('news', $news);
    }

    /**
     * Share navbar items to all views
     */
    protected function shareNavbarItems($view): void
    {
        $locale = App::getLocale();
        $cacheKey = "navbar_items_{$locale}";

        $items = Cache::remember($cacheKey, now()->addMinutes(10), function () use ($locale) {
            return NavbarItem::with('children')->whereNull('parent_id')->where('is_active', true)->orderBy('order')->get()->each(fn($item) => $this->processNavbarItem($item, $locale));
        });

        $view->with('navbarItems', $items);
    }

    protected function processNavbarItem($item, string $locale): void
    {
        $item->page = Page::where('slug', $item->route)->first();

        $item->translated_title = $locale === 'hi' && !empty($item->title_hi) ? $item->title_hi : TranslationHelper::translate($item->title, $locale);

        $item->children->each(function ($child) use ($locale) {
            $child->page = Page::where('slug', $child->route)->first();
            $child->translated_title = $locale === 'hi' && !empty($child->title_hi) ? $child->title_hi : TranslationHelper::translate($child->title, $locale);
        });
    }

    /**
     * Share all slides globally
     */
    protected function shareAllSlides($view): void
    {
        $allslides = Cache::remember('all_slides', now()->addMinutes(10), function () {
            return Slide::where('status', true)->orderBy('order')->get();
        });

        $view->with('allslides', $allslides);
    }

    /**
     * Share all leaders globally
     */
    protected function shareAllLeaders($view): void
    {
        $persons = Cache::remember('all_leaders', now()->addMinutes(10), function () {
            return Leader::where('status', true)->orderBy('order')->get();
        });

        $view->with('persons', $persons);
    }

    /**
     * Share all package components globally
     */
    protected function shareAllPackageComponents($view): void
    {
        $comps = Cache::remember('all_package_components', now()->addMinutes(10), function () {
            return PackageComponent::orderBy('created_at', 'desc')->get();
        });

        $view->with('comps', $comps);
    }
}
