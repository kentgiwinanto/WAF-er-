<?php


Auth::routes();

Route::get('/Home','HomeController@index');
Route::get('/Admin','AdminController@index');

//Regis
Route::get('/Register', function () {
    return view('Register');
  });
Route::post('/Register', 'RegisterController@store');

//Login
Route::get('/Login', function () {
    return view('Login');
  });
Route::post('/Login', 'LoginController@dologin');

//
//
//grouping
Route::group(['middleware' => 'checkuser'], function(){

    //Home
    Route::get('/Home', function () {
        return view('Home', compact('username', 'UserJobName'));
    });

    //Server
    Route::get('/Server', function()
    {
    	return view('Server');
    });

    //addServer
    Route::get('/AddServer', function()
    {
    	return view('AddServer');
    });
    Route::post('/AddServer', 'AddServerController@add');


    //Detail case-sensitive
    Route::get('/Detail', function()
    {
    	return view('Detail');
    });

    //Config
    Route::get('/Configuration', function()
    {
    	return view('Configuration');
    });
    Route::post('/Configuration', 'ConfigController@add');

    //Logout
    Route::get('/Logout','LoginController@logout');
});




Route::get('/read', function()
{
   $data = DB::select("CALL WAF_Read_Logs()");
   $object = json_encode($data, TRUE);

   return $object;
 });

 Route::get('/Testong','GetLogs@getLog');
  Route::get('/Testing','ShowLogServer@showlog');
