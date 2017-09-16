<%-- 
    Document   : KeycardReq
    Created on : May 7, 2017, 7:35:37 PM
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

        <title>Keycard Request</title>

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
                    <div class="row mt">
                        <c:forEach items="${btReqList}" var="btReq" varStatus="vs">
                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 desc">
                                <div class="white-panel pn donut-chart">
                                    <div class="white-header">
                                        <h3>Bluetooth Request ID : ${btReq.btReqId}</h3>
                                    </div>

                                    <div class="row">
                                        <div class="col-sm-12">

                                            <h3 id="h3test">Status : ${btReq.btReqStatus}</h3>
                                            <br>
                                            <c:choose>
                                                <c:when test="${btReq.btReqStatus == 'Available'}">    
                                                    <center>                                         
                                                        <button type="button" onclick="printObject('${vs.index}')" class="btn btn-success">printObject</button>                                                 
                                                    </center>
                                                </c:when>
                                            </c:choose>
                                        </div>
                                    </div>
                                    <canvas id="serverstatus01" height="120" width="120"></canvas>

                                </div><!-- white-panel -->

                            </div><!-- col-lg-4 -->
                        </c:forEach>      
                    </div><!-- Row mt-->
                    
                    <div class="row mt">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 desc">
                            <div class="white-panel pn donut-chart">
                                <div class="white-header">
                                    <h3 style="color:black;">Request History AAAAAAA</h3>
                                </div>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <table class="table table-bordered table-striped table-condensed">
                                            <thead>
                                                <tr>
                                                    <th><center style="color:black;">Key ID</center></th>
                                                    <th><center style="color:black;">Status</center></th>
                                                    <th><center style="color:black;">Request Date</center></th>                                                  
                                                </tr>
                                            </thead>
                                            <tbody id="records_table" style="color:black;">

                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <canvas id="serverstatus01" height="120" width="120"></canvas>
                            </div>
                        </div>
                    </div>  

                    <!-- **********************************************************************************************************************************************************
                    RIGHT SIDEBAR CONTENT
                    *********************************************************************************************************************************************************** -->                  
                    
                    <!-- Modal Loading -->
                    <div class="modal fade" id="loadingModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">                               
                                <div class="modal-body">
                                <!-- ANIMATED PROGRESS BARS -->                                   
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar" id="loadingBar" role="progressbar" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100" style="width: 25%"></div>
                                    </div>                                   
                                </div>                                                
                            </div>
                        </div>
                    </div>
                    
                    <!-- Modal Message -->
                    <div class="modal fade" id="messageModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">                               
                                <div class="modal-body">
                                    <center><h3 id="messageLog"></h3></center>                               
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Modal RequestDetail -->
                    <div class="modal fade" id="requestDetailModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    <h4 class="modal-title" id="myModalLabel">Cant sent new request</h4>
                                </div>
                                <div class="modal-body">
                                    <div>
                                        <center>
                                            <h4>You already has keycard request in queue of process.</h4>
                                            <p>
                                                <button type="button" class="btn btn-info" data-toggle="collapse" data-target="#requestDetailCollapse" aria-expanded="false" aria-controls="requestDetailCollapse">
                                                    See Detail
                                                </button>
                                            </p>
                                        </center>
                                    </div>
                                    <div class="collapse" id="requestDetailCollapse">
                                        <div class="alert alert-info">
                                            <div class="form-horizontal tasi-form">
                                                <div class="form-group">
                                                    <div class="col-lg-2 col-sm-2"></div>
                                                    <label class="col-lg-5 col-sm-5 control-label">Keycard ID : </label>
                                                    <div class="col-lg-5">
                                                        <p class="form-control-static" id="requestKeycardId"></p>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="col-lg-2 col-sm-2"></div>
                                                    <label class="col-lg-5 col-sm-5 control-label">Request Type : </label>
                                                    <div class="col-lg-5">
                                                        <p class="form-control-static" id="requestType"></p>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="col-lg-2 col-sm-2"></div>
                                                    <label class="col-lg-5 col-sm-5 control-label">Status : </label>
                                                    <div class="col-lg-5">
                                                        <p class="form-control-static" id="requestStatus"></p>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="col-lg-2 col-sm-2"></div>
                                                    <label class="col-lg-5 col-sm-5 control-label">Request Date : </label>
                                                    <div class="col-lg-5">
                                                        <p class="form-control-static" id="requestDate"></p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>                                 
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>                                    
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Modal NewRequest -->
                    <div class="modal fade" id="requestNewKeycardModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    <h4 class="modal-title" id="myModalLabel">Upload Document for Request New Keycard</h4>
                                </div>
                                <form action="NewKeycardRequestDocUpload" id="requestNewKeycardForm" method="post" enctype="multipart/form-data">
                                    <div class="modal-body">
                                        <div>
                                            <input type="file" id="idcardUpload" name="file" class="btn btn-primary btn-lg btn-block" style="display:none"/>
                                            <input type="file" id="leaseUpload" name="file" class="btn btn-primary btn-lg btn-block" style="display:none"/>
                                        </div>
                                        <div>
                                            <button type="button" onclick="idcardUploadClick()" class="btn btn-primary btn-lg btn-block">Upload ID card</button>
                                            <center><h3 id="select_idcard"></h3></center>
                                            <button type="button" onclick="leaseUploadClick()" class="btn btn-primary btn-lg btn-block">Upload Lease Agreement</button>
                                            <center><h3 id="select_lease"></h3></center>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                        <input type="submit" class="btn btn-primary" value="Submit"/>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Modal requestLostModal -->
                    <div class="modal fade" id="requestLostModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    <h4 class="modal-title" id="myModalLabel">Upload Document for Request</h4>
                                </div>
                                <form action="LostKeycardRequestDocUpload" class="form-horizontal tasi-form" id="requestLostKeycardForm" method="post" enctype="multipart/form-data">
                                    <div class="modal-body">  
                                        <div class="form-group btn-block">
                                            <label class="col-sm-4 control-label col-lg-4" for="selectLostKeycard">Lost Keycard ID : </label>
                                            <div class="col-lg-8">
                                                <select class="form-control" id="selectLostKeycard" name="lostKeyId">
                                                    <c:forEach items="${keycards}" var="k" varStatus="vs">
                                                        <c:choose>
                                                            <c:when test="${k.keyStatus == 'Available'}">
                                                                <option value="${k.keyId}">${k.keyId}</option>
                                                            </c:when>
                                                        </c:choose>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <div>
                                            <input type="file" id="noticeDocUpload" name="file" class="btn btn-primary btn-lg btn-block" style="display:none"/>
                                        </div>
                                        <div>
                                            <button type="button" onclick="noticeDocUploadClick()" class="btn btn-primary btn-lg btn-block">Upload Notice Document</button>
                                            <center><h3 id="select_noticeDoc"></h3></center>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                        <input type="submit" class="btn btn-primary" value="Submit"/>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Modal Lost Add -->
                    <div class="modal fade" id="requestLostAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    <h4 class="modal-title" id="myModalLabel">Select type of your request</h4>
                                </div>                                
                                <div class="modal-body">
                                    <div>                          
                                        <button type="button" onclick="selectTypeLost()" class="btn btn-primary btn-lg btn-block">Inform lost keycard and request additional keycard</button>
                                        <button type="button" onclick="selectTypeAdd()" class="btn btn-primary btn-lg btn-block">request additional keycard</button>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                </div>                                
                            </div>
                        </div>
                    </div>
                    
                    
                    
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
        <script src="assets/js/jquery.form.min.js"></script>


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
                
                listAllMyRequest();
                
                //upload file for lost request
                $("#requestLostKeycardForm").ajaxForm({
                    success: function() {
                        $('#messageLog').css('color', 'green');
                        $('#messageLog').html('Your request complete. Wait for approve.');
                        $('#requestLostModal').modal('toggle');
                        $('#messageModal').modal('toggle');
                    },
                    error: function(){ 
                        $('#messageLog').css('color', 'red');
                        $('#messageLog').html('Cant upload your file!');
                        $('#requestLostModal').modal('toggle');
                        $('#messageModal').modal('toggle');
                    }
                });

                //upload file for new request
                $("#requestNewKeycardForm").ajaxForm({
                    success: function() {
                        $('#messageLog').css('color', 'green');
                        $('#messageLog').html('Your request complete. Wait for approve.');
                        $('#requestNewKeycardModal').modal('toggle');
                        $('#messageModal').modal('toggle');
                    },
                    error: function(){ 
                        $('#messageLog').css('color', 'red');
                        $('#messageLog').html('Cant upload your file!');
                        $('#requestNewKeycardModal').modal('toggle');
                        $('#messageModal').modal('toggle');
                    }
                });
                
            });


            function myNavFunction(id) {
            $("#date-popover").hide();
            var nav = $("#" + id).data("navigation");
            var to = $("#" + id).data("to");
            console.log('nav ' + nav + ' to: ' + to.month + '/' + to.year);
            }

            //click to requestNewKeycard By AJAX
            function requestNewKeycard(keycardId){
                $('#loadingBar').width(25+'%');
                $('#loadingModal').modal('toggle');
                $.get( 'CheckKeycardRequest', {keyId: keycardId}, function(data){
                    $('#loadingBar').width(100+'%');
                    $('#loadingModal').modal('toggle');
                    
                    if(data.key_req_id != null){
                        $('#requestKeycardId').html(data.keycard.keyId);
                        
                        if(data.key_status_approve == 'WaitingNew'){
                            $('#requestType').html('First keycard request');
                        }else if(data.key_status_approve == 'WaitingLost'){
                            $('#requestType').html('Lost and Additional keycard request');
                        }else if(data.key_status_approve == 'WaitingAdd'){
                            $('#requestType').html('Additional keycard request');                           
                        }
                        
                        $('#requestStatus').html('Wait for approve your request');
                        $('#requestDate').html(data.key_date);
                        $('#requestDetailModal').modal('toggle');
                    }else if(data == 'LostOrAddition'){
                        $('#requestLostAddModal').modal('toggle');
                    }else if(data == 'RequestDoc'){
                        $('#requestNewKeycardModal').modal('toggle');
                    }
                }, 'json')
            }
            
            //trigger idcardUpload input
            function idcardUploadClick(){
                $('#idcardUpload').trigger('click');
                $('#idcardUpload').change(function() {
                    var filename = $('#idcardUpload').val();
                    $('#select_idcard').html(filename);
                });
            }
                       
            //trigger leaseUpload input
            function leaseUploadClick(){
                $('#leaseUpload').trigger('click');
                $('#leaseUpload').change(function() {
                    var filename = $('#leaseUpload').val();
                    $('#select_lease').html(filename);
                });
            } 
            
            //trigger noticeDocUpload input
            function noticeDocUploadClick(){
                $('#noticeDocUpload').trigger('click');
                $('#noticeDocUpload').change(function() {
                    var filename = $('#noticeDocUpload').val();
                    $('#select_noticeDoc').html(filename);
                });
            }
            
            //request additional keycard by AJAX
            function requestAdditionalKeycard(){
                $.get( "AddKeycardRequest", function(){
                    $('#messageLog').css('color', 'green');
                    $('#messageLog').html('Your request complete. Wait for approve.');
                    $('#requestLostAddModal').modal('toggle');
                    $('#messageModal').modal('toggle');
                })
            }
            
            //select modal
            function selectTypeLost(){
                $('#requestLostAddModal').modal('toggle');
                $('#requestLostModal').modal('toggle');
            }
            function selectTypeAdd(){
                requestAdditionalKeycard();
            }
            
            //get all request
            function listAllMyRequest(){
                $.post("ListAllMyRequest",function(data){
                    $.each(data, function(i, keycardReq) {
                        var statusText = "";
                        if(keycardReq.key_status_approve == "Approve"){
                            statusText = "Approve";
                        }else if(keycardReq.key_status_approve == "Rejected"){
                            statusText = "Rejected";
                        }else if(keycardReq.key_status_approve == "WaitingNew"){
                            statusText = "Wait for Approve";
                        }else if(keycardReq.key_status_approve == "WaitingLost"){
                            statusText = "Wait for Approve";
                        }else if(keycardReq.key_status_approve == "WaitingAdd"){
                            statusText = "Wait for Approve";
                        }     
                        var $tr = $('#records_table').append($('<tr>')
                            .append(
                                $('<td>').text(keycardReq.keycard.keyId),
                                $('<td>').text(statusText),
                                $('<td>').text(keycardReq.key_date),
                            )
                        )
                    });
                }, "json")
            }
            
            function printObject(index){
                console.log(index);
                $('#h3test').html('${btReqList[0].btReqStatus}');
            }
        </script>
        ${message}

    </body>
</html>
