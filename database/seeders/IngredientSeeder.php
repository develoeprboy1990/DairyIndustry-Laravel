<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class IngredientSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('ingredients')->insert([
            'id'                           => Str::uuid(), // Generate a UUID for the primary key
            'quantity_of_milk'             => 0,
            'quantity_of_swedish_powder'   => 0,
            'quantity_of_ACC_butter'       => 0,
            'quantity_of_cheese'           => 0,
            'quantity_of_citriv_acid'      => 0,
            'quantity_of_water'            => 0,
            'quantity_of_tamara_ghee'      => 0,
            'quantity_of_starch'           => 0,
            'quantity_of_stabilizer'       => 0,
            'quantity_of_TC3'              => 0,
            'quantity_of_704'              => 0,
            'quantity_of_salt'             => 0,
            'quantity_of_LP_powder'        => 0,
            'quantity_of_ACC_ghee'         => 0,
            'quantity_of_protin'           => 0,
            'quantity_of_anti_mold'        => 0,
            'quantity_of_qarqam'           => 0,
            'quantity_of_cylinder_powder'  => 0,
            'quantity_of_calcium'          => 0,
            'quantity_of_whey'             => 0,
            'quantity_of_GBL'              => 0,
            'created_at'                   => now(),
            'updated_at'                   => now(),
        ]);
    }
}
