 @extends('layout.index')
    @section('Title')
    <title>Server</title>
    @endsection

    @section('Contain')

   @include('inc.navbar')


<!--Breadcrumb-->

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
 
          <div class="col-md-9" style="padding-left: 0px;max-height: 400px;overflow-y: scroll;" id="servercontainer">
    <div class="col-md-4" >
      <div class="well" id="addservercont"onmouseover="style.color='grey'" onmouseout="style.color=''" onclick="addserver();" style="cursor: pointer;background-color: 
      #999999;border-radius: 8px;padding-top: 0px; padding-left: 3px;">
        <h2 style="padding:5px 1px 1px 1px; margin-top: 0px; margin-left: 110px;">  <br><label><i class="fas fa-plus"></i></label> </h2>
      </div>
    </div>

 <div class="col-md-4">
      <div class="well" onmouseover="style.color='grey'" onmouseout="style.color=''" onclick="location.href='Detail';" style="cursor: pointer;border-radius: 8px;background-color: #41ea4c;padding-top: 0px;padding-left: 5%;">
        <h2 style="padding:5px 10px 1px 1px; margin-top: 0px;"> <label style="">Server</label>  <br><label style="font-size: 15px;">(192.168.1.101)</label><br><small style="float: right;"> 32 ms </small> </h2>
      </div>
    </div>


<div class="col-md-4">
      <div class="well" onmouseover="style.color='grey'" onmouseout="style.color=''" onclick="location.href='Detail';" style="cursor: pointer;border-radius: 8px;background-color: #f67c7c;padding-top: 0px;padding-left: 5%;">
        <h2 style="padding:5px 10px 1px 1px; margin-top: 0px;"> <label>Server</label>  <br><label style="font-size: 15px;">(Error)</label><br><small style="float: right;"> ? ms </small> </h2>
      </div>
    </div>

<div class="col-md-4" style="display: none;" id="servercont">
      <div class="well" onmouseover="style.color='grey'" onmouseout="style.color=''" onclick="location.href='Detail';" style="cursor: pointer;border-radius: 8px;background-color: #ffffff;padding-top: 0px;padding-left: 5%;">
        <h2 style="padding:5px 10px 1px 1px; margin-top: 0px;"> <label>Server</label>  <br><label style="font-size: 15px;">(192.168.1.105)</label><br><small style="float: right;"> Loading... </small> </h2>
      </div>
    </div>






 
          </div>


<!--Container Recent-->

@include('inc.sidebar')


        </div>
      </div>

    </section>

@include('inc.footer')
@endsection
