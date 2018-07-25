function addserver() {

	var errormsg = document.getElementById('errortxt').innerHTML;
	var servername = document.getElementById('servernametxt').value;
	var ip = document.getElementById('iptxt').value;
	var portsopen = document.getElementById('portsopentxt').value;
	var domain = document.getElementById('domaintxt').value;

	if (servername=="") {
		document.getElementById("errortxt").innerHTML="Please Input the Name";
	} else if (!servername.match("^[a-zA-Z_]*$")) {
		document.getElementById("errortxt").innerHTML="Invalid Input Detected on ServerName !";
	} else if (servername.length>64) {
		document.getElementById("errortxt").innerHTML="ServerName must less than 64 Characters";
	} else if (ip=="") {
		document.getElementById("errortxt").innerHTML="IP Must be filled ";
	} else if (ip.match(/[^0-9\.]/)) {
		document.getElementById("errortxt").innerHTML="Invalid Input Detected on IP ! ";
	} else if (ip.length>16) {
		document.getElementById("errortxt").innerHTML="IP must less than 16 Characters";
	} else if (portsopen=="") {
		document.getElementById("errortxt").innerHTML="portsopen Must be Filled !";
	} else if (!portsopen.match("^[0-9_]")) {
		document.getElementById("errortxt").innerHTML="Invalid Input Detected on Ports !";
	} else if (portsopen.length>5) {
		document.getElementById("errortxt").innerHTML="Ports Must Less than 5 Characters";
	} else if (domain=="") {
		document.getElementById("errortxt").innerHTML="Domain Must Be Filled !";
	} else if (!domain.match(/^[a-zA-Z0-9 !?.-]+$/)) {
		document.getElementById("errortxt").innerHTML="Invalid Input Detected on Domain !";
	} else if (domain.length>32) {
		document.getElementById("errortxt").innerHTML="Domain must less than 32 Characters !";
	} else {
		document.getElementById("errortxt").innerHTML="Success, ServerAdded !"
		$('#custom7').on('change', function(){
   this.value = this.checked ? 1 : 0;
   // alert(this.value);
	}).change();
	}
}