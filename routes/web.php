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

Route::get('/login',function(){
	return view('login');
});

Route::get('/addServer',function(){
	return view('addserver');
});

Route::get('/configuration',function(){
	return view('configuration');
});

Route::get('/detail',function(){
	return view('detail');
});

Route::get('/home',function(){
	return view('home');
});

Route::get('/server',function(){
	return view('server');
});

Route::get('/register',function(){
	return view('register');
});

Route::post('/doLogin', 'testongController@Request');