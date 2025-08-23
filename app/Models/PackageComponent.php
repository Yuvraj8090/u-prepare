<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class PackageComponent extends Model
{
    use SoftDeletes;

    protected $fillable = ['name', 'budget', 'description'];
    
    public function packageProjects()
    {
        return $this->hasMany(PackageProject::class, 'package_component_id');
    }
}
