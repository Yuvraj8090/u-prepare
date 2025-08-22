<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;

class Grievance extends Model
{
    use HasFactory;

    protected $table = 'grievances';

    protected $fillable = [
        'full_name',
        'address',
        'email',
        'mobile',
        'grievance_related_to',
        'nature_of_complaint',
        'detail_of_complaint',
        'district',
        'block',
        'village',
        'project',
        'description',
        'document',
        'filing_on_behalf',
        'consent_from_survivor',
        'status',
    ];

    /*
    |--------------------------------------------------------------------------
    | Booted: Global Scope → Restrict grievances based on assignments
    |--------------------------------------------------------------------------
    */
    protected static function booted()
    {
        // Auto-generate grievance number
        static::creating(function ($grievance) {
            $lastId = Grievance::max('id') ?? 0;
            $grievance->grievance_no = 'GR' . str_pad($lastId + 1, 5, '0', STR_PAD_LEFT);
        });

        // Restrict grievances visibility
        static::addGlobalScope('userAssignments', function (Builder $builder) {
            if (auth()->check()) {
                // Only admins (role_id = 1) see everything
                if (auth()->user()->role_id !== 1) {
                    $builder->whereHas('assignments', function ($q) {
                        $q->where('assigned_to', auth()->id());
                    });
                }
            }
        });
    }

    /*
    |--------------------------------------------------------------------------
    | Scopes
    |--------------------------------------------------------------------------
    */
    public function scopeBasicInfo($query)
    {
        return $query->select('id', 'grievance_no', 'full_name', 'status');
    }

    public function scopeWithLatestAssignment($query)
    {
        return $query->with(['latestAssignment.assignedToUser', 'latestAssignment.assignedByUser']);
    }

    /*
    |--------------------------------------------------------------------------
    | Relationships
    |--------------------------------------------------------------------------
    */
    public function assignments(): HasMany
    {
        return $this->hasMany(GrievanceAssignment::class, 'grievance_id');
    }

    public function latestAssignment(): HasOne
    {
        return $this->hasOne(GrievanceAssignment::class, 'grievance_id')->latestOfMany();
    }
    public function getRouteKeyName()
{
    return 'grievance_no';
}


    /*
    |--------------------------------------------------------------------------
    | Accessors
    |--------------------------------------------------------------------------
    */
    public function getIsAssignedAttribute(): bool
    {
        return $this->assignments->isNotEmpty();
    }
}
