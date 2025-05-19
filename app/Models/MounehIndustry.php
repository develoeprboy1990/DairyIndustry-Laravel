<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Product;
class MounehIndustry extends Model
{
    use HasFactory;

    protected $fillable = [
        'product_id',
        'type_of_mouneh', 
        'quantity_of_fruit_vegetable', 
        'quantity_of_sugar_salt', 
        'quantity_of_acid', 
        'glass_used', 
        'cheese_qty',
        'water_qty',
        'citricAcid_qty',
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
    
        return $query->where('type_of_mouneh', 'LIKE', "%{$search}%")
                     ->orWhere('glass_used', 'LIKE', "%{$search}%");
    }
}
