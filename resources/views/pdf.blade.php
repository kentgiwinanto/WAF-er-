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
<script type="text/javascript" src="js/ckeditor.js"></script>
<!-- <script type="text/javascript" src="js/jquery-1.8.3.js"></script> -->
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<!-- <script type="text/javascript" src="js/jquery.min.js"></script> -->
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/fontawesome-all.js"></script>
<!-- <script type="text/javascript" src="js/jquery.fancybox.min.js"></script> -->
<script type="text/javascript" src="js/jquery.fancybox-3.3.5.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/loader.js"></script>
<script type="text/javascript">
  //Google Chart

    // Load the Visualization API and the corechart package.
    google.charts.load('current', {'packages':['corechart']});

    // Set a callback to run when the Google Visualization API is loaded.
    google.charts.setOnLoadCallback(drawChart1);

    // Callback that creates and populates a data table,
    // instantiates the pie chart, passes in the data and
    // draws it.
    function drawChart1() {

        // Create the data table.
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Day');
        data.addColumn('number', 'SQLi');
        data.addRows([
        ['Monday', 3],
        ['Tuesday', 1],
        ['Wednesday', 4],
        ['Thursday', 4],
        ['Friday', 6],
        ['Saturday', 3],
        ['Sunday', 2]
        ]);

        // Set chart options
        var options = {'title':'Number of Attacks',
                        'width':300,
                        'height':200};

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.ColumnChart(document.getElementById('chart_div1'));
        chart.draw(data, options);
    }


    google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawChart2);

    function drawChart2() {
        var data = google.visualization.arrayToDataTable([
            ['Day', 'SQLI', 'XSS'],
            ['Monday',  2,      4],
            ['Tuesday',  3,      2],
            ['Wednesday',  4,     0],
            ['Thursday',  1,      2],
            ['Friday',  5,       9],
            ['Saturday',  6,       9],
            ['Sunday',  10,       5]
        ]);

        var options = {
            title: 'Attack Summary',
            curveType: 'function',
            hAxis : { 
              textStyle : {
                fontSize: 7 // or the number you want
             }
          },      
            legend: { position: 'bottom'
          }
        };

        var chart = new google.visualization.LineChart(document.getElementById('chart_div2'));

        chart.draw(data, options);
    }

    google.charts.load("current", {packages:["corechart"]});
    google.charts.setOnLoadCallback(drawChart3);
    function drawChart3() {
        var data = google.visualization.arrayToDataTable([
            ['Attack', 'Attack/Day'],
            ['SQLi',     11],
            ['XSS',      2],
            ['DDOS',  2],
            ['RFI', 2],
            ['Brute Force',    7]
        ]);

        var options = {
            width: 350,
            title: 'Security Log',
            textStyle : {
                fontSize: 5 // or the number you want
             }        
        };

        var chart = new google.visualization.PieChart(document.getElementById('chart_div3'));
        chart.draw(data, options);
    }

    google.charts.load("current", {packages:["corechart"]});
    google.charts.setOnLoadCallback(drawChart);
    function drawChart() {
      var data = google.visualization.arrayToDataTable([
        ["Type", "Count", { role: "style" } ],
        ["200", 8, "#b87333"],
        ["404", 10, "silver"],
        ["499", 19, "gold"],
        ["400", 21, "color: #e5e4e2"]
      ]);

      var view = new google.visualization.DataView(data);
      view.setColumns([0, 1,
                       { calc: "stringify",
                         sourceColumn: 1,
                         type: "string",
                         role: "annotation" },
                       2]);

      var options = {
        title: "HTTP Request Status Code",
        width: 600,
        height: 200,
        bar: {groupWidth: "95%"},
        legend: { position: "none" },
      };
      var chart = new google.visualization.BarChart(document.getElementById("chart_div4"));
      chart.draw(view, options);
  }
  </script>
</head>

<body>


<?php 
    // print_r($GetCount);
    // die();
 ?>
<h1 style="background-color: : ">
  
  <img src="images/logo_visionet.png" style="width: 250px; height: 50px;">
</h1>
<h2 style="text-align: left;font-family: Arial Black;font-style: bold;color:#ff8100;">Monthly WAF Report</h2>
<!-- <h3 style="text-align: left;font-family: Arial Black;font-style: bold;">Detail Report :</h3> -->
<table style="font-size: 16px;font-family: Times New Roman">
  <tr>
    <td style="width:100px"><label>Server</label> </td>
    <td>: <label id=""><?php 
    $ResultLogServer = json_decode(Session::get("ResultLogServer")); 
    echo 
    $ResultLogServer->ServerDetail->Domain;
     ?>
       
     </label></td>
  </tr>
  <tr>
    <td style="width:100px"><label>IP Server</label> </td>
    <td>: <label id=""><?php 
    $ResultLogServer = json_decode(Session::get("ResultLogServer")); 
    echo 
    $ResultLogServer->ServerDetail->IP;
     ?>
       
     </label><label>:<?php 
    $ResultLogServer = json_decode(Session::get("ResultLogServer")); 
    echo 
    $ResultLogServer->ServerDetail->PortsOpen;
     ?></label></td>
  </tr>
  <tr>
    <td><label>PIC</label></td>
    <td>: <label>
           <?php echo session()->get('Username'); ?>
    </label></td>
  </tr>
  <tr>
    <td><label>Generated</label></td>
    <td>: <label> <?php
$t=time();
echo(date("Y-m-d",$t));
?></label></td>
  </tr>
</table>
<br><br>
<table style="border: solid 2px;border-color: #ff8100; ">
  <tr>
    <th colspan="2" style="border: solid 2px;border-collapse: collapse;padding: 12px;float: center;border-color: #ff8100;">
      <div id="chart_div2" style="width: 100%;"></div>
      <!-- <img src="images/chart2.png" style="width: 660px;height: 200px"> --></th>
  </tr>
  <tr>
    <td style="width: 330px;border: solid 2px;border-collapse: collapse;padding: 12px;border-color: #ff8100;">
        <div id="chart_div1" style="width: 100%;"></div>
      <!-- <img src="images/chart1.png"  style="width: 330px;height: 200px"> --></td>
    <td style="width: 330px;border: solid 2px;border-collapse: collapse;padding: 12px;border-color: #ff8100;">
        <div id="chart_div3" style="width: 100%;"></div>
      <!-- <img src="images/chart3.png"  style="width: 330px;height: 200px"> --></td>
  </tr>
  <tr>
        <td colspan="2" style="border: solid 2px;border-collapse: collapse;padding: 12px;float: center;border-color: #ff8100;">
           <div id="chart_div4" style="width: 100%;"></div>
          <!-- <img src="images/chart2.png" style="width: 660px;height: 200px"> --></td>

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
                <td style='border: solid 2px;border-color: #ff8100;width: 150px'>".$ResultLogServer->FreqUA."</td>
               </tr>";
            $i++;
       

 ?>


</table>
</body>
</html>