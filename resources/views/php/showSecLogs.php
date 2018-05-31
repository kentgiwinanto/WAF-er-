<?php
    $ResultDomain = $ResultDB->Domain;
    $Result = file_get_contents("http://192.168.56.103:9112/GetLogs.php");
    $Result = unserialize($Result);
    foreach ($Result as $att => $val) {
        $val = json_decode($val);
       //if($val->transaction->request->headers->Host == strtolower($ResultDomain)){
             echo "<form action='/detail'><tr>
                <td>".$val->transaction->id."</td>
                <td>".$val->transaction->time_stamp."</td>
                <td>".@$val->transaction->messages[0]->message."</td>

                <!-- <td>SQLi</td> -->
                <td>".$val->transaction->client_ip.":".$val->transaction->client_port."</td>
                <td>".$val->transaction->request->headers->Host.":".$val->transaction->host_port."</td>
                <!-- <td>High</td> -->
                <td><a data-fancybox data-src='#modal' ValueLogID='".$val->transaction->id."' class='btn btn-primary FancyBoxButtonPopUp'><div class='fas fa-list'></div></a></td>
            </tr></form>";
        //}
    }
?>
