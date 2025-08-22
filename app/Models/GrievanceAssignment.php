<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class GrievanceAssignment extends Model
{
    protected $fillable = [
        'grievance_id',
        'assigned_to',
        'assigned_by',
        'department',
    ];

    // Relations
    public function grievance()
    {
        return $this->belongsTo(Grievance::class);
    }

    public function assignedUser()
    {
        return $this->belongsTo(User::class, 'assigned_to');
    }

    public function assignedByUser()
    {
        return $this->belongsTo(User::class, 'assigned_by');
    }
}
