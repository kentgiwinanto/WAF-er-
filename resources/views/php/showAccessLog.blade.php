<?php
	$ResultIP = $ResultDB->IP;
	$Result = file_get_contents("http://192.168.56.103:9112/GetAccessLogs.php");
	$Result = json_decode($Result);
	// print_r($Result[0]);
	// die;
	foreach ($Result as $att => $val) {
        $val = json_decode($val);
        if($val->server_addr == strtolower($ResultIP)){

        	echo "
	        	<tr>
			 	  <td>".$val->time_local."</td>
                  <td>".$val->remote_addr."</td>
                  <td>".$val->remote_user."</td>
                  <td>".$val->server_addr.":".$val->server_port."</td>
                  <td>".$val->server_name."</td>
                  <td>".$val->server_protocol."</td>
                  <td>".$val->request."</td>
                  <td>".$val->request_uri."</td>
                  <td>".$val->request_body."</td>
                  <td>".$val->status."</td>
                  <td>".$val->body_bytes_sent."</td>
                  <td>".$val->request_time."</td>
                  <td>".$val->http_referrer."</td>
                  <td>".$val->http_user_agent."</td>
				</tr>
        	";
        }
    }
?>
