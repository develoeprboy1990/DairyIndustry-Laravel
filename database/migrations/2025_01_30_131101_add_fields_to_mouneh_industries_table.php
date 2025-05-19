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
        Schema::table('mouneh_industries', function (Blueprint $table) {
            //
            $table->string('cheese_qty')->nullable();
            $table->string('water_qty')->nullable();
            $table->string('citricAcid_qty')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('mouneh_industries', function (Blueprint $table) {
            //
            $table->dropColumn('cheese_qty');
            $table->dropColumn('water_qty');
            $table->dropColumn('citricAcid_qty');
        });
    }
};
