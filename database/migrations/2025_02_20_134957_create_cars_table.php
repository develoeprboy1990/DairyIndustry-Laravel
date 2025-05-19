<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('cars', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->string('car_type')->nullable();
            $table->string('car_name')->nullable();
            $table->string('car_driver_name')->nullable();
            $table->string('car_driver_phone')->nullable();
            $table->string('product_id')->nullable();
            $table->string('product_stock')->nullable();
            $table->date('stock_date')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('cars');
    }
};
