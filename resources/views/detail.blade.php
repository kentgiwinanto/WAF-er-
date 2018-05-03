@extends('layout.indexPage')

@section('Title')
	<title>Detail | WAFer Development</title>

	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="css/fontawesome-all.css">
	<link rel="stylesheet" type="text/css" href="css/styles.css">
	<link rel="stylesheet" type="text/css" href="css/datatables.min.css">
	<!-- new Script and CSS -->
			<link rel="stylesheet" type="text/css" href="css/datatables.min.css">
			<link rel="stylesheet" type="text/css" href="css/jquery.fancybox.min.css">
	<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
	<script type="text/javascript" src="js/datatables.min.js"></script>
	<script type="text/javascript" src="js/query.dataTables.min.js"></script>
	<script type="text/javascript" src="js/jquery.fancybox.min.js"></script>

	<script src="http://cdn.ckeditor.com/4.6.1/standard/ckeditor.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue@2.5.15/dist/vue.js"></script>
	<script src="js/bootstrap.min.js"></script>

	<!-- SCRIPT YANG HARUS MATI -->

	<!--     <script type="text/javascript" src="js/jquery.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> -->
	<!--     <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->

	<script>
	$.fn.dataTable.ext.type.order['salary-grade-pre'] = function ( d ) {
	switch ( d ) {
			case 'Low':    return 1;
			case 'Medium': return 2;
			case 'High':   return 3;
	}
	return 0;
	};

	$(document).ready(function() {
	$('#example').DataTable( {
			"columnDefs": [ {
					"type": "salary-grade",
					"targets": -1
			} ]
	} );
	} );

	</script>


	<!-- <script>


	$(document).ready(function(){
	$("#dateSlider2").find('ul').hide()
	$("#dateSlider2").click(function(){
			$("#typeSlider2").slideToggle();
	});
	});
	</script>
	<script>
	$(document).ready(function(){
	$("#dateSlider").find('ul').hide()
	$("#dateSlider").click(function(){
			$("#typeSlider").slideToggle();
	});
	});
	</script> -->
	<script>
	$(document).ready(function(){
	$("#ruleslider1").find('ul').hide()
	$("#ruleslider1").click(function(){
			$("#detailruleslider1").slideToggle();
	});
	});
	</script>
	<script>
	$(document).ready(function(){
	$("#ruleslider2").find('ul').hide()
	$("#ruleslider2").click(function(){
			$("#detailruleslider2").slideToggle();
	});
	});
	</script>
	<script type="text/javascript" src="js/fontawesome-all.js"></script>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
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
										 'width':815,
										 'height':300};

			// Instantiate and draw our chart, passing in some options.
			var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
			chart.draw(data, options);
		}
	</script>



@endsection

<!-- @section('HeadJS') -->


<!-- @endsection -->

