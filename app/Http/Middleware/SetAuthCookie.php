<?php

namespace App\Http\Middleware;

use Closure;

class SetAuthCookie
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        if(auth()->user()){
            generateTokenAndSetInDatabase();
        }
        return $next($request);
    }
}
