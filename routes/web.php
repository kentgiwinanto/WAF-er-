<?php


Auth::routes();

Route::get('/Home','HomeController@index');
Route::get('/Admin','AdminController@index');

//Regis
Route::get('/Register', function () {
    return view('register');
  });
Route::post('/Register', 'RegisterController@store');

//Login
Route::get('/Login', function () {
    return view('login');
  });
Route::post('/Login', 'LoginController@dologin');

//
//
//grouping
Route::group(['middleware' => 'checkuser'], function(){

    //Home
    Route::get('/Home', function () {
        return view('home', compact('username', 'UserJobName'));
    });

    //Server
    Route::get('/Server', function()
    {
    	return view('server');
    });

    //addServer
    Route::get('/AddServer', function()
    {
    	return view('addServer');
    });
    Route::post('/AddServer', 'AddServerController@add');


    //Detail case-sensitive
    Route::get('/Detail', function()
    {
    	return view('detail');
    });

    //Detail case-sensitive
    Route::get('/Detail/{serverID}', function($serverID)
    {
        // return $serverID;
        // return view('Detail')->with('serverID',$serverID);
        return redirect('Detail')->with('serverID',$serverID);
    });

    //Config
    Route::get('/Configuration', function()
    {
    	return view('configuration');
    });
    Route::post('/Configuration', 'ConfigController@add');

    //Logout
    Route::get('/Logout','LoginController@logout');

    Route::get('/pdf', function()
    {
        return view('pdf');
    });

    Route::get('/genPDF','PDFController@downloadPDF');
});
