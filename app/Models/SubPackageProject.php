<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class SubPackageProject extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        'project_id',
        'name',
        'contract_value',
        'lat',
        'long',
    ];

    protected $casts = [
        'lat' => 'float',
        'long' => 'float',
        'contract_value' => 'decimal:2',
    ];

    /*
    |--------------------------------------------------------------------------
    | Relationships
    |--------------------------------------------------------------------------
    */
    public function packageProject()
    {
        return $this->belongsTo(PackageProject::class, 'project_id');
    }

    public function procurementDetail()
    {
        return $this->hasOneThrough(
            ProcurementDetail::class,
            PackageProject::class,
            'id',                  // FK on PackageProject
            'package_project_id',  // FK on ProcurementDetail
            'project_id',          // FK on SubPackageProject
            'id'                   // PK on PackageProject
        );
    }

    public function getTypeOfProcurementNameAttribute()
    {
        return $this->procurementDetail
            ? $this->procurementDetail->typeOfProcurement->name
            : null;
    }

    public function contract()
    {
        return $this->belongsTo(Contract::class, 'project_id', 'project_id');
    }

    public function safeguardEntries()
    {
        return $this->hasMany(SafeguardEntry::class);
    }

    public function financialProgressUpdates()
    {
        return $this->hasMany(FinancialProgressUpdate::class, 'project_id');
    }

    // ------------------- EPC -------------------

    public function epcEntries()
    {
        return $this->hasMany(EpcEntryData::class, 'sub_package_project_id');
    }

    public function physicalEpcProgresses()
    {
        return $this->hasManyThrough(
            PhysicalEpcProgress::class,
            EpcEntryData::class,
            'sub_package_project_id', // FK on epcentry_data
            'epcentry_data_id',       // FK on physical_epc_progress
            'id',                     // PK on sub_package_project
            'id'                      // PK on epcentry_data
        );
    }

    // ------------------- BOQ -------------------

    public function boqEntries()
    {
        return $this->hasMany(BoqEntryData::class, 'sub_package_project_id');
    }

    public function physicalBoqProgresses()
    {
        return $this->hasMany(PhysicalBoqProgress::class, 'sub_package_project_id');
    }

    /*
    |--------------------------------------------------------------------------
    | Progress Accessors
    |--------------------------------------------------------------------------
    */
    public function getPhysicalProgressPercentageAttribute(): float
    {
        return $this->type_of_procurement_name === 'EPC'
            ? $this->calculateEpcProgress()
            : $this->calculateBoqProgress();
    }

    protected function calculateEpcProgress(): float
    {
        // Planned amount from EPC entries
        $plannedAmount = $this->epcEntries()->sum('amount');

        // Executed amount (must specify the table)
        $executedAmount = $this->physicalEpcProgresses()
            ->selectRaw('COALESCE(SUM(physical_epc_progress.amount), 0) as total')
            ->value('total');

        return $plannedAmount > 0
            ? round(($executedAmount / $plannedAmount) * 100, 2)
            : 0.0;
    }

    protected function calculateBoqProgress(): float
    {
        $totalQty = $this->boqEntries()->sum('qty'); // planned qty
        $completedQty = $this->physicalBoqProgresses()->sum('qty'); // executed qty

        return $totalQty > 0
            ? round(($completedQty / $totalQty) * 100, 2)
            : 0.0;
    }

    public function tests()
{
    return $this->hasMany(SubPackageProjectTest::class);
}

    /*
    |--------------------------------------------------------------------------
    | Finance Accessors
    |--------------------------------------------------------------------------
    */
    public function getTotalFinanceAmountAttribute(): float
    {
        return $this->financialProgressUpdates()->sum('finance_amount');
    }

    public function getFinancialProgressPercentageAttribute(): float
    {
        return $this->contract_value > 0
            ? round(($this->total_finance_amount / $this->contract_value) * 100, 2)
            : 0.0;
    }
}
