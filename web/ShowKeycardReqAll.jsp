<%-- 
    Document   : ShowKeycardReqAll
    Created on : May 7, 2017, 6:50:15 PM
    Author     : Mix
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Dashboard">
        <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

        <title>Kecard Management Admin</title>

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
            <!-- **********************************************************************************************************************************************************
            TOP BAR CONTENT & NOTIFICATIONS
            *********************************************************************************************************************************************************** -->
            <!--header start-->
            <header class="header black-bg">
                <div class="sidebar-toggle-box">
                    <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
                </div>
                <!--logo start-->
                <a href="index.html" class="logo"><b>Welcome Admin</b></a>
                <!--logo end-->
                <div class="nav notify-row" id="top_menu">
                    <!--  notification start -->


            </header>
            <jsp:include page="adminBar.jsp"/>
            <!-- **********************************************************************************************************************************************************
            MAIN CONTENT
            *********************************************************************************************************************************************************** -->
            <!--main content start-->
            ...............
            <section id="main-content">
                <section class="wrapper site-min-height">

                    <h3>Keycard Management</h3>
                    <div class="row mt">
                        <div class="col-lg-12">
                            <div class="content-panel">

                                <section id="unseen">
                                    <table class="table table-bordered table-striped table-condensed">
                                        <thead>
                                            <tr>
                                                <th><center>Room</center></th>
                                        <th><center>Key ID</center></th>
                                        <th><center>Request Type</center></th>
                                        <th><center>Status</center></th>
                                        <th><center>Request Date</center></th>
                                        <th><center>Approved</center></th>
                                        <th><center>Rejected</center></th>
                                        <th><center>Download Document</center></th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${keycardreqs}" var="kr" varStatus="vs">
                                                <tr>
                                                    <td class="numeric"><center>${kr.keycard.room.room_id}</center></td>
                                            <td class="numeric"><center>${kr.keycard.keyId}</center></td>
                                                <c:choose>
                                                    <c:when test = "${kr.key_status_approve == 'WaitingNew'}">
                                                    <td><center>New keycard</center></td>
                                                    </c:when>
                                                    <c:when test = "${kr.key_status_approve == 'WaitingLost'}">
                                                    <td><center>Lost and Additional keycard</center></td>
                                                    </c:when>
                                                    <c:when test = "${kr.key_status_approve == 'WaitingAdd'}">
                                                    <td><center>Additional keycard</center></td>
                                                    </c:when>
                                                </c:choose>                                                   
                                            <td><center>Waiting</center></td>
                                            <td><center>${kr.key_date}</center></td>
                                            <td><a href="ApprovedKeycard?krid=${kr.key_req_id}&kid=${kr.keycard.keyId}&roomid=${kr.keycard.room.room_id}&krstatus=${kr.key_status_approve}"><center><button type="button" class="btn btn-success">Approved</button></center></a></td>
                                            <td><a href="RejectedKeycard?krid=${kr.key_req_id}"><center><button type="button" class="btn btn-danger">Rejected</button></center></a></td>
                                            <td><center><button type="button" class="btn btn-info" onclick="getDocModalTriggle(${kr.key_req_id})">Download</button></center></td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </section>
                            </div><!-- /content-panel -->
                        </div><!-- /col-lg-4 -->     
                    </div><!-- /row -->

                </section><! --/wrapper -->

                <!-- Modal downloadDoc -->
                <div class="modal fade" id="downloadDocModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title" id="myModalLabel">Upload Document for Request New Keycard</h4>
                            </div>
                                <div class="modal-body">        
                                    <div>
                                        <a href="" id="idcardLink" download>
                                            <button type="button" id="idcardBtn" class="btn btn-primary btn-lg btn-block" style="display : none">Download ID card Document</button>
                                        </a>
                                        <a href="" id="leaseLink" download>
                                            <button type="button" id="leaseBtn" class="btn btn-primary btn-lg btn-block" style="display : none">Download Lease Agreement</button>
                                        </a> 
                                        <a href="" id="noticeLink" download>
                                            <button type="button" id="noticeBtn"  class="btn btn-primary btn-lg btn-block" style="display : none">Download Notice Document</button>
                                        </a> 
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                </div>
                        </div>
                    </div>
                </div>

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
                                            function getDocModalTriggle(reqId) {
                                                $.get("GetKeycardRequestById", {keycardReqId: reqId}, function (data) {
                                                    $('#idcardBtn').css('display', 'none');
                                                    $('#leaseBtn').css('display', 'none');
                                                    $('#noticeBtn').css('display', 'none');
                                                    
                                                    if(data.key_doc_idCard != null){
                                                        $('#idcardLink').prop('href', "${pageContext.request.contextPath}"+"/new_request_doc/"+data.keycard.room.room_id+"/"+data.key_doc_idCard);
                                                        $('#idcardBtn').css('display', '');
                                                    }
                                                    if(data.key_doc_agreement != null){
                                                        $('#leaseLink').prop('href', "${pageContext.request.contextPath}"+"/new_request_doc/"+data.keycard.room.room_id+"/"+data.key_doc_agreement);
                                                        $('#leaseBtn').css('display', '');
                                                    }
                                                    if(data.key_doc_ticket != null){
                                                        $('#noticeLink').prop('href', "${pageContext.request.contextPath}"+"/lost_request_doc/"+data.keycard.room.room_id+"/"+data.key_doc_ticket);
                                                        $('#noticeBtn').css('display', '');
                                                    }
                                                    $('#downloadDocModal').modal('toggle');
                                                }, "json");
                                            }

        </script>

    </body>
</html>

