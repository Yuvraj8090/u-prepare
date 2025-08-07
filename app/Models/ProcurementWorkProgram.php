<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class ProcurementWorkProgram extends Model
{
    use SoftDeletes;

    protected $fillable = [
        'package_project_id',
        'procurement_details_id',
        'name_work_program',
        'weightage',
        'days',
        'start_date',
        'planned_date',
    ];

    protected $casts = [
        'start_date' => 'date',
        'planned_date' => 'date',
        'weightage' => 'decimal:2',
    ];

    public function packageProject()
    {
        return $this->belongsTo(PackageProject::class);
    }

    public function procurementDetails()
    {
        return $this->belongsTo(ProcurementDetail::class);
    }
}
