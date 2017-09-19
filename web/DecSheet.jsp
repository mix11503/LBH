<%@page import="Model.Decoration"%>
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
    <h3>ใบคำร้องขอเข้าตกแต่งต่อเติมผู้รับเหมา</h3>
    </center>
    <body>
        <table border="0" width="50%" style="border-collapse: collapse;">
            <%
            Decoration d = (Decoration) request.getAttribute("decPrint");
            if(d!=null){ 
            %>
            <tr><td height='50'><div style='padding-left: 66em;'></div></td></tr>
            <tr><td height='50'><div style='float: right'>วันที่ส่งคำร้อง: <%=d.getReqDate()%></div></td></tr>
            <tr><td height='50'><div style='padding-left: 10em;'>มีความประสงค์ขอเข้าตกแต่งห้องชุดเลขที่ <b>2/<%=d.getRoomId()%></b>   โดยมีรายละเอียดดังนี้</div></td></tr>
            <tr><td height='50'><div style='padding-left: 5em;'>
                <%if(d.getDesc().length()>120){%><%=d.getDesc().substring(0,120)%><br><%=d.getDesc().substring(120,d.getDesc().length()-1)%>
                    <%}else{%><%=d.getDesc()%>,<%for(int i=d.getDesc().length();i<=110;i++){%>_<%}}%></div></td></tr>
            <tr><td height='50'><div style='padding-left: 10em;'>ตั้งแต่วันที่: <b><%=d.getStart()%></b> ถึงวันที่: <b><%=d.getEnd()%></b> โดยมีรายชื่อพนักงานดังนี้</div></td></tr>
            <tr><td height='50'><div style='padding-left: 15em;'>ผู้รับเหมาชื่อ ( นาย, นาง, นางสาว, บริษัทฯ )_____________________________________________อายุ__________ปี</div></td></tr>
            <tr><td height='50'><div style='padding-left: 5em;'>ที่อยู่ที่สามารถติดต่อได้เลขที่____________________หมู่ที่____________________ซอย____________________ถนน____________________</div></td></tr>
            <tr><td height='50'><div style='padding-left: 5em;'>แขวง______________________________เขต______________________________จังหวัด______________________________________</div></td></tr>
            <tr><td height='50'><div style='padding-left: 5em;'>เบอร์โทรศัพท์_____________________________________________เบอร์โทรสาร_____________________________________________</div></td></tr>
            <tr><td height='50'><div style='padding-left: 15em;'>พนักงานชื่อ</div></td></tr>
            <tr><td height='50'><div style='padding-left: 5em;'>1. ________________________________________________________________ บัตรประชาชนเลขที่ ___________________________</div></td></tr>
            <tr><td height='50'><div style='padding-left: 5em;'>2. ________________________________________________________________ บัตรประชาชนเลขที่ ___________________________</div></td></tr>
            <tr><td height='50'><div style='padding-left: 5em;'>3. ________________________________________________________________ บัตรประชาชนเลขที่ ___________________________</div></td></tr>
            <tr><td height='50'><div style='padding-left: 5em;'>4. ________________________________________________________________ บัตรประชาชนเลขที่ ___________________________</div></td></tr>
            <tr><td height='50'><div style='padding-left: 5em;'>5. ________________________________________________________________ บัตรประชาชนเลขที่ ___________________________</div></td></tr>
            <tr><td height='70'><div style='padding-left: 35em;'>ลงชื่อ________________________________ผู้ร้องขอ</div></td></tr>
            <tr><td height='50'><div style='padding-left: 37em;'>(_________________________________)</div></td></tr>
            <tr><td height='50'><div style='padding-left: 40em;'>วันที่____/____/_________</div></td></tr>
            <tr><td height='50'><div style='padding-left: 5em;'><b><u>หมายเหตุ</u></b></div></td></tr>
            <tr><td height='30'><div style='padding-left: 5em;'>1. นิติบุคคลฯอนุญาติให้ขนของเข้า-ออกอาคาร ระหว่าง 09.00 - 18.00 น. เท่านั้น</div></td></tr>
            <tr><td height='30'><div style='padding-left: 5em;'>2. หากเกิดความเสียหายกับทรัพย์สินส่วนกลาง / พื้นที่ส่วนอื่นนอกเหนือจากกรรมสทิธิของเจ้าของห้องชุด หรือต่อบุคคลใดๆ</div></td></tr>
            <tr><td height='30'><div style='padding-left: 5em;'>ท่านจะต้องเป็นผู้รับผิดชอบและชดใช้ค่าเสียหายที่เกิดขึ้นทั้งสิ้น</div></td></tr>
            <tr><td height='30'><div style='padding-left: 5em;'>3.นิติบุคคลขอสงวนสิทธิในการเข้าตรวจสอบพื้นที่ที่ทำการตกแต่งได้โดยไม่ต้องแจ้งล่วงหน้า</div></td></tr>
            <tr><td height='90'><div style='padding-left: 35em;'>ลงชื่อ________________________________ผู้ตรวจสอบ</div></td></tr>
            <tr><td height='40'><div style='padding-left: 37em;'>(_________________________________)</div></td></tr>
            <tr><td height='40'><div style='padding-left: 43em;'>ผู้จัดการอาคาร</div></td></tr>
            <tr><td height='40'><div style='padding-left: 40em;'>วันที่____/____/_________</div></td></tr>
            <%}%>  
            </table>
                <script>
function printout() {
    window.print();
}
</script>
    </body>
</html>
