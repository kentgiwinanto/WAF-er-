<?php
$ServerID = Session::get("serverID");
$ResultDB = DB::select("CALL WAF_Read_GetServerDetail('$ServerID')")[0];
$ResultDomain = $ResultDB->Domain;
$Result = file_get_contents("http://192.168.56.103:9112/GetLogs.php");
$Result = unserialize($Result);


foreach ($Result as $att => $val) {
    $val = json_decode($val);
    if($val->transaction->request->headers->Host == strtolower($ResultDomain)){
         $msg = $val->transaction->messages;
         foreach ($msg as $key => $value) {
           $value->details->data = str_replace(array("'", "\"", "&quot;","`","%3C","%3E","<",">"), '', $value->details->data);
           $value->details->match = str_replace(array("'", "\"", "&quot;","`","%3C","%3E","<",">"), '', $value->details->match);

           echo "<tr>
           <td>".$val->transaction->id."</td>
           <td>".$value->message."</td>
           <td>".$value->details->match."</td>
           <td>".$value->details->reference."</td>
           <td>".$value->details->ruleId."</td>
           <td>".$value->details->file."</td>
           <td>".$value->details->lineNumber."</td>
           <td>".$value->details->data."</td>
           <td>".$value->details->severity."</td>
           <td>".$value->details->ver."</td>
           <td>".$value->details->rev."</td>
           <td><ul id='tagslider1'>
             <li style='cursor: pointer;'>
               Tags";
           $tagss = $value->details->tags;
           foreach ($tagss as $tagsss) {
              echo"<ul id='detailtagslider1'>
                    <li>".$tagsss."</li>
                  </ul>";
           }
           echo "</li>
               </ul></td>
           <td>".$value->details->maturity."</td>
           <td>".$value->details->accuracy."</td>
           </tr>";
         }

    }

}

 ?>

<!-- END DETAIL MESSAGE TABLE LOG -->
