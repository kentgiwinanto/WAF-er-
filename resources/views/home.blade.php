@extends('layout.indexPage')

@section('Title')
	<title>Home | WAFer Development</title>
@endsection

@section('Content')
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
				<!--Container Content -->
				<div class="col-md-9" style="padding-left: 0px;">
					<div class="col-md-6">
						<div class="well" onmouseover="style.color='grey'" onmouseout="style.color=''" onclick="location.href='server'; " style="cursor: pointer;border-radius: 8px;background-color: #ffffff;padding-top: 0px; padding-left: 3px;margin-left: 0px;">
							<h2 style="padding:5px 10px 1px 1px; margin-top: 0px;">  Servers <br><br><small style="float: right;"> <i class="fas fa-server"></i> 3 Actives</small> </h2>
						</div>
					</div>
					<div class="col-md-6" >
						<div class="well" onmouseover="style.color='grey'" onmouseout="style.color=''" onclick="location.href='configuration';" style="cursor: pointer;background-color:  
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
	@include('inc.footer')
@endsection