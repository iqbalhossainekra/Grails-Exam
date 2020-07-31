<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<!doctype html>
<html lang="en">
<head>

    %{--<meta name="layout" content="main" />--}%
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


    <link rel="dns-prefetch" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Raleway:300,400,600" rel="stylesheet" type="text/css">



    <link rel="icon" href="Favicon.png">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <title>User Registration</title>

    <style>
    body{
        margin: 0;
        font-size: .9rem;
        font-weight: 400;
        line-height: 1.6;
        color: #212529;
        text-align: left;
        background-color: #f5f8fa;
    }

    .navbar-laravel
    {
        box-shadow: 0 2px 4px rgba(0,0,0,.04);
    }

    .navbar-brand , .nav-link, .my-form, .login-form
    {
        font-family: Raleway, sans-serif;
    }

    .my-form
    {
        padding-top: 1.5rem;
        padding-bottom: 1.5rem;
    }

    .my-form .row
    {
        margin-left: 0;
        margin-right: 0;
    }

    .login-form
    {
        padding-top: 1.5rem;
        padding-bottom: 1.5rem;
    }

    .login-form .row
    {
        margin-left: 0;
        margin-right: 0;
    }
    </style>

    <script>
        function validform() {

            var a = document.forms["my-form"]["firstName"].value;
            var b = document.forms["my-form"]["address"].value;
            var c = document.forms["my-form"]["username"].value;
            var d = document.forms["my-form"]["lastName"].value;
            var e = document.forms["my-form"]["nid-number"].value;

            if (a==null || a=="")
            {
                alert("Please Enter Your Full Name");
                return false;
            }else if (b==null || b=="")
            {
                alert("Please Enter Your Email Address");
                return false;
            }else if (d==null || d=="")
            {
                alert("Please Enter Your Permanent Address");
                return false;
            }

        }

        $('#datepicker37').datepicker({
            format: 'dd/mm/yyyy',
            endDate: '0',
            autoclose: true
        })
    </script>

</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light navbar-laravel">
    <div class="container">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="/login/auth">Login</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/user/create">Register</a>
                </li>
            </ul>

        </div>
    </div>
</nav>

<main class="my-form">
    <div class="cotainer">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header" style="align-content: center"> User Registration</div>
                    <div class="card-body">
                        <g:form action="add" controller="User" >
                            <input type="hidden"  name="passwordExpired" value="0" />
                            <input type="hidden"  name="accountLocked" value="0" />
                            <input type="hidden"  name="accountExpired" value="0" />
                            <input type="hidden"  name="enabled" value="1" />
                            <div class="form-group row">
                                <label for="firstName" class="col-md-4 col-form-label text-md-right">First Name</label>
                                <div class="col-md-6">
                                    <input type="text" id="firstName" class="form-control" name="firstName">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="lastName" class="col-md-4 col-form-label text-md-right">Last Name</label>
                                <div class="col-md-6">
                                    <input type="text" id="lastName" class="form-control" name="lastName">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="address" class="col-md-4 col-form-label text-md-right">Present Address</label>
                                <div class="col-md-6">
                                    <input type="text" id="address" name="address" class="form-control">
                                </div>
                            </div>


                            <div class="form-group row">
                                <label for="phone" class="col-md-4 col-form-label text-md-right">Phone Number</label>
                                <div class="col-md-6">
                                    <input type="text" id="phone" name="phone" class="form-control">
                                </div>
                            </div>



                            <div class="form-group row">
                                <label for="username" class="col-md-4 col-form-label text-md-right">E-Mail Address</label>
                                <div class="col-md-6">
                                    <input type="email" id="username" class="form-control"  name="username"
                                           required >
                                </div>
                            </div>



                            <div class="form-group row">
                                <label for="datepicker37" class="col-md-4 col-form-label text-md-right">Birth Date</label>
                                <div class="col-md-6">
                                    <input type="text" class="form-control" name="birthDate" id="datepicker37"
                                           value="${formatDate(format: 'dd/MM/yyyy', date: new Date())}"
                                           required/>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="password" class="col-md-4 col-form-label text-md-right">Password</label>
                                <div class="col-md-6">
                                    <g:passwordField name="password" id="password"
                                                     autocomplete="off" class="form-control" required="required"/>
                                </div>
                            </div>

                            <div class="col-md-6 offset-md-4">
                                <button type="submit" class="btn btn-primary">
                                    Register
                                </button>
                            </div>

                        </g:form>
                    </div>
                </div>
            </div>
        </div>
    </div>

</main>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>
</html>