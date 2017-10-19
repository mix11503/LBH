<%-- 
    Document   : userMtnReq
    Created on : Mar 10, 2017, 11:00:50 AM
    Author     : Joe's
--%>

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

    <title>Maintenance Request</title>
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
          	<h2>Maintenance Request Form</h2>     
                      <div class="row mt">
          		<div class="col-lg-12">
          			<div class="form-panel">
                  	  <h4 class="mb"><i class="fa fa-angle-right"></i>Complete the form to request the service</h4>
                          <form class="form-horizontal tasi-form" action="mtnReq" method="post" enctype="multipart/form-data">
                              <input type="text" name="roomId" value="<%=roomId%>" hidden/>
                              <div class="form-group has-success">
                                  <label class="col-sm-2 control-label col-lg-2" for="inputSuccess">Service Area</label>
                                  <div class="col-lg-10">
                                      <select class="form-control" id="a" name="area" required>
                                      	  <option selected="true" disabled="disabled">Select your Service Area</option>
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
                                  <label class="col-sm-2 control-label col-lg-2" for="inputSuccess">Description</label>
                                  <div class="col-lg-10">
                                      <textarea class="form-control" style="width: 99%; height: 100px;" name="desc" required></textarea>
                                  </div>
                              </div>

                              <div class="form-group has-success">
                                  <label class="col-sm-2 control-label col-lg-2" for="inputSuccess">Upload Picture</label>
                                  <div class="col-lg-10">
                                      <input type="file" name="image[0]" accept="image/*" class="btn btn-primary" onchange="readURL(this,0);"/>
                                  </div>
                              </div>
                               <div class="form-group has-success">
                                  <label class="col-sm-2 control-label col-lg-2" for="inputSuccess">Upload Picture 2</label>
                                  <div class="col-lg-10">
                                      <input type="file" name="image[1]" accept="image/*" class="btn btn-primary" onchange="readURL(this,1);"/>
                                  </div>
                              </div>
                               <div class="form-group has-success">
                                  <label class="col-sm-2 control-label col-lg-2" for="inputSuccess">Upload Picture 3</label>
                                  <div class="col-lg-10">
                                      <input type="file" name="image[2]" accept="image/*" class="btn btn-primary" onchange="readURL(this,2);"/>
                                      <br>
                                      <img id="blah0" src="#" alt="your image" hidden/>
                                      &nbsp;&nbsp;
                                      <img id="blah1" src="#" alt="your image" hidden/>
                                      &nbsp;&nbsp;
                                      <img id="blah2" src="#" alt="your image" hidden/>
                                  </div>
                              </div>

                              <input type="submit" style="margin-left: 225px; width: 80px; height: 40px;" class="btn btn-success" value="Submit"/>
                          </form>
          			</div><!-- /form-panel -->
          		</div><!-- /col-lg-12 -->
          	</div><!-- /row -->
                <% if(request.getAttribute("message")!= null){ %>
        <h3 ><span style="color:#FF0000"><%=request.getAttribute("message")%></h3>
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
    <script type="application/javascript">
        function readURL(input, index) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#blah'+index)
                        .show()
                        .attr('src', e.target.result)
                        .width(200)
                        .height(150);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
  </body>
</html>