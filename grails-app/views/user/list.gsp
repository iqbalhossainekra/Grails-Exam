<%@ page import="groovy.time.TimeCategory; groovy.time.TimeDuration; java.time.LocalDateTime; java.time.format.DateTimeFormatter" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
    <asset:stylesheet src="stylesheets/customize.css?compile=false"/>
    <asset:javascript src="jquery-2.2.0.min.js?compile=false"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


    <style>
    table {
        border: 1px solid #ccc;
        border-collapse: collapse;
        margin: 0;
        padding: 0;
        width: 100%;
        table-layout: fixed;
    }

    table caption {
        font-size: 1.5em;
        margin: .5em 0 .75em;
    }

    /*thead tr td:first-child {*/
    /*width: 55px !important;*/
    /*}*/

    table tr td {
        background: #f8f8f8;
        border: 1px solid #ddd;
        padding: .35em;

    }

    table th,
    table td {
        padding: .625em;
        text-align: center;
    }

    table th {
        font-size: .85em;
        letter-spacing: .1em;
        text-transform: uppercase;
        border: 1px solid #ddd;
    }

    @media screen and (max-width: 600px) {
        table {
            border: 0;
        }

        table caption {
            font-size: 1.3em;
        }

        table thead {
            border: none;
            clip: rect(0 0 0 0);
            height: 1px;
            margin: -1px;
            overflow: hidden;
            padding: 0;
            position: absolute;
            width: 1px;
        }

        table tr {
            border-bottom: 3px solid #ddd;
            display: block;
            margin-bottom: .625em;
        }

        table td {
            border-bottom: 1px solid #ddd;
            display: block;
            font-size: .8em;
            text-align: right;
        }

        table td:before {
            content: attr(data-label);
            float: left;
            font-weight: bold;
            text-transform: uppercase;
        }

        table td:last-child {
            border-bottom: 0;
        }

        .ss {
            background-color: #e0aa4e !important;
        }
    }
    </style>

    <style>
    * {
        box-sizing: border-box;
    }

    body {
        margin: 0;
        font-family: Arial, Helvetica, sans-serif;
    }

    .topnav {
        overflow: hidden;
        background-color: #e9e9e9;

        padding: 10px 20px;
        margin-top: 8px;
        margin-right: 16px;

    }

    .topnav a {
        float: left;
        display: block;
        color: black;
        text-align: center;
        padding: 14px 16px;
        text-decoration: none;
        font-size: 17px;
    }

    .topnav a:hover {
        background-color: #ddd;
        color: black;
    }

    .topnav a.active {
        background-color: #2196F3;
        color: white;
    }

    .topnav .search-container {
        float: right;
    }

    .topnav input[type=text] {
        padding: 6px;
        margin-top: 8px;
        font-size: 17px;
        border: none;
    }

    .topnav .search-container button {
        float: right;
        padding: 6px 10px;
        margin-top: 8px;
        margin-right: 16px;
        background: #ddd;
        font-size: 17px;
        border: none;
        cursor: pointer;
    }

    .topnav .search-container button:hover {
        background: #ccc;
    }

    @media screen and (max-width: 600px) {
        .topnav .search-container {
            float: none;
        }

        .topnav a, .topnav input[type=text], .topnav .search-container button {
            float: none;
            display: block;
            text-align: left;
            width: 100%;
            margin: 0;
            padding: 14px;
        }

        .topnav input[type=text] {
            border: 1px solid #ccc;
        }
    }
    </style>
</head>

<body>
<section class="content">



    <g:form action="list" controller="user">
        <div class="topnav">

            <a>User List</a>

            <div class="search-container">

                <input type="text" placeholder="Search.." name="search">
                <button type="submit"><i class="fa fa-search"></i></button>

            </div>
        </div>
    </g:form>
<!-- /.box -->

%{--<div class="row">--}%
%{--<div class="col-xs-12">--}%


%{--<span class="" style="margin-top: 10%;"></span>--}%

    <div class="box box-primary" style="margin-top: 2%">

        <!--new---->
        <div class="box-body">
            <table id="testTable" class="">

                <thead>
                <tr class="bg_blue">

                    <td scope="col" style="font-weight:600;">Name</td>
                    <td scope="col" style="font-weight:600;">Age</td>
                    <td scope="col" style="font-weight:600;">Email</td>
                    <td scope="col" style="font-weight:600;">Phone</td>

                </thead>


                <tbody>
                <g:each in="${userInstanceList}" status="i" var="userInstance">
                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                        <td data-label="Full Name">${fieldValue(bean: userInstance, field: "firstName")}</td>


                        <%

                            String tempStartStr
                            tempStartStr = userInstance?.birthDate.toString().replace(' ', 'T')
                            def tempStart = Date.parse("yyy-MM-dd'T'HH:mm:ss", tempStartStr)
                            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")
                            LocalDateTime now = LocalDateTime.now()
                            String tempCurrentDateString = dtf.format(now)
                            String tempEndStr = tempCurrentDateString.toString().replace(' ', 'T')
                            def tempPause = Date.parse("yyy-MM-dd'T'HH:mm:ss", tempEndStr)
                            groovy.time.TimeDuration tempDurationmanual = groovy.time.TimeCategory.minus(tempPause, tempStart)
                            def age = (tempDurationmanual.days).intdiv(365)
                        %>
                        <td data-label="User Id">${age} Year</td>
                        %{--<td data-label="Account Locked">${fieldValue(bean: userInstance, field: "username")}</td>--}%
                        <td data-label="Account Locked"><a href="/user/show/${userInstance.id}">${fieldValue(bean: userInstance, field: "username")}</a></td>
                        <td data-label="Enabled">${fieldValue(bean: userInstance, field: "phone")}</td>

                    </tr>
                </g:each>
                </tbody>
            </table>

        </div><!-- /.box-body -->

    </div><!-- /.box -->

</section><!-- /.content -->
</body>
</html>
