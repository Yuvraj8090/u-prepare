<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class GrievanceAssignment extends Model
{
    use HasFactory;

    protected $table = 'grievance_assignments';

    protected $fillable = [
        'grievance_id',
        'assigned_to',
        'assigned_by',
        'department',
    ];

    /**
     * Relationship: Belongs to a grievance
     */
    public function grievance()
    {
        return $this->belongsTo(Grievance::class);
    }

    /**
     * Relationship: User who is assigned the grievance
     */
    public function assignedUser()
    {
        return $this->belongsTo(User::class, 'assigned_to');
    }

    /**
     * Relationship: User who assigned the grievance
     */
    public function assignedByUser()
    {
        return $this->belongsTo(User::class, 'assigned_by');
    }
}
