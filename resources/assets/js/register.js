function checkregis() {
	var firstname  =  document.getElementById("firstnametxt").value;
	var lastname = document.getElementById("lastnametxt").value;
	var password = document.getElementById("passwordtxt").value;
	var confirm = document.getElementById("confirmtxt").value;
	var jobpost = document.getElementById("jobpostcheck").value;
	var adminpost = document.getElementById("admincheck").checked;
	var staffpost = document.getElementById("staffcheck").checked;
	var errormsg = document.getElementById("errortxt").innerHTML;

if (firstname =="" || lastname =="") {
	document.getElementById("errortxt").innerHTML="Invalid Name";
} else if (!firstname.match("^[a-zA-Z_]*$")){
	document.getElementById("errortxt").innerHTML="Invalid Name";
} else if (!lastname.match("^[a-zA-Z_]*$")){
	document.getElementById("errortxt").innerHTML="Invalid Name";
}
else if (firstname.length>=32 || lastname.length>=32)
{
document.getElementById("errortxt").innerHTML="Invalid Name";
} else if (password =="") {
	document.getElementById("errortxt").innerHTML="Invalid Password";
} else if (password.match(/[<>"'/&-:;.,]/)){
	document.getElementById("errortxt").innerHTML="Invalid Password";
}
else if (confirm!=password){
	document.getElementById("errortxt").innerHTML="Confirm Password Does not Match";
}
 else if (jobpost==""){
	document.getElementById("errortxt").innerHTML="Choose the job Position";
}
else 
	{ document.getElementById("errortxt").innerHTML="";}
}

