/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.*;
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
public class adminBarNoti extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        
        int mtn = Maintanance.getReqAmountByStatus("New");
        int par = parcel.getExistParcel().size();
        int pro = Problem.getNewRequest().size();
        int dec = Decoration.getNewRequest().size();
        int mov = Moving.getNewRequest().size();
        
        String bell = " <sup><i class='fa fa-bell-o'></i></sup>"+"\"";
        String ok = "<div style='color:green;'>OK!</div>"+"\"";
        
        String mtnAmt = "\"mtnAmt\":\"" + mtn + bell;
        String parAmt = "\"parAmt\":\"" + par + bell; 
        String proAmt = "\"proAmt\":\"" + pro + bell;
        String decAmt = "\"decAmt\":\"" + dec + bell;
        String movAmt = "\"movAmt\":\"" + mov + bell;
        
        if(mtn==0){mtnAmt = "\"mtnAmt\":\"" + ok ;};
        if(par==0){parAmt = "\"parAmt\":\"" + ok ;};
        if(pro==0){proAmt = "\"proAmt\":\"" + ok ;};
        if(dec==0){decAmt = "\"decAmt\":\"" + ok ;};
        if(mov==0){movAmt = "\"movAmt\":\"" + ok ;};
        
        String allAmt = "{"+mtnAmt+","+parAmt+","+proAmt+","+decAmt+","+movAmt+"}";
        
        try (PrintWriter out = response.getWriter()) {
            out.println(allAmt);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
