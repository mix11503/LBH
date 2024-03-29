/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Decoration;

import Model.Decoration;
import Model.WorkCalendarEvent;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Scanner;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Joe
 */
public class ApproveDec extends HttpServlet {

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
        String id = request.getParameter("id");
        String detail = request.getParameter("desc");
        String appBy = request.getParameter("appBy");
        String url = "printDecSheet?id="+id;
        String color = "orange";
        String type = "Decorate";
        String roomId = request.getParameter("roomId");
        String title = "Room "+roomId+" : Decorate";
        String textStartDate = request.getParameter("start");
        System.out.println(textStartDate);
        String textEndDate = request.getParameter("end");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date startDate = null;
        Date endDate  = null;
        try{
            Decoration.Approved(Integer.parseInt(id), appBy);
            java.util.Date utilDate = sdf.parse(textStartDate);
            startDate = new java.sql.Date(utilDate.getTime());
            utilDate = sdf.parse(textEndDate);
            endDate = new java.sql.Date(utilDate.getTime());
        }catch(Exception e){
            System.err.println("ApproveDec, "+e);
        }
        WorkCalendarEvent.createNewEvent(title, detail, startDate, endDate, url, color, type);
        List<Decoration> dec = Decoration.getAllRequest();
        request.setAttribute("dec", dec);
        
        try {
            String jsonResponse;

            URL sendUrl = new URL("https://onesignal.com/api/v1/notifications");
            HttpURLConnection con = (HttpURLConnection) sendUrl.openConnection();
            con.setUseCaches(false);
            con.setDoOutput(true);
            con.setDoInput(true);

            con.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
            con.setRequestProperty("Authorization", "Basic Zjk5OTBjMDktMjJmNi00YjY0LWI4ZjYtYTcxOTE2NmViOGIw");
            con.setRequestMethod("POST");

            String strJsonBody = "{"
                    + "\"app_id\": \"ad05f2e7-20a3-4e8d-b8fc-006362a35cfc\","
                    + "\"filters\": [{\"field\": \"tag\", \"key\": \"room\", \"relation\": \"=\", \"value\": \""+roomId+"\"}],"
                    + "\"contents\": {\"en\": \"Your decoration request approved.\nDescription :"+detail+"\"}"
                    + "}";

            System.out.println("strJsonBody:\n" + strJsonBody);

            byte[] sendBytes = strJsonBody.getBytes("UTF-8");
            con.setFixedLengthStreamingMode(sendBytes.length);

            OutputStream outputStream = con.getOutputStream();
            outputStream.write(sendBytes);

            int httpResponse = con.getResponseCode();
            System.out.println("httpResponse: " + httpResponse);

            if (httpResponse >= HttpURLConnection.HTTP_OK
                    && httpResponse < HttpURLConnection.HTTP_BAD_REQUEST) {
                Scanner scanner = new Scanner(con.getInputStream(), "UTF-8");
                jsonResponse = scanner.useDelimiter("\\A").hasNext() ? scanner.next() : "";
                scanner.close();
            } else {
                Scanner scanner = new Scanner(con.getErrorStream(), "UTF-8");
                jsonResponse = scanner.useDelimiter("\\A").hasNext() ? scanner.next() : "";
                scanner.close();
            }
            System.out.println("jsonResponse:\n" + jsonResponse);

        } catch (Throwable t) {
            t.printStackTrace();
        }
        
        getServletContext().getRequestDispatcher("/DecAdmin.jsp").forward(request, response);
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
