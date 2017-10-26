package Controller.Mtn;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import Model.Maintanance;
import Model.MtnChat;
import Model.mtnAppointment;
import static Model.notifyAdmin.createNoti;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Joe's
 */
public class mtnApp extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String date1 = request.getParameter("dateAppoint1");
        String time1 = request.getParameter("timeStart1");
        String timeend1 = request.getParameter("timeEnd1");
        String date2 = request.getParameter("dateAppoint2");
        String time2 = request.getParameter("timeStart2");
        String timeend2 = request.getParameter("timeEnd2");
        String other = request.getParameter("other");
        String mtnId = request.getParameter("mtnId");
        mtnAppointment m = null;
        if(date1.equals("") || date2.equals("")){
                date1 = null; date2 = null;
            }
        try{
            //Insert into DB
            m = new mtnAppointment();
            m.setApp_date1(date1);
            m.setApp_date2(date2);
            m.setApp_time1(time1);
            m.setApp_timeend1(timeend1);
            m.setApp_time2(time2);
            m.setApp_timeend2(timeend2);
            m.setApp_remark(other);
            m.updateAppointment(Integer.parseInt(mtnId));
            
            //set appToken to False
            Maintanance mtn = new Maintanance();
            mtn.setAppToken(false);
            mtn.setAppToken(Integer.parseInt(mtnId));
            
            //get to Show in MTN Chat
            MtnChat mc = new MtnChat();
            mc.setMtnId(Integer.parseInt(mtnId));
            String desc = "First Appointment Date: "+date1+", ["+time1+" - "+timeend1+"]"+"<br>"
                        + "Second Appointment Date: "+date2+", ["+time2+" - "+timeend2+"]"+"<br>"
                        + "Optional Choice: "+other;
            mc.setDesc(desc);
            mc.updateChat(Integer.parseInt(mtnId));
            
            //Create Noti
            String appoint = " Appointment Date: "+date1+", ["+time1+" - "+timeend1+"]";
            createNoti("Resident","Maintenance","request "+appoint,"SearchMtnReq?id="+mtnId, Integer.parseInt(request.getParameter("roomId")));
            
        }catch(Exception e){
            System.err.println(e);
        }
        getServletContext().getRequestDispatcher("/mtnProgress?mtnId="+mtnId).forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
