 @extends('layout.index')
    @section('Title')
    <title>Configuration</title>
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
               <!--Container COntent -->
               <div class="col-md-9" style="">
                  <div class="panel panel-default main-color-list" style="border:none;">
                     <div class="panel-heading">
                        <h3 class="panel-title">Configuration</h3>
                     </div>
                     <div class="panel-body" style="max-height: 300px;overflow-y: scroll;">
                        <div class="col-md-13">
                           <div class="col-md-13" id="container">
                              <div class="well col-md-13 well-centered clearfix" id="container1" style="display: none;">
                                 
                                 <div class="" id="smallcontainer1" style="display: none;">
                                 <div class="btn-group" >

                                     
									      <select id="action" class="btn btn-default" >
									         <option value="a">SecEngine A</option>
									         <option value="b">SecEngine B</option>
									      </select>

                                    	<input type="text" name="textDropdown" id="dropdowntxt">
                                   		 
                                  </div></div>
                                 <div class="" id="textfield1" style="display: none;">
                                    <input type="text" name="textfield1"> 
                                 </div>
                                 <!-- <div class="fas fa-plus fa-lg" id="addsmallcontainer1"  onclick="addcont2 ();"></div> -->
                                 <div class="dropdown">
                                    <button class="btn btn-default dropdown-toggle" id="menu" type="button" data-toggle="dropdown"><i class="fas fa-plus fa-lg"></i>
                                    <span class="caret"></span></button>
                                    <ul class="dropdown-menu" role="menu" aria-labelledby="menu2">
                                       <li role="presentation"><a style="text-align: center;cursor: pointer;" role="menuitem" tabindex="-1" id="addsmallcontainer1">Dropdown</a></li>
                                       <li role="presentation"><a style="text-align: center; cursor: pointer;" role="menuitem" tabindex="-1" id="addtextfield1">TextField</a></li>
                                    </ul>
                                 </div>
                              </div>
                           </div>
                           <div class="col-md-13" id="addcontainer1" onclick="addcont1 ();">
                              <div class="well well-centered clearfix"  style="background-color:#999999;cursor: pointer;border-radius: 8px; padding-left: 3px;margin-left: 0px;">
                                 <div class="col-md-3">
                                 </div>
                                 <div class="col-md-3" id="container2" style="">
                                 </div>
                                 <div class="col-md-3">
                                    <div class="fas fa-plus fa-lg"></div>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="col-md-2" style="float: right;padding-right: 0px;"> <button type="button" class="btn btn-lg btn-block">Save</button></div>
                     </div>
                  </div>
               </div>
               <!--COntainer Recent-->
@include('inc.sidebar')

            </div>
         </div>
      </section>
@include('inc.footer')
@endsection