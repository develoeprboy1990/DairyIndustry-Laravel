<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class MounehIndustrySeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run()
    {
        DB::table('mouneh_industries')->insert([
            [
                'type_of_mouneh' => 'Fruit Jam',
                'quantity_of_fruit_vegetable' => '2kg',
                'quantity_of_sugar_salt' => '1kg',
                'quantity_of_acid' => '100g',
                'glass_used' => true,
                'final_quantity' => '10kg',
            ],
            [
                'type_of_mouneh' => 'Pickles',
                'quantity_of_fruit_vegetable' => '1kg',
                'quantity_of_sugar_salt' => '500g',
                'quantity_of_acid' => '50g',
                'glass_used' => false,
                'final_quantity' => '20kg',
            ],
        ]);
    }
}
