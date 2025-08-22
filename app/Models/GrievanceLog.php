<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class GrievanceLog extends Model
{
    use HasFactory, SoftDeletes;

    protected $table = 'grievance_logs';

    protected $fillable = [
        'grievance_id',
        'user_id',
        'title',
        'remark',
        'preliminary_action_taken',
        'final_action_taken',
    ];

    /**
     * Relationship: Belongs to a grievance
     */
    public function grievance()
    {
        return $this->belongsTo(Grievance::class);
    }

    /**
     * Relationship: Belongs to a user (who added the log)
     */
    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
