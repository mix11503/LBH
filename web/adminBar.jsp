<!-- **********************************************************************************************************************************************************
      TOP BAR CONTENT & NOTIFICATIONS
      *********************************************************************************************************************************************************** -->
<!--header start-->
<header class="header black-bg">
    <div class="sidebar-toggle-box">
        <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
    </div>
    <!--logo start-->
    <a href="adminIndex" class="logo"><b>Welcome Admin</b></a>
    <!--logo end-->
    <div class="nav notify-row" id="top_menu">
        <!--  notification start -->


</header>
<!--header end-->

<!-- **********************************************************************************************************************************************************
MAIN SIDEBAR MENU
*********************************************************************************************************************************************************** -->
<!--sidebar start-->
<aside>
    <div id="sidebar"  class="nav-collapse ">
        <!-- sidebar menu start-->
        <ul class="sidebar-menu" id="nav-accordion">

            <p class="centered"><img src="assets/img/ui-sam.jpg" class="img-circle" width="60"></a></p>
            <h5 class="centered">Admin DuengJai</h5>

            <li class="mt">
                <a class="active" href="adminIndex">
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
                    <li><a  href="searchByStatus?status=New">New Request ${value}</a></li>
                    <li><a  href="searchByStatus">View By Status</a></li>
                    <li><a  href="SearchByRoomID.jsp">Search By Room No.</a></li>
                    <li><a  href="mtnMgn.jsp">Search By Form No.</a></li>
                    <li><a  href="SearchByDate.jsp">Search By Date</a></li>
                    <li><a  href="SearchByStuff.jsp">Search By Broken Stuff</a></li>
                </ul>
            </li>
            <li class="sub-menu">
                <a href="javascript:;" >
                    <i class="fa fa-key"></i>
                    <span>Key Card</span>  
                </a>
                <ul class="sub">
                    <li><a  href="GetKeycardReqNew">New Keycard Request</a></li>
                </ul>
            </li>
            <li class="sub-menu">
                <a href="javascript:;" >
                    <i class="fa fa-bullhorn"></i>
                    <span>Announcement</span>  
                </a>
                <ul class="sub">
                    <li><a  href="createNews.jsp">Create Announcement</a></li>
                    <li><a  href="searchNews?filter=Current">Manage Announcement</a></li>
                </ul>
            </li>
            <li class="sub-menu">
                <a href="javascript:;" >
                    <i class="fa fa-envelope"></i>
                    <span>Parcel Management</span>  
                </a>
                <ul class="sub">
                    <li><a  href="adminParcel">Daily Parcel</a></li>
                    <li><a  href="admParcelMgn">Manage all Parcel</a></li>
                    <li><a  href="printParcel.jsp">Print Parcel Label</a></li>
                </ul>
            </li>


            <!-- sidebar menu end-->
    </div>
</aside>
<!--sidebar end-->
