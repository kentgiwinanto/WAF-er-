<?php
  $data = DB::select("CALL WAF_Read_Logs()");
  $object = array_shift($data);
  foreach ($object as $att => $val) {
    echo $att." : ".$val."</br>";
  }
?>
