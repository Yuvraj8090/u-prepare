<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class PhysicalEpcProgress extends Model
{
    use HasFactory, SoftDeletes;

    protected $table = 'physical_epc_progress';

    protected $fillable = [
        'epcentry_data_id',
        'percent',
        'amount',
        'items',
        'progress_submitted_date',
        'images', // JSON array of media_file IDs
    ];

    protected $casts = [
        'progress_submitted_date' => 'date',
        'images' => 'array',
    ];

    public function epcentryData()
    {
        return $this->belongsTo(EpcEntryData::class, 'epcentry_data_id');
    }

    // Convenient accessor to get MediaFile models linked to this progress record
    public function getMediaFilesAttribute()
    {
        return MediaFile::whereIn('id', $this->images ?? [])->get();
    }
}
