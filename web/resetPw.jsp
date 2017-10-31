<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Password Setting</title>
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
                <%  if(request.getAttribute("id")!=null){
                    int id = (Integer) request.getAttribute("id");
                %>
                <form class="form-login" action="confirmUpdatePW" method="post">
                    <h2 class="form-login-heading">Reset Password</h2>
                    <div class="login-wrap">
                        <p>Enter new password for your account.</p>
                        <br>
                        <input type="password" class="form-control" name="password" placeholder="Password" autocomplete="off" autofocus required>
                        <br><br>
                        <input type="password" class="form-control" name="confirmPassword" placeholder="Confirm Password" autocomplete="off" required>
                        <br><br>
                        <button class="btn btn-theme btn-block" type="submit"><i class="fa fa-lock"></i> RESET PASSWORD</button>
                    </div>
                    <h4 style="color: red;">${cmessage}</h4>
                    <input type='text' value="<%=id%>" name="id" hidden/>
                </form>
                <%}%>
                    <h1 class="form-login" style="color: red; position:absolute;top:39%;left:39%">${cmessage}</h1>
                    <h1 class="form-login" style="color: red; position:absolute;top:39%;left:39%">${message}</h1>       
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
