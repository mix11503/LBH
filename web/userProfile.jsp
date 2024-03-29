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
    
    <title>My Profile</title>
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
              <h2>&nbsp;&nbsp;&nbsp;<i class="fa fa-user"></i> My Profile</h2>     
                      <div class="row mt">
          		<div class="col-lg-12">
          			<div class="form-panel">
                          <form class="form-horizontal tasi-form" action="resUpdateProf" method="post">
                              <input type="text" name="id" value="${Resident.id}" hidden/>                       
                              <div class="form-group">
                                <label class="col-sm-2 control-label col-lg-2" for="inputSuccess">Name</label>
                                <div class="col-lg-10">
                                    <input type="text" class="form-control" name="name" value="${Resident.name}" required><br>
                                </div>
                                <label class="col-sm-2 control-label col-lg-2" for="inputSuccess">Surname</label>
                                <div class="col-lg-10">
                                    <input type="text" class="form-control" name="surname" value="${Resident.lastname}" required><br>
                                </div>
                                <label class="col-sm-2 control-label col-lg-2" for="inputSuccess">Email</label>
                                <div class="col-lg-10">
                                    <input type="email" class="form-control" name="email" value="${Resident.email}" required><br>
                                </div>
                                <label class="col-sm-2 control-label col-lg-2" for="inputSuccess">Phone Number</label>
                                <div class="col-lg-10">
                                    <input type="number" class="form-control" name="number" value="${Resident.phone}" required><br>
                                </div>
                                <label class="col-sm-2 control-label col-lg-2" for="inputSuccess">Status</label>
                                <div class="col-lg-10">
                                    <input type="text" class="form-control" value="${Resident.isOwner?'Owner':'Renter'}" disabled><br> 
                                </div>
                                <label class="col-sm-2 control-label col-lg-2" for="inputSuccess">Room Number</label>
                                <div class="col-lg-10">
                                    <input type="text" class="form-control" value="${roomId}" disabled><br>
                                </div>
                                <label class="col-sm-2 control-label col-lg-2" for="inputSuccess">Living Period</label>
                                <div class="col-lg-10">
                                <input type="text" class="form-control" value="${Resident.rent_start}" style="width: 48%; float: left;" disabled>
                                <input type="text" class="form-control" value="${Resident.rent_end}" style="width: 48%; float: right;" disabled>
                                </div>
                                <br><label class="col-sm-2 control-label col-lg-2" for="inputSuccess">Enter Password</label>
                                <div class="col-lg-10">
                                    <br><input type="password" name="password" class="form-control" required><br>
                                </div>        
                            </div>

                              <input type="submit" style="margin-left: 225px; width: 80px; height: 40px;" class="btn btn-success" value="Update"/>
                          </form>
                          <h4 class="mb" style="color:blue">${message}</h4>
                          <h4 class="mb" style="color:red">${messageError}</h4>
          			</div><!-- /form-panel -->
          		</div><!-- /col-lg-12 -->
          	</div><!-- /row -->
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
    



  </body>
</html>
