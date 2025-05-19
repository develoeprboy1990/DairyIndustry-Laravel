<?php

namespace App\Models;

use App\Traits\HasUuid;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CommercialMilk extends Model
{
    use HasFactory, HasUuid;

    protected $fillable = [
        'product_id',
        'type_of_milk',
        'quantity_of_LP_powder',
        'quantity_of_ACC_ghee',
        'quantity_of_starch',
        'quantity_of_stabilizer',
        'quantity_of_sorbate',
        'quantity_of_protin',
        'quantity_of_anti_mold',
        'quantity_of_water',
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
   
       return $query->where('type_of_milk', 'LIKE', "%{$search}%")
                    ->orWhere('quantity_of_LP_powder', 'LIKE', "%{$search}%");
   }
}
