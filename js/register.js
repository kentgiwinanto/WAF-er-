function checkregis() {
	var firstname  =  document.getElementById("firstnametxt").value;
	var lastname = document.getElementById("lastnametxt").value;
	var password = document.getElementById("passwordtxt").value;
	var confirm = document.getElementById("confirmtxt").value;
	var jobpost = document.getElementById("jobpostcheck").value;
	var adminpost = document.getElementById("admincheck").checked;
	var staffpost = document.getElementById("staffcheck").checked;
if (firstname =="" || lastname =="") {
	alert("Please input Your Name ! ");
} else if (!firstname.match("^[a-zA-Z_]*$")){
	alert("Name Must Alphabet");
} else if (!lastname.match("^[a-zA-Z_]*$")){
	alert("Name Must Alphabet");
}
else if (firstname.length>=32 || lastname.length>=32)
{
alert("First Name and Last Name must be each 32 Characters");
} else if (password =="") {
	alert("Password must Be Filled");
} else if (password.match(/[<>"'/&-:;.,]/)){
	alert("Ilegal Input on Password");
}
else if (confirm!=password){
	alert("Confirm Password Does not Match");
}
 else if (jobpost==""){
	alert("Please Choose the Job Post !");
}
else 
	{ alert("Success");}
}

