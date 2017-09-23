<%-- 
    Document   : mtnMgn
    Created on : Mar 12, 2017, 6:17:49 PM
    Author     : Joe's
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
            <jsp:include page="adminBar.jsp"/>
            <!-- **********************************************************************************************************************************************************
            MAIN CONTENT
            *********************************************************************************************************************************************************** -->
            <!--main content start-->
            <section id="main-content">
                <section class="wrapper">   
                    <h2>Individual Request Management</h2>       
                    <form action="SearchMtnReq" method="get">
                        <h3 align="right">Search by Request ID </h3><div align="right"><input type="text" name="id"> <input type="submit" value="search"></div>
                    </form>
                    <% if (request.getAttribute("message") != null) {%>
                    <h3><%=request.getAttribute("message")%><h3>
                            <%}%>
                            <%
                                Maintanance m = (Maintanance) request.getAttribute("mtn");
                                if (m != null) {
                            %>

                            <div class="row mt">

                                <div class="col-lg-12">

                                    <br>
                                    <div class="form-panel" style="border-radius: 10px; padding-left: 20px;">
                                        <div class="form-horizontal tasi-form">
                                            <br>
                                            <h4 style="color: black;">Request Detail</h4>
                                            <br>
                                            <div class="form-group has-success ">
                                                <label class="col-sm-2 control-label col-lg-2" for="inputSuccess">Form ID</label>
                                                <div class="col-lg-10">
                                                    <input type="text" style="width: 50%;" class="form-control" id="inputSuccess" disabled placeholder="<%= m.getMtn_id()%>">
                                                </div>
                                            </div>

                                            <div class="form-group has-success">
                                                <label class="col-sm-2 control-label col-lg-2" for="inputSuccess">Date</label>
                                                <div class="col-lg-10">
                                                    <input type="text" style="width: 50%;" class="form-control" id="inputSuccess" disabled placeholder="<%= m.getMtn_date()%>">
                                                </div>
                                            </div>

                                            <form  method="get" action="updateStatus">
                                                <div class="form-group has-success">
                                                    <label class="col-sm-2 control-label col-lg-2" for="inputSuccess">Status</label>
                                                    <table border="0"><tr>  
                                                            <td> <div class="col-lg-10">
                                                                    <select class="form-control" id="a" style="width: 100%;" name="status">
                                                                        <option selected="true" disabled="disabled">Select Status</option>
                                                                        <option value="New"<%if (m.getMtn_status().equalsIgnoreCase("new")) {%>selected="selected"<%}%>>New</option>
                                                                        <option value="Queue"<%if (m.getMtn_status().equalsIgnoreCase("queue")) {%>selected="selected"<%}%>>Queue</option>
                                                                        <option value="Done"<%if (m.getMtn_status().equalsIgnoreCase("done")) {%>selected="selected"<%}%>>Done</option>  
                                                                    </select> 

                                                                </div></td>
                                                            <td><input type="submit" value="Update Status"/></td>
                                                        </tr></table>       
                                                </div>

                                                <input type="text" name="id" value="<%= m.getMtn_id()%>" hidden/>
                                            </form>
                                            <h4 style="color: black;">Service Information</h4>
                                            <div class="form-group has-success">
                                                <label class="col-sm-2 control-label col-lg-2" for="inputSuccess">Service Area</label>
                                                <div class="col-lg-10">
                                                    <input type="text" style="width: 50%;" class="form-control" id="inputSuccess" placeholder="<%= m.getMtn_ServiceArea()%>">
                                                </div>
                                            </div>
                                            <%--</div>--%>
                                            <div class="form-group has-success">
                                                <label class="col-sm-2 control-label col-lg-2" for="inputSuccess">Broken Stuff</label>
                                                <div class="col-lg-10">
                                                    <input type="text" style="width: 50%;" class="form-control" id="inputSuccess" placeholder="<%= m.getMtn_area_stuff()%>">
                                                </div>
                                            </div>

                                            <div class="form-group has-success">
                                                <label class="col-sm-2 control-label col-lg-2" for="inputSuccess">Description</label>
                                                <div class="col-lg-10">
                                                    <TEXTAREA style="width: 50%; height: 50%;" class="form-control" id="inputSuccess"  placeholder="<%= m.getMtn_desc()%>" ></TEXTAREA>
                                  </div>
                              </div>                                 
                                <div class="row mt">  <!-- div แถว -->
                                                <%for (String path : m.getMtn_pic()) {%>
					<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 desc">
                                            <div class="project-wrapper">
                                                <div class="project">
                                                    <div class="photo-wrapper">
                                                        <div class="photo">
                                                            <a class="fancybox" href="<%= path%>"><img class="img-responsive" src="<%= path%>" alt=""></a>
                                                        </div>
                                                        <div class="overlay"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div><!-- col-lg-4 -->
                                                <%}%>
				</div><!-- /row -->
                            
                            <hr>
                            <h4 style="color: black;">Action Taken</h4>
                            <form  method="get" action="updateAction">
                              <div class="form-group has-success">
                              <label class="col-sm-2 control-label col-lg-2" for="inputSuccess">Result</label>
                              <div class="col-lg-10">
                                  <input type="text" style="width: 50%;" class="form-control" id="inputSuccess"  placeholder="<%= m.getMtn_result()%>" name="result">
                                  </div>
                              </div>

                              <div class="form-group has-success">
                              <label class="col-sm-2 control-label col-lg-2" for="inputSuccess">Cost</label>
                              <div class="col-lg-10">
                                      <input type="text" style="width: 50%;" class="form-control" id="inputSuccess"  placeholder="<%= m.getMtn_cost()%>" name="cost">
                                  </div>
                              </div>

                              <div class="form-group has-success">
                              <label class="col-sm-2 control-label col-lg-2" for="inputSuccess">Materials</label>
                              <div class="col-lg-10">
                                      <input type="text" style="width: 50%;" class="form-control" id="inputSuccess"  placeholder="<%= m.getMtn_material()%>" name="material">
                                  </div>
                              </div>
                                  <input type="submit" value="Update Result"/>
                                  <input type="text" name="id" value="<%= m.getMtn_id()%>" hidden/>
                                      </form>
                                      <h4 style="color:#FF0000">${messageAction}</h4>
                                  <hr>
                              <br>
                              <h4 style="color: black;">Evaluation</h4>
                                 <div class="form-group has-success">
                              <label class="col-sm-2 control-label col-lg-2" for="inputSuccess">Evaluation Result</label>
                              <div class="col-lg-10">
                                      <input type="text" style="width: 50%;" class="form-control" id="inputSuccess" disabled  placeholder="<%= m.getMtn_result_eva()%>">
                                  </div>
                              </div>


                              <div class="form-group has-success">
                              <label class="col-sm-2 control-label col-lg-2" for="inputSuccess">Remark</label>
                              <div class="col-lg-10">
                                      <input type="text" style="width: 50%;" class="form-control" id="inputSuccess" disabled  placeholder="<%= m.getMtn_eva_remark()%>">
                                  </div>
                              </div>

                </div>
                              <br>
                                        <%}%>
                              <hr>

                              <br>
                              
                                        <%
                                            List<MtnChat> mtn = (List) request.getAttribute("mtnChat");
                                            if (mtn != null) {
                                        %>
                <h4 style="color: black;">Status Message</h4><br>
                              <div class="row"> 
                              <div class="col-sm-6">
                               <table class="table table-bordered table-striped table-condensed">
                              <thead>
                              <tr>
                                  <th style="min-width: 100px;">Date</th>
                                  <th>Status</th>
                              </tr>
                              </thead>
                                                    <% for (MtnChat mc : mtn) {%>
                              <tbody>
                              <tr>
                                  <td><%= mc.getDt()%></td>
                                  <td><%= mc.getDesc()%></td>
                                  
                              </tr>
                              
                              </tbody>
                                                    <%}%>
                          </table>
                          </div>
                          </div>
                             
                              <br>
                              <h4 style="color: black;">Progress Message Update</h4> 
                                        <%-- TEST BUTTON --%>           
                              
           <form action="updateChat" method="get">
               
                              <div class="row mt">
                              <div class="col-sm-6" style="margin-left: 0%">
                                  <h5 style="color: black;">Quick Response: </h5> 
                                  <!-- 
                                  <input type="submit" style=" width: 150px; height: 40px;" class="btn btn-info" name="chat" value="รับเรื่องประสานงาน"/> 
                <input type="submit" style=" width: 180px; height: 40px;" class="btn btn-info" name="chat" value="รอการตอบรับนัดหมาย"/>
                <input type="submit" style=" width: 80px; height: 40px;" class="btn btn-info" name="chat" value="ปิดงาน"/>
                                  -->
                                  <input type="button" style=" width: 150px; height: 40px;" class="btn btn-info" name="chat" id='chatreceive' value="รับเรื่องประสานงาน" onclick="changeChat('รับเรื่องประสานงาน')"/> 
                <input type="button" style=" width: 180px; height: 40px;" class="btn btn-info" name="chat" id='chatwait' value="รอการตอบรับนัดหมาย" onclick="changeChat('รอการตอบรับนัดหมาย')"/>
                <input type="button" style=" width: 80px; height: 40px;" class="btn btn-info" name="chat" id='chatdone' value="ปิดงาน" onclick="changeChat('ปิดงาน')"/>        
                              </div>
                              </div>
                              <input type="text" name="id" value="<%= m.getMtn_id()%>" hidden/>
                              </form>
                              <br>
                                        <%--END TEST BUTTON --%>                  
                              <form action="updateChat" method="get">
                              <div class="row">
                                      <div class="col-sm-5">
                                          <textarea class="form-control" id="chattext" name="chat" required></textarea>
                                      </div>
                              </div>
                                <input type="text" name="id" value="<%= m.getMtn_id()%>" hidden/>
                              <br>
                              <div class="row">
                                      <div class="col-sm-2">
                                      <input type="submit" class="btn btn-primary" value="Update">
                                      </div>  
                                  </div>
                                 
                              </form>
                                    <br>
                                    <form action="setAppointment" method="get">
                                      <div class="row">
                                        <div class="col-sm-3">
                                           <input type="submit" class="btn btn-warning" value="Request for Appointment Info" <%if (m.isAppToken() == true) {%>disabled<%}%> >
                                           <input type="text" name="appToken" value="true" hidden/>
                                           <input type="text" name="id" value="<%= m.getMtn_id()%>" hidden/>
                                        </div>
                                      </div>
                                    </form>
                                    <br>
                                    <!-- Calendar Create Event -->
                                    <div>
                                        <hr>
                                        <br>
                                        <h4 style="color: black;">Add Event to WorkCalendar</h4> 
                                        <form action="CreateEvent" method="POST" id="addEventForm">
                                            <label>Title</label>
                                            <input type="text" class="form-control" name="eventTitle" value="MTN Event for Room <%= m.getMtn_room_id() %>" required>
                                            <label>Detail</label>
                                            <textarea class="form-control" name="eventDetail"></textarea>
                                            <br>
                                            <div class="form-inline">
                                                <label>Start Date</label>
                                                <input type="date" class="form-control" name="eventStart" required>
                                                <label>End Date</label>
                                                <input type="date" class="form-control" name="eventEnd">
                                            </div>
                                            <br>
                                            <input type="hidden" class="form-control" name="eventUrl" value="SearchMtnReq?id=<%= m.getMtn_id() %>">
                                            <input type="hidden" class="form-control" name="eventColor" value="red">
                                            <input type="hidden" class="form-control" name="eventType" value="Maintanance">
                                            <input type="submit" class="btn btn-primary" value="Add to Calendar">
                                        </form>
                                        <div class="modal fade" id="messageModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">                               
                                                    <div class="modal-body">
                                                        <center><h3 id="messageLog"></h3></center>                               
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" id="closeModalBtn" class="btn btn-default" data-dismiss="modal">Close</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--End Calendar Create Event -->
          			</div><!-- panel-->
          		</div><!-- /col-lg-12 -->
          	</div><!-- /row -->
                            <%}%>
                  
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

                            $(document).ready(function(){
                            $("#a").change(function(){
                                            switch ($('#a').val()) {
                                                     case "1":
                                                    $('#b').html("<option value='1'>Light</option> <option value='2'>Ceiling</option>"+
                                                            " <option value='3'>Wall</option> <option value='4'>Floor</option> <option value='5'>Door</option>"+
                                                            "<option value='6'>Air Con</option> <option value='7'>Socket</option> <option value='8'>Window</option>"+
                                                            "<option value='9'>Others</option>");
                                                    break;
                                                case "2":
                                                    $('#b').html("<option value='1'>Light</option> <optionvalue='2'>Ceiling</option>"+
                                                            " <option value='3'>Wall</option> <option value='4'>Floor</option> <option value='5'>Sink</option>"+
                                                            "<option value='6'>Tap</option> <option value='7'>Socket</option> <option value='8'>Window</option>"+
                                                            "<option value='9'>Others</option>");
                                                    break;
                                                case "3":
                                                    $('#b').html("<option value='1'>Light</option> <option value='2'>Ceiling</option>"+
                                                            " <option value='3'>Wall</option> <option value='4'>Floor</option> "+
                                                            "<option value='5'>Socket</option> <option value='6'>Window</option>"+
                                                            "<option value='7'>Others</option>");
                                                    break;
                                                case "4":
                                                    $('#b').html("<option value='1'>Light</option> <option value='2'>Ceiling</option>"+
                                                            " <option value='3'>Wall</option> <option value='4'>Floor</option> <option value='5'>Door</option>"+
                                                            "<option value='6'>Sink/Bidet</option> <option value='7'>Shower/Tap</option> "+
                                                            "<option value='8'>Others</option>");
                                                    break;
                                                case "5":
                                                    $('#b').html("<option value='1'>Light</option> <option value='2'>Ceiling</option>"+
                                                            " <option value='3'>Wall</option> <option value='4'>Floor</option> <option value='5'>Door</option>"+
                                                            "<option value='6'>Tap</option> <option value='7'>Socket</option>"+
                                                            "<option value='8'>Others</option>");
                                                    break;
                                                case  "6":
                                                    $('#b').html("<option value='1'>Light</option> <option value='2'>Ceiling</option>"+
                                                            " <option value='3'>Wall</option> <option value='4'>Floor</option> <option value='5'>Door</option>"+
                                                            "<option value='6'>Air Con</option> <option value='7'>Socket</option> <option value='8'>Window</option>"+
                                                            "<option value='9'>Others</option>");
                                                    break;
                                            }
                            });
                            });
                            
                            //Add Event to Calendar By AJAX
                            $('#addEventForm').submit(function(event) {
                                event.preventDefault(); // Prevent the form from submitting via the browser
                                $('#closeModalBtn').prop('disabled', true);
                                $('#messageLog').css('color', 'black');
                                $('#messageLog').html('Adding New Event......');
                                $('#messageModal').modal('toggle');
                                var form = $(this);
                                $.ajax({
                                    type: form.attr('method'),
                                    url: form.attr('action'),
                                    data: form.serialize()
                                }).done(function(data) {
                                    $('#closeModalBtn').prop('disabled', false);
                                    $('#messageLog').css('color', 'green');
                                    $('#messageLog').html('Adding New Event DONE');  
                                    console.log("DONE: "+data);
                                }).fail(function(data) {
                                    $('#closeModalBtn').prop('disabled', false);
                                    $('#messageLog').css('color', 'red');
                                    $('#messageLog').html('Adding New Event ');
                                    console.log("FAIL: "+data);
                                });
                            });                                  
                        </script>
                        <script>
                        function changeChat(message) {
                            document.getElementById("chattext").value = message;
                        }
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
                                <form action="SearchMtnReq" method="get">
                                    <h3>Each Maintenance Request Management</h3><input type="text" name="id">
                                    <input type="submit" value="search">
                                </form>
                                <% if (request.getAttribute("message") != null) {%>
                                <h3><%=request.getAttribute("message")%><h3>
                                        <%}%>
                                        <%
                                            Maintanance m = (Maintanance) request.getAttribute("mtn");
                                            if (m != null) {
                                        %>
                                        <center>
                                            <h1>::Request Details::</h1>
                                            <form action="" method="get">
                                                <table>
                                                    <tr><td>Form ID</td><td><input type="text" value="<%= m.getMtn_id()%>" disabled/></td></tr>
                                                    <tr><td>Date</td><td><input type="text" value="<%= m.getMtn_date()%>" disabled/></td></tr>
                                                    <tr><td>Status<td><select name="status">
                                                                <option value="New"<%if (m.getMtn_status().equalsIgnoreCase("new")) {%>selected="selected"<%}%>>New</option>
                                                                <option value="Queue"<%if (m.getMtn_status().equalsIgnoreCase("queue")) {%>selected="selected"<%}%>>Queue</option>
                                                                <option value="Done"<%if (m.getMtn_status().equalsIgnoreCase("done")) {%>selected="selected"<%}%>>Done</option></select></td></tr>
                                                    <tr><td>Service Area<td><input type="text" value="<%= m.getMtn_ServiceArea()%>"/></td></tr>
                                                    <tr><td>Description</td><td><input type="text" value="<%= m.getMtn_desc()%>"/></td></tr>
                                                    <tr><td>Result</td><td><input type="text" value="<%= m.getMtn_result()%>"/></td></tr>
                                                    <tr><td>Material</td><td><input type="text" value="<%= m.getMtn_material()%>"/></td></tr>
                                                    <tr><td>Cost</td><td><input type="text" value="<%= m.getMtn_cost()%>"/></td></tr>
                                                    <tr><td>Evaluate</td><td><input type="text" value="<%= m.getMtn_result_eva()%>" disabled/></td></tr>
                                                    <tr><td>Remark</td><td><input type="text" value="<%= m.getMtn_eva_remark()%>" disabled/></td></tr>
                                                    <tr><td><input type="submit" value="Update Info"/></td></tr>
                                                </table>
                                                <input type="text" name="id" value="<%= m.getMtn_id()%>" hidden/>
                                            </form>
                                        </center>
                                        <%}%>
                                        <hr>
                                        <center>
                                            <%
                                                List<MtnChat> mtn = (List) request.getAttribute("mtnChat");
                                                if (mtn != null) {
                                            %>
                                            <table border="1">
                                                <tr><td><h5>Status Message</h5></td></tr>
                                                <tr>
                                                    <td><b>Date</b></td>
                                                    <td><b>Status</b></td>
                                                </tr>
                                                <% for (MtnChat mc : mtn) {%>
                                                <tr>
                                                    <td><%= mc.getDt()%></td>
                                                    <td><%= mc.getDesc()%></td>
                                                </tr>    
                                                <%}%>
                                            </table>

                <form action="updateChat" method="get">
                    <h3>Update Chat</h3><input type="text" name="chat">
                    <input type="submit" value="Update">
                    <input type="text" name="id" value="<%= m.getMtn_id()%>" hidden/>
                </form>
                
                <form action="setAppointment" method="get">
                    <input type="submit" value="Request for Appointment Info" <%if(m.isAppToken()==true){%>disabled<%}%> >
                    <input type="text" name="appToken" value="true" hidden/>
                    <input type="text" name="id" value="<%= m.getMtn_id()%>" hidden/>
                </form>
                <% if (request.getAttribute("messageUC") != null) {%>
                <h3><%=request.getAttribute("messageUC")%><h3>
                        <%}%>

                        <%}%>
                        </center>
                        <center> <% if (request.getAttribute("messageChat") != null) {%>
                            <h3><%=request.getAttribute("messageChat")%><h3>
                                    <%}%> </center>
                                    </body>
                                    </html>
                            --%>
