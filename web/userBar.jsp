<%-- 
    Document   : userBar
    Created on : Apr 30, 2017, 3:42:55 PM
    Author     : Joe's
--%>
<%@page import="Model.Moving"%>
<%@page import="Model.Decoration"%>
<%@page import="Model.parcel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- **********************************************************************************************************************************************************
           TOP BAR CONTENT & NOTIFICATIONS
           *********************************************************************************************************************************************************** -->
<!--header start-->
<header class="header black-bg" style="background-color: #FFFF99;">
    <div class="sidebar-toggle-box">
        <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
    </div>
    <!--logo start-->
    <a href="user_panel.jsp" class="logo"><b style="color: black;">Welcome {USERNAME}</b></a>
    <!--logo end-->
    <%
    int roomId = (Integer) request.getSession().getAttribute("roomId");    
    int parAmt = parcel.getAmtParcelByRoomId(roomId);
    int decAmt = Decoration.getAmountReqNoti(roomId);
    int movAmt = Moving.getAmountReqNoti(roomId);
    %>
    <div class="nav notify-row" id="top_menu" style="margin-left: 30px;">
        <!--  notification start -->
        <ul class="nav top-menu">
            
            <!-- PARCEL -->
            <li id="header_inbox_bar" class="dropdown">
                <a class="dropdown-toggle" <%=parAmt==0?"":"href='userParcel?room="%>${roomId}'>
                    <i class="fa fa-envelope"></i>
                    <span class="badge bg-theme"><%=parAmt==0?"":parAmt%></span>
                </a>
            </li>
            <!-- MTN -->
            <li id="header_inbox_bar" class="dropdown">
                <a class="dropdown-toggle">
                    <i class="fa fa-wrench"></i>
                <!--    <span class="badge bg-theme">1</span> -->
                </a>
            </li>
            <!-- KEYCARD -->
            <li id="header_inbox_bar" class="dropdown">
                <a class="dropdown-toggle">
                    <i class="fa fa-key"></i>
                <!--    <span class="badge bg-theme">1</span> -->
                </a>
            </li>
            <!-- BLUETOOTH -->
            <li id="header_inbox_bar" class="dropdown">
                <a class="dropdown-toggle">
                    <i class="fa fa-car"></i>
                <!--    <span class="badge bg-theme">1</span> -->
                </a>
            </li>
            <!-- DECORATE -->
            <li id="header_inbox_bar" class="dropdown">
                <a class="dropdown-toggle" <%=decAmt==0?"":"href='userViewHistory?roomNo="%>${roomId}'>
                    <i class="fa fa-gavel"></i>
                 <span class="badge bg-theme"><%=decAmt==0?"":decAmt%></span>
                </a>
            </li>
            <!-- MOVING -->
            <li id="header_inbox_bar" class="dropdown">
                <a class="dropdown-toggle" <%=movAmt==0?"":"href='userMovHistory?roomNo="%>${roomId}'>
                    <i class="fa fa-truck"></i>
                <span class="badge bg-theme"><%=movAmt==0?"":movAmt%></span>
                </a>
            </li>
            <!-- inbox dropdown end -->
        </ul>
        <!--  notification end -->
    </div>
    <div class="top-menu">
        <ul class="nav pull-right top-menu">
            <li><a class="logout" href="logout">Logout</a></li>
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
            <h5 class="centered">{Username}</h5>

            <li class="mt">
                <a href="user_panel.jsp">
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
                    <li><a  href="userMtnReq.jsp">Create a Request</a></li>
                    <li><a  href="MTNSearchRoom?id=${roomId}">Request History</a></li>
                </ul>
            </li>

            <!-- เเว้นนนนนนนนนนนนนนนนน -->
            <li class="sub-menu">
                <a href="javascript:;" >
                    <i class="fa fa-comment" style="size: 38px;"></i>
                    <span>Report Problem</span>
                </a>
                <ul class="sub">
                    <li><a  href="problemReportForm.jsp">Report Problem</a></li>
                    <li><a  href="reportHistory?roomNo=${roomId}">History</a></li>
                </ul>
            </li>
            <!-- เเว้นนนนนนนนนนนนนนนนน -->
            <li class="sub-menu">
                <a href="javascript:;" >
                    <i class="fa fa-key"></i>
                    <span>Key Card</span>
                </a>
                <ul class="sub">
                    <li><a  href="SearchKeycardByRoom">Request Keycard</a></li>                                
                </ul>
            </li>
            
            <li class="sub-menu">
                <a href="javascript:;" >
                    <i class="fa fa-car"></i>
                    <span>Car Bluetooth</span>
                </a>
                <ul class="sub">
                    <li><a  href="ListApprovedBluetoothReqByRoom">Bluetooth Request</a></li>                                
                </ul>
            </li>

            <!-- เเว้นนนนนนนนนนนนนนนนน -->
            <li class="sub-menu">
                <a href="javascript:;" >
                    <i class="fa fa-envelope-o"></i>
                    <span>Parcel box</span>
                </a>
                <ul class="sub">
                    <li><a  href="userParcel?room=${roomId}">View Inbox</a></li>                                
                </ul>
            </li>

            <li class="sub-menu">
                <a href="javascript:;" >
                    <i class="fa fa-gavel"></i>
                    <span>Decoration Request</span>  
                </a>
                <ul class="sub">
                    <li><a  href="userDecReq.jsp">Request for decoration</a></li>
                    <li><a  href="userViewHistory?roomNo=${roomId}">Request History</a></li>
                </ul>
            </li>
            <li class="sub-menu">
                <a href="javascript:;" >
                    <i class="fa fa-truck"></i>
                    <span>Moving Stuff Request</span>  
                </a>
                <ul class="sub">
                    <li><a  href="userMovReq.jsp">Request for Moving</a></li>
                    <li><a  href="userMovHistory?roomNo=${roomId}">Request History</a></li>
                </ul>
            </li>
            <li class="sub-menu">
                <a href="javascript:;" >
                    <i class="fa fa-book"></i>
                    <span>Contact Staff</span>  
                </a>
                <ul class="sub">
                    <li><a  href="userViewStaff">Open Phonebook</a></li>
                </ul>
            </li>
            <!-- sidebar menu end-->
    </div>
</aside>
<!--sidebar end-->
