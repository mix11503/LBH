<%-- 
    Document   : mtnOverview
    Created on : Mar 15, 2017, 11:41:30 PM
    Author     : Joe's
--%>

<%@page import="java.util.List"%>
<%@page import="Model.Maintanance"%>
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

    <title>Maintenance History</title>

    <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
        
    <!-- Custom styles for this template -->
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/style-responsive.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

  <section id="container" >
      <%        if(request.getSession().getAttribute("adminAuthen")!=null){
                Boolean status = (Boolean) request.getSession().getAttribute("adminAuthen");
                if(status==true){
            %>
      <jsp:include page="adminBar.jsp"/>
      <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
      <!--main content start-->
      ...............
      <section id="main-content">
          <section class="wrapper site-min-height">
          
          <h3>Maintenance History</h3>
            <div class="row mt" style="height :100px;">
              <div class="col-lg-12">
                
                      <h4 class="mb"><i class="fa fa-angle-right"></i>View All Request by Status</h4>
                      <form class="form-inline" role="form" action="searchByStatus" method="get">
                          <div class="form-group">
                              <select class="form-control" style="width: 300px;" name="status">
                                      <option>All</option>
                                      <option>New</option>
                                      <option>Queue</option>
                                      <option>Done</option>
                                      
                              </select>
                          </div>
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="submit" class="btn btn-theme" value="search">Search</button>
                     <br>
                      </form>
                
              </div><!-- /col-lg-12 -->
            </div><!-- /row -->

            <br>

            <div class="row mt">
                  <div class="col-md-12">
                      <div class="content-panel">
                          <% List<Maintanance> mtn = (List) request.getAttribute("record");
           if(mtn!=null){%>
                          <table class="table table-striped table-advance table-hover">
                            <hr>
                              <thead>
                                  <tr>
                            <td align=center colspan="3"><i class="fa fa-list-alt"></i><b> Request Details</b></td>
                            <td align=center colspan="3"><i class="fa fa-chain-broken"></i><b> Broken Stuff</b></td>
                            <td align=center colspan="3"><i class="fa fa-wrench"></i><b> Action Taken</b></td>
                            <td align=center colspan="2"><i class="fa fa-check"></i><b> Evaluation Details</b></td>
                            <td align=center rowspan="2"><i class="fa fa-home"></i><b> Room ID</b></td>
                            </tr>
                        <tr>
                            <td align=center ><i class="fa fa-sticky-note-o"></i><b> Work ID</b></td>
                            <td align=center ><i class="fa fa-spinner"></i><b> Status</b></td>
                            <td align=center ><i class="fa fa-calendar-o"></i><b> Date</b></td>
                            
                            <td align=center ><i class="fa fa fa-bed"></i><b> Service Area</b></td>
                            <td align=center ><i class="fa fa-bath"></i><b> Service Stuff</b></td>
                            <td align=center ><i class="fa fa-sort-desc"></i><b> Description</b></td>
                            
                            <td align=center ><i class="fa fa-wrench"></i><b> Result</b></td>
                            <td align=center ><i class="fa fa-briefcase"></i><b> Material Used</b></td>
                            <td align=center ><i class="fa fa-usd"></i><b> Cost</b></td>
                            
                            <td align=center ><i class="fa fa fa-check"></i><b> Evaluated</b></td>
                            <td align=center ><i class="fa fa-commenting"></i><b> Remark</b></td>
                        </tr> 
                              </thead>
                              <tbody>
                              <%for(Maintanance m: mtn){ %>        
                        <tr align=center>
                            <td><a href ="SearchMtnReq?id=<%=m.getMtn_id()%>"><%=m.getMtn_id()%></a></td>                     
                            <td><b><%= m.getMtn_status() %></b></td>
                            <td><%= m.getMtn_date() %></td>
                            
                            <td><%= m.getMtn_ServiceArea() %></td>
                            <td><%= m.getMtn_area_stuff() %></td>
                            <td><%= m.getMtn_desc() %></td>

                            <td><%= m.getMtn_result() %></td>
                            <td><%= m.getMtn_material() %></td>
                            <td><%= m.getMtn_cost() %></td>
                            
                            <td><%= m.getMtn_result_eva() %></td>
                            <td><%= m.getMtn_eva_remark() %></td>
                            
                            <td><%= m.getMtn_room_id() %></td>
                        </tr>    
                <%}%>
                              </tbody>
                          </table>
                           <%}%>
                      </div><!-- /content-panel -->
                  </div><!-- /col-md-12 -->
                  
                  <div class="col-md-12">
                      <div class="content-panel">
                          <% List<Maintanance> mtn2 = (List) request.getAttribute("record2");
           if(mtn2!=null){%>
                          <table class="table table-striped table-advance table-hover">
                            <hr>
                              <thead>
                                  <tr>
                            <td align=center colspan="3"><i class="fa fa-list-alt"></i><b>Request Details</b></td>
                            <td align=center colspan="3"><i class="fa fa-chain-broken"></i><b>Broken Stuff</b></td>
                            <td align=center colspan="3"><i class="fa fa-wrench"></i><b>Action Taken</b></td>
                            <td align=center colspan="2"><i class="fa fa-check"></i><b>Evaluation Details</b></td>
                            <td align=center rowspan="2"><i class="fa fa-home"></i><b>Room ID</b></td>
                            </tr>
                        <tr>
                            <td align=center ><b>Work ID</b></td>
                            <td align=center ><b>Status</b></td>
                            <td align=center ><b>Date</b></td>
                            
                            <td align=center ><b>Service Area</b></td>
                            <td align=center ><b>Service Stuff</b></td>
                            <td align=center ><b>Description</b></td>
                            
                            <td align=center ><b>Result</b></td>
                            <td align=center ><b>Material Used</b></td>
                            <td align=center ><b>Cost</b></td>
                            
                            <td align=center ><b>Evaluated</b></td>
                            <td align=center ><b>Remark</b></td>
                        </tr> 
                              </thead>
                              <tbody>
                              <%for(Maintanance m: mtn2){ %>        
                        <tr>
                            <td><a href ="SearchMtnReq?id=<%=m.getMtn_id()%>"><%=m.getMtn_id()%></a></td>                     
                            <td><b><%= m.getMtn_status() %></b></td>
                            <td><%= m.getMtn_date() %></td>
                            
                            <td><%= m.getMtn_ServiceArea() %></td>
                            <td><%= m.getMtn_area_stuff() %></td>
                            <td><%= m.getMtn_desc() %></td>

                            <td><%= m.getMtn_result() %></td>
                            <td><%= m.getMtn_material() %></td>
                            <td><%= m.getMtn_cost() %></td>
                            
                            <td><%= m.getMtn_result_eva() %></td>
                            <td><%= m.getMtn_eva_remark() %></td>
                            
                            <td><%= m.getMtn_room_id() %></td>
                        </tr>    
                <%}%>
                              </tbody>
                          </table>
                           <%}%>
                      </div><!-- /content-panel -->
                  </div><!-- /col-md-12 -->
			<div class="col-md-12">
                      <div class="content-panel">
                          <% List<Maintanance> mtn3 = (List) request.getAttribute("record3");
           if(mtn3!=null){%>
                          <table class="table table-striped table-advance table-hover">
                            <hr>
                              <thead>
                                  <tr>
                            <td align=center colspan="3"><i class="fa fa-list-alt"></i><b>Request Details</b></td>
                            <td align=center colspan="3"><i class="fa fa-chain-broken"></i><b>Broken Stuff</b></td>
                            <td align=center colspan="3"><i class="fa fa-wrench"></i><b>Action Taken</b></td>
                            <td align=center colspan="2"><i class="fa fa-check"></i><b>Evaluation Details</b></td>
                            <td align=center rowspan="2"><i class="fa fa-home"></i><b>Room ID</b></td>
                            </tr>
                        <tr>
                            <td align=center ><b>Work ID</b></td>
                            <td align=center ><b>Status</b></td>
                            <td align=center ><b>Date</b></td>
                            
                            <td align=center ><b>Service Area</b></td>
                            <td align=center ><b>Service Stuff</b></td>
                            <td align=center ><b>Description</b></td>
                            
                            <td align=center ><b>Result</b></td>
                            <td align=center ><b>Material Used</b></td>
                            <td align=center ><b>Cost</b></td>
                            
                            <td align=center ><b>Evaluated</b></td>
                            <td align=center ><b>Remark</b></td>
                        </tr> 
                              </thead>
                              <tbody>
                              <%for(Maintanance m: mtn3){ %>        
                        <tr>
                            <td><a href ="SearchMtnReq?id=<%=m.getMtn_id()%>"><%=m.getMtn_id()%></a></td>                     
                            <td><b><%= m.getMtn_status() %></b></td>
                            <td><%= m.getMtn_date() %></td>
                            
                            <td><%= m.getMtn_ServiceArea() %></td>
                            <td><%= m.getMtn_area_stuff() %></td>
                            <td><%= m.getMtn_desc() %></td>

                            <td><%= m.getMtn_result() %></td>
                            <td><%= m.getMtn_material() %></td>
                            <td><%= m.getMtn_cost() %></td>
                            
                            <td><%= m.getMtn_result_eva() %></td>
                            <td><%= m.getMtn_eva_remark() %></td>
                            
                            <td><%= m.getMtn_room_id() %></td>
                        </tr>    
                <%}%>
                              </tbody>
                          </table>
                           <%}%>
                      </div><!-- /content-panel -->
                  </div><!-- /col-md-12 -->
                  
		</section><! --/wrapper -->
      </section><!-- /MAIN CONTENT -->
      <!--main content end-->
      <!--footer start-->
      <footer class="site-footer">
          <div class="text-center">
              2014 - Alvarez.is
              <a href="blank.html#" class="go-top">
                  <i class="fa fa-angle-up"></i>
              </a>
          </div>
      </footer>
      <!--footer end-->
  </section>
       <%}}else{response.sendRedirect("loginAdmin.jsp");}%>
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
    
  <script>
      //custom select box

      $(function(){
          $('select.styled').customSelect();
      });

  </script>

  </body>
