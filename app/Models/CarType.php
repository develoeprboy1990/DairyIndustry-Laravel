<?php

namespace App\Models;

use App\Traits\HasUuid;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CarType extends Model
{
    use HasFactory, HasUuid;

    protected $fillable = [
        'name',
        'plate_number',
        'model',
        'status',
        'description',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array
     */
    protected $casts = [
        'status' => 'string',
    ];

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

        return $query->where('name', 'LIKE', "%{$search}%")
                     ->orWhere('plate_number', 'LIKE', "%{$search}%")
                     ->orWhere('model', 'LIKE', "%{$search}%");
    }

    /**
     * Scope a query to only include available cars.
     *
     * @param  \Illuminate\Database\Eloquent\Builder  $query
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function scopeAvailable(Builder $query): Builder
    {
        return $query->where('status', 'available');
    }

    /**
     * Get the status badge color.
     *
     * @return string
     */
    public function getStatusBadgeAttribute(): string
    {
        return $this->status === 'available' ? 'success' : 'secondary';
    }

    /**
     * Get the status text.
     *
     * @return string
     */
    public function getStatusTextAttribute(): string
    {
        return ucfirst($this->status);
    }

    /**
     * Get the full name (name + plate number).
     *
     * @return string
     */
    public function getFullNameAttribute(): string
    {
        return $this->name . ' (' . $this->plate_number . ')';
    }
}