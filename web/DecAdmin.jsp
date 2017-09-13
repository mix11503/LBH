<%@page import="Model.Decoration"%>
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
                <div class="col-lg-12">
                            <div class="form-panel" style="border-radius: 10px; height: 120px;" >
                                <h4 class="mb"><i class="fa fa-angle-right"></i> Search Decoration Request</h4>
                                <form class="form-inline" role="form" action="SearchDecRange" method="get" style="float: left;">
                                    <div class="form-group">
                                        &nbsp;&nbsp;&nbsp;Date Start: 
                                        <input type="date" class="form-control" id="exampleInputEmail2" name="dateStart" required>
                                    </div>
                                    <div class="form-group">
                                        &nbsp;&nbsp;&nbsp;Date End: 
                                        <input type="date" class="form-control" id="exampleInputEmail2" name="dateEnd" required>
                                    </div>
                                    <button type="submit" class="btn btn-theme">Search</button>
                                </form>
                                
                                <form class="form-inline" role="form" action="SearchFilter" method="get" style="float: right;">
                                    <div class="form-group">
                                        Filter :
                                        <select class="form-control"  name="filter">
                                            <option disabled selected></option>
                                            <option value="New">New Request</option>
                                            <option value="Old">All Request</option>
                                        </select>
                                    </div>
                                    <button type="submit" class="btn btn-theme">Search</button>
                                </form>
                            </div><!-- /form-panel -->
                        </div><!-- /col-lg-12 -->
                        <h3>${message}</h3>
                        <br>
                    <div class="row mt">
                        <h3 class="mb">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Request Board</b></h3>
                        <br>
                        <table id="example" class="display" cellspacing="0" width="95%">
            <thead><tr>
                <th>Decoration ID</th>
                <th>Request Date</th>
                <th>Resident Name</th>
                <th>Description</th>
                <th>Start Date</th>
                <th>End Date</th>
                <th>Room No</th>
                <th>Status</th>
                <th>Approve</th>
                <th>Print Request</th>
            </tr></thead>
            <tfoot><tr>
                <th>ID</th>
                <th>Date</th>
                <th>Name</th>
                <td></td>
                <td></td>
                <td></td>
                <th>Room</th>
                <td></td>
                <td></td>
                <td></td>
            </tr></tfoot>
            <tbody>
                
            <%
            List<Decoration> d = (List) request.getAttribute("dec");
            if(d!=null){
                for(Decoration dec : d){
            %>
            <tr>
                <td><%=dec.getId()%></td>
                <td><%=dec.getReqDate()%></td>
                <td>{Resident Name}</td>
                <td><%if(dec.getDesc().length()>30){%><%=dec.getDesc().substring(0, 30)%>...<%}else{%><%=dec.getDesc()%><%}%></td>
                <td><%=dec.getStart()%></td>
                <td><%=dec.getEnd()%></td>
                <td><%=dec.getRoomId()%></td>
                <td><%=dec.getStatus()%></td>
                <td><form action="ApproveDec" method="get" onclick="return confirm('Approve Decoration Request?')">
                        <input type="text" value="<%=dec.getId()%>" name="id" hidden><input type="submit" value="Approve" <%if(dec.getStatus()==true){%>disabled<%}%>/>
                    </form></td>
                <td><form action="" method="get"  target="_blank">
                        <input type="text" value="<%=dec.getId()%>" name="id" hidden><input type="submit" value="Print"/>
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
    </body>
</html>
