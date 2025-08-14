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
        'is_validity',
    ];

    protected $casts = [
        'is_validity' => 'boolean',
    ];

    public function subPackageProject()
    {
        return $this->belongsTo(SubPackageProject::class);
    }
   
public function socialSafeguardEntry()
{
    return $this->hasOne(SocialSafeguardEntry::class)
                ->whereDate('date_of_entry', '>=', now()->format('Y-m-d'))
                ->latest('date_of_entry');
}

public function socialSafeguardEntries()
{
    return $this->hasMany(SocialSafeguardEntry::class, 'safeguard_entry_id');
}

public function latestSocialEntry($selectedDate = null)
{
    $selectedDate = $selectedDate ?? now()->format('Y-m-d');

    // Get all related entries
    $entries = $this->socialSafeguardEntries;

    // Filter entries on or before the selected date
    $filtered = $entries->filter(function ($entry) use ($selectedDate) {
        return $entry->date_of_entry->format('Y-m-d') <= $selectedDate;
    });

    // Return the latest (most recent) entry
    return $filtered->sortByDesc('date_of_entry')->first();
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
