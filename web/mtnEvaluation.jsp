<%-- 
    Document   : mtnEvaluation
    Created on : Mar 10, 2017, 10:39:15 PM
    Author     : Joe's
--%>

<%@page import="java.util.List"%>
<%@page import="Model.MtnChat"%>
<%@page import="Model.Maintanance"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.util.List"%>
<%@page import="Model.MtnChat"%>
<%@page import="Model.Maintanance"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Dashboard">
        <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

        <title>Maintainance Process Tracking</title>
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
                    <h2>Maintenance Progress Tracking</h2>               
                    <div class="row mt">
 <%
            Maintanance m = (Maintanance) request.getAttribute("mtn");
            if (m != null) {
        %>



                        <div class="col-sm-12">
                            <div class="col-sm-10">
<%
int percent = 0;
String text = "";
if(m.getMtn_status().equalsIgnoreCase("new")){
    percent = 33; text = "We've got your request already.";
}else if(m.getMtn_status().equalsIgnoreCase("queue")){
    percent = 67; text = "The service is in process.";
}else if(m.getMtn_status().equalsIgnoreCase("done")){
    percent = 100; text = "The service is done!.";
}
%>
                                <div align="right">100%</div>
                                <div class="progress">

                                    <div class="progress-bar" role="progressbar" style="width:<%=percent%>%"><%=text%></div>

                                </div>

                            </div>
                        </div>

                        <div class="row mt">
                            <div class="col-lg-12">

                                <br>
                                <div class="form-panel" style="border-radius: 10px; padding-left: 20px;">
                              <%--form--%>      <div class="form-horizontal tasi-form">
                                        <br>
                                        <h4 style="color: black;">Request Detail</h4>
                                        <br>
                                        <div class="form-group has-success">
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
                                        <br>
                                        <h4 style="color: black;">Broken Stuff</h4><br>

                                        <div class="form-group has-success">
                                            <label class="col-sm-2 control-label col-lg-2" for="inputSuccess">Service Area</label>
                                            <div class="col-lg-10">
                                                <input type="text" style="width: 50%;" class="form-control" id="inputSuccess" disabled placeholder="<%= m.getMtn_ServiceArea()%>">
                                            </div>
                                        </div>

                                        <div class="form-group has-success">
                                            <label class="col-sm-2 control-label col-lg-2" for="inputSuccess">Broken Stuff</label>
                                            <div class="col-lg-10">
                                                <input type="text" style="width: 50%;" class="form-control" id="inputSuccess" disabled placeholder="<%= m.getMtn_area_stuff()%>">
                                            </div>
                                        </div>


                                        <div class="form-group has-success">
                                            <label class="col-sm-2 control-label col-lg-2" for="inputSuccess">Description</label>
                                            <div class="col-lg-10">
                                                <TEXTAREA style="width: 50%; height: 50%;" class="form-control" id="inputSuccess" disabled placeholder="<%= m.getMtn_desc()%>"></TEXTAREA>
                                  </div>
                              </div>
                              <br>
                              <h4 style="color: black;">Action Taken</h4><br>

                              <div class="form-group has-success">
                              <label class="col-sm-2 control-label col-lg-2" for="inputSuccess">Result</label>
                              <div class="col-lg-10">
                                      <input type="text" style="width: 50%;" class="form-control" id="inputSuccess" disabled placeholder="<%= m.getMtn_result()%>">
                                  </div>
                              </div>

                              
                              <div class="form-group has-success">
                              <label class="col-sm-2 control-label col-lg-2" for="inputSuccess">Materials</label>
                              <div class="col-lg-10">
                                      <input type="text" style="width: 50%;" class="form-control" id="inputSuccess" disabled placeholder="<%= m.getMtn_material()%>">
                                  </div>
                              </div>


                              <div class="form-group has-success">
                              <label class="col-sm-2 control-label col-lg-2" for="inputSuccess">Cost</label>
                              <div class="col-lg-10">
                                  <input type="text" style="width: 50%;" class="form-control" id="inputSuccess" disabled placeholder="<%= m.getMtn_cost()%>">
                                  </div>
                              </div>

                              <form action="finishEva" method="get">
                              <hr>
                              <h4 style="color: black;">Evaluation Form</h4><br>

                              <div class="form-group has-success">
                              <label class="col-sm-2 control-label col-lg-2" for="inputSuccess">Evaluation Result</label>
                              <div class="col-lg-10">
                                      <select style="width: 50%;" class="form-control" id="inputSuccess" name="eva">
                                          <option selected="true" disabled="disabled">Select Evaluate</option>
                                          <option value="Satisfy">Satisfy</option><option value="Unsatisfy">Unsatisfy</option>
                                      </select>
                                  </div>
                              </div>


                              <div class="form-group has-success">
                              <label class="col-sm-2 control-label col-lg-2" for="inputSuccess">Remark</label>
                              <div class="col-lg-10">
                                      <input type="text" style="width: 50%;" class="form-control" id="inputSuccess" name="remark" required>
                                  </div>
                              </div>
                                  <input type="submit" value="Evaluate"/>
                              <br>
                                <input type="text" name="id" value="<%= m.getMtn_id()%>" hidden/>
            </form>
                              <hr>

                              <input type="text" name="id" value="<%= m.getMtn_id()%>" hidden/>
                              <%
            List<MtnChat> mtn = (List) request.getAttribute("mtnChat");
            if (mtn != null) {
        %>
        <% if (mtn.isEmpty() == false) { %>
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
                              <%}%>
            <% for (MtnChat mc : mtn) {%>
                              <tbody>
                              <tr>
                                  <td><%= mc.getDt()%></td>
                                  <td><%= mc.getDesc()%></td>
                              </tr>
                              </tbody>
                              <%}%>
                              <%}%>
                          </table>
                          </div>
                          </div>
                     
                        <br>
                              <hr>
                        <br>
                    <% if (m.isAppToken() != false) {%>
                          <br>
                              <h4 style="color: black;">Appointment Form</h4>
                              <h6 style="color: black;">Provide your free date for service</h6>
                          <br>
                <form action="mtnApp" method="get">
                          <div class="form-group has-success">
                              <label class="col-sm-2 control-label col-lg-2" for="inputSuccess">1. Date</label>
                              <div class="col-lg-10">
                                      <input type="date" style="width: 50%;" class="form-control" id="inputSuccess" name="dateAppoint1" required />
                                  </div>
                              </div>

                          <div class="form-group has-success">
                              <label class="col-sm-2 control-label col-lg-2" for="inputSuccess">Time start</label>
                              <div class="col-lg-10">
                                      <input type="time" style="width: 20%;" class="form-control" id="inputSuccess" name="timeStart1" required/>
                              </div>
                              </div>

                          <div class="form-group has-success">
                              <label class="col-sm-2 control-label col-lg-2" for="inputSuccess">Time End</label>
                              <div class="col-lg-10">
                                      <input type="time" style="width: 20%;" class="form-control" id="inputSuccess" name="timeEnd1" required/>
                              </div>
                              </div>

                              <br>
                              <br>

                          <h4 style="color: black;">Optional appointment</h4>
                          <br>

                          <div class="form-group has-success">
                              <label class="col-sm-2 control-label col-lg-2" for="inputSuccess">1. Date</label>
                              <div class="col-lg-10">
                                      <input type="date" style="width: 50%;" class="form-control" id="inputSuccess" name="dateAppoint2" required />
                                  </div>
                              </div>

                          <div class="form-group has-success">
                              <label class="col-sm-2 control-label col-lg-2" for="inputSuccess">Time start</label>
                              <div class="col-lg-10">
                                      <input type="time" style="width: 20%;" class="form-control" id="inputSuccess" name="timeStart2" required/>
                              </div>
                              </div>

                          <div class="form-group has-success">
                              <label class="col-sm-2 control-label col-lg-2" for="inputSuccess">Time End</label>
                              <div class="col-lg-10">
                                      <input type="time" style="width: 20%;" class="form-control" id="inputSuccess" name="timeEnd2" required/>
                              </div>
                              </div>

                              <br>
                              <br>


                          <div class="form-group has-success">
                              <label class="col-sm-2 control-label col-lg-2" for="inputSuccess">Other Choice</label>
                              <div class="col-lg-10">
                                      <input type="text" style="width: 50%;" class="form-control" id="inputSuccess" name="other">
                                  </div>
                              </div>


                              <div class="row mt">
                              <div class="col-sm-6" style="margin-left: 17%">
                              <input type="submit" value=" Submit"style=" width: 80px; height: 40px;" class="btn btn-success"/>
                              <button type="button" style=" width: 80px; height: 40px;" class="btn btn-success">Back</button>
                              <input type="text" name="mtnId" value="<%= m.getMtn_id()%>" hidden/>
                              </div>
                              </div>
                              </form>
                          
                          <%}%>
          			</div><!-- panel-->
          		</div><!-- /col-lg-12 -->
          	</div><!-- /row -->
               <%}%>   
               <center> <% if (request.getAttribute("message") != null) {%>
        <h3><%=request.getAttribute("message")%><h3>
                <%}%> </center>
                
                <center> <% if (request.getAttribute("messageChat") != null) {%>
                    <h3><%=request.getAttribute("messageChat")%><h3>
                            <%}%> </center>
                           <center> <input type="button" value="Back" onclick="location.href = 'MTNSearchRoom?id=201'"/> </center>
                  
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



    </script>
  

  </body>
