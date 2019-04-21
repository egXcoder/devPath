<?php

use Illuminate\Http\Request;

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

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('panels', 'PanelsController@index');

Route::get('{category_name}/panels', 'PanelsController@listPanelsInCategory');
Route::post('{category_name}/panels/create', 'PanelsController@create');
Route::put('{category_name}/panels/edit/{panel_name}', 'PanelsController@edit');
Route::delete('{category_name}/panels/delete/{panel_name}', 'PanelsController@destroy');

Route::get('{category_name}/{panel_name}/headers', 'HeadersController@listHeadersInPanel');
Route::post('{category_name}/{panel_name}/headers/create', 'HeadersController@create');
Route::put('{category_name}/{panel_name}/headers/edit/{header_name}', 'HeadersController@edit');
Route::delete('{category_name}/{panel_name}/headers/delete/{header_name}', 'HeadersController@destroy');


