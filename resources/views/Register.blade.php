<!DOCTYPE html>
<html>
	<head>
		@include('inc.headHtml')
		<title>Admin</title>
	</head>
	<body >
		<div class="container">
			<div class="row main">
				<div class="panel-heading">
					<div class="panel-title text-center">
						<h1 class="title" style="text-align: center;">WAF(er)</h1>
						<hr />
					</div>
				</div>
				<div class="main-login main-center">
					<form class="form-horizontal" method="post" action="#">
						<div class="form-group">
							<label for="name" class="cols-sm-2 control-label">Your Name</label>
							<div class="cols-sm-4">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
									<input type="text" class="form-control" name="firstname" id="firstnametxt"  placeholder="First Name"/>
									<input type="text" class="form-control" name="lastname" id="lastnametxt"  placeholder="Last Name"/>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="password" class="cols-sm-2 control-label">Password</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
									<input type="password" class="form-control" name="password" id="passwordtxt"  placeholder="Enter your Password"/>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="confirm" class="cols-sm-2 control-label">Confirm Password</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
									<input type="password" class="form-control" name="confirm" id="confirmtxt"  placeholder="Confirm your Password"/>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="position" class="cols-sm-2 control-label">Job Position</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-briefcase fa-lg" aria-hidden="true"></i></span>
									<select class="form-control" id="jobpostcheck">
										<option value="">Choose an option...</option>
										<option value="admin" id="admincheck">Admin</option>
										<option value="staff" id="staffcheck">Staff</option>
									</select>
								</div>
							</div>
						</div>
						<div class="form-group ">
							<button type="button" class="btn btn-primary btn-lg btn-block login-button" onclick="checkregis();">Register</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</body>