@extends('layout.indexPage')

@section('Title')
    <title>AddServer</title>
@endsection

@section('HeadJS')
    <script type="text/javascript" src="js/addserver.js"></script>
@endsection

@section('Content')
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
                <div class="col-md-9" style="max-height: 400px;">
                    <div class="panel panel-default main-color-list" style="border:none;">
                        <div class="panel-heading">
                            <h3 class="panel-title">Add Server</h3>
                        </div>
                        <div class="panel-body" style="max-height: 300px;overflow-y: scroll;">
                            <form class="form" method="post" action="/AddServer">
                                {{ csrf_field() }}
                                <table >
                                    <tr>
                                        <th style="width: 400px"></th>
                                        <th style="width: 400px"></th>
                                    </tr>
                                    <tr>
                                        <td style="width: 300px;">
                                            <div class="form-group">
                                                <label for="password" class="cols-sm-2 control-label">Server Name</label>
                                                <div class="cols-sm-10">
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="fa fa-server fa-lg" aria-hidden="true"></i></span>
                                                        <input type="text" class="form-control" name="servername" id="servernametxt"  placeholder="Enter Server Name"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        <td style="width: 300px;">
                                            <div class="form-group">
                                                <label for="confirm" class="cols-sm-2 control-label">IP</label>
                                                <div class="">
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                                                        <input type="text" class="form-control" name="ip" id="iptxt"  placeholder="Enter Server IP Address"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 300px;">
                                            <div class="form-group">
                                                <label for="confirm" class="cols-sm-2 control-label">PortsOpen</label>
                                                <div class="cols-sm-10">
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="fa fa-code-branch fa-lg" aria-hidden="true"></i></span>
                                                        <input type="text" class="form-control" name="portsopen" id="portsopentxt"  placeholder="Input PortsOpen"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        <td style="width:300px;">
                                            <div class="form-group">
                                                <label for="confirm" class="cols-sm-2 control-label">Domain</label>
                                                <div class="cols-sm-10">
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="fa fa-upload fa-lg" aria-hidden="true"></i></span>
                                                        <input type="text" class="form-control" name="domain" id="domaintxt"  placeholder="Enter Server Domain"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="form-group btn-group">
                                                <input type="checkbox" name="modsecurity" value="1" id="modsecurity" checked="checked"> 
                                                <label for="modsecurity">Enable ModSecurity?</label>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="form-group">
                                                <label for="error" class="cols-sm-2 control-label" id="errortxt" value="" style="color:red;"></label>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>
                                            <input type="submit" class="btn btn-primary btn-lg" style="background-color;float:right;" value="Submit" />
                                        </td>
                                    </tr>
                                </table>
                            </form>
                            <div class="btn-group" style="float: right;"> <button type="button" class="btn btn-lg" style="background-color: #ffffff;float:left;" ><a href="server">Cancel</a>
                                </button> 
                            </div>
                        </div>
                    </div>
                </div>
                @include('inc.sidebar')
            </div>
        </div>
    </section>
    @include('inc.footer')
@endsection
