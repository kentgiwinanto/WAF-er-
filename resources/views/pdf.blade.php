<!DOCTYPE html>
<html>
<head>
  <title>INI REPORT</title>
  <link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/fontawesome-all.css">
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
<link href='css/fonts-passion.css' rel='stylesheet' type='text/css'>
<link href='css/fonts-oxygen.css' rel='stylesheet' type='text/css'> 
<!-- <link rel="stylesheet" type="text/css" href="css/jquery.fancybox.min.css"> -->
<link rel="stylesheet" type="text/css" href="css/jquery.fancybox-3.3.5.css">
<link rel="stylesheet" type="text/css" href="css/datatables.min.css">
</head>

<body>

<?php 
// print_r($GetCount);
// print_r($PostCount);
// print_r($browser":" $version);
// die();

 ?>
<h1 style="background-color: : ">
  
  <img src="images/logo_visionet.png" style="width: 250px; height: 50px;">
</h1>
<h2 style="text-align: left;font-family: Arial Black;font-style: bold;color:#ff8100;">Monthly WAF Report</h2>
<table style="font-size: 20px;font-family: Times New Roman">
  <tr>
    <td style="width:100px">Server </td>
    <td>: Reverse Proxy Virtual Box</td>
  </tr>
</table>
<br><br>
<table style="border: solid 2px;border-color: #ff8100; ">
  <tr>
    <th colspan="2" style="border: solid 2px;border-collapse: collapse;padding: 12px;float: center;border-color: #ff8100;"><img src="images/chart2.png" style="width: 660px;height: 200px"></th>
  </tr>
  <tr>
    <td style="width: 330px;border: solid 2px;border-collapse: collapse;padding: 12px;border-color: #ff8100;"><img src="images/chart1.png"  style="width: 330px;height: 200px"></td>
    <td style="width: 330px;border: solid 2px;border-collapse: collapse;padding: 12px;border-color: #ff8100;"><img src="images/chart3.png"  style="width: 330px;height: 200px"></td>
  </tr>
  <tr>
        <td colspan="2" style="border: solid 2px;border-collapse: collapse;padding: 12px;float: center;border-color: #ff8100;"><img src="images/chart2.png" style="width: 660px;height: 200px"></td>

  </tr>
</table>
<br>
<br>

<table style="border: solid 2px;border-color: #ff8100;">
  <tr>
    <th colspan="6" style="background-color:#ff8100;float: center;"><label style="color: white;">Detail Server</label></th>
  </tr>
  <tr>
    <td style="border: solid 2px;border-color: #ff8100;width: 50px">No.</td>
    <td style="border: solid 2px;border-color: #ff8100;width: 50px">Month</td>
    <td style="border: solid 2px;border-color: #ff8100;width: 150px">Attempted Attack</td>
    <td style="border: solid 2px;border-color: #ff8100;width: 150px">Count POST</td>
    <td style="border: solid 2px;border-color: #ff8100;width: 150px">Count GET</td>
    <td style="border: solid 2px;border-color: #ff8100;width: 150px">Freq.UserAgent</td>
  </tr>
  <?php
$i=1;

   $ResultLogServer = json_decode(Session::get("ResultLogServer"));

            echo"<tr>
                <td style='border: solid 2px;border-color: #ff8100;width: 50px'>".$i."</td>
                <td style='border: solid 2px;border-color: #ff8100;width: 50px'>Jun</td>
                <td style='border: solid 2px;border-color: #ff8100;width: 150px'>".$ResultLogServer->LogCount."</td>
                <td style='border: solid 2px;border-color: #ff8100;width: 150px'>".$ResultLogServer->PostCount."</td>
                <td style='border: solid 2px;border-color: #ff8100;width: 150px'>".$ResultLogServer->GetCount."</td>
                <td style='border: solid 2px;border-color: #ff8100;width: 150px'></td>
               </tr>";
            $i++;
       

 ?>


</table>
</body>
</html>