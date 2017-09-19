<%-- 
    Document   : userDecHistory
    Created on : Sep 14, 2017, 10:18:09 PM
    Author     : Joe's
--%>

<%@page import="Model.Decoration"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>Decoration History</title>

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
      <section id="main-content">
          <section class="wrapper">   
          	
              <h2>Room No. 201</h2>
              <% List<Decoration> dec = (List) request.getAttribute("dec");
           if(dec!=null){%>
          			<div class="row">
              <div class="row mt">
                  <div class="col-md-12">
                      <div class="content-panel">
                          <table class="table table-striped table-advance table-hover">
                          
                            <hr>
                              <thead>
                              <tr>
                                  <th><i class="fa fa-list-ol"></i> Request ID</th>
                                  <th><i class="fa fa-tags"></i> Name</th>
                                  <th><i class="fa fa-tasks"></i> Status</th>
                                  <th><i class="fa fa-calendar"></i> Request Date</th>
                                  <th><i class="fa fa-comments"></i> Description</th>
                                  <th>Period Start</th>
                                  <th>End</th>
                                  <th><i class="fa fa-edit"></i> EDIT</th>
                                  <th><i class="fa fa-times"></i> DELETE</th>
                              </tr>
                              </thead>
                              <tbody>
                              <%for(Decoration d: dec){%>
                              <tr>
                                  
                                  <td><h5><%=d.getId()%></h5></td>
                                  <td><h5>{Username}</h5></td>
                                  <td><h5><%if(d.getStatus()==true){%><div style="color: green"><i class="fa fa-check"></i> APPROVED</div>
                                          <%}else{%><div style="color: #F1C500"><i class="fa fa-spinner"></i> IN PROCESS</div><%}%></h5></td>
                                  <td><h5></h5><%=d.getReqDate()%></td>
                                  <%--<%if(d.getDesc().length()>30){%><%=d.getDesc().substring(0, 30)%>...<%}else{%><%=d.getDesc()%><%}%>--%>
                                  <td width="300"><h5><%if(d.getDesc().length()>30){%><marquee><%=d.getDesc()%></marquee><%}else{%><%=d.getDesc()%><%}%></h5></td>
                                  <td><h5><%=d.getStart()%></h5></td>
                                  <td><h5><%=d.getEnd()%></h5></td>
                                  <td><form action="editRequest" method="get"><input type="text" value="<%=d.getId()%>" name="id" hidden>
                                          <input type="submit" value="EDIT" class="btn btn-warning" <%if(d.getStatus()==true){%>disabled<%}%>/>
                                      </form></td>
                                  <td><form action="deleteRequest" method="get" onclick="return confirm('DELETE REQUEST?')"><input type="text" value="<%=d.getId()%>" name="id" hidden>
                                      <input type="text" value="<%=d.getRoomId()%>" name="room" hidden><input type="submit" value="DELETE" class="btn btn-danger" <%if(d.getStatus()==true){%>disabled<%}%>/>
                                      </form></td>
                            <%}%>
                             <%}%>
                              </tbody>
                          </table>
                      </div><!-- /content-panel -->
                  </div><!-- /col-md-12 -->
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

    <!-- js placed at the end of the document so the pages load faster -->
    <script src="assets/js/jquery.js"></script>
    <script src="assets/js/jquery-1.8.3.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script class="include" type="text/javascript" src="assets/js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="assets/js/jquery.scrollTo.min.js"></script>
    <script src="assets/js/jquery.nicescroll.js" type="text/javascript"></script>
    <script src="assets/js/jquery.sparkline.js"></script>


    <!--common script for all pages-->
    <script src="assets/js/common-scripts.js"></script>
    
    <script type="text/javascript" src="assets/js/gritter/js/jquery.gritter.js"></script>
    <script type="text/javascript" src="assets/js/gritter-conf.js"></script>

    <!--script for this page-->
    <script src="assets/js/sparkline-chart.js"></script>    
	<script src="assets/js/zabuto_calendar.js"></script>	
	
	
	
	<script type="application/javascript">
        $(document).ready(function () {
            $("#date-popover").popover({html: true, trigger: "manual"});
            $("#date-popover").hide();
            $("#date-popover").click(function (e) {
                $(this).hide();
            });
        
            $("#my-calendar").zabuto_calendar({
                action: function () {
                    return myDateFunction(this.id, false);
                },
                action_nav: function () {
                    return myNavFunction(this.id);
                },
                ajax: {
                    url: "show_data.php?action=1",
                    modal: true
                },
                legend: [
                    {type: "text", label: "Special event", badge: "00"},
                    {type: "block", label: "Regular event", }
                ]
            });
        });
        
        
        function myNavFunction(id) {
            $("#date-popover").hide();
            var nav = $("#" + id).data("navigation");
            var to = $("#" + id).data("to");
            console.log('nav ' + nav + ' to: ' + to.month + '/' + to.year);
        }
    </script>
  

  </body>
</html>
