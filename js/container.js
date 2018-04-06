function addcont1 () {
	$('#container1').clone().appendTo('#container').removeAttr('id').attr('id','container'+nomor).attr('testong',nomor).css('display','');
	$('#container'+nomor).children('#addsmallcontainer1').removeAttr('id').attr('id','addsmallcontainer'+nomor).attr('nomor',nomor);
	$("#addsmallcontainer"+nomor).click(function(){
		var tempnomor = $(this).attr('nomor');
	    $('#smallcontainer1').clone().appendTo("#container"+tempnomor).removeAttr('id').attr('id','smallcontainer'+tempnomor).css('display','');
	});
	nomor = nomor + 1;
	
}

// function addcont2 () {
// 	console.log(attr('testong'));
// 	$('#smallcontainer1').clone().appendTo("#container3").removeAttr('id').attr('id','smallcontainer'+nomor).css('display','')
// }


function addserver() {
	$('#servercont').clone().appendTo('#servercontainer').removeAttr('id').attr('id','servercont'+nomor).css('display','');
	nomor = nomor+1;
}



