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
        Schema::create('czech_cheeses', function (Blueprint $table) {
            $table->id();
            $table->foreignUuid('product_id')->references('id')->on('products')->onDelete('cascade');
            $table->string('type_of_cheese')->nullable();
            $table->string('quantity_of_milk')->nullable();
            $table->string('quantity_of_swedish_powder')->nullable();
            $table->string('quantity_of_tamara_ghee')->nullable();
            $table->string('quantity_of_starch')->nullable();
            $table->string('quantity_of_stabilizer')->nullable();
            $table->string('obj_TC3')->nullable();
            $table->string('obj_704')->nullable();
            $table->string('quantity_of_salt')->nullable();
            $table->string('quantity_of_cheese')->nullable();
            $table->string('quantity_of_water')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('czech_cheeses');
    }
};
