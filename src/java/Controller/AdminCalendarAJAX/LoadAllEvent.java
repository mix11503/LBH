/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.AdminCalendarAJAX;

import Model.WorkCalendarEvent;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Mix
 */
public class LoadAllEvent extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        List<WorkCalendarEvent> eventList = WorkCalendarEvent.findAllEvent();
        Gson gson = new Gson();
        response.getOutputStream().print(gson.toJson(eventList));
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
