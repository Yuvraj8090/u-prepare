<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class PhysicalBoqProgress extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        'boq_entry_id',
        'qty',
        'amount',
        'progress_submitted_date',
        'sub_package_project_id',
        'media',
        'lat',
        'long'
    ];

    protected $casts = [
        'media' => 'array',
        'progress_submitted_date' => 'date',
        'lat' => 'decimal:7',
        'long' => 'decimal:7',
    ];

    public function boqEntry()
    {
        return $this->belongsTo(BoqEntryData::class, 'boq_entry_id');
    }
}
