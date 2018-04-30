<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Http\Request;
use DB;

class AddServerController extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

    public function add(Request $request)
    {
      $servername = $request->input('servername');
      $ip = $request->input('ip');
      $portsopen = $request->input('portsopen');
      $domain = $request->input('domain');
      $userinin = session()->get('UserProfileID');
      $modsec = $request->input('modsecurity') == true ? '1':'0';

      //store sp db
      $store = DB::select("CALL WAF_Insert_ServerList(
        '$userinin','$servername','$ip','$portsopen','$domain','$modsec')");

      if($store[0]->ValueReturn == 0){
        echo $store[0]->MessageReturn;
      }
      else{
        $url = 'http://172.16.55.169:9112/addServer.php';
        $data = array(
          'ServerName' => $servername,
          'IP' => $ip,
          'Port' => $portsopen,
          'Domain' => $domain,
          'ModSecurity' => $modsec
        );

        // use key 'http' even if you send the request to https://...
        $options = array(
            'http' => array(
                'header'  => "Content-type: application/x-www-form-urlencoded\r\n",
                'method'  => 'POST',
                'content' => http_build_query($data)
            )
        );

        $context  = stream_context_create($options);
        $result = file_get_contents($url, false, $context);
        return redirect('Server')->with('message', json_decode($result)->Message);
      }

      

      // if(($result == 0) || count($store) == 0)
      // {
      //   echo "Add Server Failed Wrong Data Passed<br/>";
      //   echo "inserted :".$userinin." ".$servername." ".$ip." ".$portsopen." ".$domain." ".$modsec;
      //   //return redirect('/Server');
      // }else{
      //   echo "Add Server Successfull<br/>";
      //   print_r($request->input()->all());

      //   //return redirect('/AddServer');
      //    return back()->withErrors([
      //      'message' => 'Please check your credentials and try again.'
      //    ]);
      // }

      // if(count($store) == 0){
      //   echo "Add Server Failed Wrong Data Passed<br/>";
      //   echo "inserted :".$userinin;
      //   return redirect('/Server');
      
      // }else{
      //   echo "Add Server Successfull<br/>";
      //   print_r($request->input()->all());
      
      //   //return redirect('/AddServer');
      //    return back()->withErrors([
      //      'message' => 'Please check your credentials and try again.'
      //    ]);
      // }

    }

    public function cancel()
    {
      return redirect('/Server');
    }

}
