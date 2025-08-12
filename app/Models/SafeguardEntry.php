<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class SafeguardEntry extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        'sub_package_project_id',
        'safeguard_compliance_id',
        'contraction_phase_id',
        'sl_no',
        'item_description',
    ];

    // Relationships
    public function subPackageProject()
    {
        return $this->belongsTo(SubPackageProject::class);
    }

    public function safeguardCompliance()
    {
        return $this->belongsTo(SafeguardCompliance::class);
    }

    public function contractionPhase()
    {
        return $this->belongsTo(ContractionPhase::class);
    }
}
