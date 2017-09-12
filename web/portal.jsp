<%-- 
    Document   : portal
    Created on : Mar 12, 2017, 10:47:25 PM
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
        <br><br><br>
        <h1>:: Portal for MTN ::</h1>
        <h2>Admin Part</h2>
        <a href="index.jsp">Search Maintenance by RoomID</a><br>
        <a href="mtnMgn.jsp">Request Management: Update Status + Update Chat</a><br>
        <br><h2> User Part </h2>
        <a href="userMtnReq.jsp">Request for Maintenance Form</a><br>
        <a href="mtnProgressSearch.jsp">Request Progress Search</a><br>
        <a href="mtnEvaSearch.jsp">Evaluate Form Search</a><br>
        
        <br><h2> Merged </h2>
        <a href="userMtnReq.jsp">User Req Flow</a><br>
        <a href="MTNSearchRoom?id=201">User View Flow</a><br>
        <a href="mtnOverview.jsp">Admin Flow</a><br>
            </center>
    </body>
</html>
