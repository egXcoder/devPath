<?php

/* @var $factory \Illuminate\Database\Eloquent\Factory */

use App\Header;
use App\Model;
use App\Panel;
use Faker\Generator as Faker;

$factory->define(Header::class, function (Faker $faker) {
    return [
        'name'=>$faker->sentence(3),
        'order'=>rand(1,100000),
        'panel_id'=>Panel::inRandomOrder()->first()->id,
    ];
});
