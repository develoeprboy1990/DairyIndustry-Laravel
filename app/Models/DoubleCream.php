<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DoubleCream extends Model
{
    use HasFactory;

    protected $fillable = [
        'product_id',
        'type_of_cheese',
        'quantity_of_cheese_whey',
        'quantity_of_cylinder_powder',
        'quantity_of_calcium',
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
   
       return $query->where('type_of_cheese', 'LIKE', "%{$search}%")
                    ->orWhere('quantity_of_cheese_whey', 'LIKE', "%{$search}%");
   }
}
