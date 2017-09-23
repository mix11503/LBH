<%-- 
    Document   : admin_panel
    Created on : Apr 29, 2017, 6:30:40 PM
    Author     : Joe's
--%>

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
            <jsp:include page="adminBar.jsp"/>
            <!-- **********************************************************************************************************************************************************
            MAIN CONTENT
            *********************************************************************************************************************************************************** -->
            <!--main content start-->
            <section id="main-content">
                <section class="wrapper">

                    <div class="row">
                        <div class="col-lg-9 main-chart">

                            <div class="row mtbox">
                                <a  href="searchByStatus?status=New">
                  		<div class="col-md-2 col-sm-2 col-md-offset-1 box0">
                  			<div class="box1">
					  			<i class="fa fa-wrench" aria-hidden="true" style="font-size:71px"></i>
					  			<h5>Maintenances</h5>
                  <h2 style="color:#FF0000">${newAmt} <sup><i class="fa fa-bell-o"></i></sup></h2>
                  			</div>
					  		
                  		</div>
                      </a>
                      <a  href="adminParcel">                  
                  		<div class="col-md-2 col-sm-2 box0">
                  			<div class="box1">
					  			<i class="fa fa-envelope-o" style="font-size:71px"></i>
                  <h5>Parcel</h5>
			<h2 style="color:#FF0000">${parAmt} <sup><i class="fa fa-bell-o"></i></sup></h2>
                  			</div>
					  			
                  		</div>
                                        </a>
                     <a  href="getCurrentReport">
                  		<div class="col-md-2 col-sm-2 box0">
                  			<div class="box1">
					  			<i class="fa fa-comment-o" style="font-size:71px"></i>
                  <h5>Problem Report</h5>
			<h2 style="color:#FF0000">${pbmAmt} <sup><i class="fa fa-bell-o"></i></sup></h2>
                  			</div>
					  			
                  		</div>
                    </a>
                                <div class="col-md-2 col-sm-2 box0">
                                    <div class="box1">
                                        <i class="fa fa-car" style="font-size:71px"></i>
                                        <h5>Access Permit</h5>
                                        <h2 style="color:green">OK!</h2>
                                    </div>

                                </div>

                                <div class="col-md-2 col-sm-2 box0">
                                    <div class="box1">
                                        <i class="fa fa-credit-card" style="font-size:71px"></i>
                                        <h5>Keycard</h5>
                                        <h2 style="color:green">OK!</h2>
                                    </div>

                                </div>
                                        
                            </div><!-- /row mt -->	
                            
                            <!-- Calendar API -->
                            <div>
                                <aside class="col-lg-12 mt">
                                    <div class="row mtbox">
                                        <section class="panel">
                                            <div class="panel-body">
                                                <div id="calendar" class="has-toolbar fc">
                                                </div>
                                            </div>
                                        </section>
                                    </div>	
                                </aside>

                                <aside class="col-lg-12 mt">
                                    <div class="row mtbox">
                                        <section class="panel">
                                            <div class="panel-body">
                                                <form action="CreateEvent" method="GET">
                                                    <label>Title</label>
                                                    <input type="text" class="form-control" name="title">
                                                    <label>Detail</label>
                                                    <textarea class="form-control" name="detail"></textarea>
                                                    <label>Start Date</label>
                                                    <input type="date" class="form-control" name="start">
                                                    <label>End Date</label>
                                                    <input type="date" class="form-control" name="end">
                                                    <label>URL</label>
                                                    <input type="text" class="form-control" name="url">
                                                    <label>Color</label>
                                                    <input type="text" class="form-control" name="color">
                                                    <input type="submit" value="submit">
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
                                                <label id="titleText" class="control-label"></label>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-4 control-label">Event Detail :</label>                               
                                                <label id="detailText" class="control-label"></label>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-4 control-label">Event Start :</label>                               
                                                <label id="startText" class="control-label"></label>
                                            </div>
                                                                           
                                        </div>
                                        <div class="modal-footer">
                                            <a href="" id="urlText" target="_blank"><button type="button" class="btn btn-default" >See Request Page</button></a>
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
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

                            <!-- First Action -->
                            <div class="desc">
                                <div class="thumb">
                                    <span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
                                </div>
                                <div class="details">
                                    <p><muted>2 Minutes Ago</muted><br/>
                                    <a href="#">James Brown</a> subscribed to your newsletter.<br/>
                                    </p>
                                </div>
                            </div>
                            <!-- Second Action -->
                            <div class="desc">
                                <div class="thumb">
                                    <span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
                                </div>
                                <div class="details">
                                    <p><muted>3 Hours Ago</muted><br/>
                                    <a href="#">Diana Kennedy</a> purchased a year subscription.<br/>
                                    </p>
                                </div>
                            </div>
                            <!-- Third Action -->
                            <div class="desc">
                                <div class="thumb">
                                    <span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
                                </div>
                                <div class="details">
                                    <p><muted>7 Hours Ago</muted><br/>
                                    <a href="#">Brandon Page</a> purchased a year subscription.<br/>
                                    </p>
                                </div>
                            </div>
                            <!-- Fourth Action -->
                            <div class="desc">
                                <div class="thumb">
                                    <span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
                                </div>
                                <div class="details">
                                    <p><muted>11 Hours Ago</muted><br/>
                                    <a href="#">Mark Twain</a> commented your post.<br/>
                                    </p>
                                </div>
                            </div>
                            <!-- Fifth Action -->
                            <div class="desc">
                                <div class="thumb">
                                    <span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
                                </div>
                                <div class="details">
                                    <p><muted>18 Hours Ago</muted><br/>
                                    <a href="#">Daniel Pratt</a> purchased a wallet in your store.<br/>
                                    </p>
                                </div>
                            </div>

                            <!-- DUPLICATE -->
                            <div class="desc">
                                <div class="thumb">
                                    <span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
                                </div>
                                <div class="details">
                                    <p><muted>2 Minutes Ago</muted><br/>
                                    <a href="#">James Brown</a> subscribed to your newsletter.<br/>
                                    </p>
                                </div>
                            </div>
                            <!-- Second Action -->
                            <div class="desc">
                                <div class="thumb">
                                    <span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
                                </div>
                                <div class="details">
                                    <p><muted>3 Hours Ago</muted><br/>
                                    <a href="#">Diana Kennedy</a> purchased a year subscription.<br/>
                                    </p>
                                </div>
                            </div>
                            <!-- Third Action -->
                            <div class="desc">
                                <div class="thumb">
                                    <span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
                                </div>
                                <div class="details">
                                    <p><muted>7 Hours Ago</muted><br/>
                                    <a href="#">Brandon Page</a> purchased a year subscription.<br/>
                                    </p>
                                </div>
                            </div>
                            <!-- Fourth Action -->
                            <div class="desc">
                                <div class="thumb">
                                    <span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
                                </div>
                                <div class="details">
                                    <p><muted>11 Hours Ago</muted><br/>
                                    <a href="#">Mark Twain</a> commented your post.<br/>
                                    </p>
                                </div>
                            </div>
                            <!-- Fifth Action -->
                            <div class="desc">
                                <div class="thumb">
                                    <span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
                                </div>
                                <div class="details">
                                    <p><muted>18 Hours Ago</muted><br/>
                                    <a href="#">Daniel Pratt</a> purchased a wallet in your store.<br/>
                                    </p>
                                </div>
                            </div>
                            <!-- Fifth Action -->
                            <div class="desc">
                                <div class="thumb">
                                    <span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
                                </div>
                                <div class="details">
                                    <p><muted>18 Hours Ago</muted><br/>
                                    <a href="#">Daniel Pratt</a> purchased a wallet in your store.<br/>
                                    </p>
                                </div>
                            </div>
                            <!-- Fifth Action -->
                            <div class="desc">
                                <div class="thumb">
                                    <span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
                                </div>
                                <div class="details">
                                    <p><muted>18 Hours Ago</muted><br/>
                                    <a href="#">Daniel Pratt</a> purchased a wallet in your store.<br/>
                                    </p>
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
                    editable: true,
                    eventLimit: true, // allow "more" link when too many events
                    editable: true,
                    lazyFetching: true,
                    displayEventTime: false,
                    eventSources: [
                                    {
                                        url: 'LoadAllEvent',
                                        type: 'GET',
                                        data: {},
                                        error: function() {
                                            alert('there was an error while fetching events!');
                                        }
                                    }
                                ],
                    eventClick: function(event) {                       
                        $('#titleText').html(event.title);
                        $('#detailText').html(event.detail);               
                        if(event.end){
                            $('#startText').html(moment(event.start).format("DD MMM YYYY")+" - "+moment(event.end).format("DD MMM YYYY"));
                        }else{
                            $('#startText').html(moment(event.start).format("DD MMM YYYY"));
                        }
                        $('#urlText').prop('href', event.urlPage);
                        $('#eventDetailModal').modal('toggle');
                    }
		});
                console.log($('#calendar').fullCalendar( 'getEventSources' ));

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
                
//                console.log('ready.');
//                loadEventCurrentMonth();
            });

            // Load Event in Current Month to Calendar
//            function loadEventCurrentMonth(){
//                $.get("LoadEventCurrentMonth",function(data){
//                    console.log(data);
//                    var events = $.parseJSON(data);
//                    console.log(events);
//                    $('#calendar').fullCalendar( 'removeEventSources' );
//                    $('#calendar').fullCalendar( 'addEventSource', events );
//                });
//            }

            function myNavFunction(id) {
                $("#date-popover").hide();
                var nav = $("#" + id).data("navigation");
                var to = $("#" + id).data("to");
                console.log('nav ' + nav + ' to: ' + to.month + '/' + to.year);
            }
        </script>


    </body>
</html>

