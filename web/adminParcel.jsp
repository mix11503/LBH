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
        $('#example').DataTable();
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
                        <div class="col-lg-12">
                            <div class="form-panel" style="border-radius: 10px; height: 120px;" >
                                <h4 class="mb"><i class="fa fa-angle-right"></i> ADD NEW PARCEL</h4>
                                <form class="form-inline" role="form" action="addParcel" method="get">
                                    <div class="form-group">
                                        &nbsp;&nbsp;&nbsp;Parcel Barcode: 
                                        <input type="text" class="form-control" id="exampleInputEmail2" placeholder="Barcode"  name="barcode" required>
                                    </div>
                                    
                                    <div class="form-group">
                                        &nbsp;&nbsp;&nbsp;Receiver Name: 
                                        <input type="text" class="form-control" id="exampleInputEmail2" placeholder="Name"  name="name" required>
                                    </div>
                                    <div class="form-group">
                                        &nbsp;&nbsp;&nbsp;Room No: 
                                        <input type="number" class="form-control" id="exampleInputEmail2" name="room" min="201" max="832" required>
                                    </div>
                                    <button type="submit" class="btn btn-theme">ADD</button>
                                </form>
                            </div><!-- /form-panel -->
                        </div><!-- /col-lg-12 -->
                        <h3>${message}</h3>
            <br><br>
            <h3 class="mb">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Existing Parcel</h3>
            <table id="example" class="display" cellspacing="0" width="95%">
            <thead><tr>
                <td>Barcode ID</td>
                <td>Receiver Name</td>
                <td>Parcel Date</td>
                <td>Room</td>
                <td>Pick Up</td>
                <td>Delete</td>
            </tr></thead>
            <tbody>
            <%
            List<parcel> p = (List) request.getAttribute("parcel");
            if(p!=null){
                for(parcel pp : p){
            %>
            <tr>
                <td><b><%=pp.getBarcode()%></b></td>
                <td><%=pp.getName()%></td>
                <td><%=pp.getDate()%></td>
                <td><%=pp.getRoomId()%></td>
                <td><%if(pp.getStatus()==false){%><form action="pickParcel" method="get" onclick="return confirm('Picked <%=pp.getBarcode()%>?')">
                        <input type="text" value="<%=pp.getId()%>" name="id" hidden><b><input type="submit" value="Pick Up" class="btn btn-success"/></b>
                    </form><%}else{%><div style="color: green;">Picked: <b><%=pp.getPickStamp().substring(0, 19)%></b></div><%}%></td>
                <td><form  action="deleteParcel" method="get" onclick="return confirm('Delete <%=pp.getBarcode()%>?')">
                        <input type="text" value="<%=pp.getId()%>" name="id" hidden><b><input type="submit" value="Delete" class="btn btn-danger"/></b>
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

        
        <%--OLD CONTENT
        <form action="addParcel" method="get">
            ADD PARCEL:
            <input type="text" name="barcode" placeholder="Barcode" required>
            <input type="text" name="name" placeholder="Receiver Name" required>
            <input type="number" name="room" placeholder="Room No" min="201" max="832" required>
            <input type="submit" value="Add Parcel">
            </form>
            <h3>${message}</h3>
            <br>
            <h3>::Existing Parcel::</h3>
            <table id="example" class="display" cellspacing="0" width="100%">
            <thead><tr>
                <td>Barcode ID</td>
                <td>Receiver Name</td>
                <td>Parcel Date</td>
                <td>status</td>
                <td>Pick Up</td>
                <td>Room</td>
                <td>Delete</td>
            </tr></thead>
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
                <td><form action="pickParcel" method="get" onclick="return confirm('Picked <%=pp.getBarcode()%>?')">
                        <input type="text" value="<%=pp.getId()%>" name="id" hidden><input type="submit" value="Picked" <%if(pp.getStatus()==true){%>disabled<%}%>/>
                    </form></td>
                <td><%=pp.getRoomId()%></td>
                <td><form  action="deleteParcel" method="get" onclick="return confirm('Delete <%=pp.getBarcode()%>?')">
                        <input type="text" value="<%=pp.getId()%>" name="id" hidden><input type="submit" value="Delete"/>
                    </form></td>
                </tr>
            <%}}%>
            </tbody>
            </table>
            END OLD CONTENT --%>
    </body>
</html>
