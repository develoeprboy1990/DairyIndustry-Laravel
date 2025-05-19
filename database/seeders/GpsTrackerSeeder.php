<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\GpsTracker;

class GpsTrackerSeeder extends Seeder
{
    public function run()
    {
        // Use a fixed UUID to ensure there is only one record.
        $fixedId = '1';

        GpsTracker::updateOrCreate(
            ['id' => $fixedId],
            [
                'email'               => '',
                'password'            => '',  
                'url'                 => '',
                'user_api_hash'       => '',
                'google_map_api_key'  => '',
                'login_active'        => 0
            ]
        );
    }
}
