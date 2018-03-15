function check(){

	var username= document.getElementById('usernametxt').value;
	var password= document.getElementById('passwordtxt').value;
	var errormsg = document.getElementById('errortxt');


	if(username.length<=4 || username.length>=21){
		 document.getElementById("errortxt").innerHTML="Invalid Username and Password";
	}
	else if(!username.match("^[a-zA-Z0-9_]*$")){
	 	document.getElementById("errortxt").innerHTML="Invalid Username and Password";
	}
	else if (username.match(/[<>"'/&-:;.,"]/)){
		document.getElementById("errortxt").innerHTML="Invalid Username and Password";
	}
	else if(password.length<=4 || password.length>=21){
		document.getElementById("errortxt").innerHTML="Invalid Username and Password";
	}else if(password.match(/[<>"'/&-:;.,]/)){
		document.getElementById("errortxt").innerHTML="Invalid Username and Password";
	}else{
		document.getElementById("errortxt").innerHTML=""
		open ("home.html");
	}

}