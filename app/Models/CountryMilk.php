<?php

namespace App\Models;

use App\Traits\HasUuid;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CountryMilk extends Model
{
    use HasFactory, HasUuid;

    protected $fillable = [
        'product_id',
        'type_of_milk',
        'qty_lp_powder',
        'qty_natural_milk',
        'qty_ACC_ghee',
        'qty_stabilizer',
        'qty_protein',
        'qty_anti_mold',
        'qty_water',
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
                    ->orWhere('qty_natural_milk', 'LIKE', "%{$search}%");
   }
}
