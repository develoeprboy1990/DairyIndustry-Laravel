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
        Schema::create('white_cheeses', function (Blueprint $table) {
            $table->id();
            $table->foreignUuid('product_id')->references('id')->on('products')->onDelete('cascade');
            $table->string('type_of_cheese')->nullable();
            $table->string('quantity_of_milk')->nullable();
            $table->string('quantity_of_cylinder_powder')->nullable();
            $table->string('quantity_of_ACC_ghee')->nullable();
            $table->string('quantity_of_starch')->nullable();
            $table->string('quantity_of_stabilizer')->nullable();
            $table->string('quantity_of_protein')->nullable();
            $table->string('quantity_of_calcium')->nullable();
            $table->string('quantity_of_water')->nullable();
            $table->string('quantity_of_salt')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('white_cheeses');
    }
};
