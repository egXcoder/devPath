<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Content extends Model
{
    protected $guarded =[];
    public function codeLanguage(){
        return $this->belongsTo('App\CodeLanguage');
    }
}
