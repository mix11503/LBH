<%@page import="Model.Admin"%>
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
        <title>Admin List</title>
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
            <% Admin aaa = (Admin) request.getSession().getAttribute("admin");
                if(aaa.isRole()){
            %>
            <!--main content start-->
            ...............                      
            <section id="main-content">
                <section class="wrapper site-min-height">
                    <div class="row mt">
                        <h3 class="mb">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b><i class="fa fa-book"></i> Admin List</b></h3>
                        <br>
                        <table id="example" class="display" cellspacing="0" width="95%">
            <thead><tr>
                <th>Name</th>
                <th>Email</th>
                <th>Status</th>
                <th>Active</th>
                <th>Suspend</th>
            </tr></thead>
            <tfoot><tr>
                <th>Name</th>
                <th>Email</th>
                <td></td>
                <td></td>
                <td></td>
            </tr></tfoot>
            <tbody>
                
            <%
            List<Admin> ad = (List) request.getAttribute("admList");
            if(ad!=null){
                for(Admin a : ad){
            %>
            <tr>
                <td><%=a.getName()%></td>
                <td><%=a.getEmail()%></td>
                <td><%=a.isRole()?"MANAGER":"Admin"%></td>
                <td><%=a.isSuspend()?"<b style='color:red;'>Suspend</b>":"<b style='color:green;'>Active</b>"%></td>
                <td><form action="admSuspend" method="post" onclick="return confirm('<%=a.isSuspend()?"Make account Active?":"Suspend Account?"%>')">
                        <input type="text" value="<%=a.getId()%>" name="id" hidden>
                        <input type="text" value="<%=a.isSuspend()?"false":"true"%>" name="suspend" hidden>
                        <input type="submit" value="<%=a.isSuspend()?"Undo":"Suspend"%>" class='<%=a.isSuspend()?"btn btn-success":"btn btn-warning"%>' <%=a.isRole()?"disabled":""%>/>
                    </form></td>
                </tr>
            <%}}%>
            
            </tbody>
            </table>
                        </div><!-- /row -->
                        <!-- CREATE ADMIN ACCOUNT -->
                        <div class="row mt">
          		<div class="col-lg-12">
          			<div class="form-panel">
                  	  <h3 class="mb"><i class="fa fa-star"></i> Create Admin Account</h3>
                          <form class="form-horizontal tasi-form" action="createAdmAcc" method="post">  
                            <div class="form-group">
                                <label class="col-sm-2 control-label col-lg-2" for="inputSuccess">Name</label>
                                <div class="col-lg-10">
                                    <input type="text" class="form-control" name="name" required><br>
                                </div>
                                <label class="col-sm-2 control-label col-lg-2" for="inputSuccess">Email</label>
                                <div class="col-lg-10">
                                    <input type="email" class="form-control" name="email" required><br>
                                </div> 
                            </div>
                              <input type="submit" style="margin-left: 500px; width: 120px; height: 40px;" class="btn btn-success" value="Create Account"/>
                          </form>
                          <h4 class="mb" style="color:blue">${message}</h4>
                          <h4 class="mb" style="color:red">${messageError}</h4>
          			</div><!-- /form-panel -->
          		</div><!-- /col-lg-12 -->
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
            <%}else{%><script type="text/javascript">alert("You don't have permission to access this page");</script><%}%>
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

