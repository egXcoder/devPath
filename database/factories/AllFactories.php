<?php

/* @var $factory \Illuminate\Database\Eloquent\Factory */

use App\Panel;
use Faker\Generator as Faker;

$factory->define(Panel::class, function (Faker $faker) {
    return [
        'name' => $faker->sentence(1),
    ];
});

$factory->define('App\Category',function (Faker $faker){
 return [
        'name' => $faker->sentence(1),
    ];
});

$factory->define('App\Header',function (Faker $faker){
 return [
        'name' => $faker->sentence(1),
    ];
});

$factory->define('App\Content',function (Faker $faker){
 return [
        'name' => $faker->sentence(1),
    ];
});
