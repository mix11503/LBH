package Controller.Mtn;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import Model.Maintanance;
import Model.MtnChat;
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
public class mtnEva extends HttpServlet {

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
        String mtnId = request.getParameter("mtnId");
        Maintanance mtn = null;
        List<MtnChat> m = null;
        String message = null;
        String messageChat = null;
        String target = "/user_panel.jsp";
        if(mtnId != null || mtnId.equals("")==false){
            try{
            mtn = Maintanance.findBymtnId(Integer.parseInt(mtnId));
            m = MtnChat.getChat(Integer.parseInt(mtnId));
            }catch(Exception e){
                System.err.println(e);
            }
            if(mtn!=null){
                if(mtn.getMtn_status().equalsIgnoreCase("done")){
                    request.setAttribute("mtn", mtn);
                    if(mtn.getMtn_result_eva().equalsIgnoreCase("") || mtn.getMtn_result_eva()==null){
                    target = "/mtnEvaluation.jsp";
                    }else{
                    //    target = "/mtnEvaluation.jsp";
                        message = "Eva already!";
                    }
                }else{
                    message = "Couldn't find finished MTN form!";    
                }
            }else{
                message = "It's null!";
            }
            if(m!=null && mtn.getMtn_status().equalsIgnoreCase("new")==false){
                request.setAttribute("mtnChat", m);
                target = "/mtnEvaluation.jsp";
            }else{
                messageChat = "Check Work Status, no chat currently";
            }
            request.setAttribute("rId", mtn.getMtn_room_id());
        }
        request.setAttribute("message", message);
        request.setAttribute("messageChat", messageChat);
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
