<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class ProcurementDetail extends Model
{
    use SoftDeletes;

    protected $fillable = [
        'package_project_id',
        'method_of_procurement',
        'type_of_procurement',
        'publication_date',
        'publication_document_path',
        'tender_fee',
        'earnest_money_deposit',
        'bid_validity_days',
        'emd_validity_days',
    ];

    public function packageProject()
    {
        return $this->belongsTo(PackageProject::class);
    }
}
