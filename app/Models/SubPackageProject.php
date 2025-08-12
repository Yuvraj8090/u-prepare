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
    ];

    /**
     * Get the package project that owns the sub package project.
     */
    public function packageProject()
    {
        return $this->belongsTo(PackageProject::class, 'project_id');
    }
    public function contract()
    {
        return $this->belongsTo(Contract::class, 'project_id', 'project_id');
    }
    public function safeguardEntries()
{
    return $this->hasMany(SafeguardEntry::class);
}

}