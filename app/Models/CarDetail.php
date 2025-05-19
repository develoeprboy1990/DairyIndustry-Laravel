<?php

namespace App\Models;

use App\Traits\HasUuid;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CarDetail extends Model
{
    use HasFactory, HasUuid;

    protected $fillable = [
        'car_id',
        'product_id',
        'stock',
    ];

    public function car()
    {
        return $this->belongsTo(Car::class)->withTrashed();
    }
}
