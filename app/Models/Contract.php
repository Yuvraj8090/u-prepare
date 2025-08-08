<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

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
        'contractor_id',
    ];

    // Relationship: Contract belongs to PackageProject
    public function project()
    {
        return $this->belongsTo(PackageProject::class, 'project_id');
    }

    // Relationship: Contract belongs to Contractor
    public function contractor()
    {
        return $this->belongsTo(Contractor::class, 'contractor_id');
    }
}
