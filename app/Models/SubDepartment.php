<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class SubDepartment extends Model
{
    use HasFactory;

    protected $fillable = [
        'department_id',
        'name',
        'status',
    ];

    /**
     * Get the parent department.
     */
    public function department()
    {
        return $this->belongsTo(Department::class);
    }

    /**
     * Get the users belonging to this sub-department.
     */
    public function users()
    {
        return $this->hasMany(User::class, 'sub_department_id');
    }
}
