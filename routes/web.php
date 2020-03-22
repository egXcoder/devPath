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

    Route::middleware('auth')->group(function(){
        Route::get('/', 'AdminController@index')->name('admin.index');
        Route::get('/{category}', 'AdminController@showSpecificCategory')->name('admin.show');
        Route::post('/categories/create', 'AdminController@createCategory')->name('categories.create');
        Route::post('/categories/edit/{id}', 'AdminController@editCategory')->name('categories.edit');
        Route::get('/categories/delete/{id}', 'AdminController@deleteCategory')->name('categories.delete');
    });
});


Route::get('/', 'HomeController@index')->name('guest.index');
Route::get('/{category}', 'HomeController@showSpecificCategory')->name('guest.show');
