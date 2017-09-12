/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Mtn;

import Model.Maintanance;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Joe's
 */
public class searchByStatus extends HttpServlet {

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
        List<Maintanance> mtn = null;
        String message = null;
        String status = request.getParameter("status");
        if (status != null) {
            if (status.equalsIgnoreCase("all")) {
                    List<Maintanance> mtn2 = null;
                    List<Maintanance> mtn3 = null;
                    mtn = Maintanance.findByStatus("New");
                    mtn2 = Maintanance.findByStatus("Queue");
                    mtn3 = Maintanance.findByStatus("Done");
                    request.setAttribute("record", mtn);
                    request.setAttribute("record2", mtn2);
                    request.setAttribute("record3", mtn3);
            } else {
                try {
                    mtn = Maintanance.findByStatus(status);
                    if (mtn == null || mtn.isEmpty() == true) {
                        message = "Room not found!";
                    } else {
                        request.setAttribute("record", mtn);
                    }
                } catch (Exception e) {
                    System.out.println("Search by Status Servlet" + e);
                }
            }
        }
        request.setAttribute("message", message);
        getServletContext().getRequestDispatcher("/mtnOverview.jsp").forward(request, response);
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
