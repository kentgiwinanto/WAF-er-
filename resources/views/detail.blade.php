 @extends('layout.index')
    @section('Title')
    <title>Detail Server</title>
    @endsection


    @section('HeadJS')
     <script src="https://cdn.jsdelivr.net/npm/vue@2.5.15/dist/vue.js"></script>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
  $("#dateSlider2").find('ul').hide()
    $("#dateSlider2").click(function(){
        $("#typeSlider2").slideToggle();
    });
}); 
</script>
<script>
$(document).ready(function(){
  $("#dateSlider").find('ul').hide()
    $("#dateSlider").click(function(){
        $("#typeSlider").slideToggle();
    });
}); 
</script>
<script>
$(document).ready(function(){
  $("#ruleslider1").find('ul').hide()
    $("#ruleslider1").click(function(){
        $("#detailruleslider1").slideToggle();
    });
}); 
</script>
<script>
$(document).ready(function(){
  $("#ruleslider2").find('ul').hide()
    $("#ruleslider2").click(function(){
        $("#detailruleslider2").slideToggle();
    });
}); 
</script>
    <script type="text/javascript">

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
        var options = {'title':'Number of Attacks',
                       'width':815,
                       'height':300};

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
    </script>

    @endsection

    @section('Contain') 

   
   

@include('inc.navbar')


<!--BreadCrumb-->
    
    <section id="breadcrumb">
      <div class="container">
        <ol class="breadcrumb">
          <li class="active"> Breadcrumb </li>
        </ol>
      </div>
    </section>

    <section id="main">
      <div class="container">
        <div class="row">
       
<!--Container Content-->
 
          <div class="col-md-9">

 <div class="col-md-12" style="padding-left: 0px">
      <div class="well" onmouseover="style.color='grey'" onmouseout="style.color=''" onclick="location.href='#';" style="cursor: pointer;border-radius: 8px;background-color: #ffffff;padding-top: 0px; padding-left: 3px;">
        <h2 style="padding:5px 10px 1px 1px; margin-top: 0px;">  Server <br><br><small style="float: right;"> <i class="fas fa-server"></i> Detail Server</small> </h2>
      </div>
    </div>

<!--Container Content Log and Config-->

<ul class="nav nav-tabs">
  <li class="active"><a href="#tab_a" data-toggle="tab">Log</a></li>
  <li><a href="#tab_b" data-toggle="tab">Rules</a></li>
  <li class="dropdown">

  </li>
</ul><!-- end of nav -->

<div class="tab-content" style="background-color: white;border-radius: 1px;padding-left: 13px;padding-top: 10px; border-bottom: solid 1px;max-height: 200px;overflow-y: scroll;">
        <div class="tab-pane active" id="tab_a">
            <div class="col-md-13" style="background-color: white;">
              <h4>Logs</h4>
              <ul id="dateSlider">
                <li style="cursor: pointer;">
                  12 - 03 - 2018
                  <ul id="typeSlider">
                    <li>
                      <table border="solid 1px">
                        <tr>
                          <th style="width: 340px"></th>
                          <th style="width:340px"></th>
                        </tr>
                        <tr>
                          <td>WAF_LogsID</td>
                          <td>WAF_LogsID_1237c939-3baa</td>
                        </tr>
                        <tr>
                          <td>TimeStampLog</td>
                          <td> 2002-05-30 09:00:00</td>
                        </tr>
                      </table>
                    </li>
                  </ul>
                </li>
              </ul>

              <ul id="dateSlider2">
                <li style="cursor: pointer;">
                  11 - 03 - 2018
                  <ul id="typeSlider2">
                    <li>
                      <table border="solid 1px">
                        <tr>
                          <th style="width: 340px"></th>
                          <th style="width:340px"></th>
                        </tr>
                        <tr>
                          <td>WAF_LogsID</td>
                          <td>WAF_LogsID_1237c939-3baa</td>
                        </tr>
                        <tr>
                          <td>TimeStampLog</td>
                          <td> 2002-05-30 09:00:00</td>
                        </tr>
                      </table>
                    </li>
                  </ul>
                </li>
              </ul>
            </div>
        </div>


        <div class="tab-pane" id="tab_b">
            <h4>Rules</h4>
            <form action="#">
          <table >
            <tr>
              <th style="width: 700px"></th>
              <th style="width: 100px;"></th>
            </tr>
            <tr>
              <td> 
              <ul id="ruleslider1">
                <li style="cursor: pointer;">
                    <input type="checkbox" name="Configuration" value="SecRule1"> Sample Rules 1 
                  <ul id="detailruleslider1">
                    <li>
                      SecRule :ARGS|REQUEST_HEADERS “@rx &lt;script&gt;” </li>
                    <li>id:101,</li>
                    <li> msg:‘XSS Attack’,</li>
                    <li>severity:ERROR,</li>
                    <li>deny,</li>
                    <li>status:404</li>
             
                  </ul>
                </li>
              </ul></td>
              <td><input type="button" class="fas fa-lg fa-edit" style="float: center;cursor: pointer;" value="Edit"></td>
            </tr>
<!--             <tr>
              <td><ul id="ruleslider2">
                <li style="cursor: pointer;">
                    <input type="checkbox" name="Configuration" value="SecRule1"> SecRule REQUEST_LINE|REQUEST_HEADERS|REQUEST_HEADERS_NAMES 
                  <ul id="detailruleslider2">
                    <li>
                      SecRule REQUEST_LINE|REQUEST_HEADERS|REQUEST_HEADERS_NAMES "@contains () {" "phase:1,id:'2100080',block,t:none,t:utf8toUnicode,t:urlDecodeUni,t:compressWhitespace,msg:'SLR: Bash ENV Variable Injection Attack',tag:'CVE-2014-6271',tag:'http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-6271',tag:'https://securityblog.redhat.com/2014/09/24/bash-specially-crafted-environment-variables-code-injection-attack/'"</li>
                    <li>
                      Detail
                    </li>
                  </ul>
                </li>
              </ul></td>
              <td><input type="button" class="fas fa-lg fa-edit" style="cursor: pointer;" value=""></td>
            </tr> -->
            <tr>
              <td><input type="button" class="fas fa-lg fa-plus-circle" style="float:center;cursor: pointer;"></td>
              <td><input type="button" class="btn btn-primary" style="float: right;" value="Save"></td>
            </tr>
          </table> </form>
        </div>

</div><!-- tab content -->

 
          </div>


<!--Container Recent-->


@include('inc.sidebar')
        </div>
      </div>

    </section>

@include('inc.footer')
@endsection
