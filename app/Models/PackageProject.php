<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Relations\{BelongsTo, HasMany, HasOne};

class PackageProject extends Model
{
    use SoftDeletes;

    protected $fillable = ['project_id', 'package_category_id', 'package_sub_category_id', 'department_id', 'package_component_id', 'package_name', 'package_number', 'estimated_budget_incl_gst', 'vidhan_sabha_id', 'lok_sabha_id', 'district_id', 'block_id', 'dec_approved', 'dec_approval_date', 'dec_letter_number', 'dec_document_path', 'hpc_approved', 'hpc_approval_date', 'hpc_letter_number', 'hpc_document_path'];

    protected $casts = [
        'dec_approved' => 'boolean',
        'hpc_approved' => 'boolean',
        'estimated_budget_incl_gst' => 'decimal:2',

        'dec_approval_date' => 'date',
        'hpc_approval_date' => 'date', // not datetime
    ];

    /*
    |--------------------------------------------------------------------------
    | Scopes
    |--------------------------------------------------------------------------
    */
    public function scopeBasicInfo($query)
    {
        return $query->select('id', 'package_name');
    }

    public function scopeWithWorkProgramData($query)
    {
        return $query->with(['procurementDetail', 'workPrograms']);
    }

    /*
    |--------------------------------------------------------------------------
    | Relationships
    |--------------------------------------------------------------------------
    */
    public function project(): BelongsTo
    {
        return $this->belongsTo(Project::class);
    }

    public function category(): BelongsTo
    {
        return $this->belongsTo(ProjectsCategory::class, 'package_category_id');
    }

    public function subCategory(): BelongsTo
    {
        return $this->belongsTo(SubCategory::class, 'package_sub_category_id');
    }

    public function department(): BelongsTo
    {
        return $this->belongsTo(Department::class);
    }

    public function packageComponent(): BelongsTo
    {
        return $this->belongsTo(PackageComponent::class, 'package_component_id');
    }

    public function vidhanSabha(): BelongsTo
    {
        return $this->belongsTo(Constituency::class, 'vidhan_sabha_id');
    }

    public function lokSabha(): BelongsTo
    {
        return $this->belongsTo(Constituency::class, 'lok_sabha_id');
    }

    public function district(): BelongsTo
    {
        return $this->belongsTo(GeographyDistrict::class);
    }

    public function block(): BelongsTo
    {
        return $this->belongsTo(GeographyBlock::class);
    }

    public function procurementDetail(): HasOne
    {
        return $this->hasOne(ProcurementDetail::class);
    }

    public function workPrograms(): HasMany
    {
        return $this->hasMany(ProcurementWorkProgram::class);
    }

    public function subProjects(): HasMany
    {
        return $this->hasMany(SubPackageProject::class, 'project_id', 'id');
    }

    public function contracts(): HasMany
    {
        return $this->hasMany(Contract::class, 'project_id');
    }

    /*
    |--------------------------------------------------------------------------
    | Accessors
    |--------------------------------------------------------------------------
    */
    public function getHasWorkProgramAttribute(): bool
    {
        return $this->workPrograms->isNotEmpty();
    }
}
