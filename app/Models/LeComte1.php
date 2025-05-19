<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Traits\HasUuid;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\HasOne;

class LeComte1 extends Model
{
    use HasFactory, HasUuid;

    protected $table = 'le_comte';

    public function comte2() : HasOne
    {
        return $this->hasOne(LeComte2::class, 'parent_id', 'id');
    }
    
     //add this part:  Declare the relationship with the Product model
    public function product()
    {
        return $this->belongsTo(Product::class, 'product_id', 'id');
    }
}