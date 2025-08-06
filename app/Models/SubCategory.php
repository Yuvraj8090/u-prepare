<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class SubCategory extends Model
{
    use SoftDeletes;

    protected $table = 'sub_category';

    protected $fillable = [
        'category_id',
        'name',
        'status',
    ];

    public function category()
    {
        return $this->belongsTo(ProjectsCategory::class, 'category_id');
    }
}
