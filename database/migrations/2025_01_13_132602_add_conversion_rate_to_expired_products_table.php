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
            $table->decimal('conversion_rate', 8, 2)->nullable()->after('expired_stock');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('expired_products', function (Blueprint $table) {
            $table->dropColumn('conversion_rate');
        });
    }
};
