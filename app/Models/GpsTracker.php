<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class GpsTracker extends Model
{
    use HasFactory;

    protected $fillable = [
        'email',
        'password',
        'url',
        'user_api_hash',
        'google_map_api_key',
        'login_active'
    ];
}
