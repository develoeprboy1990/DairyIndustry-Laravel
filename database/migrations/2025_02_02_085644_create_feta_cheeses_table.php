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
        Schema::create('feta_cheeses', function (Blueprint $table) {
            $table->id();
            $table->foreignUuid('product_id')->references('id')->on('products')->onDelete('cascade');
            $table->string('type_of_milk')->nullable();
            $table->string('quantity_milk')->nullable();
            $table->string('quantity_swedish_powder')->nullable();
            $table->string('quantity_ACC_ghee')->nullable();
            $table->string('quantity_protein')->nullable();
            $table->string('quantity_stabilizer')->nullable();
            $table->string('quantity_GBL')->nullable();
            $table->string('quantity_cheese')->nullable();
            $table->string('quantity_water')->nullable();
            $table->string('quantity_produced')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('feta_cheeses');
    }
};
