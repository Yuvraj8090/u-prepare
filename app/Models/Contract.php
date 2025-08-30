<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\Auth;

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
        'contractor_id',
        'is_updated',
        'update_count',
    ];

    protected $casts = [
        'signing_date'              => 'datetime',
        'commencement_date'         => 'datetime',
        'initial_completion_date'   => 'datetime',
        'revised_completion_date'   => 'datetime',
        'actual_completion_date'    => 'datetime',
        'is_updated'                => 'boolean',
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

    public function securities()
    {
        return $this->hasMany(ContractSecurity::class);
    }

    public function active_securities()
    {
        return $this->hasMany(ContractSecurity::class)->where('issued_end_date', '>=', now());
    }

    public function expired_securities()
    {
        return $this->hasMany(ContractSecurity::class)->where('issued_end_date', '<', now());
    }

    public function updates()
    {
        return $this->hasMany(ContractUpdate::class);
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

    /*
    |--------------------------------------------------------------------------
    | Custom Methods
    |--------------------------------------------------------------------------
    */

    /**
     * Log contract changes into contract_updates table
     */
    public function logUpdate(array $oldValues, array $newValues): void
    {
        $this->updates()->create([
            'old_contract_value'           => $oldValues['contract_value'] ?? null,
            'new_contract_value'           => $newValues['contract_value'] ?? null,
            'old_initial_completion_date'  => $oldValues['initial_completion_date'] ?? null,
            'new_initial_completion_date'  => $newValues['initial_completion_date'] ?? null,
            'old_actual_completion_date'   => $oldValues['actual_completion_date'] ?? null,
            'new_actual_completion_date'   => $newValues['actual_completion_date'] ?? null,
            'changed_at'                   => now(),
        ]);

        $this->increment('update_count');
        $this->update(['is_updated' => true]);
    }
}
