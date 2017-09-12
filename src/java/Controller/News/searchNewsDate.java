/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.News;

import Model.newsUpdate;
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
public class searchNewsDate extends HttpServlet {

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
        List<newsUpdate> news = null;
        String start = request.getParameter("start");
        String end = request.getParameter("end");
        String message = null;
        if (start.equals("") == true && end.equals("") == true) {
            message = "Please select at least one of each condition to search!";
            } else if(start.equals("") == false || end.equals("") == false){
            if(start.equals("") == false && end.equals("") == false){
               news = newsUpdate.searchNewsInRange(start, end);
            }else if(start.equals("") == true && end.equals("") == false){
                String current = new java.sql.Date(new Date().getTime()).toString();
               news = newsUpdate.searchNewsInRange(current, end); 
            }else if(start.equals("") == false && end.equals("") == true){
                String current = new java.sql.Date(new Date().getTime()).toString();
               news = newsUpdate.searchNewsInRange(start, current); 
            }
            request.setAttribute("newsByDate", news);
        }
        request.setAttribute("message", message);
        getServletContext().getRequestDispatcher("/viewNewsAdmin.jsp").forward(request, response);
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
