	 @extends('layout.index')
    @section('Title')
    <title>Login</title>
    @endsection

    @section('HeadCSS')
    <link rel="stylesheet" type="text/css" href="css/register.css">
    @endsection

    @section('HeadJS')
    <script type="text/javascript" src="js/login.js"></script>
    @endsection

    @section('Contain')
		<div class="container">
			<div class="row main">
				<div class="panel-heading">
	               <div class="panel-title text-center">
	               		<h1 class="title" style="text-align: center;">WAFer</h1>
	               		<hr />
	               	</div>
	            </div> 
				<div class="main-login main-center">
					<form id="FormLogin" class="form-horizontal" method="post" action="/doLogin">
						{{csrf_field()}}

						

						<div class="form-group">
							<label for="username" class="cols-sm-2 control-label">Username</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fas fa-user fa-lg"></i></span>
									<input type="text" class="form-control" name="username" id="usernametxt"  placeholder="Enter Your Username"/>
			
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="password" class="cols-sm-2 control-label">Password</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fas fa-lock fa-lg" aria-hidden="true"></i></span>
									<input type="password" class="form-control" name="password" id="passwordtxt"  placeholder="Enter your Password"/>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="error" class="cols-sm-2 control-label" id="errortxt" value="" style="color:red;"></label>
						</div>
						

						<div class="form-group ">
							<button type="submit" form="FormLogin" class="btn btn-primary btn-lg btn-block login-button">Login</button>
						</div>
						
					</form>
				</div>
			</div>
		</div>

		<script type="text/javascript" src="assets/js/bootstrap.js"></script>
	@endsection