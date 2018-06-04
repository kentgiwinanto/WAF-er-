	@if(session()->has('ResultLogServer'))

	<?php
		$ResultLogServer = json_decode(Session::get("ResultLogServer"));
	?>

	@extends('layout.indexPage')

	@section('Title')
	<title>Detail | WAFer Development</title>
	<script type="text/javascript" src="js/detailPage.js"></script>
	@endsection

	@section('Content')
	<!-- POP UP MENU  -->
	<div style="display: none;" id="modal">
		<span id="fancyboxSecLog">
			<h2>Detail Log</h2>
			<tr>
				<td>
					<!--Container Content Log and Config-->
					<ul class="nav nav-tabs">
						<li class="active"><a href="#tab_e" data-toggle="tab">Table Log</a></li>
						<li><a href="#tab_f" data-toggle="tab">Request Header</a></li>
						<li><a href="#tab_g" data-toggle="tab">Response Header</a></li>
						<li><a href="#tab_h" data-toggle="tab">JSON Log</a></li>
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
											<th>ID</th>
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
									<tbody id="PopUpSecLog">
									</tbody>
									<tbody style="display:none">
										<tr id="PopUpSecLogTemplate">
											<td class="iID"></td>
											<td class="iMessage"></td>
											<td class="iMatch"></td>
											<td class="iReference"></td>
											<td class="iRuleID" style="text-align:center"></td>
											<td class="iFile"></td>
											<td class="iLineNumber" style="text-align:center"></td>
											<td class="iData"></td>
											<td class="iSeverity" style="text-align:center"></td>
											<td class="iVer"></td>
											<td class="iRev"></td>
											<td>
												<ul class='tagslider'>
													<li style='cursor: pointer;'>
														Tags
														<ul class='detailtagslider'>
															<li>tagsss1</li>
														</ul>
													</li>
												</ul>
											</td>
											<td class="iMaturity" style="text-align:center"></td>
											<td class="iAccuracy" style="text-align:center"></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<!-- END DETAIL MESSAGE TABLE LOG -->
						<!-- REQUEST HEADER SECTION -->
						<div class="tab-pane" id="tab_f">
							<div class="col-md-13" style="background-color: white;">
								<h4>Request Header</h4>
								<table style="width:100%; border-collapse:collapse; border:1px solid black">
									<tr id="RequestHeaderSection">
									</tr>
								</table>
							</div>
						</div>
						<!-- END REQUEST HEADER SECTION -->
						<!-- RESPONSE HEADER SECTION -->
						<div class="tab-pane" id="tab_g">
								<div class="col-md-13" style="background-color: white;">
								<h4>Response Header</h4>
								<table style="width:100%; border-collapse:collapse; border:1px solid black">
									<tr id="ResponseHeaderSection">
									</tr>
								</table>
							</div>
						</div>
						<!-- END RESPONSE HEADER SECTION -->
						<!-- JSON LOG SECTION -->
						<div class="tab-pane" id="tab_h">
							<div class="col-md-13" style="background-color: white;">
								<h4>JSON Logs</h4>
								<div class="container">
									<div class="form-group">
										<textarea disabled="" class="form-control" rows="20" id="jsonlog"></textarea>
									</div>
								</div>
							</div>
						</div>
						<!-- END JSON LOG SECTION -->
					</div>
				</td>
				<td></td>
			</tr>
		</span>
	</div>
	@include('inc.navbar')
	<!--BreadCrumb-->
	<section id="breadcrumb">
		<div class="container">
			<ol class="breadcrumb">
				<li><a href="/Home">Home</a></li>
				<li><a href="/Server">Server</a></li>
				<li class="active"> <?php echo $ResultLogServer->ServerDetail->ServerName ?></li>
			</ol>
		</div>
	</section>
	<section id="main">
		<div class="container">
			<div class="row">
				<!--Container Content-->
				<div class="col-md-12">
					<div class="col-md-12" style="padding-left: 0px">
					<div class="col-md-4" style="padding-left: 0px">
						<div class="well" onmouseover="style.color='grey'" onmouseout="style.color=''" onclick="location.href='#';" style="cursor: pointer;border-radius: 8px;background-color: #ffffff;padding-top: 0px; padding-left: 3px;">
							<br>
								<div id="chart_div1" style="margin: center;border-radius: 18px;"></div>
							</h2>
						</div>
					</div>
					<div class="col-md-4" style="padding-left: 0px">
						<div class="well" onmouseover="style.color='grey'" onmouseout="style.color=''" onclick="location.href='#';" style="cursor: pointer;border-radius: 8px;background-color: #ffffff;padding-top: 0px; padding-left: 3px;">
							 <br>
								<div id="chart_div2" style="margin: center;border-radius: 18px;"></div>
							</h2>
						</div>
					</div>
					<div class="col-md-4" style="padding-left: 0px">
						<div class="well" onmouseover="style.color='grey'" onmouseout="style.color=''" onclick="location.href='#';" style="cursor: pointer;border-radius: 8px;background-color: #ffffff;padding-top: 0px; padding-left: 3px;">
							<br>
								<div id="chart_div3" style="margin: center;border-radius: 18px;"></div>
							</h2>
						</div>
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
	<footer id="footer" style="position:static;" >
		<p>Copyright WAFer, &copy; 2018</p>
	</footer>
	@endsection

@else
	<script> window.location = "/Server"</script>
@endif
