<%-- 
    Document   : findByDate
    Created on : May 5, 2017, 5:48:00 PM
    Author     : Joe's
--%>

<%@page import="java.util.List"%>
<%@page import="Model.Maintanance"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="dateServlet" method="get">
            <input type="date" name="date">
            <input type="submit">
            </form>
        ${message}
        <hr>
        <% List<Maintanance> mtn = (List) request.getAttribute("date");
           if(mtn!=null){%>
                <%for(Maintanance m: mtn){ %>
                    <%= m.toString() %><br>
                <%}%>
                <%}%>
    </body>
</html>
