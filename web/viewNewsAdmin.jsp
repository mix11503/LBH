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

        <title>Announcement</title>

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
            ...............
            <section id="main-content">
                <section class="wrapper site-min-height">

                    <div class="row mt">
                        <div class="col-lg-12">
                            <div class="form-panel" style="border-radius: 10px; height: 120px;" >
                                <h4 class="mb"><i class="fa fa-angle-right"></i> Announcement</h4>
                                <form class="form-inline" role="form" action="searchNews" method="get" style='float:left;'>
                                    <div class="form-group">
                                        Filter :
                                        <select class="form-control"  name="filter">
                                            <option disabled selected></option>
                                            <option value="All">All news</option>
                                            <option value="Current">Current News</option>
                                            <option value="Old">Old News</option>
                                            <option value="Remove">Recycle Bin</option>
                                        </select>
                                    </div>
                                    <button type="submit" class="btn btn-theme">Search</button>
                                </form>
                                <div class="form-group" style="margin-left: 40px;">
                                </div>
                                <form class="form-inline" role="form" action="searchNewsDate" method="get" style='float:left;'>
                                    <div class="form-group">
                                        &nbsp;&nbsp;&nbsp;Date 
                                        <label class="sr-only" for="exampleInputEmail2">Date Start</label>
                                        <input type="date" class="form-control" id="exampleInputEmail2" placeholder="date end"  name="start">
                                    </div>
                                    <div class="form-group">
                                        <label class="sr-only" for="exampleInputPassword2">Date End</label>
                                        <input type="date" class="form-control" id="exampleInputPassword2" placeholder="date end"  name="end">
                                    </div>
                                    <button type="submit" class="btn btn-theme">Search</button>
                                </form>
                                <div class="form-group" style="margin-left: 40px;">
                                </div>
                                <form class="form-inline" role="form" action="searchNewsKw" method="get" style='float:left;'>
                                    <div class="form-group">
                                        &nbsp;&nbsp;&nbsp;Enter Keyword 
                                        <input type="text" class="form-control" id="exampleInputEmail2" placeholder="text"  name="keyword">
                                    </div>
                                    <button type="submit" class="btn btn-theme">Search</button>

                                </form>
                            </div><!-- /form-panel -->
                        </div><!-- /col-lg-12 -->
                    </div><!-- /row -->

                    <div class="row mt">
                        <div class="row mt">
                            <jsp:include page="newsFilterCard.jsp"/>
                            <jsp:include page="newsDateCard.jsp"/>
                            <jsp:include page="newsKwCard.jsp"/>
                        </div> <!-- row -->            
                    </div><!-- /col-lg-9 END SECTION MIDDLE -->

                </section><! --/wrapper -->
            </section><!-- /MAIN CONTENT -->
            <!--main content end-->
            <!--footer start-->
            <footer class="site-footer">
                <div class="text-center">
                    2014 - Alvarez.is
                    <a href="blank.html#" class="go-top">
                        <i class="fa fa-angle-up"></i>
                    </a>
                </div>
            </footer>
            <!--footer end-->
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

        <script>
            //custom select box

            $(function () {
                $('select.styled').customSelect();
            });

        </script>

    </body>
</html>
