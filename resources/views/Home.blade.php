@extends('layout.indexPage')

@section('Title')
	<title>Home | WAF Development</title>
@endsection

@section('Content')

	<!-- Navbar -->
	@include('inc.navbar')
	<!--BreadCrumb-->
	<section id="breadcrumb">
		<div class="container">
			<ol class="breadcrumb">
				<li class="active"> Breadcrumb </li>
				<li class=""> Breadcrumb2</li>
			</ol>
		</div>
	</section>

	<!-- Section Main -->
	<section id="main">
		<div class="container">
			<div class="row">
				<!--Container Content -->
				<div class="col-md-9" style="padding-left: 0px;">
					<div class="col-md-6">
						<div class="well" onmouseover="style.color='grey'" onmouseout="style.color=''" onclick="location.href='Server'; " style="cursor: pointer;border-radius: 8px;background-color: #ffffff;padding-top: 0px; padding-left: 3px;margin-left: 0px;">
							<h2 style="padding:5px 10px 1px 1px; margin-top: 0px;">  Servers <br><br><small style="float: right;"> <i class="fas fa-server"></i> 3 Actives</small> </h2>
						</div>
					</div>
					<div class="col-md-6" >
						<div class="well" onmouseover="style.color='grey'" onmouseout="style.color=''" onclick="location.href='Protection';" style="cursor: pointer;background-color:  
							#ffffff;border-radius: 8px;padding-top: 0px; padding-left: 3px;">
							<h2 style="padding:5px 10px 1px 1px; margin-top: 0px;"> Protection <br><br><small style="float: right;"><i class="fas fa-shield-alt"></i> 32 Actives</small> </h2>
						</div>
					</div>
					<!--Container Chart Attack-->
					<div class="col-md-9" style="margin: 0 auto;">
						<div id="chart_div" style="margin: center;border-radius: 18px;"></div>
					</div>
				</div>
				<!--SideBar-->
				<div class="col-md-3">
					@include('inc.sidebar')
				</div>
			</div>
		</div>
	</section>
	@include('inc.footer')

@endsection