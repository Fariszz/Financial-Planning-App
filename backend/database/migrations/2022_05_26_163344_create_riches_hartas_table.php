<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRichesHartasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('riches_hartas', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('users_id');
            $table->foreign('users_id')->references('id')->on('users');
            $table->string('harta');
            $table->integer('rupiah');
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
        Schema::dropIfExists('riches_hartas');
    }
}
