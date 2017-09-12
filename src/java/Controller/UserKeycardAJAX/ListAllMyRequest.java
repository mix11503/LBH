/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.UserKeycardAJAX;

import Model.KeycardReq;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Mix
 */
public class ListAllMyRequest extends HttpServlet {
  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int roomId = (int)request.getSession().getAttribute("roomId");
        List<KeycardReq> keycardReqList = KeycardReq.listRequestByRoom(roomId);
        Gson gson = new Gson();
        response.getOutputStream().print(gson.toJson(keycardReqList));
    }


}
