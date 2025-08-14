<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class MediaFile extends Model
{
    use SoftDeletes;

    protected $fillable = [
        'path',
        'type',
        'meta_data',
        'lat',
        'long',
    ];

    protected $casts = [
        'meta_data' => 'array',
    ];

    // Full URL accessor for the stored file
    public function getUrlAttribute()
    {
        return asset('storage/' . $this->path);
    }

    // Example method for gallery display (LightGallery compatible)
    public function toLightGallery()
    {
        return [
            'id' => $this->id,
            'src' => $this->url,
            'thumb' => $this->url,
            'subHtml' => '<h4>' . ($this->meta_data['name'] ?? 'Media') . '</h4><p>Subject: ' . ($this->meta_data['subject'] ?? '') . '</p>'
        ];
    }
}
