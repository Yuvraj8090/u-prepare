<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class SafeguardCompliance extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        'name',
        'role_id',
        'contraction_phase_ids', // stored as JSON
    ];

    protected $casts = [
        'contraction_phase_ids' => 'array',
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
        'deleted_at' => 'datetime',
    ];

    /**
     * Role relation
     */
    public function role()
    {
        return $this->belongsTo(Role::class, 'role_id');
    }

    /**
     * Get contraction phases as a collection
     */
    public function getContractionPhasesAttribute()
    {
        return ContractionPhase::whereIn('id', $this->contraction_phase_ids ?? [])
            ->orderBy('name') // optional ordering
            ->get();
    }
     public function contractionPhases(): HasMany
    {
        // Return a "query builder" instead of collection
        return ContractionPhase::whereIn('id', $this->contraction_phase_ids ?? [])
            ->orderBy('name') // optional ordering
            ->getQuery()      // returns query builder instead of collection
            ->getModel()      // trick to satisfy type hint? Actually, see below
            ;
    }
}
