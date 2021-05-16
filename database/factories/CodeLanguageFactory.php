<?php

/* @var $factory \Illuminate\Database\Eloquent\Factory */

use App\CodeLanguage;
use App\Model;
use Faker\Generator as Faker;

$factory->define(CodeLanguage::class, function (Faker $faker) {
    return [
        'name'=>$faker->word,
    ];
});
