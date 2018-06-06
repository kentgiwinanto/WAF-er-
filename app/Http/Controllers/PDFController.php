<?php

namespace App\Http\Controllers;
use UAParser\Parser;
use Illuminate\Http\Request;
use PDF,DB;

class PDFController extends Controller
{
	 private function GetServerDetailFromServerID($ServerID){
        $ResultDB = DB::select("CALL WAF_Read_GetServerDetail('$ServerID')")[0];
        return $ResultDB;
    }

    private function GetSecLogsFromServer(){
        $LogsFromServer = unserialize(file_get_contents("http://192.168.56.103:9112/GetLogs.php"));
        return $LogsFromServer;
    }

    private function GetAccessLogsFromServer(){
        $LogsFromServer = json_decode(file_get_contents("http://192.168.56.103:9112/GetAccessLogs.php"));
        return $LogsFromServer;
    }
    
    public function GetLogsByID(Request $request){
        $Result = array();
        $SecLogID = $request->input('SecLogID');
        $Logs = $this->GetSecLogsFromServer();

        foreach($Logs as $valForEach){
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

    public function GetDetailPageWithSecLogAndAccessLog($ServerIDPam){
        $ResultSecLog = array();
        $ResultAccessLog = array();
        $ServerDetail = $this->GetServerDetailFromServerID($ServerIDPam);
        $SecLogs = $this->GetSecLogsFromServer();
        $AccessLogs = $this->GetAccessLogsFromServer();
        $LogCount = 0;
        $GetCount =0;
        $PostCount=0;
        $SafariCount=0;
        $FirefoxCount=0;
        $ChromeCount=0;


        // $i=count($SecLogs);
        // BUAT SEC LOG
        foreach($SecLogs as $valForEach){
            $valForEach = json_decode($valForEach);
            // print_r(
            	
            // );die;
            if($valForEach->transaction->request->headers->Host == strtolower($ServerDetail->Domain)){
                array_push($ResultSecLog,$valForEach);
            }
            if(strstr($valForEach->transaction->time_stamp,'Jun')){
            	$LogCount++;
            }
        }
        // BUAT ACCESS LOG
        foreach($AccessLogs as $valForEach){
            $valForEach = json_decode($valForEach);
            $ua= $valForEach->http_user_agent;
            $parser = Parser::create();
			$resultua = $parser->parse($ua);	
            if($valForEach->server_name == strtolower($ServerDetail->Domain)){
                array_push($ResultAccessLog,$valForEach);                
                if (strstr(substr($valForEach->request,0,3),'GET')) {
            		$GetCount++;
             	}if (strstr(substr($valForEach->request,0,3), 'POST')){
            		$PostCount++;
                }if(strstr($resultua->ua->family,'Safari')){
                	$SafariCount++;
                }if(strstr($resultua->ua->family, 'Firefox')){
                	$FirefoxCount++;
                }if(strstr($resultua->ua->family,'Chrome')){
                	$ChromeCount++;
                }
            }
        }
        
        print_r($ChromeCount);
        die();
            
        // foreach($SecLogs as $valForEach){
        //    if(strpos($valForEach->transaction->time_stamp,'Jun'== true){
        //         $LogCount++;

        //    }
        // }


       
       return redirect('pdf')->with(
        	'ResultLogServer',
        	json_encode(
        		array(
        			"ServerDetail"=>$ServerDetail,
        			"ResultSecLog"=>$ResultSecLog,
        			"ResultAccessLog"=>$ResultAccessLog,
        			"LogCount"=>$LogCount,
        			"GetCount"=>$GetCount,
        			"PostCount"=>$PostCount
        		)
        	)
        );     
        
    }
      public function downloadPDF(){

      $pdf = PDF::loadView('/pdf');
      return $pdf->download('invoice.pdf');

    }
}
