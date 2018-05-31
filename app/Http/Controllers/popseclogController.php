<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class popseclogController extends Controller
{
	public function validateseclog(Request $request)
	{
		$ServerID = Session::get("serverID");
		$ResultDB = DB::select("CALL WAF_Read_GetServerDetail('$ServerID')")[0];

		$ResultDomain = $ResultDB->Domain;
		$Result = file_get_contents("http://192.168.43.231:9112/GetLogs.php");
		$Result = unserialize($Result);

		foreach ($Result as $att => $val) {
		    $val = json_decode($val);
		    if($val->transaction->request->headers->Host == strtolower($ResultDomain)&& $val->transaction->id == ValueLogId){
				$msg = $val->transaction->messages;
				foreach ($msg as $key => $value) {
						$value->details->data = str_replace(array("'", "\"", "&quot;","`","%3C","%3E","<",">"), '', $value->details->data);
						$value->details->match = str_replace(array("'", "\"", "&quot;","`","%3C","%3E","<",">"), '', $value->details->match);

						echo $val->transaction->id;
						echo $value->message;
						echo $value->details->match;
						echo $value->details->reference;
						echo $value->details->ruleId;
						echo $value->details->file;
						echo $value->details->lineNumber;
						echo $value->details->data;
						echo $value->details->severity;
						echo $value->details->ver;
						echo $value->details->rev;
						
						$tagss = $value->details->tags;
						foreach ($tagss as $tagsss) {
							echo $tagsss;
						}
						echo $value->details->maturity;
						echo $value->details->accuracy;
				}

			}

		}
		header('Content-type: application/json');
		return json_encode(array($Result));

	}
}
