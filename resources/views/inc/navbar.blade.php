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
				<li role="presentation"><a style="text-align: center;" role="menuitem" tabindex="-1" href="#"><img src="#"></a></li>
				<li role="presentation"><a style="text-align: center;" role="menuitem" tabindex="-1" href="#"> <?php echo session()->get('Username'); ?> </a></li>
				<li role="presentation"><a style="text-align: center;" role="menuitem" tabindex="-1" href="#">  <?php echo session()->get('UserJobName'); ?>  </a></li>
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
