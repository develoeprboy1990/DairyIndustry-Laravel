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
        Schema::create('ingredients', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->integer('quantity_of_milk')->nullable();
            $table->integer('quantity_of_swedish_powder')->nullable();
            $table->integer('quantity_of_ACC_butter')->nullable();
            $table->integer('quantity_of_cheese')->nullable();
            $table->integer('quantity_of_citriv_acid')->nullable();
            $table->integer('quantity_of_water')->nullable();
            $table->integer('quantity_of_tamara_ghee')->nullable();
            $table->integer('quantity_of_starch')->nullable();
            $table->integer('quantity_of_stabilizer')->nullable();
            $table->integer('quantity_of_TC3')->nullable();
            $table->integer('quantity_of_704')->nullable();
            $table->integer('quantity_of_salt')->nullable();
            $table->integer('quantity_of_LP_powder')->nullable();
            $table->integer('quantity_of_ACC_ghee')->nullable();
            $table->integer('quantity_of_protin')->nullable();
            $table->integer('quantity_of_anti_mold')->nullable();
            $table->integer('quantity_of_qarqam')->nullable();
            $table->integer('quantity_of_cylinder_powder')->nullable();
            $table->integer('quantity_of_calcium')->nullable();
            $table->integer('quantity_of_whey')->nullable();
            $table->integer('quantity_of_GBL')->nullable();
            $table->integer('quantity_of_sorbate')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('ingredients');
    }
};
