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
        Schema::create('double_creams', function (Blueprint $table) {
            $table->id();
            $table->foreignUuid('product_id')->references('id')->on('products')->onDelete('cascade');
            $table->string('type_of_cheese')->nullable();
            $table->string('quantity_of_cheese_whey')->nullable();
            $table->string('quantity_of_cylinder_powder')->nullable();
            $table->string('quantity_of_calcium')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('double_creams');
    }
};
