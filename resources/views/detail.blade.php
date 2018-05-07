@if(session()->has('serverID'))
		<?php
		    $ServerID = Session::get("serverID");
		    $ResultDB = DB::select("CALL WAF_Read_GetServerDetail('$ServerID')")[0];
		?>
	@extends('layout.indexPage')
	@section('Title')
	<title>Detail | WAFer Development</title>
	<link rel="stylesheet" type="text/css" href="css/jquery.fancybox.min.css">
	<script type="text/javascript" src="js/jquery.fancybox.min.js"></script>
	<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
	<link rel="stylesheet" type="text/css" href="css/datatables.min.css">
	<script>
	    $(document).ready(function(){
	      $("#tagslider2").find('ul').hide()
	        $("#tagslider2").click(function(){
	            $("#detailtagslider2").slideToggle();
	        });
	    }); 
	</script>
	<script>
	    $(document).ready(function(){
	      $("#tagslider1").find('ul').hide()
	        $("#tagslider1").click(function(){
	            $("#detailtagslider1").slideToggle();
	        });
	    }); 
	</script> 
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
	<script type="text/javascript" src="js/loader.js"></script>
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
	                     'width':1015,
	                     'height':300};
	    
	      // Instantiate and draw our chart, passing in some options.
	      var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
	      chart.draw(data, options);
	    }
	</script>
	@endsection
	@section('HeadJS')
	@endsection
	@section('Content')
	<!-- POP UP MENU  -->
	<div style="display: none;" id="modal">
	    <h2>Detail Log</h2>
	    <tr>
	        <td>
	            <!--Container Content Log and Config-->
	            <ul class="nav nav-tabs">
	                <li class="active"><a href="#tab_e" data-toggle="tab">Table Log</a></li>
	                <li><a href="#tab_f" data-toggle="tab">JSON Log</a></li>
	                <li class="dropdown">
	                </li>
	            </ul>
	            <!-- end of nav -->
	            <div class="tab-content" style="background-color: white;border-radius: 1px;padding-left: 13px;padding-top: 10px; border-bottom: solid 1px;height: 500px;overflow-y: scroll;overflow-x: scroll;">
	                <!-- SECTION DETAIL TABLE MESSAGE LOG POP UP -->
	                <div class="tab-pane active" id="tab_e">
	                    <div class="col-md-13" style="background-color: white;">
	                        <h4>Security Logs</h4>
	                        <table id="detaillog" class="display" style="width:100%">
	                            <thead>
	                                <tr>
	                                    <th>Message</th>
	                                    <th>Match</th>
	                                    <th>Ref</th>
	                                    <th>RuleID</th>
	                                    <th>File</th>
	                                    <th>LineNumber</th>
	                                    <th>Data</th>
	                                    <th>Severity</th>
	                                    <th>Version</th>
	                                    <th>Rev</th>
	                                    <th>Tags</th>
	                                    <th>Maturity</th>
	                                    <th>Accuracy</th>
	                                </tr>
	                            </thead>
	                            <tbody>
	                                <tr>
	                                    <td>XSS Attack Detected Via Libinjected</td>
	                                    <td>Detected XSS Using libinjection</td>
	                                    <td style="word-wrap: break-word;">"v8,38t:utf8toUnicode,t:urlDecodeUni,t:htmlEntityDecode,t:jsDecode,t:cssDecode,t:removeNulls"</td>
	                                    <td>941100</td>
	                                    <td>/etc/nginx/owasp-modsecurity-crs/rules/REQUEST-941-APPLICATION-ATTACK-XSS.conf</td>
	                                    <td>17</td>
	                                    <td>"Matched Data: \" //\" found within ARGS:p: \" //\"</td>
	                                    <td>2</td>
	                                    <td>OWASP_CRS/3.0.0</td>
	                                    <td>2</td>
	                                    <td>
	                                        <ul id="tagslider1">
	                                            <li style="cursor: pointer;">
	                                                Tags 
	                                                <ul id="detailtagslider1">
	                                                    <li>
	                                                        Tag 1 
	                                                    </li>
	                                                    <li>Tag 2</li>
	                                                </ul>
	                                            </li>
	                                        </ul>
	                                    </td>
	                                    <td>2</td>
	                                    <td>9</td>
	                                </tr>
	                                <td>XSS Attack Detected Via Libinjected</td>
	                                <td>Detected XSS Using libinjection</td>
	                                <td style="word-wrap: break-word;">"v8,38t:utf8toUnicode,t:urlDecodeUni,t:htmlEntityDecode,t:jsDecode,t:cssDecode,t:removeNulls"</td>
	                                <td>941100</td>
	                                <td>/etc/nginx/owasp-modsecurity-crs/rules/REQUEST-941-APPLICATION-ATTACK-XSS.conf</td>
	                                <td>17</td>
	                                <td>"Matched Data: \" //\" found within ARGS:p: \" //\"</td>
	                                <td>2</td>
	                                <td>OWASP_CRS/3.0.0</td>
	                                <td>2</td>
	                                <td>
	                                    <ul id="tagslider2">
	                                        <li style="cursor: pointer;">
	                                            Tags 
	                                            <ul id="detailtagslider2">
	                                                <li>
	                                                    Tag 1 
	                                                </li>
	                                                <li>TAGTAGATAGATAGATAGAT 2 AW</li>
	                                            </ul>
	                                        </li>
	                                    </ul>
	                                </td>
	                                <td>2</td>
	                                <td>9</td>
	                            </tbody>
	                        </table>
	                    </div>
	                </div>
	                <!-- END DETAIL MESSAGE TABLE LOG -->
	                <!-- JSON LOG SECTION -->
	                <div class="tab-pane" id="tab_f">
	                    <div class="col-md-13" style="background-color: white;">
	                        <h4>JSON Logs</h4>
	                        <div class="container">
	                            <div class="form-group">  
	                                <textarea disabled="" class="form-control" rows="5" id="jsonlog"></textarea>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	                <!-- END JSON LOG SECTION -->
	            </div>
	        </td>
	        <td></td>
	    </tr>
	</div>
	@include('inc.navbar')
	<!--BreadCrumb-->
	<section id="breadcrumb">
	    <div class="container">
	        <ol class="breadcrumb">
	        	<li><a href="/Home">Home</a></li>
	        	<li><a href="/Server">Server</a></li>
	            <li class="active"> DetailLog </li>
	        </ol>
	    </div>
	</section>
	<section id="main">
	    <div class="container">
	        <div class="row">
	            <!--Container Content-->
	            <div class="col-md-12">
	                <div class="col-md-12" style="padding-left: 0px">
	                    <div class="well" onmouseover="style.color='grey'" onmouseout="style.color=''" onclick="location.href='#';" style="cursor: pointer;border-radius: 8px;background-color: #ffffff;padding-top: 0px; padding-left: 3px;">
	                        <h2 style="padding:5px 10px 1px 1px; margin-top: 0px;">
	                            Server <br> 
	                            <div id="chart_div" style="margin: center;border-radius: 18px;"></div>
	                            <small style="float: right;"> <i class="fas fa-server"></i> Detail Server</small> 
	                        </h2>
	                    </div>
	                </div>
	                <!--Container Content Log and Config-->
	                <ul class="nav nav-tabs">
	                    <li class="active"><a href="#tab_a" data-toggle="tab">Security Log</a></li>
	                    <li><a href="#tab_b" data-toggle="tab">Access Log</a></li>
	                    <li><a href="#tab_c" data-toggle="tab">Rules</a></li>
	                    <li><a href="#tab_d" data-toggle="tab">Setting</a></li>
	                    <li class="dropdown">
	                    </li>
	                </ul>
	                <!-- end of nav -->
	                <div class="tab-content" style="background-color: white;border-radius: 1px;padding-left: 13px;padding-top: 10px; border-bottom: solid 1px;height: 500px;overflow-y: scroll;overflow-x: scroll;">
	                    <div class="tab-pane active" id="tab_a">
	                        <!-- SECTION SECURITY LOG -->
	                        <div class="col-md-13" style="background-color: white;">
	                            <h4>Security Logs</h4>
	                            <table id="seclog" class="display" style="width:100%">
	                                <thead>
	                                    <tr>
	                                        <th>ID</th>
	                                        <th>Date/Time</th>
	                                        <th>Event Name</th>
	                                        <!-- <th>Type Attack</th> -->
	                                        <th>IP Source</th>
	                                        <th>Destination</th>
	                                        <!-- <th>Risk</th> -->
	                                        <th></th>
	                                    </tr>
	                                </thead>
	                                <tbody>
	                                	@include('php.showSecLogs')
	                                </tbody>
	                            </table>
	                        </div>
	                    </div>
	                    <!-- 
	                        Access Log -->
	                    <div class="tab-pane" id="tab_b">
	                        <div class="col-md-13" style="background-color: white;">
	                            <h4>Access Logs</h4>
	                            <table id="accesslog" class="display" style="width:100%">
	                                <thead>
	                                    <tr>
	                                        <th>TimeStamp</th>
	                                        <th>From</th>
	                                        <th>To</th>
	                                        <th>Request</th>
	                                        <th>Request Body</th>
	                                        <th>Status</th>
	                                        <th>Body Bytes Sent</th>
	                                        <th></th>
	                                    </tr>
	                                </thead>
	                                <tbody>
	                                    @include('php.showAccessLog')
	                                </tbody>
	                            </table>
	                        </div>
	                    </div>
	                    <div class="tab-pane" id="tab_c">
	                        <h4>Rules</h4>
	                        Coming Soon ~
	                    </div>
	                    <div class="tab-pane" id="tab_d">
	                        <h4>Setting</h4>
	                        <form action="#">
	                            <table>
	                                <table >
	                                    <tr>
	                                        <th style="width: 550px"></th>
	                                        <th style="width: 550px"></th>
	                                    </tr>
	                                    <tr>
	                                        <td style="width: 300px;">
	                                            <div class="form-group">
	                                                <label for="password" class="cols-sm-2 control-label">Server Name</label>
	                                                <div class="cols-sm-10">
	                                                    <div class="input-group">
	                                                        <span class="input-group-addon"><i class="fa fa-server fa-lg" aria-hidden="true"></i></span>
	                                                        <input type="text" class="form-control" name="servername" id="servernametxt"  placeholder="Enter Server Name"/>
	                                                    </div>
	                                                </div>
	                                            </div>
	                                        </td>
	                                        <td style="width: 300px;">
	                                            <div class="form-group">
	                                                <label for="confirm" class="cols-sm-2 control-label">IP</label>
	                                                <div class="">
	                                                    <div class="input-group">
	                                                        <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
	                                                        <input type="text" class="form-control" name="ip" id="iptxt"  placeholder="Enter Server IP Address"/>
	                                                    </div>
	                                                </div>
	                                            </div>
	                                        </td>
	                                    </tr>
	                                    <tr>
	                                        <td style="width: 300px;">
	                                            <div class="form-group">
	                                                <label for="confirm" class="cols-sm-2 control-label">PortsOpen</label>
	                                                <div class="cols-sm-10">
	                                                    <div class="input-group">
	                                                        <span class="input-group-addon"><i class="fa fa-code-branch fa-lg" aria-hidden="true"></i></span>
	                                                        <input type="text" class="form-control" name="portsopen" id="portsopentxt"  placeholder="PortsOpen"/>
	                                                    </div>
	                                                </div>
	                                            </div>
	                                        </td>
	                                        <td style="width:300px;">
	                                            <div class="form-group">
	                                                <label for="confirm" class="cols-sm-2 control-label">Domain</label>
	                                                <div class="cols-sm-10">
	                                                    <div class="input-group">
	                                                        <span class="input-group-addon"><i class="fa fa-upload fa-lg" aria-hidden="true"></i></span>
	                                                        <input type="text" class="form-control" name="domain" id="domaintxt"  placeholder="Enter Server Domain"/>
	                                                    </div>
	                                                </div>
	                                            </div>
	                                        </td>
	                                    </tr>
	                                    <tr>
	                                        <td>
	                                            <div class="form-group btn-group">
	                                                <input type="checkbox" name="custom7" value="1" id="custom7" checked="checked"> 
	                                                <label for="custom7">Enable ModSecurity?</label>
	                                            </div>
	                                        </td>
	                                        <td>
	                                            <div class="form-group">
	                                                <label for="error" class="cols-sm-2 control-label" id="errortxt" value="" style="color:red;"></label>
	                                            </div>
	                                        </td>
	                                    </tr>
	                                    <tr>
	                                        <td></td>
	                                        <td>
	                                        </td>
	                                    </tr>
	                                </table>
	                            </table>
	                        </form>
	                        <div class="col-md-8">
	                            <button type="button" class="btn btn-lg" style="float:left;" onclick="addserver();">Delete</button>
	                        </div>
	                        <div class="col-md-"3 style="float: right;">
	                            <button type="button" class="btn btn-lg" onclick="addserver();">Cancel</button>
	                            <button type="button" class="btn btn-lg" onclick="addserver();">Update</button>                       
	                        </div>
	                    </div>
	                </div>
	                <!-- tab content -->
	            </div>
	            <!--Container Recent-->
	        </div>
	    </div>
	</section>
	<!-- footer -->
	<!-- @include('inc.footer') -->
	<footer id="footer" style="position:static;" >
	    <p>Copyright WAFer, &copy; 2018</p>
	</footer>
	<script type="text/javascript">
	    $('#detaillog').DataTable();
	    $('#seclog').DataTable();
	    $('#accesslog').DataTable();
	</script>
	@endsection
@else
    <script> window.location = "/Server"</script>
@endif