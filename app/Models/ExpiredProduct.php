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
    
    public function product()
    {
        return $this->belongsTo(Product::class, 'product_id');
    }
}
