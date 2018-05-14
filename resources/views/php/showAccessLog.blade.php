<?php
	$ResultIP = $ResultDB->IP;
	$Result = file_get_contents("http://172.16.55.169:9112/GetAccessLogs.php");
    $Result = json_decode($Result);
    // print_r($Result);
	foreach ($Result as $att => $val) {
        $val = json_decode($val);
        if($val->server_addr == strtolower($ResultIP)){

        	echo "
	        	<tr>
                    <td>".$val->time_local."</td>
                    <td>".$val->remote_addr.":".$val->remote_port."</td>
                    <td>".$val->server_addr.":".$val->server_port."</td>
                    <td>".$val->request."</td>
                    <td>".$val->request_body."</td>
                    <td>".$val->status."</td>
                    <td>".$val->http_user_agent."</td>
				</tr>
        	";
        }
    }
?>