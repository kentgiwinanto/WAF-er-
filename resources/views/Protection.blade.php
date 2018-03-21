<!DOCTYPE html>
<html lang="en">
	<head>
		@include('inc.headHtml')
		<title>Protections | WAF Development</title>
	</head>
	<body>
		<!--Header Judul-->
		<header id="header">
			<div class="container">
				<div class="row">
					<div class="col-md-10">
						<a href="home.html">
							<h1>
								<i class="fas fa-cog"></i> WAF <small>Manage System</small> 
						</a>
						<div class="dropdown" style="float: right;">
						<button class="btn btn-default dropdown-toggle" id="menu1" type="button" data-toggle="dropdown"><i class="fas fa-user"></i>
						<span class="caret"></span></button>
						<ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
						<li role="presentation"><a style="text-align: center;" role="menuitem" tabindex="-1" href="#"><img src="#"></a></li>
						<li role="presentation"><a style="text-align: center;" role="menuitem" tabindex="-1" href="#">Name</a></li>
						<li role="presentation"><a style="text-align: center;" role="menuitem" tabindex="-1" href="#">Job Role</a></li>
						<li role="presentation" class="divider"></li>
						<li role="presentation"><a role="menuitem" tabindex="-1" href="home.html">Home</a></li>
						<li role="presentation"><a role="menuitem" tabindex="-1" href="server.html">Server</a></li>
						<li role="presentation"><a role="menuitem" tabindex="-1" href="protection.html">Protection</a></li>
						<li role="presentation" class="divider"></li>
						<li role="presentation"><a role="menuitem" tabindex="-1" href="login.html">Logout</a></li>    
						</ul>
						</div> </h1>
					</div>
				</div>
			</div>
		</header>
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
					<!--Container COntent -->
					<div class="col-md-9" style="">
						<div class="panel panel-default main-color-list" style="border:none;">
							<div class="panel-heading">
								<h3 class="panel-title">Protection</h3>
							</div>
							<div class="panel-body">
								<div class="col-md-13">
									<form action="#">
										<table style="margin:center;float: left;border:none;position: center;">
											<tr>
												<th style="width:150px;"> </th>
												<th style="width:350px;"> </th>
												<th style="width:350px"> </th>
												<th style="width:350px;"> </th>
												<th style="width:350px"> </th>
												<th style="width:350px;"> </th>
											</tr>
											<tr>
												<td></td>
												<td><label><input type="checkbox" name="Protection" value="RFI"> RFI </label></td>
												<td></td>
												<td><label><input type="checkbox" name="Protection" value="DOS Protection"> DOS Protection </label></td>
												<td></td>
												<td><label><input type="checkbox" name="Protection" value="Session Fixation"> Session Fixation </label></td>
											</tr>
											<tr>
												<td></td>
												<td><label><input type="checkbox" name="Protection" value="LFI"> LFI </label></td>
												<td></td>
												<td><label><input type="checkbox" name="Protection" value="Scanner Protection"> Scanner Protection </label></td>
												<td></td>
												<td><label><input type="checkbox" name="Protection" value="SQL Leak"> SQL Data Leakage </label></td>
											</tr>
											<tr>
												<td></td>
												<td><label><input type="checkbox" name="Protection" value="RCE"> RCE </label></td>
												<td></td>
												<td><label><input type="checkbox" name="Protection" value="Protocol Enrolement"> Protocol Enrolement </label></td>
												<td></td>
												<td><label><input type="checkbox" name="Protection" value="Java Leak"> Java Data Leakage </label></td>
											</tr>
											<tr>
												<td></td>
												<td><label><input type="checkbox" name="Protection" value="XSS"> XSS </label></td>
												<td></td>
												<td><label><input type="checkbox" name="Protection" value="Protocol Attack"> Protocol Attack </label></td>
												<td></td>
												<td><label><input type="checkbox" name="Protection" value="PHP Leak"> PHP Data Leakage </label></td>
											</tr>
											<tr>
												<td></td>
												<td><label><input type="checkbox" name="Protection" value="SQLI"> SQLI </label></td>
												<td></td>
												<td><label><input type="checkbox" name="Protection" value="PHP Vulnerability"> PHP Vulnerability </label></td>
												<td></td>
												<td><label><input type="checkbox" name="Protection" value="IIS Leak"> IIS Data Leakage </label></td>
											</tr>
											<tr>
												<td> . </td>
												<td> . </td>
												<td> . </td>
												<td> . </td>
												<td> . </td>
												<td> . </td>
											</tr>
											<tr>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td><input type="button" value="Save"></td>
											</tr>
										</table>
									</form>
								</div>
							</div>
						</div>
					</div>
					<!--COntainer Recent-->
					<div class="col-md-3">
						@include('inc.sidebar')
					</div>
				</div>
			</div>
		</section>
		@include('inc.footer')
	</body>
</html>