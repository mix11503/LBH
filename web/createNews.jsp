<%-- 
    Document   : createNews
    Created on : Aug 17, 2017, 8:48:26 PM
    Author     : Joe's
--%>

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
            <h2>Announcement</h2>               
                      <div class="row mt">
              <div class="col-lg-12">
                <div class="form-panel">
                      <h4 class="mb"><i class="fa fa-angle-right"></i> Create News Announcement</h4>
                          <form action="createNews" class="form-horizontal tasi-form" method="get" >
                              <div class="form-group has-success">
                                  <label class="col-sm-2 control-label col-lg-2" for="inputSuccess">Topic </label>
                                  <div class="col-lg-5">
                                      <input type="text" class="form-control" id="inputSuccess" name="topic" required>
                                  </div>
                                  
                              </div>
                              
                              <div class="form-group has-success">
                                  <label class="col-sm-2 control-label col-lg-2" for="inputSuccess">Description </label>
                                  <div class="col-lg-10">
                                      <textarea name="desc"></textarea>
                                  </div>
                                  
                              </div>
                              
                              <div class="form-group has-success">
                                  <label class="col-sm-2 control-label col-lg-2" for="inputSuccess">Category</label>
                                  <div class="col-lg-5">
                                      <select class="form-control" id="a" name="category" required>
                                            <option selected="true" disabled="disabled">Select News Category</option>
                                            <option value="gen">General News</option>
                                            <option value="amb">Emergency News</option>
                                            <option value="mtn">Maintenance News</option>
                                            <option value="ads">Advertisement News</option>
                                     </select>
                                  </div>
                              </div>
                              
                              <h4 class="mb"><i class="fa fa-angle-right"></i> Period Available</h4>

                              <div class="form-group has-success">
                                  <label class="col-sm-2 control-label col-lg-2" for="inputSuccess">Date Start</label>
                                  <div class="col-lg-5">
                                      <input type="text" class="form-control" id="inputStart" name="startdate" required>
                                  </div>
                              </div>

                              <div class="form-group has-success">
                                  <label class="col-sm-2 control-label col-lg-2" for="inputSuccess">Date End</label>
                                  <div class="col-lg-5">
                                      <input type="text" class="form-control" id="inputEnd" name="enddate" required>
                                  </div>
                              </div>
                              
                              <h4 class="mb"><i class="fa fa-angle-right"></i> Notification Tag</h4>
                              <div class="form-group has-success">
                              <label class="col-sm-2 control-label col-lg-2" for="inputSuccess">Group Tag</label>
                                  <div class="col-lg-10">
                                    <label class="checkbox-inline">
                                      <input type="checkbox"  name="0" value="0" id="all"> All Room
                                    </label>
                                    <label class="checkbox-inline">
                                      <input type="checkbox"  name="200" value="200" class="group1"> Floor 2
                                    </label>
                                    <label class="checkbox-inline">
                                      <input type="checkbox"  name="300" value="300" class="group1"> Floor 3
                                    </label>
                                    <label class="checkbox-inline">
                                      <input type="checkbox"  name="400" value="400" class="group1"> Floor 4
                                    </label>
                                    <label class="checkbox-inline">
                                      <input type="checkbox"  name="500" value="500" class="group1"> Floor 5
                                    </label>
                                    <label class="checkbox-inline">
                                      <input type="checkbox"  name="600" value="600" class="group1"> Floor 6
                                    </label>
                                    <label class="checkbox-inline">
                                      <input type="checkbox"  name="700" value="700" class="group1"> Floor 7
                                    </label>
                                    <label class="checkbox-inline">
                                      <input type="checkbox"  name="800" value="800" class="group1"> Floor 8
                                    </label>
                                  </div>
                              </div>

                              <div class="form-group has-success">
                                  <label class="col-sm-2 control-label col-lg-2" for="inputSuccess">Tag Flag</label>
                                  <div class="col-lg-5">
                                     <select class="form-control" id="a">
                                            <option selected="true" disabled="disabled">Select your Tag</option>
                                            <option value="1">ห้องที่ค้างชำระค่าส่วนกลาง</option>
                                            <option value="2">ห้องที่ค้างชำระค่าไฟ</option>
                                            <option value="3">ห้องที่ค้างชำระค่าน้ำ</option>
                                            <option value="4">ห้องที่พัสดุตกค้าง</option>
                                     </select>
                                  </div>
                              </div>
                              
                              <div class="form-group has-success">
                              <label class="col-sm-2 control-label col-lg-2" for="inputSuccess"></label>
                              <div class="col-lg-5">
                              <button type="submit" style="width: 80px; height: 40px;" class="btn btn-success" id="btn1">Post</button>
                              </div>
                              </div>
                          </form>
                </div><!-- /form-panel -->
              </div><!-- /col-lg-12 -->
            </div><!-- /row -->
                  
                  
      <!-- **********************************************************************************************************************************************************
      RIGHT SIDEBAR CONTENT
      *********************************************************************************************************************************************************** -->                  
                  
                  
          </section>
  </section>
        <%}}%>
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


        // var daysToAdd = 0;
        // $("#inputStart").datepicker({
        //     onSelect: function (selected) {
        //         var dtMax = new Date(selected);
        //         dtMax.setDate(dtMax.getDate() + daysToAdd); 
        //         var dd = dtMax.getDate();
        //         var mm = dtMax.getMonth() + 1;
        //         var y = dtMax.getFullYear();
        //         var dtFormatted = y + '-'+ mm + '-'+ dd;
        //         $("#inputEnd").datepicker("option", "minDate", dtFormatted);
        //     }
        //   });

      // $(function(){
      //     $('select.styled').customSelect();
      // });

  </script>
  
  <script>
      $('#all').change(function(){
          if($(this).prop("checked")){
              $("input.group1").prop("disabled","disabled");
          }else{
              $("input.group1").removeAttr("disabled");
          }
      });
      </script>
        
  </body>
</html>