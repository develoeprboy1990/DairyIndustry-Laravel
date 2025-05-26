<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use App\Traits\HasUuid;
use Illuminate\Database\Eloquent\Model;

class ExpiredProduct extends Model
{
    use HasFactory, HasUuid;

    protected $fillable = [
        'product_id',
        'expired_stock',
        'conversion_rate',
        'expiry_date',
        'trash',
        'reproduce'
    ];

    protected $casts = [
        'expired_stock' => 'float',
        'conversion_rate' => 'decimal:2',
        'expiry_date' => 'date',
        'trash' => 'boolean',
        'reproduce' => 'boolean',
    ];

    // In App\Models\ExpiredProduct.php
    public function product()
    {
        return $this->belongsTo(Product::class, 'product_id', 'id'); // Explicitly set UUID keys
    }
}
