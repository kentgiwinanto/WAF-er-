function check(){

	var username= document.getElementById('usernametxt').value;
	var password= document.getElementById('passwordtxt').value;


	if(username.length<=4 || username.length>=21){
		alert("Invalid Username or Password");
	}
	else if(!username.match("^[a-zA-Z0-9_]*$")){
	 	alert("Illegal input detected");
	}else if(password.length<=4 || password.length>=21){
		alert("Invalid Username or Password");
	}else if(password.match(/[<>"'/&-]/)){
		alert("Illegal input detected");
	}else{
		alert("success")
		open ("home.html");
	}

}