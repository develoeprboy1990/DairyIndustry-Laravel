<?php

namespace App\Models;
use App\Traits\HasImage;
use App\Traits\HasStatus;
use App\Traits\HasUuid;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class ExpenseCategory extends Model
{
    use HasFactory, SoftDeletes, HasUuid, HasImage, HasStatus;
    
    protected $fillable = [
        'name',
        'image_path',
        'sort_order',
        'is_active',
    ];
    
     /**
     * Scope a query to search posts
     */
    public function scopeSearch(Builder $query, ?string $search): Builder
    {
        if (!$search) return $query;
        return $query->where('name', 'LIKE', "%{$search}%");
    }
    
    public function expenses()
    {
        return $this->hasMany(Expense::class, 'expense_category_id');
    }
    
    public function payments()
    {
        return $this->hasMany(Payment::class, 'expense_category_id');
    }



    public function products()
    {
        return $this->hasMany(Product::class);
    }
}
