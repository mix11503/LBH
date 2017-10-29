<%
                Boolean status = (Boolean) request.getSession().getAttribute("adminAuthen");
                if(status==true){
            %>
<!-- **********************************************************************************************************************************************************
      TOP BAR CONTENT & NOTIFICATIONS
      *********************************************************************************************************************************************************** -->
<!--header start-->
<header class="header black-bg">
    <div class="sidebar-toggle-box">
        <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
    </div>
    <!--logo start-->
    <a href="admin_panel.jsp" class="logo"><b>Welcome Admin</b></a>
    <!--logo end-->
    <div class="top-menu">
            	<ul class="nav pull-right top-menu">
                    <li><a class="logout" href="logoutAdm">Logout</a></li>
            	</ul>
            </div>
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
            <h5 class="centered">Mr. Scofield</h5>
                <!-- Add class="active" at a href to blue hilight-->
            <li class="mt">
                <a href="admin_panel.jsp">
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
                    <li><a  href="SearchByRoomID.jsp">Search By Room No.</a></li>
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
            <li class="sub-menu">
                <a href="javascript:;" >
                    <i class="fa fa-gavel"></i>
                    <span>Decoration Request</span>  
                </a>
                <ul class="sub">
                    <li><a  href="SearchFilter?filter=New">Manage Request</a></li>
                </ul>
            </li>
            <li class="sub-menu">
                <a href="javascript:;" >
                    <i class="fa fa-truck"></i>
                    <span>Moving Stuff Request</span>  
                </a>
                <ul class="sub">
                    <li><a href="admMgnReq">Manage Request</a></li>
                </ul>
            </li>
            <li class="sub-menu">
                <a href="javascript:;" >
                    <i class="fa fa-comment-o"></i>
                    <span>Problem Report</span>  
                </a>
                <ul class="sub">
                    <li><a  href="getCurrentReport">Manage Report</a></li>
                </ul>
            </li>
            <li class="sub-menu">
                <a href="javascript:;" >
                    <i class="fa fa-book"></i>
                    <span>Staff PhoneBook</span>  
                </a>
                <ul class="sub">
                    <li><a  href="getStaff">ADD / MANAGE</a></li>
                </ul>
            </li>
            <li class="sub-menu">
                <a href="javascript:;" >
                    <i class="fa fa-cog"></i>
                    <span>User Management</span>  
                </a>
                <ul class="sub">
                    <li><a href="createAccount.jsp">Create Account</a></li>
                    <li><a href="">User Management</a></li>
                </ul>
            </li>
            <!-- sidebar menu end-->
    </div>
</aside>
<!--sidebar end-->
<%}%>
