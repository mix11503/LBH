<%-- 
    Document   : editNews
    Created on : Aug 23, 2017, 11:02:13 PM
    Author     : Joe's
--%>

<%@page import="Model.newsUpdate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Dashboard">
        <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

        <script src="https://cloud.tinymce.com/stable/tinymce.min.js?apiKey=z3nckpsimbih4hb7cgzuvqwxi9mqj7lhhkk4icm4y10dsocp"></script>

        <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script src="assets/js/jquery.js"></script>
        <script type="application/javascript">
        
             $( function() {
        var from = $( "#inputStart" )
            .datepicker({
              defaultDate: "+1w",
              changeMonth: true,
              numberOfMonths: 2,
              dateFormat: "yy-mm-dd",
              minDate: 0
            })
            .on( "change", function() {
              to.datepicker( "option", "minDate", from.datepicker( "getDate" ));
            }),
          to = $( "#inputEnd" ).datepicker({
            defaultDate: "+1w",
            changeMonth: true,
            numberOfMonths: 2,
            dateFormat: "yy-mm-dd"
          })
          .on( "change", function() {
            from.datepicker( "option", "maxDate", to.datepicker( "getDate" ));
          });
 
        function getDate( element ) {
          var date;
          try {
            date = $.datepicker.parseDate( dateFormat, element.value );
          } catch( error ) {
            date = null;
          }
 
          return date;
        }
      } );

        $( function() {
        var currentDate = new Date();  
          //$("#inputStart").datepicker("setDate",currentDate);
    

        });

    tinymce.init({
      selector: 'textarea',
      max_height: 1000,
      max_width: 300,
      min_height: 200,
      min_width: 400,
      menubar: false,
      plugins: [
        'advlist autolink lists link image charmap print preview anchor',
        'searchreplace visualblocks code fullscreen',
        'insertdatetime media table contextmenu paste code image code'
      ],
      toolbar: 'undo redo | insert | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image',
 
     // without images_upload_url set, Upload tab won't show up
      images_upload_url: 'postAcceptor.php',
  
      // we override default upload handler to simulate successful upload
      images_upload_handler: function (blobInfo, success, failure) {
        setTimeout(function() {
          // Upload Handler
      success('https://www.mx7.com/i/0b3/HEe6eV.jpg');
        }, 2000);
      },    
            content_css: [
        '//fonts.googleapis.com/css?family=Lato:300,300i,400,400i',
        '//www.tinymce.com/css/codepen.min.css']


    });

       
        </script>

        <title>Create News</title>

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
            <jsp:include page="adminBar.jsp"/>
            <!-- **********************************************************************************************************************************************************
            MAIN CONTENT
            *********************************************************************************************************************************************************** -->
            <!--main content start-->
 <script>
            function goBack() {
             window.history.back()
              }
            </script>
            <section id="main-content">
                <section class="wrapper">   
                    <h2>Edit Announcement</h2>               
                    <div class="row mt">
                        <div class="col-lg-12">
                            <div class="form-panel">
                                <% newsUpdate nu = (newsUpdate) request.getAttribute("news");
                                    if (nu != null) {
                                %>
                                <h4 class="mb"><i class="fa fa-angle-right"></i> Edit News Content</h4>
                                <form action="ConfirmEditNews" class="form-horizontal tasi-form" method="post"  accept-charset="UTF-8">
                                    <input type="text" name="id" value="<%= nu.getNews_id()%>" hidden/>
                                    <div class="form-group has-success">
                                        <label class="col-sm-2 control-label col-lg-2" for="inputSuccess">Topic </label>
                                        <div class="col-lg-5">
                                            <input type="text" class="form-control" id="inputSuccess" name="topic" value="<%= nu.getNews_topic()%>" required>
                                        </div>

                                    </div>

                                    <div class="form-group has-success">
                                        <label class="col-sm-2 control-label col-lg-2" for="inputSuccess">Description </label>
                                        <div class="col-lg-10">
                                            <textarea name="desc"><%= nu.getNews_desc()%></textarea>
                                        </div>

                                    </div>
                                        
                                        <div class="form-group has-success">
                                  <label class="col-sm-2 control-label col-lg-2" for="inputSuccess">Category</label>
                                  <div class="col-lg-5">
                                      <select class="form-control" id="a" name="category">
                                          <option value="gen" <%if(nu.getCate().equals("gen")){%>selected<%}%>>General News</option>
                                            <option value="amb" <%if(nu.getCate().equals("amb")){%>selected<%}%>>Emergency News</option>
                                            <option value="mtn" <%if(nu.getCate().equals("mtn")){%>selected<%}%>>Maintenance News</option>
                                            <option value="ads" <%if(nu.getCate().equals("ads")){%>selected<%}%>>Advertisement News</option>
                                     </select>
                                  </div>
                              </div>

                                    <h4 class="mb"><i class="fa fa-angle-right"></i> Period Available</h4>

                                    <div class="form-group has-success">
                                        <label class="col-sm-2 control-label col-lg-2" for="inputSuccess">Date Start</label>
                                        <div class="col-lg-5">
                                            <input type="text" class="form-control" id="inputStart" name="startdate" value="<%= nu.getStart_date()%>" required>
                                        </div>
                                    </div>

                                    <div class="form-group has-success">
                                        <label class="col-sm-2 control-label col-lg-2" for="inputSuccess">Date End</label>
                                        <div class="col-lg-5">
                                            <input type="text" class="form-control" id="inputEnd" name="enddate" value="<%= nu.getEnd_date()%>" required>
                                        </div>
                                    </div>

                                    <div class="form-group has-success">
                                        <label class="col-sm-2 control-label col-lg-2" for="inputSuccess"></label>
                                        <div class="col-lg-5">
                                            <button type="submit" style="width: 150px; height: 40px;" class="btn btn-info" id="btn1">Confirm Edit</button>
                                            <button style="width: 80px; height: 40px;" class="btn btn-danger" id="btn1" onclick="goBack()">Cancel</button>
                                        </div>
                                    </div>
                                </form>
                                <%}%>
                                ${message}
                            </div><!-- /form-panel -->
                        </div><!-- /col-lg-12 -->
                    </div><!-- /row -->


                    <!-- **********************************************************************************************************************************************************
                    RIGHT SIDEBAR CONTENT
                    *********************************************************************************************************************************************************** -->                  


                </section>
            </section>

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
    </body>
</html>
