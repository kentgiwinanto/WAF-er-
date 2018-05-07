<?php
	$ResultDB = DB::select("SELECT COUNT(ServerID) AS CountServer FROM ServerList WHERE Stsrc <> 'D'")[0]->CountServer;
?>
@extends('layout.indexPage')

@section('Title')
	<title>Home | WAFer Development</title>
@endsection

@section('Head')
	
@endsection

@section('Content')
	
	@include('inc.navbar')
	<!--BreadCrumb-->
	<section id="breadcrumb">
		<div class="container">
			<ol class="breadcrumb">
				<li class="active">Home</li>
			</ol>
		</div>
	</section>
	<section id="main">
		<div class="container">
			<div class="row">
				<!--Container Content -->
				<div class="col-md-9" style="padding-left: 0px;">
					<div class="col-md-6">
						<div class="well" onmouseover="style.color='grey'" onmouseout="style.color=''" onclick="location.href='Server'; " style="cursor: pointer;border-radius: 8px;background-color: #ffffff;padding-top: 0px; padding-left: 3px;margin-left: 0px;">
							<h2 style="padding:5px 10px 1px 1px; margin-top: 0px;">  Servers <br><br><small style="float: right;"> <i class="fas fa-server"></i><?php echo " ".$ResultDB." Servers" ?></small> </h2>
						</div>
					</div>
					<div class="col-md-6" >
						<div class="well" onmouseover="style.color='grey'" onmouseout="style.color=''" onclick="location.href='Configuration';" style="cursor: pointer;background-color:
							#ffffff;border-radius: 8px;padding-top: 0px; padding-left: 3px;">
							<h2 style="padding:5px 10px 1px 1px; margin-top: 0px;"> Configuration <br><br><small style="float: right;"><i class="fas fa-wrench"></i> Tune Up</small> </h2>
						</div>
					</div>
					<!--Container Chart Attack-->
					<div class="col-md-9" style="margin: 0 auto;">
						<div id="chart_div" style="margin: center;border-radius: 18px;"></div>
					</div>
				</div>
				@include('inc.sidebar')
			</div>
		</div>
	</section>
	<script type="text/javascript">
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
					  'width':830,
					  'height':300};
		
			// Instantiate and draw our chart, passing in some options.
			var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
			chart.draw(data, options);
		}
	</script>
	<!-- footer -->
	<footer id="footer" >
		<p>Copyright WAFer, &copy; 2018</p>
	</footer>
@endsection
