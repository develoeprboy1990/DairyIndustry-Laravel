<?php

namespace App\Models;

use App\Traits\HasUuid;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Ingredient extends Model
{
    use HasFactory, HasUuid;

    protected $fillable = [
        'quantity_of_milk',
        'quantity_of_swedish_powder',
        'quantity_of_ACC_butter',
        'quantity_of_cheese',
        'quantity_of_citriv_acid',
        'quantity_of_water',
        'quantity_of_tamara_ghee',
        'quantity_of_starch',
        'quantity_of_stabilizer',
        'quantity_of_TC3',
        'quantity_of_704',
        'quantity_of_salt',
        'quantity_of_LP_powder',
        'quantity_of_ACC_ghee',
        'quantity_of_protin',
        'quantity_of_anti_mold',
        'quantity_of_qarqam',
        'quantity_of_cylinder_powder',
        'quantity_of_calcium',
        'quantity_of_whey',
        'quantity_of_GBL',
        'quantity_of_sorbate',
    ];
}
