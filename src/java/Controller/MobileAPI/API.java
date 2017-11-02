/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.MobileAPI;

import Model.Maintanance;
import Model.Problem;
import Model.newsUpdate;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONObject;

/**
 *
 * @author Mix
 */
public class API extends HttpServlet {

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
        String pathInfo = request.getPathInfo();
        String[] pathParts = pathInfo.split("/");
        String part1 = pathParts[1];
        Gson gson = new Gson();
        
        switch(part1){
            case "News" : 
                List<newsUpdate> news = newsUpdate.getCurrentNews();
                try (PrintWriter out = response.getWriter()) {
                    out.println(gson.toJson(news));
                }
                break;
                
            case "MTN" :
                List<Maintanance> mtn = null;
                String message = null;
                //String jsonData = request.getParameter("jsondata");
                //JSONObject jsonObject = new JSONObject(jsonData);
                //String id = jsonObject.getString("roomId");
                String id = request.getParameter("roomId");
                if(id != null){
                    try{
                        int roomId = Integer.parseInt(id);
                        mtn = Maintanance.findByRoomId(roomId);
                        if(mtn == null || mtn.isEmpty() == true){
                        message = "Room not found!";
                        }else{
                            request.setAttribute("record", mtn);
                        }
                    }catch(Exception e){
                        message = "please enter number!";
                    }
                    try (PrintWriter out = response.getWriter()) {
                        out.println(gson.toJson(mtn));
                    }
                }
                break;
            
            case "Problem" :
                String roomId = request.getParameter("roomId");
                List<Problem> pbm = Problem.getRequestByRoomNo(Integer.parseInt(roomId));
                try (PrintWriter out = response.getWriter()) {
                    out.println(gson.toJson(pbm));
                }
                break;
        }
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
