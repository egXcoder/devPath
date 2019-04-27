<?php

namespace App\Http\Middleware;

use Closure;

class ApiAuthenticated {
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next) {
        $api_token_in_database = \App\User::find(1)->api_token;
        if($request->header('api_token')===$api_token_in_database){
            return $next($request);
        }else{
            return response()->json(['401'=>'unauthorized']);
        }
    }
}
