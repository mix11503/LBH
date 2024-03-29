/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Decoration;

import Model.Decoration;
import static Model.notifyAdmin.createNoti;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Joe's
 */
public class createRequest extends HttpServlet {

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
        String start = request.getParameter("start");
        String end = request.getParameter("end");
        String roomId = request.getParameter("roomId");
        String usName = request.getParameter("usName");
        String message = null;
        String target = "/userDecReq.jsp";
        try{
            Decoration d = new Decoration();
            d.setDesc(desc);
            d.setStart(start);
            d.setEnd(end);
            d.setUsName(usName);
            d.createRequest(Integer.parseInt(roomId));
            
            //Create Noti
            String app = null;
            if(desc.length()>10){ app = desc.substring(0,10)+"...";}else{ app = desc;};
            createNoti(usName,"Decorate Request","request "+app,"SearchFilter?filter=New", Integer.parseInt(roomId));
            
            target = "/userViewHistory?roomNo="+roomId;
        }catch(Exception e){
            System.err.println(e);
            message = e+"";
            request.setAttribute("message", message);
        }
        getServletContext().getRequestDispatcher(target).forward(request, response);
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
