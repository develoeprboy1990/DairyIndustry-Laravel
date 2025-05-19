<?php

namespace App\Models;


use App\Traits\HasUuid;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Car extends Model
{
    use HasFactory, HasUuid;

    protected $fillable = [
        'car_type',
        'car_name',
        'car_driver_name',
        'car_driver_phone',
        'product_id',
        'product_stock',
        'stock_date',
    ];


     /**
     * Scope a query to search posts
     */
    public function scopeSearch(Builder $query, ?string $search): Builder
    {
        if (!$search) return $query;
        return $query->where('car_name', 'LIKE', "%{$search}%");
    }

    public function carDetails()
    {
        return $this->hasMany(CarDetail::class);
    }
}
