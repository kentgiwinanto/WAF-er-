$(document).ready(function () {
    //Tags Slider
    $(".tagslider").find('ul').hide()
    $(".tagslider").click(function(){
        $(".detailtagslider").slideToggle();
    });
    //DataTable
    $('#detaillog').DataTable({
        "bPaginate": false,
        "bLengthChange": false,
        "bInfo": false,
    });
    $('#seclog').DataTable();
    $('#accesslog').DataTable();
    //Google Chart

    // Load the Visualization API and the corechart package.
    // google.charts.load('current', {'packages':['corechart']});

    // // Set a callback to run when the Google Visualization API is loaded.
    // google.charts.setOnLoadCallback(drawChart1);

    // // Callback that creates and populates a data table,
    // // instantiates the pie chart, passes in the data and
    // // draws it.
    // function drawChart1() {

    //     // Create the data table.
    //     var data = new google.visualization.DataTable();
    //     data.addColumn('string', 'Day');
    //     data.addColumn('number', 'SQLi');
    //     data.addRows([
    //     ['Monday', 3],
    //     ['Tuesday', 1],
    //     ['Wednesday', 4],
    //     ['Thursday', 4],
    //     ['Friday', 6],
    //     ['Saturday', 3],
    //     ['Sunday', 2]
    //     ]);

    //     // Set chart options
    //     var options = {'title':'Number of Attacks',
    //                     'width':300,
    //                     'height':200};

    //     // Instantiate and draw our chart, passing in some options.
    //     var chart = new google.visualization.ColumnChart(document.getElementById('chart_div1'));
    //     chart.draw(data, options);
    // }

    // google.charts.load('current', {'packages':['corechart']});
    // google.charts.setOnLoadCallback(drawChart2);

    // function drawChart2() {
    //     var data = google.visualization.arrayToDataTable([
    //         ['Day', 'SQLI', 'XSS'],
    //         ['Monday',  2,      4],
    //         ['Tuesday',  3,      2],
    //         ['Wednesday',  4,     0],
    //         ['Thursday',  1,      2],
    //         ['Friday',  5,       9],
    //         ['Saturday',  6,       9],
    //         ['Sunday',  10,       5]
    //     ]);

    //     var options = {
    //         title: 'Attack Summary',
    //         curveType: 'function',
    //         legend: { position: 'bottom' }
    //     };

    //     var chart = new google.visualization.LineChart(document.getElementById('chart_div2'));

    //     chart.draw(data, options);
    // }
    // google.charts.load("current", {packages:["corechart"]});
    // google.charts.setOnLoadCallback(drawChart3);
    // function drawChart3() {
    //     var data = google.visualization.arrayToDataTable([
    //         ['Method', 'Total'],
    //         ['Post',  <?php $ResultLogServer = json_decode(Session::get('ResultLogServer')); echo $ResultLogServer->PostCount; ?> ],
    //         ['Get',   <?php $ResultLogServer = json_decode(Session::get('ResultLogServer')); echo $ResultLogServer->GetCount; ?> ]
    //     ]);

    //     var options = {
    //         title: 'Security Log',
            
    //     };

    //     var chart = new google.visualization.PieChart(document.getElementById('chart_div3'));
    //     chart.draw(data, options);
    // }

    //PopUp
    $('.FancyBoxButtonPopUp').on("click", function (e) {
        $.ajax({
            url: "api/detail", 
            type: 'post',
            data: {
                "SecLogID": $(this).attr('ValueLogID')
                },
            beforeSend: function(){
                $('#PopUpSecLog').empty();
                $('#RequestHeaderSection').empty();
                $('#ResponseHeaderSection').empty();
                $('#jsonlog').empty();
                $('#PopUpSecLog').append("<td colspan=14 rowspan=2 style='text-align:center'>Loading...</td>"); 
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
                for(var i = 0;i < result.Message[0].transaction.messages.length; i++){
                    tr = $('#PopUpSecLogTemplate').clone().removeAttr('id').addClass('PopUpSecLogRow');
                    $('.iID',tr).text(result.Message[0].transaction.id);
                    $('.iMessage',tr).text(result.Message[0].transaction.messages[i].message);
                    $('.iMatch',tr).text(result.Message[0].transaction.messages[i].details.match);
                    $('.iReference',tr).text(result.Message[0].transaction.messages[i].details.reference);
                    $('.iRuleID',tr).text(result.Message[0].transaction.messages[i].details.ruleId);
                    $('.iFile',tr).text(result.Message[0].transaction.messages[i].details.file);
                    $('.iLineNumber',tr).text(result.Message[0].transaction.messages[i].details.lineNumber);
                    $('.iData',tr).text(result.Message[0].transaction.messages[i].details.data);
                    $('.iSeverity',tr).text(result.Message[0].transaction.messages[i].details.severity);
                    $('.iVer',tr).text(result.Message[0].transaction.messages[i].details.ver);
                    $('.iRev',tr).text(result.Message[0].transaction.messages[i].details.rev);
                    $('.iMaturity',tr).text(result.Message[0].transaction.messages[i].details.maturity);
                    $('.iAccuracy',tr).text(result.Message[0].transaction.messages[i].details.accuracy);
                    $('#PopUpSecLog').append(tr);
                }
                var RequestKeyNames = Object.getOwnPropertyNames(result.Message[0].transaction.request.headers);
                for(var i = 0; i < RequestKeyNames.length ; i++){
                    $('#RequestHeaderSection').append(
                        "<tr>\
                            <td style='border:1px solid black'> "+RequestKeyNames[i]+" </td>\
                            <td style='border:1px solid black'> "+result.Message[0].transaction.request.headers[RequestKeyNames[i]]+" </td>\
                        </tr>\
                        "
                    );
                }
                var ResponseKeyNames = Object.getOwnPropertyNames(result.Message[0].transaction.response.headers);
                for(var i = 0; i < ResponseKeyNames.length ; i++){
                    $('#ResponseHeaderSection').append(
                        "<tr>\
                            <td style='border:1px solid black'> "+ResponseKeyNames[i]+" </td>\
                            <td style='border:1px solid black'> "+result.Message[0].transaction.response.headers[ResponseKeyNames[i]]+" </td>\
                        </tr>\
                        "
                    );
                }
                $('#jsonlog').text(JSON.stringify(result, null, 4));     
            }
        });
      }); 
}); 