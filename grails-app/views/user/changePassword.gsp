<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Change Password</title>
</head>

<body>
<div class="content-wrapper">
    <section class="content-header">

        <ul class="top-links">
            %{--<li><g:link class="btn btn-block btn-primary btn-xs" url="/"><i class="fa fa-home"></i>Home</g:link></li>--}%
            %{-- <li><g:link class="btn btn-block btn-primary btn-xs" action="list"><i
                     class="fa fa-reorder"></i>User list</g:link></li>--}%
        </ul>
    </section>
    <section class="content">
        <g:if test="${flash.success}">
            <div class="alert alert-success alert-dismissable">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <i class="icon fa fa-check"></i>
                ${flash.success}
            </div>
        </g:if>
        <g:elseif test="${flash.error}">
            <div class="alert alert-danger alert-dismissable">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <i class="icon fa fa-remove"></i>
                ${flash.error}
            </div>
        </g:elseif>
        <g:elseif test="${flash.message}">
            <div class="alert alert-info alert-dismissable">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <i class="icon fa fa-info"></i>
                ${flash.message}
            </div>
        </g:elseif>
    <!-- flash message end -->
        <div class="row">
            <div class="col-xs-12">

                <!-- Horizontal Form -->
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">Change Password</h3>
                    </div><!-- /.box-header -->
                <!-- form start -->
                    <g:form action="changePassword" method="post" class="form-horizontal formValidation">
                        <div class="box-body">
                            %{--<g:render template="form"/>--}%
                            <div class="form-group">
                                <label for="username" class="col-sm-2 control-label required">Username
                                </label>

                                <div class="col-sm-6">
                                    <g:textField name="username" id="username" disabled="disabled"
                                                 value="${userName}" class="form-control"/>
                                </div>
                            </div>
                            %{--<div class="form-group">
                                <label class="col-sm-2 control-label required">Current Password
                                </label>

                                <div class="col-sm-6">
                                    <g:passwordField name="oldPassword" id="oldPassword"
                                                     autocomplete="off" class="form-control"/>
                                </div>
                            </div>--}%
                            <div class="form-group">
                                <label class="col-sm-2 control-label required">Old Password
                                </label>

                                <div class="col-sm-6">
                                    <g:passwordField name="oldPassword" id="oldPassword"
                                                     autocomplete="off" class="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label required">New Password
                                </label>

                                <div class="col-sm-6">
                                    <g:passwordField name="newPassword" id="newPassword"
                                                     autocomplete="off" class="form-control"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label required">Confirm Password
                                </label>

                                <div class="col-sm-6">
                                    <g:passwordField name="confirmPassword" id="confirmPassword"
                                                     autocomplete="off" class="form-control"/>
                                </div>
                            </div>
                        </div><!-- /.box-body -->
                        <div class="box-footer">
                            <button type="submit" class="btn btn-primary "><i class="fa fa-save"></i>Update
                            </button>
                            <button type="reset" class="btn btn-default pull-right"><i class="fa fa-hand-paper-o"></i>Clear
                            </button>

                        </div><!-- /.box-footer -->
                    </g:form>
                </div><!-- /.box -->
            </div>
        </div>
    </section>
</div>
</body>
</html>