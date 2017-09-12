<%@page import="java.util.List"%>
<%@page import="Model.parcel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Parcel Label Printing</title>
    </head>
    <body>
        <%
            List<parcel> p = (List) request.getAttribute("parcel");
            if(p!=null){
                int i = 1;
        %>
            <table border="1" style="width: 720px; height: 950px;">
                <tr>
                <%for(parcel pp : p){%>
                <td><h3>Parcel Pick up Ticket</h3><h4 style="float: right;">DATE: <%=pp.getDate()%></h4><h4>Room No: <%=pp.getRoomId()%></h4><h4>Dear khun: <%=pp.getName()%></h4><h4>Parcel ID: <%=pp.getBarcode()%></h4><h6>Please contact at condo's office from 08:00 - 17:00 everyday, Tel 02 123 4567<br>Please note that your parcel will be kept for 30 days</h6></td>
                <%if(i%2==0){%></tr><tr><%}%>
                <%if(i%8==0){%></table><br><br><br><br><br><br><table border="1" style="width: 720px; height: 950px;"><%}%>    
            <%i++;}%>
            <%String blankCard = "<td><h3>Parcel Pick up Ticket</h3><h4 style='float:right'>DATE:_ _/_ _/_ _ _ _</h4><h4>Room No:_ _ _</h4><h4>Dear:_______________</h4><h4>Parcel ID:_______________</h4><h6>Please contact at condo's office from 08:00 - 17:00 everyday, Tel 02 123 4567<br>Please note that your parcel will be kept for 30 days</h6></td>";%>
            <%--Generate pair for odd card--%>
            <%if((i-1)%2!=0){%>
            <%=blankCard%>    
            <%}%>
            <%--Generate page fulfill card(s) to be 8--%>
            <%int no = 0;
              int left = 8-((i-1)%8);
              if(left%2!=0){
                  no = (left - 1)/2;
              }else{
                  no = left/2;
              }
              for(int x=1;x<=no;x++){
            %>
            <tr><%=blankCard%><%=blankCard%></tr>
            <%}%>
                </tr>
            </table><br>
                <%}%>
        <br><button onclick="printout()">Print this page</button>
        <script>
function printout() {
    window.print();
}
</script>
    </body>
</html>
