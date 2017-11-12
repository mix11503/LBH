/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Mtn;

import Model.Maintanance;
import Model.notifyUser;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Scanner;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Joe's
 */
public class updateAction extends HttpServlet {

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
        String id = request.getParameter("id");
        String result = request.getParameter("result");
        String cost = request.getParameter("cost");
        String material = request.getParameter("material");
        String room = request.getParameter("room");
        Maintanance m = null;
        double dcost;
        String message = null;
        if (id != null) {
            try {
                dcost = Double.parseDouble(cost);
                try {
                    m = new Maintanance();
                    m.setMtn_result(result);
                    m.setMtn_material(material);
                    m.setMtn_cost(dcost);
                    m.updateAction(Integer.parseInt(id));
                    notifyUser.createNotiMtn("mtnProgress?mtnId="+id,"Action Taken: "+result,Integer.parseInt(room));
                } catch (Exception e) {
                    System.err.println("updateAction " + e);
                }
            } catch (Exception e) {
                message = "Please enter number";
            }
        }
        request.setAttribute("messageAction", message);
        
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
                    + "\"filters\": [{\"field\": \"tag\", \"key\": \"room\", \"relation\": \"=\", \"value\": \""+room+"\"}],"
                    + "\"contents\": {\"en\": \"Your Maintenance Request Action Update. \nRequest ID: "+id+"\"}"
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
        
        getServletContext().getRequestDispatcher("/SearchMtnReq?id=" + id).forward(request, response);
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
