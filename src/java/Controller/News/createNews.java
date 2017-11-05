/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.News;

import Model.newsUpdate;
import static Model.notifyUser.createNotiNews;
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
public class createNews extends HttpServlet {

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
        
        String topic = request.getParameter("topic");
        String desc = request.getParameter("desc");
        String start = request.getParameter("startdate");
        String end = request.getParameter("enddate");
        String cate = request.getParameter("category");
        String adName = request.getParameter("adName");
        String att = "<h6 style=\"text-align: right;\"><em>By Admin: "+adName+"</em></h6>";
        newsUpdate nu = null;
        String message = null;
        
        String all = request.getParameter("0");
        String f2 = request.getParameter("200");
        String f3 = request.getParameter("300");
        String f4 = request.getParameter("400");
        String f5 = request.getParameter("500");
        String f6 = request.getParameter("600");
        String f7 = request.getParameter("700");
        String f8 = request.getParameter("800");
        
        try{
            nu = new newsUpdate();
            nu.setNews_topic(topic);
            nu.setNews_desc(desc+" "+att);
            nu.setCate(cate);
            nu.createNews(start, end);
            
            if(all!=null){
             nu.attachedTag(nu.getNews_id(), Integer.parseInt(all));
             createNotiNews("",nu.getNews_id(),0);
            }else{
            if(f2!=null){nu.attachedTag(nu.getNews_id(), Integer.parseInt(f2));createNotiNews("",nu.getNews_id(),200);}
            if(f3!=null){nu.attachedTag(nu.getNews_id(), Integer.parseInt(f3));createNotiNews("",nu.getNews_id(),300);}
            if(f4!=null){nu.attachedTag(nu.getNews_id(), Integer.parseInt(f4));createNotiNews("",nu.getNews_id(),400);}
            if(f5!=null){nu.attachedTag(nu.getNews_id(), Integer.parseInt(f5));createNotiNews("",nu.getNews_id(),500);}
            if(f6!=null){nu.attachedTag(nu.getNews_id(), Integer.parseInt(f6));createNotiNews("",nu.getNews_id(),600);}
            if(f7!=null){nu.attachedTag(nu.getNews_id(), Integer.parseInt(f7));createNotiNews("",nu.getNews_id(),700);}
            if(f8!=null){nu.attachedTag(nu.getNews_id(), Integer.parseInt(f8));createNotiNews("",nu.getNews_id(),800);}
            }     
            message = "Create News Successfully!";
        }catch(Exception e){
            message = "error!";
        }
        request.setAttribute("message", message);
        getServletContext().getRequestDispatcher("/createNews.jsp").forward(request, response);
        
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
