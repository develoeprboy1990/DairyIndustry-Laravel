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
        Schema::create('expense_categories', function (Blueprint $table) {
            $table->uuid('id')->primary(); // UUID primary key
            $table->string('image_path')->nullable(); // Path for category image
            $table->string('name'); // Name of the category
            $table->integer('sort_order')->default(0); // Sorting order
            $table->boolean('is_active')->default(true); // Active status
            $table->softDeletes(); // Soft deletes
            $table->timestamps(); // Created at and u
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('expense_categories');
    }
};
