/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.AdminKeycardAJAX;

import Model.KeycardReq;
import com.google.gson.Gson;
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
public class GetKeycardRequestById extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int keycardReqId = Integer.parseInt(request.getParameter("keycardReqId"));
        KeycardReq keycardReq = KeycardReq.findById(keycardReqId);
        Gson gson = new Gson();
        response.getOutputStream().print(gson.toJson(keycardReq));
    }


}
