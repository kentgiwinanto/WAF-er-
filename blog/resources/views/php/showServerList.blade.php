<?php

	function pingServer($domainServer, $portServer){
		$starttime = microtime(true);
		$file = fsockopen($domainServer, $portServer, $errno, $errstr, 10);
		$stoptime = microtime(true);
		$status = 0;

		if(!$file) $status = -1;
		else{
			fclose($file);
			$status = ($stoptime - $starttime) * 1000;
			$status = floor($status);
		}
		return "Ping: ".$status." ms";
	}
	
	$Result = DB::select('CALL WAF_Read_ServerList()');
	foreach ($Result as $key => $value) {
?>
		<div class='col-md-4' onclick="location.href='Detail';" >
		<div class='well'style='cursor: pointer;border-radius: 8px;background-color: #41ea4c;padding-top: 0px;padding-left: 5%;'>
			<h2 style='padding:5px 10px 1px 1px; margin-top: 0px;'>
			<label> <?php echo $value->ServerName ?> </label><br>
			<label style='font-size: 15px;'> <?php echo $value->IP ?> : <?php echo $value->PortsOpen ?> </label><br><small style='float: right;'> 32 ms </small> </h2>
		</div>
	</div>
<?php
}
  ?>
