<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Dashboard">
        <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

        <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script src="assets/js/jquery.js"></script>

        <title>Moving Request</title>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!-- Bootstrap core CSS -->
        <link href="assets/css/bootstrap.css" rel="stylesheet">
        <!--external css-->
        <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
        <link rel="stylesheet" type="text/css" href="assets/css/zabuto_calendar.css">
        <link rel="stylesheet" type="text/css" href="assets/js/gritter/css/jquery.gritter.css" />
        <link rel="stylesheet" type="text/css" href="assets/lineicons/style.css">    

        <!-- Custom styles for this template -->
        <link href="assets/css/style.css" rel="stylesheet">
        <link href="assets/css/style-responsive.css" rel="stylesheet">

        <script src="assets/js/chart-master/Chart.js"></script>

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>

    <body>

        <section id="container" >
            <%
                if(request.getSession().getAttribute("roomId")!=null){
                int roomId = (Integer) request.getSession().getAttribute("roomId");
            %>
            <jsp:include page="userBar.jsp"/>
            <!-- **********************************************************************************************************************************************************
            MAIN CONTENT
            *********************************************************************************************************************************************************** -->
            <!--main content start-->
            <section id="main-content">
                <section class="wrapper">   
                    <h2>Stuff moving Request Form</h2>     
                    <div class="row mt">
                        <div class="col-lg-12">
                            <div class="form-panel">
                                <h4 class="mb"><i class="fa fa-angle-right"></i>Complete the form to request the service</h4>
                                <form action="createMoveReq" method="post">
                                    <input type="text" name="roomId" value="<%=roomId%>" hidden/>  
                                    <input type="text" name="usName" value="${Resident.name}" hidden/>
                                <div class="form-group has-success">
                                  <label class="col-sm-2 control-label col-lg-2" for="inputSuccess">Type of Move</label>
                                  <div class="col-lg-10">
                                      <select class="form-control" name="type" required>
                                                  <option value="true">Move In</option>
                                                  <option value="false">Move Out</option>
						</select>
                                  </div><br><br>
                              </div>    
                                <div class="form-group has-success">
                                  <label class="col-sm-2 control-label col-lg-2" for="inputSuccess">Date of Move</label>
                                  <div class="col-lg-10">
                                  <input type="date" class="form-control" name="date" required>
                                  </div><br><br><br>
                                  <label class="col-sm-2 control-label col-lg-2" for="inputSuccess">Time</label>
                                  <div class="col-lg-10">
                                  <input type="time" class="form-control" name="time" required>
                                  </div><br><br>
                              </div>
                                <div class="form-group has-success">
                                  <label class="col-sm-2 control-label col-lg-2" for="inputSuccess">Reason of moving stuffs</label>
                                  <div class="col-lg-10">
                                      <textarea class="form-control" style="width: 100%; height: 100px;" name="desc" placeholder="Why do you want to move these stuffs?.." maxlength="180" required></textarea><br>
                                  </div>
                              </div>    
                                <div class="form-inline">
                                    <br><br>
                                    <label class="col-sm-2 control-label col-lg-2" for="inputSuccess">List your stuffs</label>
                                    <div class="field_wrapper">
                                    <div>
                                        <input type="text" name="stuff" value="" placeholder="Stuff" required/> &nbsp;&nbsp;
                                        <input type="number" name="stuffAmt" value="" placeholder="Amount" required/> &nbsp;&nbsp;
                                        <a href="javascript:void(0);" class="add_button" title="Add field">
                                            <button type="button" class="btn btn-info"> + </button><br>
                                        </a>
                                    </div>
                                </div>
                                    </div>
                                    <br><input type="submit" style="margin-left: 500px; width: 150px; height: 40px;" class="btn btn-success" value="Create Request"/>
        </form>
                            </div><!-- /form-panel -->
                        </div><!-- /col-lg-12 -->
                    </div><!-- /row -->
                    <h3><span style="color:#FF0000">${message}</h3>
                    <!-- **********************************************************************************************************************************************************
                    RIGHT SIDEBAR CONTENT
                    *********************************************************************************************************************************************************** -->                  


                </section>
            </section>

            <!--main content end-->
            <!--footer start-->

            <!--footer end-->
        </section>
                    <%}else{response.sendRedirect("login.jsp");}%>
        <!-- js placed at the end of the document so the pages load faster -->
        <script src="assets/js/jquery.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery-ui-1.9.2.custom.min.js"></script>
        <script src="assets/js/jquery.ui.touch-punch.min.js"></script>
        <script class="include" type="text/javascript" src="assets/js/jquery.dcjqaccordion.2.7.js"></script>
        <script src="assets/js/jquery.scrollTo.min.js"></script>
        <script src="assets/js/jquery.nicescroll.js" type="text/javascript"></script>


        <!--common script for all pages-->
        <script src="assets/js/common-scripts.js"></script>

        <!--script for this page-->
        <script type="text/javascript">
            $(document).ready(function () {
                var maxField = 10; //Input fields increment limitation
                var addButton = $('.add_button'); //Add button selector
                var wrapper = $('.field_wrapper'); //Input field wrapper
                var x = 1; //Initial field counter is 1
                var removeBut = '&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-warning"> - </button>';
                //var fieldHTML = '<div><input type="text" name="field_name['+x+']" value=""/><a href="javascript:void(0);" class="remove_button" title="Remove field"><img src="remove-icon.png"/></a></div>'; //New input field html 
                var prestyle = '<br><label class="col-sm-2 control-label col-lg-2" for="inputSuccess">>></label>';
            $(addButton).click(function () { //Once add button is clicked
                    if (x < maxField) { //Check maximum number of input fields 
                        $(wrapper).append('<div>'+prestyle+'<input type="text" name="stuff'+x+'" placeholder="Stuff" required/>&nbsp;&nbsp;&nbsp;&nbsp;<input type="number" name="stuffAmt'+x+'" value="" placeholder="Amount" required/>&nbsp;<a href="javascript:void(0);" class="remove_button" title="Remove field">'+removeBut+'</a></div>'); // Add field html
                    x++; //Increment field counter
        }
                });
                $(wrapper).on('click', '.remove_button', function (e) { //Once remove button is clicked
                    e.preventDefault();
                    $(this).parent('div').remove(); //Remove field html
                    x--; //Decrement field counter
                });
            });
        </script>
    </body>
</html>
<%--
        <form action="" method="get">
            <textarea name="desc" placeholder="Decoration Description here.." maxlength="180" rows="10" cols="50" required></textarea>
            <input type="date" name="start" required>
            <input type="date" name="end" required>
            <input type="submit" value="Request">
        </form>
--%>