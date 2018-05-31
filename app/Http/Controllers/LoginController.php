<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Http\Request;
//use App\Http\Request;
use App\Users;
use Validator;
use Auth;
use DB;

class LoginController extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests, AuthenticatesUsers;

    protected $redirectTo = '/';

    public function doLogin(Request $request)
    {

      $username = $request->input('username');
      $password = $request->input('password');

      $Validator = Validator::make($request->all(), [
           'username'  => 'required',
           'password'  => 'required',
       ]);

       if($Validator->fails()) {
           return redirect('/Login')
               ->withErrors($Validator)
               ->withInput();
           print_r($request->input());
       }

      $checkLogin = DB::select("CALL WAF_Read_Login('$username','$password')");

      if (count($checkLogin) > 0) {
        echo "Login Successfull<br/>";

        //session
        $object = array_shift($checkLogin);
        $userinin = $object->UserProfileID;
        $username = $object->FullName;
        $userjobname = $object->UserJobName;

        $request->session()->put('UserProfileID', $userinin);
        $request->session()->put('Username', $username);
        $request->session()->put('UserJobName', $userjobname);

        return redirect('/Home');

      }else{
        echo "Login Failed Wrong Data Passed<br/>";

        //return redirect('/Login');

        return back()->withErrors([
          'message' => 'Please check your credentials and try again.'
        ]);
      }
    }

    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }

    protected function redirectTo()
    {
        return '/path';
    }

    public function logout(Request $request)
    {
        $request->session()->flush();
        return redirect('/Login');
    }

}



?>
