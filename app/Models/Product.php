<?php

namespace App\Models;

use App\Models\Cheese;

use App\Traits\HasImage;
use App\Traits\HasStatus;
use App\Traits\HasUuid;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Carbon\Carbon;
use App\Models\MounehIndustry;



class Product extends Model
{
    use HasFactory, SoftDeletes, HasUuid, HasImage, HasStatus;


    public $incrementing = false; // Disable auto-incrementing (since UUID is used)
    protected $keyType = 'string'; // Set key type as string for UUID

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'image_path',
        // 'sale_price',
        'wholesale_price',
        'price_per_gram',
        'price_per_kilogram',
        // 'retailsale_price',
        'cost',
        // 'barcode',
        'wholesale_barcode',
        // 'retail_barcode',
        // 'sku',
        'wholesale_sku',
        // 'retail_sku',
        'quantity',
        'description',
        'sort_order',
        'is_active',
        'category_id',
        'in_stock',
        'plastic_bucket_stock',
        'minimum_stock',
        'packet_type_1kg',
        'packet_type_2kg',
        'packet_type_5kg',
        'expired_stock',
        'track_stock',
        'continue_selling_when_out_of_stock',
        'box_price',
        'unit_price',
        'box_barcode',
        'unit_barcode',
        'box_sku',
        'unit_sku',
        'wholesale_price',
        'price_per_gram',
        'price_per_kilogram',
        'superdealer_barcode',
        'superdealer_sku',
        'pricepergram_barcode',
        'pricepergram_sku',
        'priceperkilogram_barcode',
        'priceperkilogram_sku',
        'count_per_box',
        'cost_unit',
        'box_unit',
        'expiry_date',
        'weight',
        'expired',
        'expired_product_id',
        'main_category'
    ];


    /**
     * The accessors to append to the model's array form.
     *
     * @var array
     */
    protected $appends = [
        'image_url',
        'full_name',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array
     */
    protected $casts = [
        'track_stock' => 'boolean',
        'continue_selling_when_out_of_stock' => 'boolean',
        'plastic_bucket_stock' => 'array',
    ];

    public function categories()
    {
        return $this->belongsToMany(Category::class);
    }

    // Declare the relationship with the MounehIndustry model
    public function mounehIndustries()
    {
        return $this->hasMany(MounehIndustry::class, 'product_id', 'id');
    }


    //add this part:  Declare the relationship with the DairyIndustries model
    public function dairyIndustries()
    {
        return $this->hasMany(DairyIndustry::class, 'product_id', 'id');
    }



    // Declare the relationship with the MounehIndustry model
    public function cheeses()
    {
        return $this->hasMany(Cheese::class, 'product_id', 'id');
    }


    // Declare the relationship with the CheeseProcess1 model
    public function cheeseProcesses()
    {
        return $this->hasMany(CheeseProcess1::class, 'product_id', 'id');
    }

    // Declare the relationship with the GoudaRegular model
    public function goudaRegulars()
    {
        return $this->hasMany(GoudaRegular1::class, 'product_id', 'id');
    }


    // Declare the relationship with the Kishek model
    public function kishekes()
    {
        return $this->hasMany(Kishek::class, 'product_id', 'id');
    }


    // Declare the relationship with the LabanProcess1 model
    public function labanProcesses()
    {
        return $this->hasMany(LabanProcess1::class, 'product_id', 'id');
    }

    // Declare the relationship with the LabnehProcess1 model
    public function labnehProcesses()
    {
        return $this->hasMany(LabnehProcess1::class, 'product_id', 'id');
    }


    // Declare the relationship with the Margarine model
    public function margarines()
    {
        return $this->hasMany(Margarine::class, 'product_id', 'id');
    }


    // Declare the relationship with the LeComte1 model
    public function leComtes()
    {
        return $this->hasMany(LeComte1::class, 'product_id', 'id');
    }

    // Declare the relationship with the Raclette1 model
    public function raclette1s()
    {
        return $this->hasMany(Raclette1::class, 'product_id', 'id');
    }

    // Declare the relationship with the Serum model
    public function serums()
    {
        return $this->hasMany(Serum::class, 'product_id', 'id');
    }

    // Declare the relationship with the Shankleesh model
    public function shankleeshes()
    {
        return $this->hasMany(Shankleesh::class, 'product_id', 'id');
    }


    // Declare the relationship with the Tomme1 model
    public function tommes()
    {
        return $this->hasMany(Tomme1::class, 'product_id', 'id');
    }



    /**
     * Scope a query to search posts
     */
    public function scopeSearch(Builder $query, ?string $search): Builder
    {
        if (!$search) return $query;
        return $query->where('name', 'LIKE', "%{$search}%")
            ->orWhere('unit_barcode', 'LIKE', "%{$search}%")
            ->orWhere('unit_sku', 'LIKE', "%{$search}%")
            ->orWhereHas('category', function ($q) use ($search) {
                $q->where('name', 'LIKE', "%{$search}%");
            });
    }


    public function category()
    {
        return $this->belongsTo(Category::class)->withTrashed();
    }

    /**
     * Get the cost value.
     *
     * @return float
     */
    public function getCostValueAttribute(): float
    {

        $hasExchangeRate = config('settings')->enableExchangeRateForItems;
        if ($hasExchangeRate) {
            $exchangeRate = config('settings')->exchangeRate;
            return $this->cost * $exchangeRate;
        }
        return $this->cost;
    }

    public function getExpiryDateViewAttribute(): string
    {

        if ($this->expiry_date) {
            $dateFormat = Settings::getValue(Settings::DATE_FORMATE);
            return Carbon::parse($this->expiry_date)->format($dateFormat);
        }
        return '';
    }

    public function dateView($date): string
    {

        if ($date) {
            $dateFormat = Settings::getValue(Settings::DATE_FORMATE);
            return Carbon::parse($date)->format($dateFormat);
        }
        return '';
    }


    // public function getTableSalesViewPriceAttribute(): string
    // {
    //     $hasExchangeRate = config('settings')->enableExchangeRateForItems;

    //     if ($hasExchangeRate) {
    //         $price = currency_format($this->price);
    //         // return currency_format($this->sale_price * $this->in_stock, $hasExchangeRate) . " ({$price})";
    //         return currency_format($this->retailsale_price * $this->in_stock, $hasExchangeRate) . " ({$price})";
    //     }
    //     // return currency_format($this->sale_price * $this->in_stock, $hasExchangeRate);
    //     return currency_format($this->retailsale_price * $this->in_stock, $hasExchangeRate);
    // }

    public function getTableWholesaleViewPriceAttribute(): string
    {
        $hasExchangeRate = config('settings')->enableExchangeRateForItems;

        if ($hasExchangeRate) {
            $exchangeRate = config('settings')->exchangeRate;
            $price = currency_format($this->wholesale_price * $exchangeRate * $this->in_stock, $hasExchangeRate);
            return currency_format($this->wholesale_price * $this->in_stock) . " ({$price})";
        }
        return currency_format($this->wholesale_price * $this->in_stock, $hasExchangeRate);
        // return "test3";
    }

    /**
     * Get the price per gram
     * 
     * @return string
     */
    public function getTablePricePerGramAttribute(): string
    {
        $hasExchangeRate = config('settings')->enableExchangeRateForItems;

        if ($hasExchangeRate) {
            $price = currency_format($this->price_per_gram);
            return currency_format($this->price_per_gram * $this->in_stock, $hasExchangeRate) . " ({$price})";
        }
        return currency_format($this->price_per_gram * $this->in_stock, $hasExchangeRate);
    }

    /**
     * Get the price per kilogram
     * 
     * @return string
     */
    public function getTablePricePerKilogramAttribute(): string
    {
        $hasExchangeRate = config('settings')->enableExchangeRateForItems;

        if ($hasExchangeRate) {
            $price = currency_format($this->price_per_kilogram);
            return currency_format($this->price_per_kilogram * $this->in_stock, $hasExchangeRate) . " ({$price})";
        }
        return currency_format($this->price_per_kilogram * $this->in_stock, $hasExchangeRate);
    }

    public function getTableSalesViewPriceAttribute(): string
    {
        $hasExchangeRate = config('settings')->enableExchangeRateForItems;

        if ($hasExchangeRate) {
            $price = currency_format($this->price);
            // return currency_format($this->sale_price * $this->in_stock, $hasExchangeRate) . " ({$price})";
            return currency_format($this->unit_price * $this->in_stock, $hasExchangeRate) . " ({$price})";
        }
        // return currency_format($this->sale_price * $this->in_stock, $hasExchangeRate);
        return currency_format($this->unit_price * $this->in_stock, $hasExchangeRate);
    }


    public function getTableBoxViewPriceAttribute(): string
    {
        $hasExchangeRate = config('settings')->enableExchangeRateForItems;

        if ($hasExchangeRate) {
            $exchangeRate = config('settings')->exchangeRate;
            $price = currency_format($this->box_price * $exchangeRate, $hasExchangeRate);
            return currency_format($this->box_price) . " ({$price})";
        }
        return currency_format($this->box_price, $hasExchangeRate);
    }

    public function getTableBoxViewWholepriceAttribute(): string
    {
        $hasExchangeRate = config('settings')->enableExchangeRateForItems;

        if ($hasExchangeRate) {
            $exchangeRate = config('settings')->exchangeRate;
            $price = currency_format($this->box_price * $this->in_stock / $this->count_per_box * $exchangeRate, $hasExchangeRate);
            return currency_format($this->box_price * $this->in_stock / $this->count_per_box) . " ({$price})";
        }
        return currency_format($this->box_price * $this->in_stock / $this->count_per_box, $hasExchangeRate);
    }

    public function getWholeCostAttribute(): string
    {
        $hasExchangeRate = config('settings')->enableExchangeRateForItems;

        if ($hasExchangeRate) {
            $exchangeRate = config('settings')->exchangeRate;
            $price = currency_format($this->cost * $exchangeRate * $this->in_stock, $hasExchangeRate);
            return currency_format($this->cost * $this->in_stock) . " ({$price})";
        }
        return currency_format($this->cost * $this->in_stock, $hasExchangeRate);
    }

    /**
     * Get the price.
     *
     * @return float
     */
    public function getPriceAttribute(): float
    {
        $hasExchangeRate = config('settings')->enableExchangeRateForItems;
        if ($hasExchangeRate) {
            $exchangeRate = config('settings')->exchangeRate;
            return $this->unit_price * $exchangeRate;
            // return $this->sale_price * $exchangeRate;
        }
        // return $this->sale_price;
        return $this->unit_price;
    }

    /**
     * Get the view price.
     *
     * @return string
     */
    public function getViewPriceAttribute(): string
    {
        $hasExchangeRate = config('settings')->enableExchangeRateForItems;
        if ($hasExchangeRate) {
            $exchangeRate = config('settings')->exchangeRate;
            $price = currency_format($this->unit_price * $exchangeRate, $hasExchangeRate);
            return currency_format($this->unit_price) . " ({$price})";
        }
        return currency_format($this->unit_price, $hasExchangeRate);
    }

    /**
     * Get the view price.
     *
     * @return string
     */
    public function getViewWholepriceAttribute(): string
    {
        $hasExchangeRate = config('settings')->enableExchangeRateForItems;
        if ($hasExchangeRate) {
            $exchangeRate = config('settings')->exchangeRate;
            $price = currency_format($this->unit_price * $this->in_stock * $exchangeRate, $hasExchangeRate);
            return currency_format($this->unit_price * $this->in_stock) . " ({$price})";
        }
        return currency_format($this->unit_price * $this->in_stock, $hasExchangeRate);
    }

    /**
     * Get the view price.
     *
     * @return string
     */
    public function getTableViewPriceAttribute(): string
    {
        $hasExchangeRate = config('settings')->enableExchangeRateForItems;

        if ($hasExchangeRate) {
            $price = currency_format($this->price);
            return currency_format($this->unit_price, $hasExchangeRate) . " ({$price})";
            // return currency_format($this->sale_price, $hasExchangeRate) . " ({$price})";
        }
        return currency_format($this->unit_price, $hasExchangeRate);
        // return currency_format($this->sale_price, $hasExchangeRate);
    }

    public function getTableViewCostAttribute(): string
    {
        $hasExchangeRate = !config('settings')->enableExchangeRateForItems;
        return currency_format($this->cost, $hasExchangeRate);
    }

    /**
     * Get the view cost.
     *
     * @return string
     */
    public function getViewCostAttribute(): string
    {
        return currency_format($this->cost);
    }

    /**
     * Get the full name.
     *
     * @return string
     */
    public function getFullNameAttribute(): string
    {
        return $this->name;
    }
}
