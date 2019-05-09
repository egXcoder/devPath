<?php

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::get('{category}/panels', 'PanelsController@listPanelsInCategory');

Route::middleware('ApiAuthenticated')->group(function () {

    Route::post('{category}/panels/editOrder', 'PanelsController@editOrder');

    Route::post('{category}/panels/create', 'PanelsController@create');
    Route::post('panels/edit/{panel}', 'PanelsController@edit');
    Route::post('panels/delete/{panel}', 'PanelsController@destroy');

    Route::post('{panel}/headers/create', 'HeadersController@create');
    Route::post('/headers/edit/{header}', 'HeadersController@edit');
    Route::post('/headers/delete/{header}', 'HeadersController@destroy');

    Route::post('{panel}/contents/create', 'ContentsController@create');
    Route::post('/contents/edit/{content}', 'ContentsController@edit');
    Route::post('/contents/delete/{content}', 'ContentsController@destroy');
});