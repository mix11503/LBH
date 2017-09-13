<%@page import="Model.Decoration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Decoration Request</title>
    </head>
    <body>
        <table border="1" width="100%" style="border-collapse: collapse;">
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <%
            Decoration d = (Decoration) request.getAttribute("decPrint");
            if(d!=null){ 
            %>
            <tr height="30">
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                </tr>
            <%}%>  
            </table>
            <br>
            <button onclick="printout()">Print this page</button>
        </table>
                <script>
function printout() {
    window.print();
}
</script>
    </body>
</html>
