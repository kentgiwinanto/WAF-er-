<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use DB;
use Validator;



class RegisterController extends Controller
{
  protected function submitData(Request $request)
    {

      $firstnametxt = $request->input('firstname');
      $lastnametxt= $request->input('lastname');
      $passwordtxt= $request->input('password');
      $confirmtxt= $request->input('confirm');
      $jobpostcheck = $request->input('jobposition');

      /*  $input['firstname'] = filter_var($input['firstname'], FILTER_SANITIZE_STRING);
        $input['firstname'] = filter_var($input['lastname'], FILTER_SANITIZE_STRING);*/


      $validator = Validator::make($request->all(),[
        'firstname' => 'required|max:32|alpha',
        'lastname' => 'required|max:32|alpha',
        'password' => 'required',
        'confirm' => 'required|same:password',
        'jobposition' => 'required',
      ]);

       if ($validator->fails()) {

            echo "Registration Failed</br>";
            return redirect('/Register')
                        ->withErrors($validator)
                        ->withInput();
        }else{
            $submitData = DB::select("CALL WAF_Insert_Register('$firstnametxt','$lastnametxt','$jobpostcheck','$passwordtxt', 'Admin')");
            echo "Registration Success</br>";
            return redirect('/Login');

        }
       

      
    }  
      
}