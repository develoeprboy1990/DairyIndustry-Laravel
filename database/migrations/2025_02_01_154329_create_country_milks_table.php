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
        Schema::create('country_milks', function (Blueprint $table) {
            $table->id();
            $table->foreignUuid('product_id')->references('id')->on('products')->onDelete('cascade');
            $table->string('type_of_milk')->nullable();
            $table->string('qty_lp_powder')->nullable();
            $table->string('qty_natural_milk')->nullable();
            $table->string('qty_ACC_ghee')->nullable();
            $table->string('qty_stabilizer')->nullable();
            $table->string('qty_protein')->nullable();
            $table->string('qty_anti_mold')->nullable();
            $table->string('qty_water')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('country_milks');
    }
};
