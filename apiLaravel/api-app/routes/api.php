<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('/Cargos','App\Http\Controllers\CargosController@index');

Route::get('/Departamento','App\Http\Controllers\DepartamentosController@index');

Route::get('/Users','App\Http\Controllers\usuarioController@getUsuarios');

Route::get('/UserxId/{id}','App\Http\Controllers\usuarioController@getUsuariosxId');

Route::post('/addUser','App\Http\Controllers\usuarioController@store');

Route::put('/updUser/{usuarios}','App\Http\Controllers\usuarioController@update');

Route::delete('delUser/{usuarios}','App\Http\Controllers\usuarioController@store');
