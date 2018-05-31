<?php

$postdata = http_build_query(
    array(
        '$servername' => 'servername',
        '$ip' => 'ip'
        '$portsopen' => 'portsopen'
        '$domain' => 'domain'
        '$userinin' => 'userinin'
        '$modsec' => 'modsec'
    )
);

$opts = array('http' =>
    array(
        'method'  => 'POST',
        'header'  => 'Content-type: application/x-www-form-urlencoded',
        'content' => $postdata
    )
);

$context = stream_context_create($opts);

$result = file_get_contents('http://example.com/submit.php', false, $context);

?>
