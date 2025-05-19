<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PlasticBucket extends Model
{
    use HasFactory;

    protected $fillable = [
        'category_name',
        'stock'
    ];
}
