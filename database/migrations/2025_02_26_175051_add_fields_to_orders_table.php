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
        Schema::table('orders', function (Blueprint $table) {
            $table->float('returnBucketTotalPrice', 12, 2);
            $table->json('plastic_bucket_stock')->nullable();
            $table->json('returned_plastic_bucket_stock')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('orders', function (Blueprint $table) {
            $table->dropColumn('returnBucketTotalPrice');
            $table->dropColumn('plastic_bucket_stock');
            $table->dropColumn('returned_plastic_bucket_stock');
        });
    }
};
