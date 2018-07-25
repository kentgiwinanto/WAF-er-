function check(){

	var oldpass= document.getElementById('oldpasswordtxt').value;
	var newpass= document.getElementById('newpasswordtxt').value;
	var confirm= document.getElementById('confirmtxt').value;
	var errormsg= document.getElementById("errortxt");


	if(oldpass.match(/[^a-zA-Z\.]/)){
	 	document.getElementById("errortxt").innerHTML="Invalid Input";
	}
	else if(newpass.length<=4 || newpass.length>=21){
		document.getElementById("errortxt").innerHTML="Invalid Input";
	}else if(newpass.match(/[<>"'/&-:;.,#]/)){
		document.getElementById("errortxt").innerHTML="Invalid Input";
	}else if(confirm!=newpass){
		document.getElementById("errortxt").innerHTML="Password doesn't match";
	}else if(confirm.match(/[<>"'/&-:;.,#]/)){
		document.getElementById("errortxt").innerHTML="Invalid Input";
	}else{
		document.getElementById("errortxt").innerHTML=""
		open ("index.html");
	}

}