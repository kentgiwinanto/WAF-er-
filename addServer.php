<?php
	$serverName = $_POST['ServerName'];
	$IP = $_POST['IP'];
	$Port = $_POST['Port'];
	$Domain = $_POST['Domain'];
	$ModSecurity = $_POST['ModSecurity'];

	$content = "
server{
	listen $Port;
	server_name $Domain;
	".($ModSecurity == 1 ? "
	modsecurity on;
	modsecurity_rules_file /etc/nginx/modsec/main.conf;" : "")."
	location / {
		proxy_pass http://$IP;
		proxy_http_version 1.1;
		proxy_set_header Upgrade \$http_upgrade;
		proxy_set_header Connection 'upgrade';
		proxy_set_header Host \$host;
		proxy_cache_bypass \$http_upgrade;
		server_tokens off;
	}
	# redirect server error pages to the static page
	error_page 500 502 503 504 /50x.html;
	location = /50x.html {
		root /usr/share/nginx.html;
	}
}";
	header('Content-type: application/json');
	$fp = fopen("/etc/nginx/conf.d/$serverName.conf","wb") or die(json_encode(array ('Status'=>'0','Message'=>'Error!')));
	fwrite($fp,$content);
	fclose($fp);
	
	echo json_encode(array ('Status'=>'1','Message'=>'Server Added Successfully!'));
?>
