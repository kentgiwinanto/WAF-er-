<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        @yield('Title')
        @yield('HeadCSS')
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/fontawesome-all.css">
        <link rel="stylesheet" type="text/css" href="css/styles.css">
        <link rel="stylesheet" type="text/css" href="css/datatables.min.css">
        <link rel="stylesheet" type="text/css" href="css/jquery.fancybox.min.css">
        @yield('HeadJS')

        <script type="text/javascript" src="js/datatables.min.js"></script>
        <script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="js/jquery.fancybox.min.js"></script>

        <script src="js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/fontawesome-all.js"></script>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script type="text/javascript" src="js/container.js"></script>
	    <script type="text/javascript" src="js/addserver.js"></script>
        <script type="text/javascript">
            var nomor = 2; 
            // Load the Visualization API and the corechart package.
            google.charts.load('current', {'packages':['corechart']});
            
            // Set a callback to run when the Google Visualization API is loaded.
            google.charts.setOnLoadCallback(drawChart);
            
            // Callback that creates and populates a data table,
            // instantiates the pie chart, passes in the data and
            // draws it.
            function drawChart() {
            
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
                             'width':835,
                             'height':300};
            
              // Instantiate and draw our chart, passing in some options.
              var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
              chart.draw(data, options);
            }
        </script>
    </head>
    <body>
      @yield('Contain')
    </body>

    </html>