/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Problem;

import Model.Problem;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Joe's
 */
public class searchPbmRange extends HttpServlet {

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
        List<Problem> pbm = null;
        String start = request.getParameter("dateStart");
        String end = request.getParameter("dateEnd");
        String message = null;
        if (start.equals("") == true && end.equals("") == true) {
            message = "Please select at least one of each condition to search!";
            } else if(start.equals("") == false || end.equals("") == false){
            if(start.equals("") == false && end.equals("") == false){
               pbm = Problem.searchPbmInRange(start, end);
            }else if(start.equals("") == true && end.equals("") == false){
                String current = new java.sql.Date(new Date().getTime()).toString();
               pbm = Problem.searchPbmInRange(current, end); 
            }else if(start.equals("") == false && end.equals("") == true){
                String current = new java.sql.Date(new Date().getTime()).toString();
               pbm = Problem.searchPbmInRange(start, current); 
            }
            request.setAttribute("pbm", pbm);
        }
        request.setAttribute("message", message);
        getServletContext().getRequestDispatcher("/admProblemMgn.jsp").forward(request, response);
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
