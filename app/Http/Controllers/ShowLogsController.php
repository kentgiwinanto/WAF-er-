<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ShowLogsController extends Controller
{
    public function GetLogsByID(Request $request){
        $Result = array();
        $SecLogID = $request->input('SecLogID');
        // //Ambil Log dari server kemudian di unserialize
        $LogsFromServer = file_get_contents("http://192.168.56.103:9112/GetLogs.php");
        $LogsFromServer = unserialize($LogsFromServer);

        foreach($LogsFromServer as $valForEach){
            //decode dahulu kemudian compare
            $valForEach = json_decode($valForEach);
            if($valForEach->transaction->id == $SecLogID){
                array_push($Result,$valForEach);
            }
        }
        if(count($Result) > 0){
            header('Content-Type: application/json');
            header("Cache-Control: no-cache, must-revalidate");
            return json_encode(array("Status"=>"1","Message"=>$Result));
        }else{
            header('Content-Type: application/json');
            header("Cache-Control: no-cache, must-revalidate");
            return json_encode(array("Status"=>"0","Message"=>"No Data Found!"));
        }
    }
}
