<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
   public function up()
    {
        // List of table names that need to be updated
        $tables = [ 'milk_details', 'raclette', 'raclette_2','serum_dairy', 'shankleesh', 'tomme', 'tomme_2'
        ];
    
        foreach ($tables as $table) {
            Schema::table($table, function (Blueprint $table) {
                // Add product_id column as char(36)
                $table->char('product_id', 36)->nullable()->after('updated_at'); // Add 'existing_column' based on your requirement
                
                // Optional: Add foreign key if you want (if you have the products table)
                $table->foreign('product_id')->references('id')->on('products')->onDelete('cascade');
            });
        }
    }
    
    public function down()
    {
        // Rollback changes
        $tables = [ 'milk_details', 'raclette', 'raclette_2', 
            'serum_dairy', 'shankleesh', 'tomme', 'tomme_2'
        ];
    
        foreach ($tables as $table) {
            Schema::table($table, function (Blueprint $table) {
                $table->dropColumn('product_id');
            });
        }
    }

};
