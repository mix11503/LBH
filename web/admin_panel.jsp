<%-- 
    Document   : admin_panel
    Created on : Apr 29, 2017, 6:30:40 PM
    Author     : Joe's
--%>

<%@page import="Model.Moving"%>
<%@page import="Model.Decoration"%>
<%@page import="Model.parcel"%>
<%@page import="Model.Problem"%>
<%@page import="Model.notifyAdmin"%>
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

        <title>Library Houze Admin Dashboard</title>

        <!-- Bootstrap core CSS -->
        <link href="assets/css/bootstrap.css" rel="stylesheet">
        <!--external css-->
        <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
         <!--<link href="assets/js/fullcalendar/bootstrap-fullcalendar.css" rel="stylesheet" />--> 
        <link href="assets/js/fullcalendar-3.5.1/fullcalendar.min.css" rel="stylesheet" />
        <link rel="stylesheet" type="text/css" href="assets/css/zabuto_calendar.css">
        <link rel="stylesheet" type="text/css" href="assets/js/gritter/css/jquery.gritter.css" />
        <link rel="stylesheet" type="text/css" href="assets/lineicons/style.css">   
        
        <!-- Custom styles for this template -->
        <link href="assets/css/style.css" rel="stylesheet">
        <link href="assets/css/style-responsive.css" rel="stylesheet">
        

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
        
        <style>
            .fc-widget-header{
                background-color:gray;
            }
            .fc-center{
                color:black;
            }
            .fc-day-number{
                color:black;
            }
        </style>
    </head>

    <body>

        <section id="container" >
            <%
                if(request.getSession().getAttribute("adminAuthen")!=null){
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

                    <div class="row">
                        <div class="col-lg-9 main-chart">
                            
                            <% int mtnAmt = Maintanance.getReqAmountByStatus("New");
                               int parAmt = parcel.getExistParcel().size(); 
                               int proAmt = Problem.getNewRequest().size();
                               int decAmt = Decoration.getNewRequest().size();
                               int movAmt = Moving.getNewRequest().size();
                               String bell = " <sup><i class='fa fa-bell-o'></i></sup>";
                               String ok = "<div style='color:green;'>OK!</div>";
                            %>

                            <div class="row" id="topBar"  style="display:none">
                                <a  href="searchByStatus?status=New">
                  		<div class="col-md-2 col-sm-2 col-md-offset-1 box0">
                  			<div class="box1">
					  			<i class="fa fa-wrench" aria-hidden="true" style="font-size:71px"></i>
					  			<h5>Maintenances</h5>
                  <h2 style="color:#FF0000"><%=mtnAmt==0?ok:mtnAmt+bell%></h2>
                  			</div>
					  		
                  		</div>
                      </a>
                      <a  href="adminParcel">                  
                  		<div class="col-md-2 col-sm-2 box0">
                  			<div class="box1">
					  			<i class="fa fa-envelope" style="font-size:71px"></i>
                  <h5>Parcel</h5>
			<h2 style="color:#FF0000"><%=parAmt==0?ok:parAmt+bell%></h2>
                  			</div>
					  			
                  		</div>
                                        </a>
                     <a  href="getCurrentReport">
                  		<div class="col-md-2 col-sm-2 box0">
                  			<div class="box1">
					  			<i class="fa fa-comment" style="font-size:71px"></i>
                  <h5>Problem Report</h5>
                  <h2 style="color:#FF0000"><%=proAmt==0?ok:proAmt+bell%></h2>
                  			</div>
					  			
                  		</div>
                    </a>
                                        <a href="SearchFilter?filter=New">
                                <div class="col-md-2 col-sm-2 box0">
                                    <div class="box1">
                                        <i class="fa fa-gavel" style="font-size:71px"></i>
                                        <h5>Decoration</h5>
                                        <h2 style="color:#FF0000"><%=decAmt==0?ok:decAmt+bell%></h2>
                                    </div>

                                </div>
                                    </a>
                                    
                                    <a href="admMgnReq">
                                <div class="col-md-2 col-sm-2 box0">
                                    <div class="box1">
                                        <i class="fa fa-truck" style="font-size:71px"></i>
                                        <h5>Move Stuffs</h5>
                                        <h2 style="color:#FF0000"><%=movAmt==0?ok:movAmt+bell%></h2>
                                    </div>

                                </div>
                                    </a>
                                        
                            </div><!-- /row mt -->	
                            
                            <!-- Calendar API -->
                            <div>
                                <aside class="col-lg-12 mt">
                                    <div class="row">
                                        <section class="panel">
                                            <div class="panel-body">
                                                <div id="calendar" class="has-toolbar fc">
                                                </div>
                                            </div>
                                        </section>
                                    </div>	
                                </aside>

                                <aside class="col-lg-12 mt">
                                    <div class="row">
                                        <section class="panel">
                                            <div class="panel-body">
                                                <h4 style="color: black;">Add Other Event to WorkCalendar</h4> 
                                                <form action="CreateEvent" method="POST" id="addEventForm">
                                                    <label>Title</label>
                                                    <input type="text" class="form-control" name="eventTitle" required>
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
                                                    <input type="hidden" class="form-control" name="eventUrl">
                                                    <input type="hidden" class="form-control" name="eventColor" value="gray">
                                                    <input type="hidden" class="form-control" name="eventType" value="Other">
                                                    <input type="submit" class="btn btn-primary" value="Add to Calendar">
                                                </form>
                                            </div>
                                        </section>
                                    </div>	
                                </aside>
                            </div>
                            <div class="modal fade" id="eventDetailModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">                               
                                        <div class="modal-header">
                                            <h4 class="modal-title" id="myModalLabel">Event Detail</h4>
                                        </div>
                                        <div class="modal-body">
                                            <div class="form-group">
                                                <label class="col-sm-4 control-label">Event Title :</label>                               
                                                <p id="titleText" class="control-label"></p>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-4 control-label">Event Detail :</label>                               
                                                <p id="detailText" class="control-label"></p>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-4 control-label">Event Duration :</label>                               
                                                <p id="startText" class="control-label"></p>
                                            </div>                                     
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" id="deleteBtn" class="btn btn btn-danger" data-dismiss="modal">Delete Event</button>
                                            <a href="" id="urlText" target="_blank"><button type="button" id="urlBtn" class="btn btn-info">See Request Page</button></a>
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
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
                            <!-- End Calendar API -->
                            
                        </div><!-- /col-lg-9 END SECTION MIDDLE -->


                        <!-- **********************************************************************************************************************************************************
                        RIGHT SIDEBAR CONTENT
                        *********************************************************************************************************************************************************** -->                  

                        <div class="col-lg-3 ds">
                            <!--COMPLETED ACTIONS DONUTS CHART-->
                            <h3>NOTIFICATIONS</h3>
                            <!--jsp:include page="admin_panel_noti.jsp"/-->
                            
                            <div id="notiAjax">                                
                                <div id="notiDetails">      
                                    
                                </div>
                            </div>
                            
                            <!-- USERS ONLINE SECTION -->

                            <!-- CALENDAR>
                            <div id="calendar" class="mb">
                                <div class="panel green-panel no-margin">
                                    <div class="panel-body">
                                        <div id="date-popover" class="popover top" style="cursor: pointer; disadding: block; margin-left: 33%; margin-top: -50px; width: 175px;">
                                            <div class="arrow"></div>
                                            <h3 class="popover-title" style="disadding: none;"></h3>
                                            <div id="date-popover-content" class="popover-content"></div>
                                        </div>
                                        <div id="my-calendar"></div>
                                    </div>
                                </div>
                            </div><!-- / calendar -->

                        </div><!-- /col-lg-3 -->
                    </div><! --/row -->
                </section>
            </section>

            <!--main content end-->
            <!--footer start-->
            <footer class="site-footer">
                <div class="text-center">
                    SCHOOL PROJECT @SIT #IT20
                    <a href="" class="go-top">
                        <i class="fa fa-angle-up"></i>
                    </a>
                </div>
            </footer>
            <!--footer end-->
            <%}}else{response.sendRedirect("loginAdmin.jsp");}%>
        </section>

        <!-- js placed at the end of the document so the pages load faster -->
        <script src="assets/js/jquery.js"></script>
        <script src="assets/js/jquery-1.8.3.min.js"></script>
        <script src="assets/js/jquery-ui-1.9.2.custom.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/moment.min.js"></script> 
        
        
        <!-- <script src="assets/js/fullcalendar/fullcalendar.min.js"></script> -->  
        <script src="assets/js/fullcalendar-3.5.1/fullcalendar.min.js"></script>      
        <script class="include" type="text/javascript" src="assets/js/jquery.dcjqaccordion.2.7.js"></script>
        <script src="assets/js/jquery.scrollTo.min.js"></script>
        <script src="assets/js/jquery.nicescroll.js" type="text/javascript"></script>
        <script src="assets/js/jquery.sparkline.js"></script>
        <script src="assets/js/chart-master/Chart.js"></script>


        <!--common script for all pages-->
        <script src="assets/js/common-scripts.js"></script>

        <script type="text/javascript" src="assets/js/gritter/js/jquery.gritter.js"></script>
        <script type="text/javascript" src="assets/js/gritter-conf.js"></script>

        <!--script for this page-->
        <script src="assets/js/sparkline-chart.js"></script>    
        <script src="assets/js/zabuto_calendar.js"></script>	

        <script type="application/javascript">
            
            $(document).ready(function () {
                $('#calendar').fullCalendar({
                    header: {
			left: 'prev,next today',
			center: 'title',
			right: 'month,basicWeek,basicDay'
                    },
                    defaultDate: moment().format("YYYY-MM-DD"),
                    navLinks: false, // can click day/week names to navigate views
                    editable: false,
                    eventLimit: true, // allow "more" link when too many events
                    lazyFetching: true,
                    displayEventTime: false,
                    eventSources: [
                                    {
                                        url: '${pageContext.request.contextPath}/LoadAllEvent',
                                        type: 'GET',
                                        data: {},
                                        success: function() {
                                        },
                                        error: function() {
                                            alert('there was an error while fetching events!');
                                        }
                                    }
                                ],
                    eventClick: function(event) {                       
                        $('#titleText').html(event.title);
                        $('#deleteBtn').attr('onclick', 'deleteEvent('+event.id+')');
                        if(event.detail){
                            $('#detailText').html(event.detail);     
                        }else{
                            $('#detailText').html("-");
                        }
                        if(event.end){
                            $('#startText').html(moment(event.start).format("DD MMM YYYY")+" - "+moment(event.end).format("DD MMM YYYY"));
                        }else{
                            $('#startText').html(moment(event.start).format("DD MMM YYYY"));
                        }
                        if(event.urlPage){
                            console.log('IF CHECK');
                            $('#urlText').unbind('click', false);
                            $('#urlText').prop('href', event.urlPage);
                            $('#urlBtn').css('visibility', 'visible');
                        }else{
                            console.log('ELSE CHECK');
                            $('#urlText').bind('click', false);
                            $('#urlBtn').css('visibility', 'hidden');
                        }
                        $('#eventDetailModal').modal('toggle');
                    }
		});
                
                //NotiAdmin
                
                listAllNoti();
                window.setInterval(function(){
                $('#notiDetails').empty();
                $('#notiDetails').load(listAllNoti());
                 //window.location.reload(true);
                    //listAllNoti();
                }, 10000);
                
                console.log($('#calendar').fullCalendar( 'getEventSources' ));                
                
                $.ajax({
                    url: "${pageContext.request.contextPath}/LoadAllEvent",
                    error: function(){
                        // will fire when timeout is reached
                    },
                    success: function(data){
                        console.log("DATA: "+data);
                    },
                    timeout: 30000 // sets timeout to 3 seconds
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
               
               //get noti Req
            function listAllNoti(){
                $.post("adminPanelNoti",function(data){
                    $.each(data, function(i, notifyAdmin) {     
                            $('#notiDetails').append('<div class="desc"><div class="thumb"><span class="badge bg-theme">'+
                              '<i class="fa fa-clock-o"></i></span></div><div class="details">'+
                              '<p><muted>'+notifyAdmin.datetime+'</muted><br/>'+
                              'Room: <a href="#">'+notifyAdmin.room+',<br/></a><b> '+notifyAdmin.name+' </b>'+ notifyAdmin.message+
                              ' on <b>'+notifyAdmin.type+'</b><br/></p></div></div>'
                            )                            
                    });
                    //console.log(data);
                }, "json")
            }
                
            });

            function deleteEvent(id){
                console.log('DETELE :'+id);
                $.post("DeleteEvent", { "id": id }, function(data){
                    $('#calendar').fullCalendar( 'refetchEvents' );
                });    
            }
            
            function myNavFunction(id) {
                $("#date-popover").hide();
                var nav = $("#" + id).data("navigation");
                var to = $("#" + id).data("to");
                console.log('nav ' + nav + ' to: ' + to.month + '/' + to.year);
            }
            
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
                    $('#calendar').fullCalendar( 'refetchEvents' );
                }).fail(function(data) {
                    $('#closeModalBtn').prop('disabled', false);
                    $('#messageLog').css('color', 'red');
                    $('#messageLog').html('Adding New Event ');
                    console.log("FAIL: "+data);
                    $('#calendar').fullCalendar( 'refetchEvents' );
                });
            });
            
        </script>

                <script type="application/javascript">
            $(function() {
                $('#noti').show();
            });
            $(function() {
                $('#topBar').show();
            });
            
          </script>

    </body>
</html>