</html>

<%-- THEME --%>
<%--
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="searchByStatus" method="get">
             <h3>Search Maintenance by Status</h3>
             <select name="status">
                 <option value="all">All</option>
                 <option value="New">New</option>
                 <option value="Queue">Queue</option>
                 <option value="Done">Done</option>
            <input type="submit" value="search">
            </form>
        <hr> <center>
        <br><br>
         <% List<Maintanance> mtn = (List) request.getAttribute("record");
           if(mtn!=null){%>
           <table border="1">
                        <jsp:include page="OverviewHead.jsp"/>
                <%for(Maintanance m: mtn){ %>        
                        <tr>
                            <td><a href ="SearchMtnReq?id=<%=m.getMtn_id()%>"><%=m.getMtn_id()%></a></td>                     
                            <td><b><%= m.getMtn_status() %></b></td>
                            <td><%= m.getMtn_date() %></td>
                            
                            <td><%= m.getMtn_ServiceArea() %></td>
                            <td><%= m.getMtn_area_stuff() %></td>
                            <td><%= m.getMtn_desc() %></td>

                            <td><%= m.getMtn_result() %></td>
                            <td><%= m.getMtn_material() %></td>
                            <td><%= m.getMtn_cost() %></td>
                            
                            <td><%= m.getMtn_result_eva() %></td>
                            <td><%= m.getMtn_eva_remark() %></td>
                            
                            <td><%= m.getMtn_room_id() %></td>
                        </tr>    
                <%}%>
                </table>
                
                <%}%>
                <% List<Maintanance> mtn2 = (List) request.getAttribute("record2");
           if(mtn2!=null){%>
           <br><hr><br>
           <table border="1">
                        <jsp:include page="OverviewHead.jsp"/>
                <%for(Maintanance m: mtn2){ %>        
                        <tr>
                            <td><a href ="SearchMtnReq?id=<%=m.getMtn_id()%>"><%=m.getMtn_id()%></a></td>                     
                            <td><b><%= m.getMtn_status() %></b></td>
                            <td><%= m.getMtn_date() %></td>
                            
                            <td><%= m.getMtn_ServiceArea() %></td>
                            <td><%= m.getMtn_area_stuff() %></td>
                            <td><%= m.getMtn_desc() %></td>

                            <td><%= m.getMtn_result() %></td>
                            <td><%= m.getMtn_material() %></td>
                            <td><%= m.getMtn_cost() %></td>
                            
                            <td><%= m.getMtn_result_eva() %></td>
                            <td><%= m.getMtn_eva_remark() %></td>
                            
                            <td><%= m.getMtn_room_id() %></td>
                        </tr>    
                <%}%>
                </table>
                <%}%>
                <% List<Maintanance> mtn3 = (List) request.getAttribute("record3");
           if(mtn3!=null){%>
           <br><hr><br>
           <table border="1">
                        <jsp:include page="OverviewHead.jsp"/>
                <%for(Maintanance m: mtn3){ %>        
                        <tr>
                            <td><a href ="SearchMtnReq?id=<%=m.getMtn_id()%>"><%=m.getMtn_id()%></a></td>                     
                            <td><b><%= m.getMtn_status() %></b></td>
                            <td><%= m.getMtn_date() %></td>
                            
                            <td><%= m.getMtn_ServiceArea() %></td>
                            <td><%= m.getMtn_area_stuff() %></td>
                            <td><%= m.getMtn_desc() %></td>

                            <td><%= m.getMtn_result() %></td>
                            <td><%= m.getMtn_material() %></td>
                            <td><%= m.getMtn_cost() %></td>
                            
                            <td><%= m.getMtn_result_eva() %></td>
                            <td><%= m.getMtn_eva_remark() %></td>

                             <td><%= m.getMtn_room_id() %></td>
                        </tr>    
                <%}%>
                </table>
                <%}%>
                </center>
    </body>
</html>
--%>

