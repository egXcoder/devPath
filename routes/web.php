<?php
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
Route::prefix('admin')->group(function () {
    // Authentication Routes...
    Route::get('/login', 'Auth\LoginController@showLoginForm')->name('login');
    Route::post('/login', 'Auth\LoginController@login');
    Route::post('/logout', 'Auth\LoginController@logout')->name('logout');

    Route::middleware('auth')->group(function () {
        Route::get('/', 'AdminController@index')->where('any', '.*');
        Route::get('{any}', 'AdminController@index')->where('any', '.*');
    });
});

Route::get('{any}', 'HomeController@index')->where('any', '.*');