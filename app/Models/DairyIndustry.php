<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Traits\HasUuid;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class DairyIndustry extends Model
{
    use HasFactory, HasUuid;

    protected $table = 'dairy_industry';
    
    //add this part:  Declare the relationship with the Product model
    public function product()
    {
        return $this->belongsTo(Product::class, 'product_id', 'id');
    }
}