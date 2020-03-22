<?php

function generateTokenAndSetInDatabase(){
    $token = Str::random(60);
    $hashed = hash('sha256', $token);
    auth()->user()->forceFill([
        'api_token' => $hashed,
    ])->save();

    setcookie('devPathApi',$hashed,time()+ env('SESSION_LIFETIME')*60);
}