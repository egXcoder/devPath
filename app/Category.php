<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    protected $guarded = [];

    public function getImageUrlAttribute($image_url)
    {
        return asset($image_url);
    }

    public function panels()
    {
        return $this->hasMany('App\Panel');
    }

    public function getRouteKeyName()
    {
        return 'name';
    }
}
