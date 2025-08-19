<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Contract extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        'contract_number',
        'project_id',
        'contract_value',
        'security',
        'signing_date',
        'commencement_date',
        'initial_completion_date',
        'revised_completion_date',
        'actual_completion_date',
        'contract_document',
        'count_sub_project',
        'contractor_id'
    ];

    protected $casts = [
        'signing_date' => 'datetime',
        'commencement_date' => 'datetime',
        'initial_completion_date' => 'datetime',
        'revised_completion_date' => 'datetime',
        'actual_completion_date' => 'datetime',
    ];

    /*
    |--------------------------------------------------------------------------
    | Relationships
    |--------------------------------------------------------------------------
    */

    public function project()
    {
        return $this->belongsTo(PackageProject::class, 'project_id');
    }

    public function contractor()
    {
        return $this->belongsTo(Contractor::class, 'contractor_id');
    }

    public function subProjects()
    {
        return $this->hasMany(SubPackageProject::class, 'project_id', 'project_id');
    }

    /*
    |--------------------------------------------------------------------------
    | Scopes
    |--------------------------------------------------------------------------
    */

    public function scopeWithBasicRelations($query)
    {
        return $query->with([
            'project:id,package_name,department_id',
            'project.department:id,name',
            'contractor:id,company_name',
        ]);
    }
}
