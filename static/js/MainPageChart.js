$(document).ready( function () {
	//Chart Weekly Access Activity
	$.ajax({
		url: "getWeeklyAccessActivity", 
		type: 'GET',
		beforeSend: function(){
					  
		},
		error: function(result){
							  
		},
		success: function(result){
			var ObjKey = Object.keys(result);
			labels = [];
			dataValues = [];
			
			ObjKey.forEach(function(entry){
				labels.push(entry);
				dataValues.push(result[entry]);
			});
			var ctx = document.getElementById('ChartDailyServeActivity').getContext("2d");
			var chart = new Chart(ctx, {
				type: 'bar',
				data: {
					labels: labels,
					datasets: [{
						backgroundColor: '#97ce2f',
						data: dataValues,
					}]
				},
				options: {
					legend: {
						display: false
					},
					title: {
						display: true,
						text: 'Weekly Access Activity'
					},
				}
			});
		}
	});

	//Chart Monthly Attack Activity
	$.ajax({
		url: "getMonthlyAttackSummary", 
		type: 'GET',
		beforeSend: function(){
					  
		},
		error: function(result){
							  
		},
		success: function(result){
			var ObjKey = Object.keys(result);
			labels = [];
			dataValues = [];
			ObjKey.forEach(function(entry){
				labels.push(entry);
				dataValues.push(result[entry]);
			});
			//2
			var ctx = document.getElementById('ChartTotalAttack').getContext("2d");
			var chart = new Chart(ctx, {
				// The type of chart we want to create
				type: 'bar',

				// The data for our dataset
				data: {
					labels: labels,
					datasets: [{
						backgroundColor: ['#ff0000','#ff7F00','#cccc00','#00cc00','#0000cc','#4b0082','#9400d3','#cc465d','#7fb548','#69b4ff','#58d496','#00ee00'],
						borderColor: '#97ce2f',
						data: dataValues,
					}]
				},

				// Configuration options go here
				options: {
					legend: {
						display: false
					},
					title: {
						display: true,
						text: 'Monthly Attack Activity'
					},

				}
			});
		}
	});

	//Chart Monthly Attack Activity
	$.ajax({
		url: "getDailyAccessMethod", 
		type: 'GET',
		beforeSend: function(){
					  
		},
		error: function(result){
							  
		},
		success: function(result){
			var ObjKey = Object.keys(result);
			labels = [];
			dataValues = [];
			ObjKey.forEach(function(entry){
				labels.push(entry);
				dataValues.push(result[entry]);
			});
			//3
			var ctx = document.getElementById('ChartMethodServePerDay').getContext("2d");
			var chart = new Chart(ctx, {
				// The type of chart we want to create
				type: 'horizontalBar',

				// The data for our dataset
				data: {
					labels: labels,
					datasets: [{
						backgroundColor: ['#ff0000','#ff7F00','#cccc00','#00cc00','#0000cc','#4b0082','#9400d3','#cc465d','#7fb548','#69b4ff','#58d496','#00ee00'],
						data: dataValues,
					}]
				},

				// Configuration options go here
				options: {
					legend: {
						display: false
					},
					title: {
						display: true,
						text: 'Daily Access Method'
					},
				}
			});

		}
	});

	//Chart Daity Status Code Errors
	$.ajax({
		url: "getDailyErrorStatusCode", 
		type: 'GET',
		beforeSend: function(){
					  
		},
		error: function(result){
							  
		},
		success: function(result){

			var ObjKey = Object.keys(result);
			labels = [];
			dataValues = [];
			ObjKey.forEach(function(entry){
				labels.push(entry);
				dataValues.push(result[entry]);
			});
				
			var canvas = document.getElementById('ChartStatusCodeErrors');
			var ctx = canvas.getContext("2d");
			if(labels.length < 1){
				canvas.getContext("2d").textAlign = 'center';
				canvas.getContext("2d").textBaseline = 'middle';
				canvas.getContext("2d").fillText('No Data Available', canvas.width / 2, canvas.height / 2);	
			}else{
				var chart = new Chart(ctx, {
					// The type of chart we want to create
					type: 'doughnut',
					// The data for our dataset
					data: {
						labels: labels,
						datasets: [{
							label: "Status Code",
							backgroundColor: ['#ff0000','#ff7F00','#cccc00','#00cc00','#0000cc','#4b0082','#9400d3','#cc465d','#7fb548','#69b4ff','#58d496','#00ee00'],
							borderColor: '#97ce2f',
							data: dataValues,
						}]
					},

					// Configuration options go here
					options: {
						title: {
							display: true,
							text: 'Daity Status Code Errors'
						},
					}
				});	
			}
		}
	});

	//Chart User Agent Access this month
	$.ajax({
		url: "getUserAgentAccessMonthly", 
		type: 'GET',
		beforeSend: function(){
					  
		},
		error: function(result){
							  
		},
		success: function(result){

			var ObjKey = Object.keys(result);
			labels = [];
			dataValues = [];
			ObjKey.forEach(function(entry){
				labels.push(entry);
				dataValues.push(result[entry]);
			});

			//5
			var canvas = document.getElementById('ChartUserAgent');
			var ctx = canvas.getContext("2d");
			if(labels.length < 1){
				canvas.getContext("2d").textAlign = 'center';
				canvas.getContext("2d").textBaseline = 'middle';
				canvas.getContext("2d").fillText('No Data Available', canvas.width / 2, canvas.height / 2);	
			}else{
				var chart = new Chart(ctx, {
					// The type of chart we want to create
					type: 'pie',

					// The data for our dataset
					data: {
						labels: labels,
						datasets: [{
							label: "User Agent",
							backgroundColor: ['#ff0000','#ff7F00','#cccc00','#00cc00','#0000cc','#4b0082','#9400d3','#cc465d','#7fb548','#69b4ff','#58d496','#00ee00'],
							borderColor: '#97ce2f',
							data: dataValues,
						}]
					},

					// Configuration options go here
					options: {
						 title: {
							display: true,
							text: 'User Agent Access this month'
						},
					}
				});
			}
		}
	});

	//Tables and functions
	$('.ServerDetailPopUpButton').on("click", function (e) {
		$.ajax({
			url: "detail", 
			type: 'post',
			data: {
				"ServerID": $(this).attr('ServerID')
				},
			beforeSend: function(){
				$('#Table_AccessLog_ServerDetail').empty();
				$('#Table_SecLog_ServerDetail').empty();
				$('#Table_AccessLog_ServerDetail').append("<td colspan=6 rowspan=2 style='text-align:center'><div class='loader'>Loading...</div></td>"); 
				$('#Table_SecLog_ServerDetail').append("<td colspan=6 rowspan=2 style='text-align:center'><div class='loader'>Loading...</div></td>"); 
			},
			error: function(result){
				$('#Table_AccessLog_ServerDetail').empty();
				$('#Table_SecLog_ServerDetail').empty();
				$('#Table_AccessLog_ServerDetail').append("<td colspan=6 rowspan=2 style='text-align:center'><div class='loader'>Something Went Wrong, Please Contact Adminsitrator!</div></td>"); 
				$('#Table_SecLog_ServerDetail').append("<td colspan=6 rowspan=2 style='text-align:center'><div class='loader'>Something Went Wrong, Please Contact Adminsitrator!</div></td>"); 
			},
			success: function(result){
				$('#Table_SecLog_ServerDetail').empty();
				$('#Table_AccessLog_ServerDetail').empty();
				var AccessLogs = JSON.parse(result.AccessLogs);
				var SecLogs = JSON.parse(result.SecurityLogs);

				if(AccessLogs.length != 0){

					for(var i = 0;i < AccessLogs.length; i++){
						tr = $('#Table_AccessLog_ServerDetail_Template').clone().removeAttr('id').addClass('PopUpSecLogRow');
						$('.iDate_AccessLog_Server_Detail',tr).text(AccessLogs[i].time_local);
						$('.iIPFrom_AccessLog_Server_Detail',tr).text(AccessLogs[i].remote_addr);
						$('.iIPTo_AccessLog_Server_Detail',tr).text(AccessLogs[i].server_pass2);
						$('.iRequest_AccessLog_Server_Detail',tr).text(AccessLogs[i].request);
						$('.iRequestBody_AccessLog_Server_Detail',tr).text(AccessLogs[i].request_body);
						$('.iStatusCode_AccessLog_Server_Detail',tr).text(AccessLogs[i].status);
						$('.iBodyBytesSent_AccessLog_Server_Detail',tr).text(AccessLogs[i].body_bytes_sent);
						$('.iUserAgent_AccessLog_Server_Detail',tr).text(AccessLogs[i].http_user_agent);
						$('#Table_AccessLog_ServerDetail').append(tr);
					}
				}else{
					$('#Table_AccessLog_ServerDetail').append("<td colspan=8 rowspan=2 style='text-align:center'><div class='loader'>No Data Available!</div></td>"); 
				}
				if(SecLogs.length != 0){
					for(var i = 0;i < SecLogs.length; i++){
						tr = $('#Table_SecLog_ServerDetail_Template').clone().removeAttr('id').addClass('PopUpSecLogRow');
						$('.iID_SecLog_Server_Detail',tr).text(SecLogs[i].transaction.id);
						$('.iDate_SecLog_Server_Detail',tr).text(SecLogs[i].transaction.time_stamp);
						$('.iEventName_SecLog_Server_Detail',tr).text(SecLogs[i].transaction.messages[0].message);
						$('.iIPSource_SecLog_Server_Detail',tr).text(SecLogs[i].transaction.host_ip);
						$('.iDestination_SecLog_Server_Detail',tr).text(SecLogs[i].transaction.request.headers.Host);
						$('.iAction_SecLog_Server_Detail',tr).html('<a class="tooltip modal-trigger LogDetailPopUpButtonTrigger_ServerDetail" ValueLogID="'+SecLogs[i].transaction.id+'" href="#PopUpDetail">\
											<i class="material-icons">pageview</i>\
											<span class="tooltiptext">Detail</span>\
										</a>')
						$('#Table_SecLog_ServerDetail').append(tr);
					}
					$('.LogDetailPopUpButtonTrigger_ServerDetail').on("click", function (e) {
						$.ajax({
							url: "DetailLog", 
							type: 'post',
							data: {
								"SecLogID": $(this).attr('ValueLogID')
								},
							beforeSend: function(){
								$('#PopUpSecLog').empty();
								$('#RequestHeaderSection').empty();
								$('#ResponseHeaderSection').empty();
								$('#jsonlog').empty();
								$('#PopUpSecLog').append("<td colspan=14 rowspan=2 style='text-align:center'><div class='loader'>Loading...</div></td>"); 
								$('#RequestHeaderSection').append(
									"<tr>\
										<td colspan=2>Loading...</td>\
									</tr>\
									"
								); 
								$('#ResponseHeaderSection').append(
									"<tr>\
										<td colspan=2>Loading...</td>\
									</tr>\
									"
								); 
								$('#jsonlog').text("Loading...");                   
							},
							error: function(result){
								$('#PopUpSecLog').empty();
								$('#RequestHeaderSection').empty();
								$('#ResponseHeaderSection').empty();
								$('#jsonlog').empty();
								$('#PopUpSecLog').append("<td colspan=14 rowspan=2 style='text-align:center'>Something Went Wrong... Please contact Administrator!</td>");  
								$('#RequestHeaderSection').append(
									"<tr>\
										<td colspan=2>Something Went Wrong... Please Contact Administrator!</td>\
									</tr>\
									"
								); 
								$('#ResponseHeaderSection').append(
									"<tr>\
										<td colspan=2>Something Went Wrong... Please Contact Administrator!</td>\
									</tr>\
									"
								); 
								$('#jsonlog').text("Something Went Wrong... Please Contact Adminsitrator!");                     
							},
							success: function(result){
								result = JSON.parse(result);
								$('#PopUpSecLog').empty();
								$('#RequestHeaderSection').empty();
								$('#ResponseHeaderSection').empty();
								$('#jsonlog').empty();
								for(var i = 0;i < result[0].transaction.messages.length; i++){
									tr = $('#PopUpSecLogTemplate').clone().removeAttr('id').addClass('PopUpSecLogRow');
									$('.iID',tr).text(result[0].transaction.id);
									$('.iMessage',tr).text(result[0].transaction.messages[i].message);
									$('.iMatch',tr).text(result[0].transaction.messages[i].details.match);
									$('.iReference',tr).text(result[0].transaction.messages[i].details.reference);
									$('.iRuleID',tr).text(result[0].transaction.messages[i].details.ruleId);
									$('.iFile',tr).text(result[0].transaction.messages[i].details.file);
									$('.iLineNumber',tr).text(result[0].transaction.messages[i].details.lineNumber);
									$('.iData',tr).text(result[0].transaction.messages[i].details.data);
									$('.iSeverity',tr).text(result[0].transaction.messages[i].details.severity);
									$('.iVer',tr).text(result[0].transaction.messages[i].details.ver);
									$('.iRev',tr).text(result[0].transaction.messages[i].details.rev);
									$('.iMaturity',tr).text(result[0].transaction.messages[i].details.maturity);
									$('.iAccuracy',tr).text(result[0].transaction.messages[i].details.accuracy);
									$('#PopUpSecLog').append(tr);
								}
								var RequestKeyNames = Object.getOwnPropertyNames(result[0].transaction.request.headers);
								for(var i = 0; i < RequestKeyNames.length ; i++){
									$('#RequestHeaderSection').append(
										"<tr>\
											<td style='border:1px solid black'> "+RequestKeyNames[i]+" </td>\
											<td style='border:1px solid black'> "+result[0].transaction.request.headers[RequestKeyNames[i]]+" </td>\
										</tr>\
										"
									);
								}
								var ResponseKeyNames = Object.getOwnPropertyNames(result[0].transaction.response.headers);
								for(var i = 0; i < ResponseKeyNames.length ; i++){
									$('#ResponseHeaderSection').append(
										"<tr>\
											<td style='border:1px solid black'> "+ResponseKeyNames[i]+" </td>\
											<td style='border:1px solid black'> "+result[0].transaction.response.headers[ResponseKeyNames[i]]+" </td>\
										</tr>\
										"
									);
								}
								$('#jsonlog').text(JSON.stringify(result, null, 4));     
							}
						});
					  }); 
				}else{
					$('#Table_SecLog_ServerDetail').append("<td colspan=6 rowspan=2 style='text-align:center'><div class='loader'>No Data Available!</div></td>"); 
				}
			}
		});
	  }); 
	$('.LogDetailPopUpButtonTrigger_Index').on("click", function (e) {
		$.ajax({
			url: "DetailLog", 
			type: 'post',
			data: {
				"SecLogID": $(this).attr('ValueLogID')
				},
			beforeSend: function(){
				$('#PopUpSecLog').empty();
				$('#RequestHeaderSection').empty();
				$('#ResponseHeaderSection').empty();
				$('#jsonlog').empty();
				$('#PopUpSecLog').append("<td colspan=14 rowspan=2 style='text-align:center'><div class='loader'>Loading...</div></td>"); 
				$('#RequestHeaderSection').append(
					"<tr>\
						<td colspan=2>Loading...</td>\
					</tr>\
					"
				); 
				$('#ResponseHeaderSection').append(
					"<tr>\
						<td colspan=2>Loading...</td>\
					</tr>\
					"
				); 
				$('#jsonlog').text("Loading...");                   
			},
			error: function(result){
				$('#PopUpSecLog').empty();
				$('#RequestHeaderSection').empty();
				$('#ResponseHeaderSection').empty();
				$('#jsonlog').empty();
				$('#PopUpSecLog').append("<td colspan=14 rowspan=2 style='text-align:center'>Something Went Wrong... Please contact Administrator!</td>");  
				$('#RequestHeaderSection').append(
					"<tr>\
						<td colspan=2>Something Went Wrong... Please Contact Administrator!</td>\
					</tr>\
					"
				); 
				$('#ResponseHeaderSection').append(
					"<tr>\
						<td colspan=2>Something Went Wrong... Please Contact Administrator!</td>\
					</tr>\
					"
				); 
				$('#jsonlog').text("Something Went Wrong... Please Contact Adminsitrator!");                     
			},
			success: function(result){
				result = JSON.parse(result);
				$('#PopUpSecLog').empty();
				$('#RequestHeaderSection').empty();
				$('#ResponseHeaderSection').empty();
				$('#jsonlog').empty();
				for(var i = 0;i < result[0].transaction.messages.length; i++){
					tr = $('#PopUpSecLogTemplate').clone().removeAttr('id').addClass('PopUpSecLogRow');
					$('.iID',tr).text(result[0].transaction.id);
					$('.iMessage',tr).text(result[0].transaction.messages[i].message);
					$('.iMatch',tr).text(result[0].transaction.messages[i].details.match);
					$('.iReference',tr).text(result[0].transaction.messages[i].details.reference);
					$('.iRuleID',tr).text(result[0].transaction.messages[i].details.ruleId);
					$('.iFile',tr).text(result[0].transaction.messages[i].details.file);
					$('.iLineNumber',tr).text(result[0].transaction.messages[i].details.lineNumber);
					$('.iData',tr).text(result[0].transaction.messages[i].details.data);
					$('.iSeverity',tr).text(result[0].transaction.messages[i].details.severity);
					$('.iVer',tr).text(result[0].transaction.messages[i].details.ver);
					$('.iRev',tr).text(result[0].transaction.messages[i].details.rev);
					$('.iMaturity',tr).text(result[0].transaction.messages[i].details.maturity);
					$('.iAccuracy',tr).text(result[0].transaction.messages[i].details.accuracy);
					$('#PopUpSecLog').append(tr);
				}
				var RequestKeyNames = Object.getOwnPropertyNames(result[0].transaction.request.headers);
				for(var i = 0; i < RequestKeyNames.length ; i++){
					$('#RequestHeaderSection').append(
						"<tr>\
							<td style='border:1px solid black'> "+RequestKeyNames[i]+" </td>\
							<td style='border:1px solid black'> "+result[0].transaction.request.headers[RequestKeyNames[i]]+" </td>\
						</tr>\
						"
					);
				}
				var ResponseKeyNames = Object.getOwnPropertyNames(result[0].transaction.response.headers);
				for(var i = 0; i < ResponseKeyNames.length ; i++){
					$('#ResponseHeaderSection').append(
						"<tr>\
							<td style='border:1px solid black'> "+ResponseKeyNames[i]+" </td>\
							<td style='border:1px solid black'> "+result[0].transaction.response.headers[ResponseKeyNames[i]]+" </td>\
						</tr>\
						"
					);
				}
				$('#jsonlog').text(JSON.stringify(result, null, 4));     
			}
		});
	  }); 
	$('#SecurityLogTable').DataTable({
		"bLengthChange": false,
		"bAutoWidth": false
	});
	$('#AccessLogsTable').DataTable({
		"bLengthChange": false,
		"bAutoWidth": false
	});
	$('#ServerListTable').DataTable({
		"bLengthChange": false,
		"bInfo": false,
		"bAutoWidth": false
	});
});