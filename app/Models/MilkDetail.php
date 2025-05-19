<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Traits\HasUuid;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class MilkDetail extends Model
{
    use HasFactory, HasUuid;

    protected $table = 'milk_details';

    /**
     * Scope a query to search Suppliers
     */
    public function scopeSearch(Builder $query, ?string $search): Builder
    {
        if (!$search)  return $query;
        return $query->where('name', 'LIKE', "%{$search}%");
    }

    /**
     * Get the staff that owns the attendance.
     */
    public function staff() : BelongsTo
    {
        return $this->belongsTo(Staff::class, 'staffs_id', 'id')->withDefault();
    }

    /**
     * Get Sum of milk details
     */
    public static function getSum($year, $week)
    {
        $sums = [];
        for ($i=1; $i <= 7; $i++) { 
            $field = '2_qty_'.$i;
            $sum = MilkDetail::where('year', '=', $year)
                    ->where('week', '=', $week)
                    ->sum($field);
            $sums[$field.'_sum'] = $sum;
        }
        return $sums;
    }
}