<%@page import="Model.parcel"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Parcel Management Table</title>
    </head>
    <body>
        <h3>::Parcel Data Sheets::</h3>
        <table border="1" width="100%">
            <tr>
                <td>Barcode ID</td>
                <td>Receiver Name</td>
                <td>Parcel Date</td>
                <td>status</td>
                <td>Room</td>
                <td>Signature</td>
            </tr>
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
                <td><%=pp.getRoomId()%></td>
                <td></td>
                </tr>
            <%}}%>  
            </table>
            <br>
            <button onclick="printout()">Print this page</button><br><br>
            <form action="cardPrint" method="get" target="_blank">
                <input type="text" name="date" value="${date}" hidden>
                <input type="submit" value="Print Card">
            </form>
            
<script>
function printout() {
    window.print();
}
</script>
    </body>
</html>
