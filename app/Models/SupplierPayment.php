<?php

namespace App\Models;

use App\Traits\HasUuid;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SupplierPayment extends Model
{
    use HasFactory, HasUuid;

    public function supplier()
    {
        return $this->belongsTo(Supplier::class);
    }
    
    public static $modes = [
        'Cash',
        'Check',
        'Credit Card',
        'Bank Transfer',
    ];

    public static $paid_modes = [
        'Paid',
        'Not Paid'
    ];
    /**
     * The attributes that should be cast.
     *
     * @var array
     */
    protected $casts = [
        'date' => 'date',
    ];
    protected static function boot()
    {
        parent::boot();
        SupplierPayment::creating(function ($model) {
            $latest = SupplierPayment::latest()->first();
            $strPadString = $latest ? (int)preg_replace("/[^0-9]/", "", $latest->number) + 1 : 1;
            $model->number = "P" . str_pad($strPadString, 6, "0", STR_PAD_LEFT);
        });
    }
    /**
     * Scope a query to search orders
     */
    public function scopeSearch(Builder $query, ?string $search): Builder
    {
        if (!$search)  return $query;
        return $query->where('number', 'LIKE', "%{$search}%");
    }


    public function getAmountViewAttribute(): string
    {
        return currency_format($this->amount_in * 1).'/'.currency_format($this->amount_out * 1);
    }

    public function getTotalViewAttribute(): string
    {
        return currency_format($this->total || 0 * 1);
    }
    public function getCreatedAtViewAttribute(): string
    {
        $dateFormat = Settings::getValue(Settings::DATE_FORMATE);
        $timeFormat = Settings::getValue(Settings::TIME_FORMATE);
        $timezone = Settings::getValue(Settings::TIMEZONE);
        return $this->created_at->timezone($timezone)->format("{$dateFormat} {$timeFormat}");
    }
    public function getDateViewAttribute(): string
    {
        $dateFormat = Settings::getValue(Settings::DATE_FORMATE);
        $timezone = Settings::getValue(Settings::TIMEZONE);
        return $this->date->timezone($timezone)->format("{$dateFormat}");
    }
    public function getTimeViewAttribute(): string
    {
        $timeFormat = Settings::getValue(Settings::TIME_FORMATE);
        $timezone = Settings::getValue(Settings::TIMEZONE);
        return $this->created_at->timezone($timezone)->format("{$timeFormat}");
    }
}