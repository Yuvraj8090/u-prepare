<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RoleRoute extends Model
{
    use HasFactory;

    protected $table = 'role_routes';

    // Mass assignable fields
    protected $fillable = [
        'role_id',
        'route_name',
    ];

    /**
     * Relationship: A RoleRoute belongs to a Role
     */
    public function role()
    {
        return $this->belongsTo(Role::class, 'role_id');
    }
}
