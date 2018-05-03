<?php

$config = DB::select("CALL WAF_Read_Config()");

foreach ($config as $att => $val) {
    echo '<option value="'.$val->ConfigName.'" ><li><a href="#">'.$val->ConfigName.'</option></a></li>';
}

?>
