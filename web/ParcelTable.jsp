<%@page import="Model.parcel"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>.</title>
        <style type="text/css" media="print">
            .dontprint
            { display: none; }
        </style>
    </head>
    <body>
        <h2>::Parcel Data Sheets::</h2>
        <h3>Date of Delivery: ${date}</h3>
        <table border="1" width="100%" style="border-collapse: collapse;">
            <tr>
                <td>Barcode ID</td>
                <td>Receiver Name</td>
                <td>status</td>
                <td>Room</td>
                <td>Signature</td>
                <td>Pick Up Date</td>
            </tr>
            <%
                List<parcel> p = (List) request.getAttribute("parcel");
                if (p != null) {
                    for (parcel pp : p) {
            %>
            <tr height="30">
                <td><%=pp.getBarcode()%></td>
                <td><%=pp.getName()%></td>
                <td><%if (pp.getStatus() == false) {%>Exist<%} else {%>Picked<%}%></td>
                <td><%=pp.getRoomId()%></td>
                <td></td>
                <td></td>
            </tr>
            <%}
                }%>  
        </table>
        <br>
        <div class="dontprint">
        <button onclick="printout()">Print this page</button><br><br>
        <form action="cardPrint" method="get" target="_blank">
            <input type="text" name="date" value="${date}" hidden>
            <input type="submit" value="Print Card">
        </form>
            <%--<form action="markedPrint" method="get" target="_blank">
            <input type="text" name="date" value="${date}" hidden>
            <input type="submit" value="Mark as Print">
        </form>--%>   
        </div>
        <script>
            function printout() {
                window.print();
            }
        </script>
    </body>
</html>
