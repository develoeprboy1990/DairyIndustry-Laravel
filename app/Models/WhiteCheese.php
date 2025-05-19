<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Product;

class WhiteCheese extends Model
{
    use HasFactory;

    protected $fillable = [
        'product_id',
        'type_of_cheese',
        'quantity_of_milk',
        'quantity_of_cylinder_powder',
        'quantity_of_ACC_ghee',
        'quantity_of_starch',
        'quantity_of_stabilizer',
        'quantity_of_protein',
        'quantity_of_calcium',
        'quantity_of_water',
        'quantity_of_salt',
        'final_quantity'
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
   
       return $query->where('type_of_labneh', 'LIKE', "%{$search}%")
                    ->orWhere('quantity_of_water', 'LIKE', "%{$search}%");
   }
}
