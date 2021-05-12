<?php

namespace App\Listeners;

use Cookie;

class ClearApiToken
{
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     *
     * @param  object  $event
     * @return void
     */
    public function handle($event)
    {
        $event->user->update(['api_token'=>null]);

        Cookie::queue(Cookie::make('api_token', '', -1));
    }
}
