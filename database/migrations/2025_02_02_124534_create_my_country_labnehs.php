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
        Schema::create('my_country_labnehs', function (Blueprint $table) {
            $table->id();
            $table->foreignUuid('product_id')->references('id')->on('products')->onDelete('cascade');
            $table->string('type_of_labneh')->nullable();
            $table->string('quantity_of_LP_powder')->nullable();
            $table->string('quantity_of_ACC_ghee')->nullable();
            $table->string('quantity_of_stabilizer')->nullable();
            $table->string('quantity_of_protein')->nullable();
            $table->string('quantity_of_anti_mold')->nullable();
            $table->string('quantity_of_qarqam')->nullable();
            $table->string('quantity_of_water')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('my_country_labnehs');
    }
};
