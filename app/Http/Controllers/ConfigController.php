<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Http\Request;
use DB;

class ConfigController extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

    public function add(Request $request)
    {
      $configname = $request->input('configname');
      $ip = $request->input('ip');
      $portsopen = $request->input('portsopen');
      $domain = $request->input('domain');
      $userinin = session()->get('UserProfileID');
      //Session::get('variableName');

      $store = DB::select("CALL WAF_Insert_Config(
        '$userinin','$servername','$ip','$portsopen','$domain','1')");

      if(count($store) == 0){
        echo "Add Server Failed Wrong Data Passed<br/>";
        echo "inserted :".$userinin;
        return redirect('/Server');

      }else{
        echo "Add Server Successfull<br/>";
        print_r($request->input()->all());

        //return redirect('/AddServer');
         return back()->withErrors([
           'message' => 'Please check your credentials and try again.'
         ]);
      }

    }

    public function cancel()
    {
      return redirect('/Server');
    }

}
