<%-- 
    Document   : user_panel
    Created on : Apr 30, 2017, 3:39:58 PM
    Author     : Joe's
--%>

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
      <!-- **********************************************************************************************************************************************************
      TOP BAR CONTENT & NOTIFICATIONS
      *********************************************************************************************************************************************************** -->
      <!--header start-->
      <header class="header black-bg" style="background-color: #FFFF99;">
              <div class="sidebar-toggle-box">
                  <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
              </div>
            <!--logo start-->
            <a href="index_user.html" class="logo"><b style="color: black;">Welcome {USER}</b></a>
            <!--logo end-->
            <div class="nav notify-row" id="top_menu" style="margin-left: 30px;">
                <!--  notification start -->
                <ul class="nav top-menu">
                    <!-- settings start -->
                    <!-- settings end -->
                    <!-- inbox dropdown start-->
                    <li id="header_inbox_bar" class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="index.html#">
                            <i class="fa fa-envelope-o"></i>
                            <span class="badge bg-theme">4</span>
                        </a>
                        <ul class="dropdown-menu extended inbox">
                            <div class="notify-arrow notify-arrow-green"></div>
                            <li>
                                <p class="green">You have 4 new messages</p>
                            </li>
                            <li>
                                <a href="index.html#">
                                    <span class="photo"><img alt="avatar" src="assets/img/ui-divya.jpg"></span>
                                    <span class="subject">
                                    <span class="from">พี่ดวงใจ</span>
                                    <span class="time">{Date}</span>
                                    </span>
                                    <span class="message">
                                        update Status
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a href="index.html#">
                                    <span class="photo"><img alt="avatar" src="assets/img/ui-divya.jpg"></span>
                                    <span class="subject">
                                    <span class="from">พี่ดวงใจ</span>
                                    <span class="time">{Date}</span>
                                    </span>
                                    <span class="message">
                                     Hi, I need your help with this.
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a href="index.html#">
                                    <span class="photo"><img alt="avatar" src="assets/img/ui-divya.jpg"></span>
                                    <span class="subject">
                                    <span class="from">พี่ดวงใจ</span>
                                    <span class="time">{Date}</span>
                                    </span>
                                    <span class="message">
                                        Love your new Dashboard.
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a href="index.html#">
                                    <span class="photo"><img alt="avatar" src="assets/img/ui-divya.jpg"></span>
                                    <span class="subject">
                                    <span class="from">พี่ดวงใจ</span>
                                    <span class="time">{Date}</span>
                                    </span>
                                    <span class="message">
                                        Please, answer asap.
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a href="index_user.html">See all messages</a>
                            </li>
                        </ul>
                    </li>
                    <!-- inbox dropdown end -->
                </ul>
                <!--  notification end -->
            </div>
            <div class="top-menu">
              <ul class="nav pull-right top-menu">
                    <li><a class="logout" href="login.html">Logout</a></li>
              </ul>
            </div>
        </header>
      
      <!-- **********************************************************************************************************************************************************
      MAIN SIDEBAR MENU
      *********************************************************************************************************************************************************** -->
      <!--sidebar start-->
      <aside>
          <div id="sidebar"  class="nav-collapse ">
              <!-- sidebar menu start-->
              <ul class="sidebar-menu" id="nav-accordion">
              
                  <p class="centered"><img src="assets/img/ui-sam.jpg" class="img-circle" width="60"></a></p>
                  <h5 class="centered">${Username}</h5>
                    
                  <li class="mt">
                      <a class="active" href="index_user.html">
                          <i class="fa fa-dashboard"></i>
                          <span>News Feed</span>
                      </a>
                  </li>

                  <li class="sub-menu">
                      <a href="javascript:;" >
                          <i class="fa fa-wrench"></i>
                          <span>Maintenance</span>
                      </a>
                      <ul class="sub">
                          <li><a  href="user_report_maintenance.html">Report Problem</a></li>
                          <li><a  href="user_maintenance_his.html">Maintenance History</a></li>
                      </ul>
                  </li>

                  <!-- เเว้นนนนนนนนนนนนนนนนน -->
                  <li class="sub-menu">
                      <a href="javascript:;" >
                          <i class="fa fa-key"></i>
                          <span>Key Card</span>  
                      </a>
                      <ul class="sub">
                          <li><a  href="user_report_maintenance.html">View Keycard</a></li>
                      </ul>
                  </li>


                   <!-- เเว้นนนนนนนนนนนนนนนนน -->
                  <li class="sub-menu">
                      <a href="javascript:;" >
                          <i class="fa fa-keyboard-o" style="size: 38px;"></i>
                          <span>General</span>
                      </a>
                      <ul class="sub">
                          <li><a  href="user_report_maintenance.html">Report Problem</a></li>
                          <li><a  href="user_maintenance_his.html">History</a></li>
                      </ul>
                  </li>


                   <!-- เเว้นนนนนนนนนนนนนนนนน -->
                  <li class="sub-menu">
                      <a href="javascript:;" >
                         <i class="material-icons">bluetooth</i>
                          <span>Bluetooth</span>
                      </a>
                      <ul class="sub">
                          <li><a  href="user_report_maintenance.html">Request Keycard</a></li>
                          <li><a  href="user_maintenance_his.html">History</a></li>
                      </ul>
                  </li>

              <!-- sidebar menu end-->
          </div>
      </aside>
      <!--sidebar end-->
      
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
                      <form class="form-inline" role="form">
                          <div class="form-group">
                              <label class="sr-only" for="exampleInputEmail2">Email address</label>
                              <input type="text" class="form-control" id="exampleInputEmail2" placeholder="Search">
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
                     
                      
                        <div class="col-md-3 col-sm-3 mb" data-toggle="modal" data-target="#myModal">
                          <div class="white-panel pn white-header">
                            <div class="white-header">
                                <h5 style="color:black;"><b>Announcement</b></h5>
                            </div>
                            <div style="height: 155px;">
                              <!--i class="material-icons" style="font-size:150px; object-fit: contain; color:#66CC00;">fiber_new</i-->
                              <img src="lbh.jpg" style="height: 100%; width: 100%; object-fit: contain;">
                              <div class="white-panel pn white-header" style="height: 40px;">
                                <h5 style="float: left; color: #00c5de;"><b>2017-08-22</b></h5>
                                <h5 style="float: right; color: #262626;">Post By Admin</h5>
                              </div>
                            </div>
                            
               
                
                          </div><! --/grey-panel -->
                        </div><!-- /col-md-3-->


                        <!-- เว้นนน -->

                <div class="col-md-3 col-sm-3 mb" data-toggle="modal" data-target="#myModal">
                          <div class="white-panel pn white-header">
                            <div class="white-header">
                              <h5>ใส่วันที่</h5>
                            </div>
                            <div style="height: 155px; background-color: #00c5de;">
                              <i class="material-icons" style="font-size:150px; object-fit: contain; color:#889199;">warning</i>
                              <div class="white-panel pn white-header" style="height: 40px;">
                                <h5>ใส่หัวข้อข่าว</h5>
                              </div>
                            </div>
                            
               
                
                          </div><! --/grey-panel -->
                        </div><!-- /col-md-3-->

                        
                  <!-- เว้นนน -->


                 <div class="col-md-3 col-sm-3 mb" data-toggle="modal" data-target="#myModal">
                          <div class="white-panel pn white-header">
                            <div class="white-header">
                              <h5>ใส่วันที่</h5>
                            </div>
                           
                            <div style="height: 155px;">
                              <i class="material-icons" style="font-size:150px; object-fit: contain; color : #889199;">build</i>

                              <div class="white-panel pn white-header" style="height: 40px;">
                                <h5>ใส่หัวข้อข่าว</h5>
                              </div>
                            </div>
                            
               
                
                          </div><! --/grey-panel -->
                        </div><!-- /col-md-3-->

                    <!-- เว้น -->

               <div class="col-md-3 col-sm-3 mb" data-toggle="modal" data-target="#myModal" >
                          <div class="white-panel pn white-header">
                            <div class="white-header">
                              <h5>ใส่วันที่</h5>
                            </div>
                            
                            <div style="height: 155px;">
                              <i class="material-icons" style="font-size:150px; object-fit: contain; color : #889199;">email</i>

                              <div class="white-panel pn white-header" style="height: 40px;">
                                <h5>ใส่หัวข้อข่าว</h5>
                              </div>
                            </div>
                           
               
                
                          </div><! --/grey-panel -->
                        </div><!-- /col-md-3-->
                    
                            <!-- แถวล่าง -->
         

          
                  </div><!-- row -->

                  <div class="row mt">
                     
                      
                        <div class="col-md-3 col-sm-3 mb" data-toggle="modal" data-target="#myModal">
                          <div class="white-panel pn white-header">
                            <div class="white-header">
                              <h5 style="color:black;"><b>ข่าวทั่วไป</b></h5>
                            </div>
                            <div style="height: 155px;">
                              <img src="gen.jpg" style="height: 100%; width: 100%; object-fit: contain;">
                              <div class="white-panel pn white-header" style="height: 40px;">
                                <h5>ใส่หัวข้อข่าว</h5>
                              </div>
                            </div>
               
                
                          </div><! --/grey-panel -->
                        </div><!-- /col-md-3-->


                        <!-- เว้นนน -->

                <div class="col-md-3 col-sm-3 mb" data-toggle="modal" data-target="#myModal">
                          <div class="white-panel pn white-header">
                            <div class="white-header">
                              <h5 style="color:black;"><b>ข่าวด่วน</b></h5>
                            </div>
                            <div style="height: 155px;">
                              <img src="amb.jpg" style="height: 100%; width: 100%; object-fit: contain;">

                              <div class="white-panel pn white-header" style="height: 40px;">
                                <h5>ใส่หัวข้อข่าว</h5>
                              </div>
                            </div>
                            
               
                
                          </div><! --/grey-panel -->
                        </div><!-- /col-md-3-->

                        
                  <!-- เว้นนน -->


                 <div class="col-md-3 col-sm-3 mb" data-toggle="modal" data-target="#myModal">
                          <div class="white-panel pn white-header">
                            <div class="white-header">
                              <h5 style="color:black;"><b>ข่าวซ่อมบำรุง</b></h5>
                            </div>
                           
                            <div style="height: 155px;">
                              <img src="mtn.jpg" style="height: 100%; width: 100%; object-fit: contain;">

                              <div class="white-panel pn white-header" style="height: 40px;">
                                <h5>ใส่หัวข้อข่าว</h5>
                              </div>
                            </div>
                            
               
                
                          </div><! --/grey-panel -->
                        </div><!-- /col-md-3-->

                    <!-- เว้น -->

               <div class="col-md-3 col-sm-3 mb" data-toggle="modal" data-target="#myModal" >
                          <div class="white-panel pn white-header">
                            <div class="white-header">
                              <h5 style="color:black;"><b>ข่าวโฆษณา / ประชาสัมพันธ์</b></h5>
                            </div>
                            
                            <div style="height: 155px;">
                              <img src="ads.jpg" style="height: 100%; width: 100%; object-fit: contain;">

                              <div class="white-panel pn white-header" style="height: 40px;">
                                <h5>ใส่หัวข้อข่าว</h5>
                              </div>
                            </div>
                           
               
                
                          </div><! --/grey-panel -->
                        </div><!-- /col-md-3-->
                    
                            <!-- แถวล่าง -->
         

          
                  </div><!-- row -->


                  <center>
                    <div class="col-lg-12" >
                        <nav aria-label="Page navigation example">
                          <ul class="pagination pagination-lg">
                            <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                            <li class="page-item"><a class="page-link" href="#">1</a></li>
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item"><a class="page-link" href="#">Next</a></li>
                          </ul>
                        </nav>
                    </div>
                  </center>

                  <!-- Modal -->
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">ใส่วันที่</h4>
                  </div>
                  <div class="modal-body">
                    <h3>สระปิดวันที่ บลาๆๆๆ ไำเทาดสหวสกาดาดสกอวะเาดส (หัวข้อข่าว)</h3>

                    <img src="toilet.jpg" style="height: 100%; width: 100%; object-fit: contain;">

                    <br>
                    <br>
                    <br>
                    <p>"ยังไงก็ตามจากที่ได้ครุ่นคิดอย่างหนักและยาวนาน ผมบอกกับแกเร็ธว่าผมตัดสินใจรีไทร์จากฟุตบอลทีมชาติ เป็นการตัดสินใจที่ยากมากและเป็นการตัดสินใจที่ผมปรึกษากับครอบครัว, ผู้จัดการทีมที่เอฟเวอร์ตันและคนใกล้ชิด"</p>

                    <iframe src="//www.youtube.com/embed/8rRfqWcz-mw" width="560" height="314" allowfullscreen="allowfullscreen"></iframe>

                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                  </div>
                </div>
              </div>
            </div>              
              </div><!-- /showback -->

                  
                  
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
    </script>
  

  </body>
</html>
