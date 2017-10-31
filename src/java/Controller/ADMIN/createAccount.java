/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.ADMIN;

import Model.Resident;
import Model.mailRegister;
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
public class createAccount extends HttpServlet {

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
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        String email = request.getParameter("email");
        String phone = request.getParameter("number");
        String status = request.getParameter("status");
        String room = request.getParameter("room");
        String start = request.getParameter("start");
        String end = request.getParameter("end");
        String message = null;
        String messageError = null;
        
        if(Integer.parseInt(room)<=200 || Integer.parseInt(room)>832){
            messageError = "Invalid RoomNumber";
        }else if(((Integer.parseInt(room)/10)%10)>3){
            messageError = "Invalid RoomNumber";
        }else if(((Integer.parseInt(room)/10)%10)==3 && (Integer.parseInt(room)%10)>2){
            messageError = "Invalid RoomNumber";    
        }else{
            try{
            Resident r = new Resident();
            r.setName(name);
            r.setLastname(surname);
            r.setEmail(email);
            r.setPhone(Long.parseLong(phone));
            r.setIsOwner(status.equalsIgnoreCase("owner"));
            r.setRent_start(start);
            r.setRent_end(end);
            r.createAccount(Integer.parseInt(room));
            
            mailRegister.sendSetPw(email);
            
            message = "Create Account Successfully!";
        }catch(Exception e){
            System.err.println("create acc servlet: "+e);
        }
        }
        request.setAttribute("message", message);
        request.setAttribute("messageError", messageError);
        getServletContext().getRequestDispatcher("/createAccount.jsp").forward(request, response);
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
