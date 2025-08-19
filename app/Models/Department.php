<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Staudenmeir\EloquentHasManyDeep\HasRelationships;

class Department extends Model
{
    use HasFactory, HasRelationships;

    protected $fillable = ['name', 'budget'];

    /*
    |--------------------------------------------------------------------------
    | Relationships
    |--------------------------------------------------------------------------
    */
    public function projects()
    {
        return $this->hasMany(PackageProject::class, 'department_id');
    }

    public function subProjects()
    {
        return $this->hasManyThrough(
            SubPackageProject::class,
            PackageProject::class,
            'department_id',
            'project_id',
            'id',
            'id'
        );
    }

    public function contracts()
    {
        return $this->hasManyThrough(
            Contract::class,
            PackageProject::class,
            'department_id',
            'project_id',
            'id',
            'id'
        );
    }

    public function financials()
    {
        // Deep relation: Department → PackageProject → SubPackageProject → FinancialProgressUpdate
        return $this->hasManyDeepFromRelations(
            $this->subProjects(),
            (new SubPackageProject())->financialProgressUpdates()
        );
    }

    /*
    |--------------------------------------------------------------------------
    | Scopes
    |--------------------------------------------------------------------------
    */
    public function scopeWithProjectAndContractStats($query)
    {
        return $query
            ->withCount([
                'projects',
                'projects as signed_contracts_count' => fn($q) => $q->whereHas('contracts'),
            ])
            ->withSum('contracts', 'contract_value');
    }

    public function scopeWithFinancialStats($query)
    {
        return $query->withSum('financials', 'finance_amount');
    }

    /*
    |--------------------------------------------------------------------------
    | Accessors
    |--------------------------------------------------------------------------
    */
    public function getTotalContractValueAttribute(): float
    {
        return (float) ($this->contracts()->sum('contract_value') ?? 0);
    }

    public function getTotalFinanceAttribute(): float
    {
        return (float) ($this->financials()->sum('finance_amount') ?? 0);
    }
}
