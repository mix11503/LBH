<%-- 
    Document   : SearchByStuff
    Created on : May 7, 2017, 6:27:33 PM
    Author     : Mix
--%>

<%@page import="Model.MtnChat"%>
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

        <title>Maintainance Admin Tracking</title>
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
            <%        if(request.getSession().getAttribute("adminAuthen")!=null){
                Boolean status = (Boolean) request.getSession().getAttribute("adminAuthen");
                if(status==true){
            %>
            <jsp:include page="adminBar.jsp"/>
            <!-- **********************************************************************************************************************************************************
            MAIN CONTENT
            *********************************************************************************************************************************************************** -->
            <!--main content start-->
            <section id="main-content">
                <section class="wrapper">   
                    <h2>Search by Broken stuff</h2>       
                    <form action="MTNSearchStuff" method="get">
                        <div class="form-group has-success">
                            <label class="col-sm-2 control-label col-lg-2" for="inputSuccess">Service Area</label>
                            <div class="col-lg-10">
                                <select class="form-control" id="a" name="area" required>
                                    <option selected="true" disabled>Select your Service Area</option>
                                    <option value="Bedroom">Bedroom</option>
                                    <option value="Pantry">Pantry</option>
                                    <option value="Livingroom">Livingroom</option>
                                    <option value="Toilet">Toilet</option>
                                    <option value="Balcony">Balcony</option>
                                    <option value="Others">Others</option>
                                </select>
                            </div>

                        </div>
                        <div class="form-group has-success">
                            <label class="col-sm-2 control-label col-lg-2" for="inputSuccess">Broken Stuff</label>

                            <div class="col-lg-10">
                                <select class="form-control" id="b" name="stuff" required>

                                </select>
                            </div>
                        </div>
                        <div class="form-group has-success">
                            <input type="submit" name="submit">
                        </div>
                    </form>
                    <% if (request.getAttribute("message") != null) {%>
                    <h3><%=request.getAttribute("message")%></h3>
                    <%}%>
                    <hr>

                    <div class="row mt">
                        <div class="col-md-12">
                            <div class="content-panel">
                                <% List<Maintanance> mtn = (List) request.getAttribute("record");
                                    if (mtn != null) {%>
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
                                        <%for (Maintanance m : mtn) {%>        
                                        <tr align=center>
                                            <td><a href ="SearchMtnReq?id=<%=m.getMtn_id()%>"><%=m.getMtn_id()%></a></td>                     
                                            <td><b><%= m.getMtn_status()%></b></td>
                                            <td><%= m.getMtn_date()%></td>

                                            <td><%= m.getMtn_ServiceArea()%></td>
                                            <td><%= m.getMtn_area_stuff()%></td>
                                            <td><%= m.getMtn_desc()%></td>

                                            <td><%= m.getMtn_result()%></td>
                                            <td><%= m.getMtn_material()%></td>
                                            <td><%= m.getMtn_cost()%></td>

                                            <td><%= m.getMtn_result_eva()%></td>
                                            <td><%= m.getMtn_eva_remark()%></td>

                                            <td><%= m.getMtn_room_id()%></td>
                                        </tr>    
                                        <%}%>
                                    </tbody>
                                </table>
                                <%}%>
                            </div><!-- /content-panel -->
                        </div><!-- /col-md-12 -->

                        <!-- **********************************************************************************************************************************************************
                  RIGHT SIDEBAR CONTENT
                  *********************************************************************************************************************************************************** -->                  


                </section>
            </section>

            <!--main content end-->
            <!--footer start-->

            <!--footer end-->
        </section>
        <%}}else{response.sendRedirect("loginAdmin.jsp");}%>
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
            
            $(document).ready(function(){
                $("#a").change(function(){
                    switch ($('#a').val()) {
                            case "Bedroom":
                                $('#b').html("<option value='Light'>Light</option> <option value='Ceiling'>Ceiling</option>"+
                                        " <option value='Wall'>Wall</option> <option value='Floor'>Floor</option> <option value='Door'>Door</option>"+
                                        "<option value='Air Conditioner'>Air Conditioner</option> <option value='Socket'>Socket</option> <option value='Window'>Window</option>"+
                                        "<option value='Others'>Others</option>");
                                break;
                            case "Pantry":
                                $('#b').html("<option value='Light'>Light</option> <optionvalue='Ceiling'>Ceiling</option>"+
                                        " <option value='Wall'>Wall</option> <option value='Floor'>Floor</option> <option value='Sink'>Sink</option>"+
                                        "<option value='Tap'>Tap</option> <option value='Socket'>Socket</option> <option value='Window'>Window</option>"+
                                        "<option value='Others'>Others</option>");
                                break;
                            case "Livingroom":
                                $('#b').html("<option value='Light'>Light</option> <option value='Ceiling'>Ceiling</option>"+
                                        " <option value='Wall'>Wall</option> <option value='Floor'>Floor</option> "+
                                        "<option value='Socket'>Socket</option> <option value='Window'>Window</option>"+
                                        "<option value='Others'>Others</option>");
                                break;
                            case "Toilet":
                                $('#b').html("<option value='Light'>Light</option> <option value='Ceiling'>Ceiling</option>"+
                                        " <option value='Wall'>Wall</option> <option value='Floor'>Floor</option> <option value='Door'>Door</option>"+
                                        "<option value='Sink/Bidet'>Sink/Bidet</option> <option value='Shower/Tap'>Shower/Tap</option> "+
                                        "<option value='Others'>Others</option>");
                                break;
                            case "Balcony":
                                $('#b').html("<option value='Light'>Light</option> <option value='Ceiling'>Ceiling</option>"+
                                        " <option value='Wall'>Wall</option> <option value='Floor'>Floor</option> <option value='Door'>Door</option>"+
                                        "<option value='Tap'>Tap</option> <option value='Socket'>Socket</option>"+
                                        "<option value='Others'>Others</option>");
                                break;
                            case  "Others":
                                $('#b').html("<option value='Light'>Light</option> <option value='Ceiling'>Ceiling</option>"+
                                        " <option value='Wall'>Wall</option> <option value='Floor'>Floor</option> <option value='Door'>Door</option>"+
                                        "<option value='Air Conditioner'>Air Conditioner</option> <option value='Socket'>Socket</option> <option value='Window'>Window</option>"+
                                        "<option value='Others'>Others</option>");
                                break;
                    }
                });
            });
        </script>


    </body>
</html>
