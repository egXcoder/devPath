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

Route::get('/', 'CategoriesController@index');

Route::get('{category_name}/panels', 'PanelsController@listPanelsInCategory');

Route::get('{category_name}/{panel_name}/headers', 'HeadersController@listHeadersInPanel');

Route::get('{category_name}/{panel_name}/contents', 'ContentsController@listContentsInPanel');

Route::middleware('ApiAuthenticated')->group(function () {
    Route::post('{category_name}/panels/create', 'PanelsController@create');
    Route::put('panels/edit/{id}', 'PanelsController@edit');
    Route::post('panels/delete/{id}', 'PanelsController@destroy');

    Route::post('{category_name}/{panel_name}/headers/create', 'HeadersController@create');
    Route::put('/headers/edit/{id}', 'HeadersController@edit');
    Route::post('/headers/delete/{id}', 'HeadersController@destroy');

    Route::post('{category_name}/{panel_name}/contents/create', 'ContentsController@create');
    Route::put('/contents/edit/{id}', 'ContentsController@edit');
    Route::post('/contents/delete/{id}', 'ContentsController@destroy');
});
