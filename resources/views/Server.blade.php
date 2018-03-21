<!DOCTYPE html>
<html lang="en">
	<head>
		@include('inc.headHtml')	
		<title>Servers | WAF Development</title>
	</head>
	<body>
		@include('inc.navbar')
		<!--Breadcrumb-->
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
					<div class="col-md-9" style="padding-left: 0px;">
						<div class="col-md-4">
							<div class="well" onmouseover="style.color='grey'" onmouseout="style.color=''" onclick="location.href='detail.html';" style="cursor: pointer;border-radius: 8px;background-color: #ffffff;padding-top: 0px; padding-left: 3px;">
								<h2 style="padding:5px 10px 1px 1px; margin-top: 0px;">  Server <br><br><small style="float: right;"> <i class="fas fa-server"></i> Server A</small> </h2>
							</div>
						</div>
						<div class="col-md-4">
							<div class="well" onmouseover="style.color='grey'" onmouseout="style.color=''" onclick="location.href='detail.html';" style="cursor: pointer;border-radius: 8px;background-color: #ffffff;padding-top: 0px; padding-left: 3px;">
								<h2 style="padding:5px 10px 1px 1px; margin-top: 0px;">  Server <br><br><small style="float: right;"> <i class="fas fa-server"></i> Server B</small> </h2>
							</div>
						</div>
						<div class="col-md-4" >
							<div class="well" onmouseover="style.color='grey'" onmouseout="style.color=''" onclick="location.href='detail.html';" style="cursor: pointer;background-color: 
								#ffffff;border-radius: 8px;padding-top: 0px; padding-left: 3px;">
								<h2 style="padding:5px 10px 1px 1px; margin-top: 0px;"> Server <br><br><small style="float: right;"><i class="fas fa-server"></i> Server C</small> </h2>
							</div>
						</div>
					</div>
					<!--Container Recent-->
					<div class="col-md-3">
						@include('inc.sidebar')
					</div>
				</div>
			</div>
		</section>
		@include('inc.footer')
	</body>
</html>