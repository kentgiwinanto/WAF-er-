<?php

$rules = DB::select("CALL WAF_Read_SecRules()");
$object = array_shift($rules);


// foreach ($object as $att) {
//     echo $att;
//     echo "<br>";
// }



?>
