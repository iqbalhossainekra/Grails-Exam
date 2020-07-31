<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Grails"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <asset:stylesheet src="application.css"/>
    <asset:stylesheet src="master-body.css"/>

    <g:layoutHead/>

    <style>
    .sidenav {
        height: 100%;
        width: 160px;
        position: fixed;
        margin-top: 3.6%;
        z-index: 1;
        top: 0;
        left: 0;
        background-color: #111;
        overflow-x: hidden;
        padding-top: 20px;
    }

    .sidenav a {
        padding: 6px 8px 6px 16px;
        text-decoration: none;
        font-size: 25px;
        color: #818181;
        display: block;
    }

    .sidenav a:hover {
        color: #f1f1f1;
    }

    .main {
        margin-left: 160px; /* Same as the width of the sidenav */
        font-size: 28px; /* Increased text to enable scrolling */
        padding: 0px 10px;
    }

    .sidenav a {
        padding: 6px 8px 6px 16px;
        text-decoration: none;
        font-size: 25px;
        color: #818181;
        display: block;
    }

    .sidenav a:hover {
        color: #f1f1f1;
    }
    </style>
</head>

<body>

</div>


<div class="navbar navbar-default navbar-static-top" role="navigation">
    <div class="container">

        <div class="navbar-collapse collapse" aria-expanded="false" style="height: 0.8px;">

            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">${session["user"]} <span
                        class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="/user/changePassword/${session["check"]}">Change Password</a></li>
                        <li><g:link controller='logout'>Logout</g:link></li>

                    </ul>
                </li>

            </ul>



            %{--<ul class="nav navbar-nav navbar-right">--}%
            %{--<sec:ifLoggedIn>--}%
            %{--Hello <sec:username />--}%
            %{--<g:link controller='logout'>Logout</g:link>--}%

            %{--</sec:ifLoggedIn>--}%
            %{--<sec:ifNotLoggedIn>--}%
            %{--<a href="/login/auth">Log In</a>--}%
            %{--<a href="/user/create">Sign Up</a>--}%
            %{--</sec:ifNotLoggedIn>--}%

            %{--</ul>--}%
        </div>

    </div>
</div>

<div class="sidenav">
    <g:if test="${session["role"] != 'ROLE_ADMIN'}">
        <a href="/user/show/${session["check"]}">Profile Page</a>
        <a href="/user/changePassword/${session["check"]}">Change Password</a>
    </g:if>
    <g:else>
        <a href="/user/list">User List</a>
    </g:else>
</div>

<div class="testy">

    <g:layoutBody/>
</div>

%{--<g:layoutBody/>--}%


%{--<div id="spinner" class="spinner" style="display:none;">--}%
%{--<g:message code="spinner.alt" default="Loading&hellip;"/>--}%
%{--</div>--}%

<asset:javascript src="application.js"/>

</body>
</html>


