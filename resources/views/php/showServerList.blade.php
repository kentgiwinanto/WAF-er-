<?php
	$Result = DB::select('CALL WAF_Read_ServerList()');
	function pingServer($domainServer, $portServer){

		$starttime = microtime(true);
		$file = @fsockopen($domainServer,$portServer,$errno,$errstr,1);
		$stoptime = microtime(true);
		$status = 0;

		if(!$file) $status = -1;
		else{
			fclose($file);
			$status = ($stoptime - $starttime) * 1000;
			$status = floor($status);
		}
		return $status;

	}

	foreach ($Result as $key => $value) {
		$PingResult = pingServer($value->IP,$value->PortsOpen);
?>
		<div class='col-md-4' onclick="location.href='Detail';" >
			<div class='well' style='cursor: pointer;border-radius: 8px;background-color:<?php echo ($PingResult != -1 ? '#41ea4c' : '#f67c7c'); ?> ;padding-top: 0px;padding-left: 5%;'>
				<h2 style='padding:5px 10px 1px 1px; margin-top: 0px;'>
				<label> <?php echo $value->ServerName ?> </label><br>
				<label style='font-size: 15px;'> <?php echo $value->IP ?> : <?php echo $value->PortsOpen ?> </label><br><small id=<?php echo "'".$value->ServerID."'" ?> style='float: right;'> <?php echo ($PingResult != -1 ? $PingResult." ms" : "Disconnected ") ?> </small> </h2>
			</div>
		</div>
<?php
}
  ?>


