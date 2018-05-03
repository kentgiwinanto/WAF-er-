<?php

$config = DB::select("CALL WAF_Read_Config()");
$object = array_shift($config);


foreach ($object as $att => $val) {
    echo $att." : ".$val;
    echo "<br>";

}



?>
