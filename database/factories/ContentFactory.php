<?php

/* @var $factory \Illuminate\Database\Eloquent\Factory */

use App\CodeLanguage;
use App\Content;
use App\Panel;
use Faker\Generator as Faker;

$factory->define(Content::class, function (Faker $faker) {
    return [
        'content'=>$faker->paragraph(10),
        'order'=>rand(1, 100000),
        'panel_id'=>Panel::inRandomOrder()->first()->id,
        'code_language_id'=>CodeLanguage::inRandomOrder()->first()->id,
    ];
});
