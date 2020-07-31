<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>

        <style>
        .inf-content{
            border:1px solid #DDDDDD;
            -webkit-border-radius:10px;
            -moz-border-radius:10px;
            border-radius:10px;
            box-shadow: 7px 7px 7px rgba(0, 0, 0, 0.3);
        }

        </style>
    </head>
    <body>
    %{--<div class="content-wrapper">--}%
        %{--<section class="content-header">--}%

            %{--<ul class="top-links">--}%
                %{--<li><g:link class="btn btn-block btn-primary btn-xs" url="/"><i class="fa fa-home"></i>Home</g:link></li>--}%
                %{-- <li><g:link class="btn btn-block btn-primary btn-xs" action="list"><i--}%
                         %{--class="fa fa-reorder"></i>User list</g:link></li>--}%
            %{--</ul>--}%
        %{--</section>--}%
        %{--<section class="content">--}%
            %{--<g:if test="${flash.success}">--}%
                %{--<div class="alert alert-success alert-dismissable">--}%
                    %{--<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>--}%
                    %{--<i class="icon fa fa-check"></i>--}%
                    %{--${flash.success}--}%
                %{--</div>--}%
            %{--</g:if>--}%
            %{--<g:elseif test="${flash.error}">--}%
                %{--<div class="alert alert-danger alert-dismissable">--}%
                    %{--<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>--}%
                    %{--<i class="icon fa fa-remove"></i>--}%
                    %{--${flash.error}--}%
                %{--</div>--}%
            %{--</g:elseif>--}%
            %{--<g:elseif test="${flash.message}">--}%
                %{--<div class="alert alert-info alert-dismissable">--}%
                    %{--<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>--}%
                    %{--<i class="icon fa fa-info"></i>--}%
                    %{--${flash.message}--}%
                %{--</div>--}%
            %{--</g:elseif>--}%
        %{--<!-- flash message end -->--}%
            %{--<div class="row">--}%
                %{--<div class="col-xs-12">--}%

                    %{--<!-- Horizontal Form -->--}%
                    %{--<div class="box box-primary">--}%
                        %{--<div class="box-header with-border">--}%
                            %{--<h3 class="box-title" style="text-align: center">User Details</h3>--}%
                        %{--</div><!-- /.box-header -->--}%
                    %{--<!-- form start -->--}%
                        %{--<div class="form-horizontal formValidation" style="margin-top: 30px">--}%
                            %{--<div class="box-body">--}%
                                %{--<g:render template="form"/>--}%
                                %{--<div class="form-group">--}%
                                    %{--<label for="username" class="col-sm-2 control-label ">First Name :--}%
                                    %{--</label>--}%
                                        %{--${userInstance.firstName}--}%
                                %{--</div>--}%
                                %{--<div class="form-group">--}%
                                    %{--<label class="col-sm-2 control-label ">Last Name :--}%
                                    %{--</label>--}%

                                    %{--${userInstance.firstName}--}%
                                %{--</div>--}%
                                %{--<div class="form-group">--}%
                                    %{--<label class="col-sm-2 control-label ">Address :--}%
                                    %{--</label>--}%

                                    %{--${userInstance.firstName}--}%
                                %{--</div>--}%

                                %{--<div class="form-group">--}%
                                    %{--<label class="col-sm-2 control-label ">Phone :--}%
                                    %{--</label>--}%

                                    %{--${userInstance.firstName}--}%
                                %{--</div>--}%

                                %{--<div class="form-group">--}%
                                    %{--<label class="col-sm-2 control-label ">email :--}%
                                    %{--</label>--}%

                                    %{--${userInstance.firstName}--}%
                                %{--</div>--}%

                                %{--<div class="form-group">--}%
                                    %{--<label class="col-sm-2 control-label ">Birth Date :--}%
                                    %{--</label>--}%

                                    %{--${userInstance.birthDate}--}%
                                %{--</div>--}%

                            %{--</div><!-- /.box-body -->--}%
                            %{--<div class="box-footer">--}%


                            %{--</div><!-- /.box-footer -->--}%
                    %{--</div>--}%
                    %{--</div><!-- /.box -->--}%
                %{--</div>--}%
            %{--</div>--}%
        %{--</section>--}%
    %{--</div>--}%



            <div class="row">
                <div class="col-md-4">

                </div>
                <div class="col-md-6" style="font-size:20px; padding: 3%">
                    <strong>User Details</strong><br>
                    <div class="table-responsive">
                        <table class="table table-user-information">
                            <tbody>
                            <tr>
                                <td>
                                    <strong>
                                        Fisrt Name
                                    </strong>
                                </td>
                                <td class="text-primary">
                                    ${userInstance.firstName}
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong>

                                        Last Name
                                    </strong>
                                </td>
                                <td class="text-primary">
                                    ${userInstance.lastName}
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong>

                                        Address
                                    </strong>
                                </td>
                                <td class="text-primary">
                                    ${userInstance.address}
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <strong>
                                        Phone
                                    </strong>
                                </td>
                                <td class="text-primary">
                                    ${userInstance.phone}
                                </td>
                            </tr>


                            <tr>
                                <td>
                                    <strong>

                                        Email
                                    </strong>
                                </td>
                                <td class="text-primary">
                                    ${userInstance.username}
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong>

                                        Birth Date
                                    </strong>
                                </td>
                                <td class="text-primary">
                                    ${userInstance.birthDate}
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>


    </body>
</html>
