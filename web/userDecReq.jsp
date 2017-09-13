<%-- 
    Document   : userDecReq
    Created on : Sep 13, 2017, 12:11:15 AM
    Author     : Joe's
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Decoration Request</title>
    </head>
    <body>
        <form action="" method="get">
            <textarea name="desc" placeholder="Decoration Description here.." maxlength="180" rows="10" cols="50" required></textarea>
            <input type="date" name="start" required>
            <input type="date" name="end" required>
            <input type="submit" value="Request">
        </form>
    </body>
</html>
