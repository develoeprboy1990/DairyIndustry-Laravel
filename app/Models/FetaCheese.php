<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Product;

class FetaCheese extends Model
{
    use HasFactory;

    protected $fillable = [
        'product_id',
        'type_of_milk',
        'quantity_milk',
        'quantity_swedish_powder',
        'quantity_ACC_ghee',
        'quantity_protein',
        'quantity_stabilizer',
        'quantity_GBL',
        'quantity_cheese',
        'quantity_water',
        'quantity_produced'
    ];


    // Declare the relationship with the Product model
    public function product()
    {
        return $this->belongsTo(Product::class, 'product_id', 'id');
    }


        /**
    * Scope a query to search based on multiple fields.
    *
    * @param  \Illuminate\Database\Eloquent\Builder  $query
    * @param  string|null  $search
    * @return \Illuminate\Database\Eloquent\Builder
    */
   public function scopeSearch(Builder $query, ?string $search): Builder
   {
       if (!$search) {
           return $query;
       }
   
       return $query->where('type_of_milk', 'LIKE', "%{$search}%")
                    ->orWhere('quantity_milk', 'LIKE', "%{$search}%");
   }
}
