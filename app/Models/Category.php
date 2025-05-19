<?php

namespace App\Models;

use App\Traits\HasImage;
use App\Traits\HasStatus;
use App\Traits\HasUuid;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Category extends Model
{
    use HasFactory, SoftDeletes, HasUuid, HasImage, HasStatus;


    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'minimum_stock',
        'image_path',
        'sort_order',
        'is_active',
    ];


    /**
     * Override the boot function from Laravel so that
     * we give the model a new UUID when we create it.
     */
    protected static function boot(): void
    {
        parent::boot();
        static::deleted(function ($category) {
            $category->products->each->delete();
        });

        // When a category is updated, if minimum_stock changed then update its products
        static::updated(function ($category) {
            if ($category->isDirty('minimum_stock')) {
                $category->products()->update(['minimum_stock' => $category->minimum_stock]);
            }
        });
    }


    /**
     * Scope a query to search posts
     */
    public function scopeSearch(Builder $query, ?string $search): Builder
    {
        if (!$search) return $query;
        return $query->where('name', 'LIKE', "%{$search}%");
    }


    public function products()
    {
        return $this->hasMany(Product::class);
    }


    public function generalRestrictions()
    {
        return $this->belongsTo(GeneralRestriction::class)->withTrashed();
    }
}
