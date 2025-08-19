<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('procurement_details', function (Blueprint $table) {
            $table->dropColumn('type_of_procurement');
        });
    }

    public function down(): void
    {
        Schema::table('procurement_details', function (Blueprint $table) {
            $table->string('type_of_procurement')->nullable();
        });
    }
};
