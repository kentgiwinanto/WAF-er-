<header id="header">
	<div class="container">
		<div class="row">
			<div class="col-md-10">
				<a href="Home">
					<h1>
						<i class="fas fa-cog"></i> WAF <small>Manage System</small>
				</a>
				<!--DropDown Profile-->
				<div class="dropdown" style="float: right;">
				<button class="btn btn-default dropdown-toggle" id="menu1" type="button" data-toggle="dropdown"><i class="fas fa-user"></i>
				<span class="caret"></span></button>
				<ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
				<li role="presentation"><a style="text-align: center;" role="menuitem" tabindex="-1" href="#"><div style="width: 150px;height: 100px;"><img style="border-radius: 50%;max-height: 100%;max-width:100%;" src="images/admin.png"></div></a></li>
				<br>
				<li role="presentation"><div style="text-align: center;color: black;" role="menuitem" tabindex="-1" href="#"><label> <?php echo session()->get('Username'); ?> </label></div></li>
				<li role="presentation"><div style="text-align: center;color: black;" role="menuitem" tabindex="-1" href="#"><label> <?php echo session()->get('UserJobName'); ?></label> </div></li>
				<br>
				<li role="presentation"><a role="menuitem" tabindex="-1" href="Profile">Edit Profile</a></li>
				<li role="presentation" class="divider"></li>
				<li role="presentation"><a role="menuitem" tabindex="-1" href="Home">Home</a></li>
				<li role="presentation"><a role="menuitem" tabindex="-1" href="Server">Server</a></li>
				<li role="presentation"><a role="menuitem" tabindex="-1" href="Configuration">Configuration</a></li>
				<li role="presentation" class="divider"></li>
				<li role="presentation"><a role="menuitem" tabindex="-1" href="Login">Logout</a></li>
				</ul>
				</div> </h1>
			</div>
		</div>
	</div>
</header>
