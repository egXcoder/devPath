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

Route::get('headersAndContents/{panel_id}', 'PanelsController@getHeadersAndContentsFrom');

Route::get('{category_name}/panels', 'PanelsController@listPanelsInCategory');
Route::post('{category_name}/panels/create', 'PanelsController@create');
Route::put('panels/edit/{id}', 'PanelsController@edit');
Route::delete('panels/delete/{id}', 'PanelsController@destroy');

Route::get('{category_name}/{panel_name}/headers', 'HeadersController@listHeadersInPanel');
Route::post('{category_name}/{panel_name}/headers/create', 'HeadersController@create');
Route::put('/headers/edit/{id}', 'HeadersController@edit');
Route::delete('/headers/delete/{id}', 'HeadersController@destroy');

Route::get('{category_name}/{panel_name}/contents', 'ContentsController@listContentsInPanel');
Route::post('{category_name}/{panel_name}/contents/create', 'ContentsController@create');
Route::put('/contents/edit/{id}', 'ContentsController@edit');
Route::delete('/contents/delete/{id}', 'ContentsController@destroy');
