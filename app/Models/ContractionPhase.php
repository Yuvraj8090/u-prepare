<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class ContractionPhase extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = ['name', 'is_one_time'];

    public function safeguardEntries()
    {
        return $this->hasMany(SafeguardEntry::class);
    }
}
