<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;



class BoqEntryData extends Model
{
    use HasFactory, SoftDeletes;

    protected $table = 'boqentry_data';

    protected $fillable = [
        'sub_package_project_id',
        'sl_no',
        'item_description',
        'unit',
        'qty',
        'rate',
        'amount',
    ];

    /**
     * The project sub-package this BOQ entry belongs to.
     */
    public function subPackageProject()
    {
        return $this->belongsTo(SubPackageProject::class, 'sub_package_project_id');
    }
}
