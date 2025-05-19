<?php

namespace App\Models;

use App\Traits\HasUuid;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class GeneralRestriction extends Model
{
    use HasFactory, HasUuid;

    protected $fillable = [
        'sub_category_name',
        'category_id',
        'product_id',
        'product_name',
        'gr_stock',
        'gr_price',
    ];


    public function categories()
    {
        return $this->hasMany(Category::class);
    }

    public function products()
    {
        return $this->hasMany(Product::class);
    }
}
