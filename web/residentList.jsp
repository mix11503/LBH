<%@page import="Model.Resident"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Dashboard">
        <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
        <title>Resident List</title>
        <!-- Bootstrap core CSS -->
        <link href="assets/css/bootstrap.css" rel="stylesheet">
        <!--external css-->
        <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />

        <!-- Custom styles for this template -->
        <link href="assets/css/style.css" rel="stylesheet">
        <link href="assets/css/style-responsive.css" rel="stylesheet">
        
        <!-- first jQuery -->
            <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <!-- then dataTables -->
            <link href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />   
            <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
    <script>
        $(document).ready(function() {
        // Setup - add a text input to each footer cell
    $('#example tfoot th').each( function () {
        var title = $(this).text();
        $(this).html( '<input type="text" placeholder="Search '+title+'" />' );
    } );
 
    // DataTable
    var table = $('#example').DataTable();
 
    // Apply the search
    table.columns().every( function () {
        var that = this;
 
        $( 'input', this.footer() ).on( 'keyup change', function () {
            if ( that.search() !== this.value ) {
                that
                    .search( this.value )
                    .draw();
            }
        } );
    } );
    
    
        } );
    </script>
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
            ...............
            <section id="main-content">
                <section class="wrapper site-min-height">
                    <div class="row mt">
                        <h3 class="mb">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b><i class="fa fa-book"></i> Resident List</b></h3>
                        <br>
                        <table id="example" class="display" cellspacing="0" width="95%">
            <thead><tr>
                <th>Name</th>
                <th>Phone Number</th>
                <th>Email</th>
                <th>Status</th>
                <th>Rent Start</th>
                <th>Rent End</th>
                <th>Active</th>
                <th>Suspend</th>
                <th>Room ID</th>
            </tr></thead>
            <tfoot><tr>
                <th>Name</th>
                <th>Phone</th>
                <th>Email</th>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <th>Room</th>
            </tr></tfoot>
            <tbody>
                
            <%
            List<Resident> rr = (List) request.getAttribute("listResident");
            if(rr!=null){
                for(Resident r : rr){
            %>
            <tr>
                <td><%=r.getName()%> <%=r.getLastname()%></td>
                <td>0<%=r.getPhone()%></td>
                <td><%=r.getEmail()%></td>
                <td><%=r.isIsOwner()?"Owner":"Renter"%></td>
                <td><%=r.isIsOwner()?"-":r.getRent_start()%></td>
                <td><%=r.isIsOwner()?"-":r.getRent_end()%></td>
                <td><%=r.isSuspend()?"<b style='color:red;'>Suspend</b> by "+r.getAppBy():"<b style='color:green;'>Active</b> by "+r.getAppBy()%></td>
                <td><form action="suspendAccount" method="post" onclick="return confirm('<%=r.isSuspend()?"Make account Active?":"Suspend Account?"%>')">
                        <input type="text" value="<%=r.getId()%>" name="id" hidden>
                        <input type="text" value="<%=r.isSuspend()?"false":"true"%>" name="suspend" hidden>
                        <input type="text" value="${admin.name}" name="appBy" hidden/>
                        <input type="submit" value="<%=r.isSuspend()?"Undo":"Suspend"%>" class='<%=r.isSuspend()?"btn btn-success":"btn btn-warning"%>'/>
                    </form></td>
                <td><%=r.getRoom_ID()%></td>
                </tr>
            <%}}%>
            
            </tbody>
            </table>
                        </div><!-- /row -->
                </section><! --/wrapper -->
            </section><!-- /MAIN CONTENT -->
            <!--main content end-->
            <!--footer start-->
            <footer class="site-footer">
                <div class="text-center">
                    SIT SCHOOL PROJECT
                    <a href="" class="go-top">
                        <i class="fa fa-angle-up"></i>
                    </a>
                </div>
            </footer>
            <!--footer end-->
        </section>
            <%}}else{response.sendRedirect("loginAdmin.jsp");}%>
        <!-- js placed at the end of the document so the pages load faster -->
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery.ui.touch-punch.min.js"></script>
        <script class="include" type="text/javascript" src="assets/js/jquery.dcjqaccordion.2.7.js"></script>
        <script src="assets/js/jquery.scrollTo.min.js"></script>
        <script src="assets/js/jquery.nicescroll.js" type="text/javascript"></script>


        <!--common script for all pages-->
        <script src="assets/js/common-scripts.js"></script>
    </body>
</html>
