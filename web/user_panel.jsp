<%-- 
    Document   : testUserIndex
    Created on : Aug 25, 2017, 12:56:21 AM
    Author     : Joe's
--%>

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

    <title>Index User</title>

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

            <div class="row mt">
              <div class="col-lg-12">
                <div class="form-panel" style="border-radius: 10px;">
                      <h4 class="mb"><i class="fa fa-angle-right"></i> Search Keyword</h4>
                      <form action="getCurrentNewsByKw" method="get" class="form-inline" role="form">
                          <div class="form-group">
                              <label class="sr-only" for="exampleInputEmail2"></label>
                              <input type="text" class="form-control" id="exampleInputEmail2" placeholder="Search" name="keyword">
                          </div>
                          
                          <button type="submit" class="btn btn-theme">Search</button>
                      </form>
                </div><!-- /form-panel -->
              </div><!-- /col-lg-12 -->
            </div><!-- /row -->
<!--
          <div class="row mt">
              <div class="col-lg-12">
            
                  
                      <form class="form-inline" role="form">
                            <input type="text" class="form-control">
                              &nbsp;<button type="submit" class="btn btn-theme">Search</button>
                      </form>
                    
                 
              </div><!-- /col-lg-12 -->
     <!--       </div><!-- /row -->   

            <br>

                      <div class="row mt">
                     <%
                         List<newsUpdate> news = (List) request.getSession().getAttribute("newsUser");
                         if(news!=null){
                             int i = 1;
                             String headline = null;
                             String pic = "gen.jpg";
                             for(newsUpdate nu : news){
                                 if(nu.getNews_topic().length()>=40){
                                     headline = nu.getNews_topic().substring(0, 36)+"...";
                                 }else{
                                     headline = nu.getNews_topic();
                                 }
                                 if(nu.getCate().equals("amb")){pic = "amb.jpg";}
                                 else if(nu.getCate().equals("mtn")){pic = "mtn.jpg";}
                                 else if(nu.getCate().equals("ads")){pic = "ads.jpg";}
                                 else{pic = "gen.jpg";}
                     %>
                      
                        <div class="col-md-3 col-sm-3 mb" data-toggle="modal" data-target="#myModal<%=i%>">
                          <div class="white-panel pn white-header">
                            <div class="white-header">
                                <h5 style="color: #272b34;"><b><%=headline%></b></h5>
                            </div>
                            <div style="height: 155px;">
                              <img src="<%=pic%>" style="height: 100%; width: 100%; object-fit: contain;">
                              <!--xmp></xmp-->
                              <div class="white-panel pn white-header" style="height: 40px;">
                                  <h5 align="right" style="color: #FCB322"><b><%=nu.getStart_date()%></b></h5>
                              </div>
                            </div>
               
                
                          </div><! --/grey-panel -->
                        </div><!-- /col-md-3-->
                        
                        <!-- Modal -->
            <div class="modal fade" id="myModal<%=i%>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel"><%=nu.getNews_topic()%></h4>
                  </div>
                  <div class="modal-body">
                      <%=nu.getNews_desc()%>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                  </div>
                </div>
              </div>
            </div>   
                        <!-- เน€เธงเนเธเธเธ -->

                        <%i++;%>
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
  <%}else{response.sendRedirect("login.jsp");}%>
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

