<%-- 
    Document   : mtnEvaSearch
    Created on : Mar 10, 2017, 10:51:15 PM
    Author     : Joe's
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <center>
        <h1>::MTN EVA SEARCH::</h1>
        <form action="mtnEva" method="get">
        <table>
            <tr><input type="text" name="mtnId"/></tr>
            <tr><input type="submit" value="Submit Form"/></tr>
        </table>
            </form>
        </center>
    <center> <% if(request.getAttribute("message")!= null){ %>
        <h3><%=request.getAttribute("message")%><h3>
                <%}%> </center>
                <center> <% if(request.getAttribute("messageChat")!= null){ %>
        <h3><%=request.getAttribute("messageChat")%><h3>
                <%}%> </center>
    </body>
</html>
