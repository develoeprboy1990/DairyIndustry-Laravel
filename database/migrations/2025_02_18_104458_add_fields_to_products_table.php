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
            $table->integer('minimum_stock')->nullable()->after('in_stock');
            $table->integer('packet_type_1kg')->nullable()->after('in_stock');
            $table->integer('packet_type_2kg')->nullable()->after('in_stock');
            $table->integer('packet_type_5kg')->nullable()->after('in_stock');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('products', function (Blueprint $table) {
            $table->dropColumn('minimum_stock');
            $table->dropColumn('packet_type_1kg');
            $table->dropColumn('packet_type_2kg');
            $table->dropColumn('packet_type_5kg');
        });
    }
};
