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
            $table->string('bucketName')->nullable();
            $table->string('bucketStock')->nullable();
            $table->float('bucketTotalPrice')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('orders', function (Blueprint $table) {
            $table->dropColumn('bucketName');
            $table->dropColumn('bucketStock');
            $table->dropColumn('bucketTotalPrice');
        });
    }
};
