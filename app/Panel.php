<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Panel extends Model
{
    protected $guarded = [];
    public function category(){
        return $this->belongsTo('App\Category');
    }
    public function header(){
        return $this->hasMany('App\Header');
    }
    public function content(){
        return $this->hasMany('App\Content');
    }
}
