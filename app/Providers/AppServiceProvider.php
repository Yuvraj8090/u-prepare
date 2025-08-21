<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\{View, Cache, App};
use App\Models\{NavbarItem, Page};
use App\Helpers\TranslationHelper;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }
    public function boot(): void
    {
        $this->registerViewComposers();
    }


    protected function registerViewComposers(): void
    {
        View::composer('*', function ($view) {
            $this->shareNavbarItems($view);
        });
    }


    protected function shareNavbarItems($view): void
    {
        $locale = App::getLocale();
        $cacheKey = "navbar_items_{$locale}";

        $items = Cache::remember($cacheKey, now()->addMinutes(10), function () use ($locale) {
            return NavbarItem::with('children')
                ->whereNull('parent_id')
                ->where('is_active', true)
                ->orderBy('order')
                ->get()
                ->each(function ($item) use ($locale) {
                    $this->processNavbarItem($item, $locale);
                });
        });

        $view->with('navbarItems', $items);
    }


    protected function processNavbarItem($item, string $locale): void
    {
        $item->page = Page::where('slug', $item->route)->first();
        if ($locale === 'hi' && !empty($item->title_hi)) {
            $item->translated_title = $item->title_hi;
        } else {
            $item->translated_title = TranslationHelper::translate($item->title, $locale);
        }
        $item->children->each(function ($child) use ($locale) {
            $child->page = Page::where('slug', $child->route)->first();

            if ($locale === 'hi' && !empty($child->title_hi)) {
                $child->translated_title = $child->title_hi;
            } else {
                $child->translated_title = TranslationHelper::translate($child->title, $locale);
            }
        });
    }
}
