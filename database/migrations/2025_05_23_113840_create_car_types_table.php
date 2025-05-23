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
        Schema::create('car_types', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->string('name'); // e.g., "Refrigerated Truck", "Van"
            $table->string('plate_number')->unique();
            $table->string('model')->nullable(); // e.g., "Toyota Hiace"
            $table->enum('status', ['available', 'unavailable'])->default('available');
            $table->text('description')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('car_types');
    }
};