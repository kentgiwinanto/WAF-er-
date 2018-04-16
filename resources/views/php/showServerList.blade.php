<?php
	$Result = DB::select('CALL WAF_Read_ServerList()');
	foreach ($Result as $key => $value) {
		echo "<div class='col-md-4'>
		<div class='well' style='cursor: pointer;border-radius: 8px;background-color: #41ea4c;padding-top: 0px;padding-left: 5%;'>
			<h2 style='padding:5px 10px 1px 1px; margin-top: 0px;'> <label>Server</label>  <br><label style='font-size: 15px;'>".$value->IP."</label><br><small style='float: right;'> 32 ms </small> </h2>
		</div>
	</div>";
	}
?>

