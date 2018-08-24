<?php
	$Addresses = json_decode($_POST["Addresses"]);
	//print_r($Addresses[0]->IP);
	foreach($Addresses as $key=>$value){
		/*
		$starttime = microtime(true);
		$file = fsockopen($value->IP, $value->Port, $errno, $errstr, 10);
		$stoptime = microtime(true);
		$status = 0;
	
		if(!$file) $status = -1;
		else{
			fclose($file);
			$status = ($stoptime - $starttime)*1000;
			$status = floor($status);
		}
		$Addresses[$key]->Ping = $status;*/
		$Addresses[$key]->Ping = 2;
		print_r($Addresses[$key]);
	}
	//header('Content-Type: application/json');
	//print_r($Addresses);
	//die();
	//return json_encode($Addresses);
?>
