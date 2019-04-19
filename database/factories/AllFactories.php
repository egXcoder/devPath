<?php

/* @var $factory \Illuminate\Database\Eloquent\Factory */

use Faker\Generator as Faker;

$factory->define('App\Category', function (Faker $faker) {
    return [
        'name' => $faker->sentence(1),
    ];
});

$factory->define('App\Panel', function (Faker $faker) {
    return [
        'name' => $faker->sentence(1),
    ];
});

$factory->define('App\CodeLanguage', function (Faker $faker) {
    
    return [
        'name' => $faker->sentence(1),
    ];
});

$factory->define('App\Header', function (Faker $faker) {
    return [
        'name' => $faker->sentence(1),
        'priority' => $faker->biasedNumberBetween($min = 1, $max = 10)
    ];
});

$factory->define('App\Content', function (Faker $faker) {
    return [
        'content' => $faker->paragraph(6),
        'priority' => $faker->biasedNumberBetween($min = 1, $max = 10),
    ];
});
