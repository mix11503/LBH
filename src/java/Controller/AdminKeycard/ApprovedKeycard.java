/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.AdminKeycard;

import Model.Keycard;
import Model.KeycardReq;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Mix
 */
public class ApprovedKeycard extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String requestStatus = request.getParameter("krstatus");
        int requsetId = Integer.parseInt(request.getParameter("krid"));
        int keyId = Integer.parseInt(request.getParameter("kid"));
        int roomId = Integer.parseInt(request.getParameter("roomid"));
        switch(requestStatus){
            case "WaitingNew" : 
                KeycardReq.approve(requsetId);
                Keycard.statusAvailable(keyId);
                break;
            case "WaitingLost" :
                KeycardReq.approve(requsetId);
                Keycard.updateLostKeycard(keyId);
                Keycard.setNewAvailableByRoom(roomId);
                break;
            case "WaitingAdd" :
                KeycardReq.approve(requsetId);
                Keycard.statusAvailable(keyId);
                break;
            default : break;
        }
        getServletContext().getRequestDispatcher("/GetKeycardReqNew").forward(request, response);
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
