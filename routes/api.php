<?php

use Illuminate\Http\Request;
use App\Http\Resources\PanelResource;
use App\Panel;
use App\Http\Controllers\PanelsController;

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

Route::get('panels','PanelsController@index');
Route::get('{category_name}/panels','PanelsController@listPanelsInCategory');
Route::post('{category_name}/panels/create','PanelsController@create');
Route::post('{category_name}/panels/edit/{panel_name}','PanelsController@edit');
Route::get('{category_name}/panels/delete/{panel_name}','PanelsController@destroy');