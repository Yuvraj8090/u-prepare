<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class EpcEntryData extends Model
{
    use HasFactory, SoftDeletes;

    protected $table = 'epcentry_data';

    protected $fillable = [
        'sub_package_project_id',
        'sl_no',
        'item_description',
        'percent',
        'amount',
    ];

    // Relationship: EpcEntryData belongs to SubPackageProject
    public function subPackageProject()
    {
        return $this->belongsTo(SubPackageProject::class, 'sub_package_project_id');
    }
}
