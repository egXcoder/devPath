<?php

/* @var $factory \Illuminate\Database\Eloquent\Factory */

use App\Category;
use App\Panel;
use Faker\Generator as Faker;

$factory->define(Panel::class, function (Faker $faker) {
    return [
        'category_id'=>Category::inRandomOrder()->first()->id,
        'order'=>rand(0,10000),
        'name'=>$faker->sentence(3),
    ];
});
