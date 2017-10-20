/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Moving;

import Model.Moving;
import static Model.notifyAdmin.createNoti;
import Model.stuff;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Joe
 */
public class createMoveReq extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        
        String desc = request.getParameter("desc");
        String date = request.getParameter("date");
        String time = request.getParameter("time");
        String roomId = request.getParameter("roomId");
        String st = request.getParameter("stuff");
        try{
            Moving m = new Moving();
            m.setDateMove(date+" "+time);
            m.setInOrOut(true);
            m.setRemark(desc);
            m.createRequest(Integer.parseInt(roomId));
            //add stuff
            stuff.addStuff(st, 1, m.getId());
            //add more stuff
        for(int i=1;i<=10;i++){
            if(request.getParameter("stuff"+i)!=null){
                stuff.addStuff(request.getParameter("stuff"+i), 1, m.getId());
            }
        }
        //Create Noti
            String app = null;
            if(desc.length()>10){ app = desc.substring(0,10)+"...";}else{ app = desc;};
            createNoti("Resident","Moving Request","request "+app, Integer.parseInt(roomId));
        }catch(Exception e){
            System.err.println(e);
        }
        getServletContext().getRequestDispatcher("/userMovHistory?roomNo="+roomId).forward(request, response);
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
