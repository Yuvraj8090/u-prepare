<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class SubPackageProject extends Model
{
    use HasFactory, SoftDeletes;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'project_id',
        'name',
        'contract_value',
        'lat',    // nullable latitude
        'long',   // nullable longitude
    ];

    /**
     * The attributes that should be cast.
     * Make sure lat and long can be null or float.
     *
     * @var array
     */
    protected $casts = [
        'lat' => 'float',
        'long' => 'float',
    ];

    /**
     * Get the package project that owns the sub package project.
     */
    public function packageProject()
    {
        return $this->belongsTo(PackageProject::class, 'project_id');
    }

    /**
     * Get the contract related to this sub package project.
     * Assuming the relation is via the `project_id` field.
     */
    public function contract()
    {
        return $this->belongsTo(Contract::class, 'project_id', 'project_id');
    }

    /**
     * Get all safeguard entries for this sub package project.
     */
    public function safeguardEntries()
    {
        return $this->hasMany(SafeguardEntry::class);
    }
}
