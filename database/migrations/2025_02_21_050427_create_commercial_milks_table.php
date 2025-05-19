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
        Schema::create('commercial_milks', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->string('product_id')->nullable();
            $table->string('type_of_milk')->nullable();
            $table->string('quantity_of_LP_powder')->nullable();
            $table->string('quantity_of_ACC_ghee')->nullable();
            $table->string('quantity_of_starch')->nullable();
            $table->string('quantity_of_stabilizer')->nullable();
            $table->string('quantity_of_sorbate')->nullable();
            $table->string('quantity_of_protin')->nullable();
            $table->string('quantity_of_anti_mold')->nullable();
            $table->string('quantity_of_water')->nullable();
            $table->string('final_quantity')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('commercial_milks');
    }
};
