$(document).ready(function () {
    //Tags Slider
    $(".tagslider").find('ul').hide()
    $(".tagslider").click(function(){
        $(".detailtagslider").slideToggle();
    });

    //DataTable
    $('#detaillog').DataTable();
    $('#seclog').DataTable();
    $('#accesslog').DataTable();
        
    //Google Chart

    // Load the Visualization API and the corechart package.
    google.charts.load('current', {'packages':['corechart']});
    
    // Set a callback to run when the Google Visualization API is loaded.
    google.charts.setOnLoadCallback(drawChart);
    
    // Callback that creates and populates a data table,
    // instantiates the pie chart, passes in the data and
    // draws it.
    function drawChart() {
    
        // Create the data table.
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Day');
        data.addColumn('number', 'SQLi');
        data.addRows([
        ['Monday', 3],
        ['Tuesday', 1],
        ['Wednesday', 4],
        ['Thursday', 4],
        ['Friday', 6],
        ['Saturday', 3],
        ['Sunday', 2]
        ]);
    
        // Set chart options
        var options = 
        {
            'title':'Number of Attacks',
            'width':$(window).width()*0.75,
            'height':300 
        };
    
        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
        chart.draw(data, options);
    }

    //PopUp
    $('.FancyBoxButtonPopUp').on("click", function (e) {
        $.ajax({
            url: "api/detail", 
            type: 'post',
            data: {
                "SecLogID": $(this).attr('ValueLogID')
                },
            success: function(result){
                result = JSON.parse(result);
                $('#jsonlog').text(JSON.stringify(result, null, 4));	

                $('#PopUpSecLog').empty();					
                tr = $('#PopUpSecLogTemplate').clone().removeAttr('id').addClass('PopUpSecLogRow');

                $('.iID',tr).text(result.Message[0].transaction.id);
                $('.iMessage',tr).text(result.Message[0].transaction.messages[0].message);
                $('.iMatch',tr).text(result.Message[0].transaction.messages[0].details.match);
                $('.iReference',tr).text(result.Message[0].transaction.messages[0].details.reference);
                $('.iRuleID',tr).text(result.Message[0].transaction.messages[0].details.ruleId);
                $('.iFile',tr).text(result.Message[0].transaction.messages[0].details.file);
                $('.iLineNumber',tr).text(result.Message[0].transaction.messages[0].details.lineNumber);
                $('.iData',tr).text(result.Message[0].transaction.messages[0].details.data);
                $('.iSeverity',tr).text(result.Message[0].transaction.messages[0].details.severity);
                $('.iVer',tr).text(result.Message[0].transaction.messages[0].details.ver);
                $('.iRev',tr).text(result.Message[0].transaction.messages[0].details.rev);
                $('.iMaturity',tr).text(result.Message[0].transaction.messages[0].details.maturity);
                $('.iAccuracy',tr).text(result.Message[0].transaction.messages[0].details.accuracy);

                $('#PopUpSecLog').append(tr);
            
            }
        });
      }); // on
}); // ready