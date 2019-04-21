<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateContentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('contents', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->text('content');
            $table->tinyInteger('priority')->unsigned();
            $table->bigInteger('code_language_id')->unsigned();
            $table->bigInteger('panel_id')->unsigned();
            $table->timestamps();
            $table->foreign('panel_id')
                ->on('panels')
                ->references('id')
                ->onUpdate('No Action')
                ->onDelete('Cascade');
            
            $table->foreign('code_language_id')
                ->on('code_languages')
                ->references('id')
                ->onUpdate('No Action')
                ->onDelete('Restrict');

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('contents');
    }
}
