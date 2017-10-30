<%-- 
    Document   : resetPw
    Created on : 30 Oct, 2017, 11:02:38 PM
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
        <h1>Hello World!</h1>
        <% int id = (Integer) request.getAttribute("id");
        if(request.getAttribute("id")!=null){
        %>
        <%= id %>    
        <%}%>
        ${message}
    </body>
</html>
