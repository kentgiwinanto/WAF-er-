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


//Index redirect to login
Route::get('/Login', function () {
    return view('Login');
});

//Home case-sensitive
Route::get('/Home', function () {
    return view('Home');
});

//Register case-sensitive
Route::get('/Register', function()
{
	return view('Register');
});

//Server case-sensitive
Route::get('/Server', function()
{
	return view('Server');
});

//Detail case-sensitive
Route::get('/Detail', function()
{
	return view('Detail');
});

//Protection case-sensitive
Route::get('/Protection', function()
{
	return view('Protection');
});


Route::post('/submiteRegister','RegisterController@inputData');









