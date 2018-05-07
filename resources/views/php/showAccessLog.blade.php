<?php
	$ResultIP = $ResultDB->IP;
	$Result = file_get_contents("http://192.168.43.134:9112/GetAccessLogs.php");
	$Result = json_decode($Result);
	foreach ($Result as $att => $val) {
        $val = json_decode($val);
        if($val->server_addr == strtolower($ResultIP)){

        	echo "
	        	<tr>
					<td>".$val->time_local."</td>
					<td>".$val->remote_addr."</td>
					<td>".$val->server_addr.":".$val->server_port."</td>
					<td>".$val->request."</td>
					<td>".$val->request_body."</td>
					<td>".$val->status."</td>
					<td>".$val->body_bytes_sent."</td>
					<td>
						<a data-fancybox data-src='#modal' href='javascript:;' class='btn btn-primary'>
							<div class='fas fa-list'></div>
						</a>
					</td>
				</tr>
        	";
        }
    }
?>