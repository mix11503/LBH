<%@page import="Model.Staff"%>
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
            $(document).ready(function () {
                $('#example').DataTable();
            });
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
                                <h4 class="mb"><i class="fa fa-angle-right"></i> ADD STAFF</h4>
                                <form class="form-inline" role="form" action="addStaff" method="get">
                                    <div class="form-group">
                                        &nbsp;<input type="text" class="form-control" id="exampleInputEmail2" name="name" placeholder="Name" required/>
                                        &nbsp;&nbsp;<input type="text" class="form-control" id="exampleInputEmail2" name="last" placeholder="Lastname" />
                                        &nbsp;&nbsp;<input type="text" class="form-control" id="exampleInputEmail2" name="nickname" placeholder="Nickname"/>
                                        &nbsp;&nbsp;<input type="number" class="form-control" id="exampleInputEmail2" name="tel" placeholder="Tel" min="20000001" max="999999999" required/>
                                        &nbsp;&nbsp;<select name="division" class="form-control" required>
                                            <option selected disabled>Select Division</option>
                                            <option value="Security">Security</option>
                                            <option value="Admin">Admin</option>
                                            <option value="Technician">Technician</option>
                                            <option value="Janitor">Janitor</option>
                                            <option value="Other">Other</option>
                                        </select>
                                        &nbsp;&nbsp;&nbsp;Period: <input type="time" class="form-control" id="exampleInputEmail2" name="start" required/>
                                        &nbsp;End: <input type="time" class="form-control" id="exampleInputEmail2" name="end" required/>
                                    </div>
                                    &nbsp;&nbsp;<button type="submit" class="btn btn-theme">ADD</button>
                                </form>
                            </div><!-- /form-panel -->
                        </div><!-- /col-lg-12 -->
                        <h3>${message}</h3>
                        <br><br>
                        <h3 class="mb">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Staff Phonebook</h3>
                        <table id="example" class="display" cellspacing="0" width="95%">
                            <thead><tr>
                                    <td>Name</td>
                                    <td>Last Name</td>
                                    <td>NickName</td>
                                    <td>Telephone No</td>
                                    <td>Division</td>
                                    <td>Period Start</td>
                                    <td>End</td>
                                    <td>EDIT</td>
                                    <td>DELETE</td>
                                </tr></thead>
                            <tbody>
                                <%
                                    List<Staff> ss = (List) request.getAttribute("st");
                                    if (ss != null) {
                                        for (Staff s : ss) {
                                %>
                                <tr>
                                    <td><%=s.getName()%></td>
                                    <td><%=s.getLastname()%></td>
                                    <td><%=s.getNickname()%></td>
                                    <td>0<%=s.getTel()%></td>
                                    <td><%=s.getDivision()%></td>
                                    <td><%=s.getStart()%></td>
                                    <td><%=s.getEnd()%></td>
                                    <td><form action="" method="get">
                                            <input type="text" value="" name="id" hidden><input type="submit" value="EDIT"/>
                                        </form></td>
                                    <td><form  action="deleteStaff" method="get" onclick="return confirm('Delete <%=s.getName()%>?')">
                                            <input type="text" value="<%=s.getId()%>" name="id" hidden><input type="submit" value="DELETE"/>
                                        </form></td>
                                </tr>
                                <%}
                }%>
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
