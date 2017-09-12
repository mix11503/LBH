<%@page import="java.util.List"%>
<%@page import="Model.parcel"%>
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
        <title>Parcel Main Page</title>
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
            <jsp:include page="adminBar.jsp"/>
            <!-- **********************************************************************************************************************************************************
            MAIN CONTENT
            *********************************************************************************************************************************************************** -->
            <!--main content start-->
            ...............
            <section id="main-content">
                <section class="wrapper site-min-height">
                    <div class="row mt">
                        <h3 class="mb">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>View All Parcel</b></h3>
                        <br>
                        <table id="example" class="display" cellspacing="0" width="95%">
            <thead><tr>
                <th>Barcode ID</th>
                <th>Receiver Name</th>
                <th>Parcel Date</th>
                <th>status</th>
                <th>Pick Up</th>
                <th>Room</th>
                <th>Delete</th>
            </tr></thead>
            <tfoot><tr>
                <th>Barcode</th>
                <th>Name</th>
                <th>Date</th>
                <td></td>
                <td></td>
                <th>Room</th>
                <td></td>
            </tr></tfoot>
            <tbody>
                
            <%
            List<parcel> p = (List) request.getAttribute("parcel");
            if(p!=null){
                for(parcel pp : p){
            %>
            <tr>
                <td><%=pp.getBarcode()%></td>
                <td><%=pp.getName()%></td>
                <td><%=pp.getDate()%></td>
                <td><%if(pp.getStatus()==false){%>Exist<%}else{%>Picked<%}%></td>
                <td><form action="pickMgn" method="get" onclick="return confirm('Picked <%=pp.getBarcode()%>?')">
                        <input type="text" value="<%=pp.getId()%>" name="id" hidden><input type="submit" value="Picked" <%if(pp.getStatus()==true){%>disabled<%}%>/>
                    </form></td>
                <td><%=pp.getRoomId()%></td>
                <td><form  action="deleteMgn" method="get" onclick="return confirm('Delete <%=pp.getBarcode()%>?')">
                        <input type="text" value="<%=pp.getId()%>" name="id" hidden><input type="submit" value="Delete"/>
                    </form></td>
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
                    2014 - Alvarez.is
                    <a href="blank.html#" class="go-top">
                        <i class="fa fa-angle-up"></i>
                    </a>
                </div>
            </footer>
            <!--footer end-->
        </section>

        <!-- js placed at the end of the document so the pages load faster -->
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery.ui.touch-punch.min.js"></script>
        <script class="include" type="text/javascript" src="assets/js/jquery.dcjqaccordion.2.7.js"></script>
        <script src="assets/js/jquery.scrollTo.min.js"></script>
        <script src="assets/js/jquery.nicescroll.js" type="text/javascript"></script>


        <!--common script for all pages-->
        <script src="assets/js/common-scripts.js"></script>
        <%--BLIND
            <h3>View All Parcel</h3>
            <table id="example" class="display" cellspacing="0" width="100%">
            <thead><tr>
                <th>Barcode ID</th>
                <th>Receiver Name</th>
                <th>Parcel Date</th>
                <th>status</th>
                <th>Pick Up</th>
                <th>Room</th>
                <th>Delete</th>
            </tr></thead>
            <tfoot><tr>
                <th>Barcode</th>
                <th>Name</th>
                <th>Date</th>
                <td></td>
                <td></td>
                <th>Room</th>
                <td></td>
            </tr></tfoot>
            <tbody>
                
            <%
            List<parcel> p = (List) request.getAttribute("parcel");
            if(p!=null){
                for(parcel pp : p){
            %>
            <tr>
                <td><%=pp.getBarcode()%></td>
                <td><%=pp.getName()%></td>
                <td><%=pp.getDate()%></td>
                <td><%if(pp.getStatus()==false){%>Exist<%}else{%>Picked<%}%></td>
                <td><form action="pickMgn" method="get" onclick="return confirm('Picked <%=pp.getBarcode()%>?')">
                        <input type="text" value="<%=pp.getId()%>" name="id" hidden><input type="submit" value="Picked" <%if(pp.getStatus()==true){%>disabled<%}%>/>
                    </form></td>
                <td><%=pp.getRoomId()%></td>
                <td><form  action="deleteMgn" method="get" onclick="return confirm('Delete <%=pp.getBarcode()%>?')">
                        <input type="text" value="<%=pp.getId()%>" name="id" hidden><input type="submit" value="Delete"/>
                    </form></td>
                </tr>
            <%}}%>
            
            </tbody>
            </table>
            END BLIND --%>
    </body>
</html>
