<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login into Admin System</title>
        <!-- Bootstrap core CSS -->
        <link href="assets/css/bootstrap.css" rel="stylesheet">
        <!--external css-->
        <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />

        <!-- Custom styles for this template -->
        <link href="assets/css/style.css" rel="stylesheet">
        <link href="assets/css/style-responsive.css" rel="stylesheet">
    </head>
    <body>

        <!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->

        <div id="login-page">
            <div class="container">

                <form class="form-login" action="adminIndex" method="post">
                    <h2 class="form-login-heading" style="background:#ffd777"><i class="fa fa-user"></i> STAFF LOGIN</h2>
                    <div class="login-wrap">
                        <input type="text" class="form-control" name="id" placeholder="User ID" autofocus required>
                        <br>
                        <input type="password" class="form-control" name="password" placeholder="Password" required>
                        <label class="checkbox">
                            <span class="pull-right">
                                <a data-toggle="modal" href="loginAdmin.jsp#myModal"> Forgot Password?</a>

                            </span>
                        </label>
                        <button class="btn btn-theme btn-block" style="background:#ffd777; border-color: #f9b718;" type="submit"><i class="fa fa-lock"></i> SIGN IN</button>
                        
                        <h4 style="color: red;">${message}</h4>
                        <hr>

                        <div class="registration">
                            Any Problem in using this system?<br/>
                            <a class="" href="mailto:admin@lbh.com?Subject=Hello, Admin">
                                Contact ADMIN
                            </a>
                        </div>
                            <h4 style="color: red;">${messagePw}</h4>
                    </div>
                    </form>
                    <!-- Modal -->
                    <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal" class="modal fade">
                        
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header" style="background:#ffd777">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    <h4 class="modal-title">Forgot Password ?</h4>
                                </div>
                                <form action='admResetPw' method='get'>
                                <div class="modal-body">
                                    <p>Enter your e-mail address below to reset your password.</p>
                                    
                                    <input type="text" name="email" placeholder="Email" autocomplete="off" class="form-control placeholder-no-fix">
                                </div>
                                <div class="modal-footer">
                                    <button data-dismiss="modal" class="btn btn-default" type="button">Cancel</button>
                                    <input class="btn btn-warning" type="submit"/>
                                </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <!-- modal -->

                	  	

            </div>
        </div>

        <!-- js placed at the end of the document so the pages load faster -->
        <script src="assets/js/jquery.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>

        <!--BACKSTRETCH-->
        <!-- You can use an image of whatever size. This script will stretch to fit in any screen size.-->
        <script type="text/javascript" src="assets/js/jquery.backstretch.min.js"></script>
        <script>
            $.backstretch("assets/img/login.jpg", {speed: 500});
        </script>

    </body>
</html>
