<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('transfer_history', function (Blueprint $table) {
            // Add driver and car type references
            $table->uuid('driver_id')->nullable()->after('product_name');
            $table->uuid('car_type_id')->nullable()->after('driver_id');
            
            // Add foreign key constraints
            $table->foreign('driver_id')->references('id')->on('drivers')->onDelete('set null');
            $table->foreign('car_type_id')->references('id')->on('car_types')->onDelete('set null');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('transfer_history', function (Blueprint $table) {
            // Drop foreign keys first
            $table->dropForeign(['driver_id']);
            $table->dropForeign(['car_type_id']);
            
            // Drop columns
            $table->dropColumn(['driver_id', 'car_type_id']);
        });
    }
};