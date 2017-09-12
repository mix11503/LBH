<%@page import="Model.newsUpdate"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Announcement</title>
    </head>
    <body>
        <form action="searchNews" method="get" style='float:left;'>
            Filter By: <select name="filter">
                <option disabled selected></option>
                <option value="All">All news</option>
                <option value="Current">Current News</option>
                <option value="Old">Old News</option>
                <option value="Remove">Recycle Bin</option>
            </select> 
            <input type="submit" value="Search">
        </form>
        <form action="searchNewsDate"  method="get" style='float:left;'>
            &nbsp;&nbsp;&nbsp;Start <input type="date" name="start"/> : End <input type="date" name="end"/>
            <input type="submit" value="Search">
        </form>
        <form action="searchNewsKw"  method="get" style='float:left;'>
            &nbsp;&nbsp;&nbsp;Keyword Here <input type="text" name="keyword"/>
            <input type="submit" value="Search">
        </form><br><br><br>

        <%
            List<newsUpdate> news = (List) request.getAttribute("newsFilter");
            if (news != null) {
        %>
        <table border="1">
            <tr><td>News ID</td><td>News Topic</td><td>Desc</td><td>Start</td><td>End</td></tr>        
            <% for (newsUpdate n : news) {%>

            <tr><td><%= n.getNews_id()%></td><td><%= n.getNews_topic()%></td><td><%= n.getNews_desc()%></td>
                <td><%= n.getStart_date()%></td><td><%= n.getEnd_date()%></td>
                <td><form action="editNews" method="get"><input type="text" name="id" value="<%=n.getNews_id()%>" hidden/><input type="submit" value="edit"/></form></td>
                <td><form action="<%if(n.isHidden()){%>recycleNews<%}else{%>removeNews<%}%>" method="get"><input type="text" name="id" value="<%=n.getNews_id()%>" hidden/>
                        <input type="submit" value="<%if(n.isHidden()){%>Recycle<%}else{%>Remove<%}%>"/></form></td>
            </tr>
        
        <%}%>
        </table>
        <%}%>
        
        <%
            List<newsUpdate> newsDate = (List) request.getAttribute("newsByDate");
            if (newsDate != null) {
        %>
        <table border="1">
            <tr><td>News ID</td><td>News Topic</td><td>Desc</td><td>Start</td><td>End</td></tr>        
            <% for (newsUpdate n : newsDate) {%>

            <tr><td><%= n.getNews_id()%></td><td><%= n.getNews_topic()%></td><td><%= n.getNews_desc()%></td>
                <td><%= n.getStart_date()%></td><td><%= n.getEnd_date()%></td>
                <td><form action="editNews" method="get"><input type="text" name="id" value="<%=n.getNews_id()%>" hidden/><input type="submit" value="edit"/></form></td>
                <td><form action="<%if(n.isHidden()){%>recycleNews<%}else{%>removeNews<%}%>" method="get"><input type="text" name="id" value="<%=n.getNews_id()%>" hidden/>
                        <input type="submit" value="<%if(n.isHidden()){%>Recycle<%}else{%>Remove<%}%>"/></form></td>
            </tr>
        <%}%>
        </table>
        <%}%>
        
        <%
            List<newsUpdate> newsKw = (List) request.getAttribute("newsKw");
            if (newsKw != null) {
        %>
        <table border="1">
            <tr><td>News ID</td><td>News Topic</td><td>Desc</td><td>Start</td><td>End</td></tr>        
            <% for (newsUpdate n : newsKw) {%>

            <tr><td><%= n.getNews_id()%></td><td><%= n.getNews_topic()%></td><td><%= n.getNews_desc()%></td>
                <td><%= n.getStart_date()%></td><td><%= n.getEnd_date()%></td>
                <td><form action="editNews" method="get"><input type="text" name="id" value="<%=n.getNews_id()%>" hidden/><input type="submit" value="edit"/></form></td>
                <td><form action="<%if(n.isHidden()){%>recycleNews<%}else{%>removeNews<%}%>" method="get"><input type="text" name="id" value="<%=n.getNews_id()%>" hidden/>
                        <input type="submit" value="<%if(n.isHidden()){%>Recycle<%}else{%>Remove<%}%>"/></form></td>
            </tr>
        
        <%}%>
        </table>
        <%}%>

        <h3 style="color:red;">${message}</h3>
    </body>
</html>
