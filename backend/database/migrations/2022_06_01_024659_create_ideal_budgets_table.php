<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateIdealBudgetsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('ideal_budgets', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('users_id');
            $table->foreign('users_id')->references('id')->on('users');
            $table->integer('total_penghasilan');
            $table->integer('agama')->nullable();
            $table->integer('tabungan')->nullable();
            $table->integer('asuransi')->nullable();
            $table->integer('cicilan')->nullable();
            $table->integer('investasi')->nullable();
            $table->integer('rumah_tangga')->nullable();
            $table->integer('anak')->nullable();
            $table->integer('hiburan')->nullable();
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
        Schema::dropIfExists('ideal_budgets');
    }
}
