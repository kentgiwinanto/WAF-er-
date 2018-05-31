<?php
	foreach ($ResultLogServer->ResultAccessLog as $att => $val) {
		echo "
			<tr>
				<td>".$val->time_local."</td>
				<td>".$val->remote_addr."</td>
				<td>".$val->server_addr.":".$val->server_port."</td>
				<td>".$val->request."</td>
				<td>".$val->request_body."</td>
				<td>".$val->status."</td>
				<td>".$val->body_bytes_sent."</td>
				<td>".$val->http_user_agent."</td>
			</tr>
		";
    }
?>
