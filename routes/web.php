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

Route::get('/Login', function () {
    return view('login');
});


Route::get('/Addserver', function () {
    return view('addserver');
});


Route::get('/Configuration', function () {
    return view('configuration');
});


Route::get('/Detail', function () {
    return view('detail');
});


Route::get('/Home', function () {
    return view('home');
});


Route::get('/Register', function () {
    return view('register');
});


Route::get('/Server', function () {
    return view('server');
});


Route::get('/', function () {
    return view('welcome');
});
	
Route::post('/doLogin','testongController@Request');
