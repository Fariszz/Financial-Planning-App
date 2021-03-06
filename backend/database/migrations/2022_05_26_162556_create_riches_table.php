<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRichesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('riches', function (Blueprint $table) {
            $table->id();

            $table->unsignedBigInteger('users_id');
            $table->foreign('users_id')->references('id')->on('users');
            $table->integer('total_harta')->nullable();
            $table->integer('total_utang')->nullable();
            $table->integer('total_kekayaan_bersih')->nullable();
            $table->integer('sisa_penghasilan')->nullable();
            $table->enum('status', ['baik', 'tidak-baik'])->default('baik');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('riches');
    }
}
