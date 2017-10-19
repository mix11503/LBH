<%@page import="Model.parcel"%>
<%@page import="Model.newsUpdate"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>Parcel Box</title>

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
                if(request.getAttribute("rId").equals(roomId+"")){
            %>
     <jsp:include page="userBar.jsp"/>
      <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
                      <div class="row mt">
                          <div class="form-panel" style="border-radius: 10px; height: 75px;" >
                                <h3 align='center' class="mb"><i class="fa fa-envelope-o"></i> Parcel Inbox</h3>
                                </div>
                          <br>
                     <%
                         List<parcel> par = (List) request.getAttribute("parcel");
                         if(par!=null){
                             String status = null;
                             for(parcel p : par){
                                 if(p.getStatus()==false){
                                     status = "Avaliable";
                                 }else{
                                     status = "Picked";
                                 }
                     %>
                        <div class="col-md-3 col-sm-3 mb">
                          <div class="white-panel pn white-header">
                            <div class="white-header">
                                <h4 style="color: #269abc"><b><%=p.getDate()%></b></h4>
                            </div>
                            <div style="height: 155px;">
                                <div>
                                    <h5 align="left" style="color: #245269"><b>&nbsp;&nbsp;&nbsp;Room Id: <%=p.getRoomId()%></b></h5>
                                </div>
                                <div>
                                <h5 align="left" style="color: #245269"><b>&nbsp;&nbsp;&nbsp;Dear Khun: <%=p.getName()%></b></h5>
                                </div>
                                <div>
                                <h5 align="left" style="color: #245269"><b>&nbsp;&nbsp;&nbsp;Parcel Barcode: <%=p.getBarcode()%></b></h5>
                                </div>
                                <br>
                                <div>
                                <h6 align="center" style="color: #a94442"><b>Please contact at condo staff in office hours.</b></h6>
                                <h6 align="center" style="color: #a94442"><b>Your parcel will be kept for 30 days in responsibility.</b></h6>
                                </div>
                              <div class="white-panel pn white-header" style="height: 45px;">
                                  <h5 align="center"><b><%if(p.getStatus()==true){%>
                                          <div style="color:#FF0000"><%=status%>, <%=p.getPickStamp().substring(0,p.getPickStamp().length()-2)%></div><%}else{%>
                                          <div style="color:#26AE5C"><%=status%></div><%}%></b></h5>
                              </div>
                            </div>
                          </div><! --/grey-panel -->
                        </div><!-- /col-md-3-->
                        

                        <%}}%>
                
                          </div><! --/grey-panel -->
                        </div><!-- /col-md-3-->
                    
                            <!-- เนเธ–เธงเธฅเนเธฒเธ -->
         

          
                  </div><!-- row -->
                
      <!-- **********************************************************************************************************************************************************
      RIGHT SIDEBAR CONTENT
      *********************************************************************************************************************************************************** -->                  
                  
                  
          </section>
      </section>

      <!--main content end-->
      <!--footer start-->

      <!--footer end-->
  </section>
<%}}else{response.sendRedirect("login.jsp");}%>
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

