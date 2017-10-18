<%@page import="java.util.List"%>
<%@page import="Model.stuff"%>
<%@page import="Model.Moving"%>
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
        <h3>นิติบุคคลอาคารชุด Library Houze Condo</h3>
    <h3>คำขอขนย้ายสำภาระเข้า-ออก</h3>
    </center>
    <body>
        <%if(request.getSession().getAttribute("adminAuthen")==null){response.sendRedirect("loginAdmin.jsp");}%>
        <table border="0" width="50%" style="border-collapse: collapse;">
            <%
            Moving m = (Moving) request.getAttribute("movPrint");
            if(m!=null){ 
            %>
            <tr><td height='50'><div style='padding-left: 66em;'></div></td></tr>
            <tr><td height='50'><div style='float: right'>วันที่ยื่นคำร้อง: <b><%=m.getReqDate()%></b></div></td></tr>
            <tr><td height='50'><div style='padding-left: 10em;'>ขาพเจ้า นาย <b>{_____FULL NAME_____}</b> สถานะ <b>{___USER.STATUS___}</b> ถือบัตรประชาชนเลขที่ <b>{___USER.ID CARD___}</b></div></td></tr>
            <tr><td height='50'><div style='padding-left: 10em;'>อยู่บ้านเลขที่<b>{USER.HOMEID}</b> ถนน <b>{USER.HOMEROAD}</b> แขวง <b>{USER.HOMEDISTRICT}</b> เขต <b>{USER.HOMESUBDIST}</b></div></td></tr>
            <tr><td height='50'><div style='padding-left: 5em;'> จังหวัด<b>{USER.HOMEPROVINCE}</b> เบอร์โทรศัพท์ที่ติดต่อได้ <b>{USER.TELEPHONE}</b></div></td></tr>
            <tr><td height='50'><div style='padding-left: 10em;'>มีความประสงค์จะทำการขนย้ายสิ่งของ จากห้องชุดเลขที่ <b>2/<%=m.getRoomId()%></b> ชั้น <b><%=m.getRoomId()/100%></b> ของอาคารชุดฯ ในวันที่ <b><%=m.getDateMove().substring(0, 10)%> </b> เวลา<b><%=m.getDateMove().substring(11,16)%></b> นาฬิกา</div></td></tr>
            <tr><td height='50'><div style='padding-left: 10em;'>เนื่องจาก <b><%=m.getRemark()%></b></div></td></tr>
            <tr><td height='50'></td></tr>
            <tr><td height='50'><div style='padding-left: 28em;'><h3><b>รายการทรัพย์สินที่ขนย้าย</b></h3></div></td></tr>
            <%List<stuff> ss = (List) request.getAttribute("stuff");
            if(ss!=null){
                int count = 0;
            for(stuff s : ss){
                count++;    
            %>
            <tr><td height='35'><div style='padding-left: 15em;'>รายการที่ <b><%=count%>) <%=s.getDesc()%> </b>จำนวนชิ้น <b><%=s.getAmt()%></b> <b>หมายเหตุ</b>_______________</div></td></tr>
            <%}}else{%>
            <tr><td height='50'><div style='padding-left: 5em;'>รายการสิ่งของ ______________________________________________________ จำนวน __________ หมายเหตุ ___________________</div></td></tr>
            <%}%>
            <tr><td height='50'></td></tr>
            <tr><td height='30'><div style='padding-left: 15em;'>ขาพเจ้าขอรับรองว่า รายการทรัพย์สินที่ระบุข้างต้น เป็นของข้าพเจ้าจริง และยินดีที่จะให้ทางนิติบุคคลฯ</div></td></tr>
            <tr><td height='30'><div style='padding-left: 5em;'>หรือผู้รับมอบอำนาจจากนิติบุคคลฯ ตรวจสอบความถูกต้องจนเป็นที่แน่ใจ และขาพเจ้าขอสละสิทธิใดๆที่จะทำการเรียกร้อง หรือ</div></td></tr>
            <tr><td height='30'><div style='padding-left: 5em;'>ดำเนินการทางกฎหมายต่อนิติบุคคลฯ เพราะเหตุจากการดำเนินการดังกล่าว</div></td></tr>
            <tr><td height='30'><div style='padding-left: 5em;'><b><u> หมายเหตุ </u></b> กรณีผู้เช่า, ผู้พักอาศัยประสงค์จะทำการขนย้าย ต้องมีลายเซ็นรับรองจากเจ้าของห้องชุด หรือผู้แทนลงนามรับรอง</div></td></tr>
            <tr><td height='30'><div style='padding-left: 5em;'>และจะต้องชำระหนี้ที่ค้างชำระในส่นของนิติบุคคลฯให้หมดก่อน</div></td></tr>
            <tr><td height='70'><div style='padding-left: 5em;'>ลงชื่อ_________________________เจ้าของห้องชุด<%for(int i=0;i<50;i++){%>&nbsp;<%}%>ลงชื่อ_________________________ผู้ขนย้าย</div></td></tr>
            <tr><td height='50'><div style='padding-left: 8em;'>(_____________________________)<%for(int i=0;i<65;i++){%>&nbsp;<%}%>(_____________________________)</div></td></tr>
            <tr><td height='60'><div style='padding-left: 38em;'>ลงชื่อ_________________________ฝ่ายจัดการ</div></td></tr>
            <tr><td height='40'><div style='padding-left: 39em;'>(______________________________)</div></td></tr>
            <tr><td height='50'></td></tr>
            <tr><td height='40'><div style='padding-left: 5em;'>สำหรับเจ้าหน้าที่รักษาความปลอดภัย</div></td></tr>
            <tr><td height='20'><div style='padding-left: 5em;'>ทะเบียนรถ _____________________</div></td></tr>
            <tr><td height='20'><div style='padding-left: 5em;'>จังหวัด ________________________</div></td></tr>
            <tr><td height='20'><div style='padding-left: 5em;'>ยี่ห้อ __________________________</div></td></tr>
            <tr><td height='20'><div style='padding-left: 5em;'>สี ____________________________</div></td></tr>
            <tr><td height='40'><div style='padding-left: 5em;'>ลงชื่อ _____________________ รปภ.</div></td></tr>
            <%}%>  
            </table>
                <script>
function printout() {
    window.print();
}
</script>
    </body>
</html>