@section('Content')
		<!-- POP UP MENU  -->
		<div style="display: none;" id="modal">
			<h2>Detail Log</h2>
			<tr>
				<td><!-- INI ISINYA ATRIBUT LOG -->Ini isinya nanti log mentah , jadinya ini cuman contoh aja kalo tulisannya bisa nampung sepanjang ini atau ga, jujur gw ga tau harus masukin apa , normalnya orang bakal taro ipsum atau sejenisnya tapi yaudah gw males copy lagi , jadi gw ketik manual aja , supaya tau limit dari pop up windows ini aja sih. Sekian terima kasih dah di baca , sebenernya ga usah dibaca juga gapapa. </td>
				<td><!-- INI ISINYA VALUE LOG --></td>
			</tr>
		</div>


		@include('inc.navbar')
		<!--BreadCrumb-->
		<section id="breadcrumb">
			<div class="container">
				<ol class="breadcrumb">
					<li class="active"> Breadcrumb </li>
				</ol>
			</div>
		</section>
		<section id="main">
			<div class="container">
				<div class="row">
					<!--Container Content-->
					<div class="col-md-9">
						<div class="col-md-12" style="padding-left: 0px">
							<div class="well" onmouseover="style.color='grey'" onmouseout="style.color=''" onclick="location.href='#';" style="cursor: pointer;border-radius: 8px;background-color: #ffffff;padding-top: 0px; padding-left: 3px;">
								<h2 style="padding:5px 10px 1px 1px; margin-top: 0px;">  Server <br><br><small style="float: right;"> <i class="fas fa-server"></i> Detail Server</small> </h2>
							</div>
						</div>
						<!--Container Content Log and Config-->
						<ul class="nav nav-tabs">
						  <li class="active"><a href="#tab_a" data-toggle="tab">Log</a></li>
						  <li><a href="#tab_b" data-toggle="tab">Rules</a></li>
						  <li class="dropdown">

						  </li>
						</ul><!-- end of nav -->

						<div class="tab-content" style="background-color: white;border-radius: 1px;padding-left: 13px;padding-top: 10px; border-bottom: solid 1px;height: 500px;overflow-y: scroll;overflow-x: scroll;">
						        <div class="tab-pane active" id="tab_a">
						            <div class="col-md-13" style="background-color: white;">
						              <h4>Error Logs</h4>



						               <table id="example" class="display" style="width:100%">
														 <thead>
				 						            <tr>
				 						                <th>ID</th>
				 						                <th>Date/Time</th>
				 						                <th>Event Name</th>
				 						                <th>Type Attack</th>
				 						                <th>IP Source</th>
				 						                <th>Destination</th>
				 						                <th>Risk</th>
				 						                <th></th>

				 						            </tr>
				 						        </thead>
														@include('php.showLogsNew')
														<tfoot>
										            <tr>
										                <th>ID</th>
										                <th>Date/Time</th>
										                <th>Event Name</th>
										                <th>Type Attack</th>
										                <th>IP Source</th>
										                <th>Destination</th>
										                <th>Risk</th>
										                <th></th>
										            </tr>
										        </tfoot>
										    </table>

						        <!-- <tbody>
						            <tr>
						                <td>Fri Apr 13 00:53:24 2018</td>
						                <td>SQL Injection Detected Via lbinject</td>
						                <td>SQLi</td>
						                <td>192.168.1.105</td>
						                <td>0.0.0.0</td>
						                <td>High</td>
						            </tr>
						            <tr>
						                <td>Fri Apr 13 11:32:54 2018</td>
						                <td>XSS Attack Attempt</td>
						                <td>XSS</td>
						                <td>192.168.1.105</td>
						                <td>0.0.0.0</td>
						                <td>Low</td>
						            </tr>
						            <tr>
						                <td>Fri Apr 12 21:53:13 2018</td>
						                <td>Brute Force Attack</td>
						                <td>Brute Force</td>
						                <td>192.168.1.106</td>
						                <td>0.0.0.0</td>
						                <td>Low</td>
						            </tr>
						            <tr>
						                <td>Fri Apr 12 17:11:03 2018</td>
						                <td>SQL Injection Detected Via lbinject</td>
						                <td>SQLi</td>
						                <td>192.168.1.105</td>
						                <td>0.0.0.0</td>
						                <td>High</td>
						            </tr>
						            <tr>
						                <td>Fri Apr 11 03:21:30 2018</td>
						                <td>XSS Attack Via WAF</td>
						                <td>XSS</td>
						                <td>192.168.1.112</td>
						                <td>0.0.0.0</td>
						                <td>Medium</td>
						            </tr>
						            <tr>
						                <td>Fri Apr 13 18:23:31 2018</td>
						                <td>SQL Injection Attempt</td>
						                <td>SQLi</td>
						                <td>192.168.1.105</td>
						                <td>0.0.0.0</td>
						                <td>Low</td>
						            </tr>
						        </tbody> -->
						        <!-- <tfoot>
						            <tr>
						                <th>Date/Time</th>
						                <th>Event Name</th>
						                <th>Type Attack</th>
						                <th>IP Source</th>
						                <th>Destination</th>
						                <th>Risk</th>
						            </tr>
						        </tfoot>
						    </table> -->
						            </div>
						        </div>


						        <div class="tab-pane" id="tab_b">
						            <h4>Rules</h4>
						            <form action="#">
						          <table >
						            <tr>
						              <th style="width: 700px"></th>
						              <th style="width: 100px;"></th>
						            </tr>
						            <tr>
						              <td>
						              <ul id="ruleslider1">
						                <li style="cursor: pointer;">
						                    <input type="checkbox" name="Configuration" value="SecRule1"> Sample Rules 1
						                  <ul id="detailruleslider1">
						                    <li>
						                      SecRule :ARGS|REQUEST_HEADERS “@rx &lt;script&gt;” </li>
						                    <li>id:101,</li>
						                    <li> msg:‘XSS Attack’,</li>
						                    <li>severity:ERROR,</li>
						                    <li>deny,</li>
						                    <li>status:404</li>

						                  </ul>
						                </li>
						              </ul></td>
						              <td><input type="button" class="fas fa-lg fa-edit" style="float: center;cursor: pointer;" value="Edit"></td>
						            </tr>
										<!--             <tr>
											<td><ul id="ruleslider2">
											  <li style="cursor: pointer;">
												  <input type="checkbox" name="Configuration" value="SecRule1"> SecRule REQUEST_LINE|REQUEST_HEADERS|REQUEST_HEADERS_NAMES
												<ul id="detailruleslider2">
												  <li>
													SecRule REQUEST_LINE|REQUEST_HEADERS|REQUEST_HEADERS_NAMES "@contains () {" "phase:1,id:'2100080',block,t:none,t:utf8toUnicode,t:urlDecodeUni,t:compressWhitespace,msg:'SLR: Bash ENV Variable Injection Attack',tag:'CVE-2014-6271',tag:'http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-6271',tag:'https://securityblog.redhat.com/2014/09/24/bash-specially-crafted-environment-variables-code-injection-attack/'"</li>
												  <li>
													Detail
												  </li>
												</ul>
											  </li>
											</ul></td>
											<td><input type="button" class="fas fa-lg fa-edit" style="cursor: pointer;" value=""></td>
											</tr> -->
										<tr>
											<td><input type="button" class="fas fa-lg fa-plus-circle" style="float:center;cursor: pointer;"></td>
											<td><input type="button" class="btn btn-primary" style="float: right;" value="Save"></td>
										</tr>
									</table>
								</form>
							</div>
						</div>
						<!-- tab content -->
					</div>
					@include('inc.sidebar')
				</div>
			</div>
		</section>
		<!-- footer -->
		<!-- @include('inc.footer') -->
		<footer id="footer" style="position:static;" >
		 <p>Copyright WAFer, &copy; 2018</p>
		</footer>
@endsection
