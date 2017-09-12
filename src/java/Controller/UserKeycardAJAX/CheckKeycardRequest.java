/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.UserKeycardAJAX;

import Model.Keycard;
import Model.KeycardReq;
import com.google.gson.Gson;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Mix
 */
public class CheckKeycardRequest extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int roomId = (int)request.getSession().getAttribute("roomId");
        int keycardId = Integer.parseInt(request.getParameter("keyId"));
        KeycardReq keycardReq = KeycardReq.listWaitingRequestByRoom(roomId);
        HttpSession session = request.getSession();                               
        session.setAttribute("keyId", keycardId);
        if(keycardReq != null){
            Gson gson = new Gson();
            response.getOutputStream().print(gson.toJson(keycardReq));
        }else{
            List<Keycard> keycardList = Keycard.findAvailableKeycard(roomId);
            if(!keycardList.isEmpty()){
                Gson gson = new Gson();
                response.getOutputStream().print(gson.toJson("LostOrAddition"));
            }else{
                Gson gson = new Gson();               
                response.getOutputStream().print(gson.toJson("RequestDoc"));
            }
        }
    }
}
