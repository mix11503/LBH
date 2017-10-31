<%@page import="Model.Maintanance"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ฺ</title>
         <style type="text/css" media="print">
            .dontprint
            { display: none; }
        </style>
    </head>
    <div class="dontprint"><button onclick="printout()">Print this page</button></div>
    <br>
    <center><img src='gen.jpg' style="width: 150px"/>
        <h3>นิติบุคคลอาคารชุด Condominium</h3>
    <h3>ใบแจ้งซ่อมแซม/บำรุงรักษาห้องชุด</h3>
    </center>
    <body>
        <%if(request.getSession().getAttribute("adminAuthen")==null){response.sendRedirect("loginAdmin.jsp");}%>
        <table border="0" width="50%" style="border-collapse: collapse;">
            <%
            Maintanance m = (Maintanance) request.getAttribute("mtn");
                if (m != null) {
            %>
            <tr><td height='50'><div style='padding-left: 66em;'></div></td></tr>
            <tr><td height='50'><div style='float: right'>วันที่ส่งคำร้อง: <%=m.getMtn_date()%></div></td></tr>
            <tr><td height='50'><div style='padding-left: 15em;'>มีความประสงค์เข้าซ่อมแซม/บำรุงรักษาห้องชุดเลขที่ <b>2/<%=m.getMtn_room_id()%></b>   โดยมีรายละเอียดดังนี้</div></td></tr>
            <tr><td height='50'><div style='padding-left: 10em;'>บริเวณที่แจ้งความประสงค์ซ่อมแซม/บำรุงรักษา <%=m.getMtn_ServiceArea()%> สิ่งของที่ต้องการซ่อมแซม   <%=m.getMtn_area_stuff()%></div></td></tr>
            <tr><td height='50'><div style='padding-left: 10em;'>โดยมีรายละเอียดดังนี้ <%=m.getMtn_desc()%></div></td></tr>
            <tr><td><div style='padding-left: 5em;'><%for(String path : m.getMtn_pic() ){%><img src="<%=path%>" height="250"><%}%></div></td></tr>
            <tr><td height='50'><div style='padding-left: 10em;'></div></td></tr>
            <tr><td><hr></td></tr>
            <tr><td height='50'><div style='padding-left: 30em;'><b>บันทึกผลการแก้ไข</b></div></td></tr>
            <tr><td height='50'><div style='padding-left: 10em;'>โดยมีผลการแก้ไข ดังนี้ ____________________________________________________________________________________</div></td></tr>
            <tr><td height='50'><div style='padding-left: 10em;'>______________________________________________________________________________________________________</div></td></tr>
            <tr><td height='50'><div style='padding-left: 10em;'>______________________________________________________________________________________________________</div></td></tr>
            <tr><td height='50'><div style='padding-left: 10em;'>วัสดุ/อุปกรณ์ที่ใช้/ค่าใช้จ่าย _________________________________________________________________________________</div></td></tr>
            <tr><td height='50'><div style='padding-left: 10em;'>______________________________________________________________________________________________________</div></td></tr>
            <tr><td height='50'><div style='padding-left: 10em;'>______________________________________________________________________________________________________</div></td></tr>
            <tr><td height='50'><div style='padding-left: 10em;'></div></td></tr>
            <tr><td height='50'><div style='padding-left: 10em;'> ผู้แก้ไข ________________________________วันที่ ________________________เวลา ______________________________</div></td></tr>
            <tr><td height='50'><div style='padding-left: 10em;'> ผู้ตรวจสอบ _____________________________วันที่ ________________________เวลา ______________________________</div></td></tr>
            <tr><td height='50'><div style='padding-left: 10em;'></div></td></tr>
            <tr><td height='70'><div style='padding-left: 35em;'>ลงชื่อ________________________________ผู้จัดการอาคาร</div></td></tr>
            <tr><td height='50'><div style='padding-left: 37em;'>(_________________________________)</div></td></tr>
            <tr><td height='50'><div style='padding-left: 40em;'>วันที่____/____/_________</div></td></tr>
            <%}%>  
            </table>
                <script>
function printout() {
    window.print();
}
</script>
    </body>
</html>
