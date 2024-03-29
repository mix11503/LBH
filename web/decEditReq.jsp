<%-- 
    Document   : userDecReq
    Created on : Sep 13, 2017, 12:11:15 AM
    Author     : Joe's
--%>
<%@page import="Model.Decoration"%>
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
 <script type="application/javascript">        
         $( function() {
    var from = $( "#inputStart" )
        .datepicker({
          defaultDate: "+1w",
          changeMonth: true,
          numberOfMonths: 2,
          dateFormat: "yy-mm-dd",
          minDate: 0
        })
        .on( "change", function() {
          to.datepicker( "option", "minDate", from.datepicker( "getDate" ));
        }),
      to = $( "#inputEnd" ).datepicker({
        defaultDate: "+1w",
        changeMonth: true,
        numberOfMonths: 2,
        dateFormat: "yy-mm-dd"
      })
      .on( "change", function() {
        from.datepicker( "option", "maxDate", to.datepicker( "getDate" ));
      });
 
    function getDate( element ) {
      var date;
      try {
        date = $.datepicker.parseDate( dateFormat, element.value );
      } catch( error ) {
        date = null;
      }
 
      return date;
    }
  } );

    $( function() {
    var currentDate = new Date();  
      //$("#inputStart").datepicker("setDate",currentDate);
    });
    </script>
    
    <title>Decoration Edit Request</title>
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
     <jsp:include page="userBar.jsp"/>
      <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
      <!--main content start-->
      <%
      Decoration d = (Decoration) request.getAttribute("dec");
      %>
      <section id="main-content">
          <section class="wrapper">   
          	<h2>Decoration Edit Request</h2>     
                      <div class="row mt">
          		<div class="col-lg-12">
          			<div class="form-panel">
                  	  <h4 class="mb"><i class="fa fa-angle-right"></i>Edit Your Request</h4>
                          <form class="form-horizontal tasi-form" action="decConfirmEdit" method="post">
                              <input type="text" name="roomId" value="<%=d.getRoomId()%>" hidden/>
                              <input type="text" name="id" value="<%=d.getId()%>" hidden/>
                              <div class="form-group has-success">
                                  <label class="col-sm-2 control-label col-lg-2" for="inputSuccess">Description</label>
                                  <div class="col-lg-10">
                                      <textarea class="form-control" style="width: 99%; height: 100px;" name="desc" maxlength="180" required><%=d.getDesc()%></textarea>
                                  </div>
                              </div>
                              <div class="form-group has-success">
                                  <label class="col-sm-2 control-label col-lg-2" for="inputSuccess">Start Date</label>
                                  <div class="col-lg-10">
                                  <input type="text" class="form-control" id="inputStart" name="start" value="<%=d.getStart()%>" required>
                                  </div>
                                  <label class="col-sm-2 control-label col-lg-2" for="inputSuccess">End Date</label>
                                  <div class="col-lg-10">
                                  <br><input type="text" class="form-control" id="inputEnd" name="end" value="<%=d.getEnd()%>" required>    
                                  </div>
                              </div>

                              <input type="submit" style="margin-left: 225px; width: 80px; height: 40px;" class="btn btn-success" value="EDIT"/>
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
<%--
        <form action="" method="get">
            <textarea name="desc" placeholder="Decoration Description here.." maxlength="180" rows="10" cols="50" required></textarea>
            <input type="date" name="start" required>
            <input type="date" name="end" required>
            <input type="submit" value="Request">
        </form>
--%>