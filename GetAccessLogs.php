<?php
	$filename = '/var/log/nginx/accessJSON.log';
	$contents = file($filename);
	header('Content-type: application/json');
	echo json_encode($contents);
	//header('Content-type: application/json');
	//foreach($contents as $line=>$value){
	//	echo $value.",\n";
	//}
?>
