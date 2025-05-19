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
        Schema::table('expired_products', function (Blueprint $table) {
            $table->double('expired_stock', 8, 2)->default(0.00)->after('product_id');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('expired_products', function (Blueprint $table) {
             $table->dropColumn('expired_stock');
        });
    }
};
