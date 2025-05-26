<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Traits\HasUuid;

class TransferHistory extends Model
{
    use HasFactory, HasUuid;
    
    protected $table = 'transfer_history';
    
    protected $fillable = [
        'from_general_restriction_id',
        'to_general_restriction_id',
        'from_sub_category_name',
        'to_sub_category_name',
        'category_id',
        'product_id',
        'product_name',
        'gr_stock',
        'gr_price',
        'driver_id',
        'car_type_id'      
    ];
    
    protected $casts = [
        'gr_price' => 'float',
    ];
    
    public function fromGeneralRestriction()
    {
        return $this->belongsTo(GeneralRestriction::class, 'from_general_restriction_id');
    }
    
    public function toGeneralRestriction()
    {
        return $this->belongsTo(GeneralRestriction::class, 'to_general_restriction_id');
    }
    
    public function product()
    {
        return $this->belongsTo(Product::class, 'product_id');
    }
    
    public function category()
    {
        return $this->belongsTo(Category::class, 'category_id');
    }

    // Driver and CarType relationships
    public function driver()
    {
        return $this->belongsTo(Driver::class, 'driver_id');
    }

    public function carType()
    {
        return $this->belongsTo(CarType::class, 'car_type_id');
    }


    public function getFromGeneralRestrictionNameAttribute()
    {
        return $this->fromGeneralRestriction ? $this->fromGeneralRestriction->name : null;
    }
    
    public function getToGeneralRestrictionNameAttribute()
    {
        return $this->toGeneralRestriction ? $this->toGeneralRestriction->name : null;
    }

    
    public function getCategoryNameAttribute()
    {
        return $this->category ? $this->category->name : null;
    }
    
    public function getFromGeneralRestrictionStockAttribute()
    {
        return $this->fromGeneralRestriction ? $this->fromGeneralRestriction->gr_stock : null;
    }

    // Driver and CarType accessors
    public function getDriverNameAttribute()
    {
        return $this->driver ? $this->driver->name : __('Not assigned');
    }

    public function getCarTypeNameAttribute()
    {
        return $this->carType ? $this->carType->full_name : __('Not assigned');
    }
}