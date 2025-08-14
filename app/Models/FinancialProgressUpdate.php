<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class FinancialProgressUpdate extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        'project_id',
        'finance_amount',
        'no_of_bills',
        'bill_serial_no',
        'submit_date',
        'media',
    ];

    // Cast JSON columns
    protected $casts = [
        'bill_serial_no' => 'array',
        'media' => 'array',
        'submit_date' => 'date',
        'finance_amount' => 'decimal:2',
    ];

    // Relationship to sub_package_projects
    public function project()
    {
        return $this->belongsTo(SubPackageProject::class, 'project_id');
    }
}
