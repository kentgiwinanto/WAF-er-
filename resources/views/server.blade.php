@extends('layout.indexPage')

@section('Title')
	<title> Server | WAFer Development</title>
@endsection

@section('Content')
		@include('inc.navbar')
		<!--Breadcrumb-->
		<section id="breadcrumb">
			<div class="container">
				<ol class="breadcrumb">
					<li><a href="/Home">Home</a></li>
					<li class="active">Server</li>
				</ol>
				 <!-- Kalau ada return message -->
				@if(session()->has('message'))
				    <div class="alert alert-success">
				        {{ session()->get('message') }}
				    </div>
				@endif
			</div>
		</section>
		<section id="main">
			<div class="container">
				<div class="row">
					<!--Container Content-->
					
					<div class="col-md-12" style="padding-left: 0px;max-height: 400px;overflow-y: scroll;" id="servercontainer">
						<div class="col-md-3" ><a href="AddServer">
							<div class="well" id="addservercont"onmouseover="style.color='grey'" onmouseout="style.color=''" style="cursor: pointer;background-color: 
								#999999;border-radius: 8px;padding-top: 0px; padding-left: 3px;">
								<h2 style="padding:5px 1px 1px 1px; margin-top: 0px; margin-left: 110px;">  <br><label><i class="fas fa-plus"></i></label> </h2>
							</div></a>
						</div> 
						@include('php.showServerList')
					</div>
				 <!-- Tempat Naro SideBar -->
				</div>
			</div>
		</section>
		@include('inc.footer')
@endsection