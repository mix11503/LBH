<%-- 
    Document   : userBar
    Created on : Apr 30, 2017, 3:42:55 PM
    Author     : Joe's
--%>

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
    <a href="userIndex?roomid=201" class="logo"><b style="color: black;">Welcome {USERNAME}</b></a>
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
                    <span class="badge bg-theme">1</span>
                </a>
                <ul class="dropdown-menu extended inbox">
                    <div class="notify-arrow notify-arrow-green"></div>
                    <li>
                        <p class="green">You have 1 new messages</p>
                    </li>
                    <li>
                        <a href="mtnProgress?mtnId=10001">
                            <span class="photo"><img alt="avatar" src="assets/img/ui-divya.jpg"></span>
                            <span class="subject">
                                <span class="from">Admin Duengjai</span>
                                <span class="time">9/5/2017</span>
                            </span>
                            <span class="message">
                                Your request has been done!
                            </span>
                        </a>
                    </li>

                    <li>
                        <a href="">See all messages</a>
                    </li>
                </ul>
            </li>
            <!-- inbox dropdown end -->
        </ul>
        <!--  notification end -->
    </div>
    <div class="top-menu">
        <ul class="nav pull-right top-menu">
            <li><a class="logout" href="userIndex?roomid=201">Logout</a></li>
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
                <a class="active" href="userIndex?roomid=201">
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
                    <li><a  href="MTNSearchRoom?id=201">Request History</a></li>
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
                    <i class="fa fa-key"></i>
                    <span>Key Card</span>
                </a>
                <ul class="sub">
                    <li><a  href="SearchKeycardByRoom">Request Keycard</a></li>                                
                </ul>
            </li>

            <!-- เเว้นนนนนนนนนนนนนนนนน -->
            <li class="sub-menu">
                <a href="javascript:;" >
                    <i class="fa fa-envelope-o"></i>
                    <span>Parcel box</span>&nbsp;
                    <span class="badge bg-theme">${parcelExistAmount}</span>
                </a>
                <ul class="sub">
                    <li><a  href="userParcel">View Inbox</a></li>                                
                </ul>
            </li>

            <li class="sub-menu">
                <a href="javascript:;" >
                    <i class="fa fa-gavel"></i>
                    <span>Decoration Request</span>  
                </a>
                <ul class="sub">
                    <li><a  href="userDecReq.jsp">Request for decoration</a></li>
                    <li><a  href="">Request History</a></li>
                </ul>
            </li>

            <!-- sidebar menu end-->
    </div>
</aside>
<!--sidebar end-->
