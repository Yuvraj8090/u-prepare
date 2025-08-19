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

    /*
    |--------------------------------------------------------------------------
    | Accessors
    |--------------------------------------------------------------------------
    */
    public function getTotalFinanceAmountAttribute(): float
    {
        return $this->financialProgressUpdates()->sum('finance_amount');
    }

    public function getFinancialProgressPercentageAttribute(): float
    {
        return $this->contract_value > 0
            ? ($this->total_finance_amount / $this->contract_value) * 100
            : 0;
    }
}