</html>
<%--THEME--%>
<%--
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Maintanance m = (Maintanance) request.getAttribute("mtn");
            if(m!=null){
            %>
        <center>
        <h1>::Maintenance Evaluation Form::</h1>
        <table>
            <tr>
                <td>
                    <%if(m.getMtn_status().equalsIgnoreCase("new")){%>
                    <img src="status/1.png">
                    <%}else if(m.getMtn_status().equalsIgnoreCase("queue")){%>
                    <img src="status/2.png">
                    <%}else if(m.getMtn_status().equalsIgnoreCase("done")){%>
                    <img src="status/3.png">
                    <%}%>
                </td>
                </tr>
        </table>
        <form action="finishEva" method="get">
       <table>
         <tr> <td></td> <td><b>::Request Details::</b></td> <td></td></tr>
            <tr><td>Form ID</td><td><input type="text" value="<%= m.getMtn_id()%>" disabled/></td></tr>
            <tr><td>Date</td><td><input type="text" value="<%= m.getMtn_date()%>" disabled/></td></tr>
            <tr><td>Status</td><td><input type="text" value="<%= m.getMtn_status() %>" disabled/></td></tr>
         <tr> <td></td> <td><b>::Broken Stuff::</b></td> <td></td> </tr>
            <tr><td>Service Area<td><input type="text" value="<%= m.getMtn_ServiceArea()%>" disabled/></td></tr>
            <tr><td>Service Stuff</td><td><input type="text" value="<%= m.getMtn_area_stuff() %>" disabled/></td></tr>
            <tr><td>Description</td><td><input type="text" value="<%= m.getMtn_desc()%>" style="width:156px; height:50px;" disabled/></td></tr>
         <tr> <td></td> <td><b>::Action Taken::</b></td> <td></td> </tr>
            <tr><td>Result</td><td><input type="text" value="<%= m.getMtn_result()%>" disabled/></td></tr>
            <tr><td>Material</td><td><input type="text" value="<%= m.getMtn_material()%>" disabled/></td></tr>
            <tr><td>Cost</td><td><input type="text" value="<%= m.getMtn_cost()%>" disabled/></td></tr>
         <tr> <td></td> <td><b>::Evaluate the Correction::</b></td> <td></td> </tr>   
            <tr><td>Evaluate</td><td><select name="eva"><option value="Satisfy">Satisfy</option><option value="Unsatisfy">Unsatisfy</option></select></td></tr>
            <tr><td>Remark</td><td><input type="text" name="remark"/></td></tr>
            <tr><td><input type="submit" value="Submit Form"/></td><td><input type="button" value="CANCLE" onclick="location.href='mtnEvaluation.jsp'"/></td></tr>
        </table>
            <input type="text" name="id" value="<%= m.getMtn_id() %>" hidden/>
            </form>
        </center>
            <%}%>
            <center> <% if(request.getAttribute("message")!= null){ %>
        <h3><%=request.getAttribute("message")%></h3>
                <%}%> </center>
                <br><br><br>
                <center>
                <%
                    List<MtnChat> mtn = (List) request.getAttribute("mtnChat");
                    if(mtn!=null){
                    }
                    %>
                    <table border="1">
                        <tr><td><h5>Status Message</h5></td></tr>
                        <tr>
                            <td><b>Date</b></td>
                            <td><b>Status</b></td>
                        </tr>
                    <% for(MtnChat mc : mtn){ %>
                        <tr>
                            <td><%= mc.getDt() %></td>
                            <td><%= mc.getDesc() %></td>
                        </tr>    
                    <%}%>
                    </table>
                    </center>
                <center> <% if(request.getAttribute("messageChat")!= null){ %>
        <h3><%=request.getAttribute("messageChat")%></h3>
                <%}%> </center>
                
                 <center> <input type="button" value="Back" onclick="location.href='MTNSearchRoom?id=201'"/> </center>
    </body>
</html>
--%>