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
         Schema::table('products', function (Blueprint $table) {
            // Add the expired_flag column
            $table->boolean('expired_flag')->default(false)->after('expiry_date');

            // Add the expired_product_id column as a foreign key to expired_products
            $table->char('expired_product_id', 36)->nullable()->after('expired_flag');
            $table->foreign('expired_product_id')->references('id')->on('expired_products')->onDelete('set null');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('products', function (Blueprint $table) {
             // Drop the added columns
            $table->dropForeign(['expired_product_id']);
            $table->dropColumn(['expired_flag', 'expired_product_id']);
        });
    }
};
