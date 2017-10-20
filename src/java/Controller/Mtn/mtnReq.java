package Controller.Mtn;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import Model.Maintanance;
import static Model.notifyAdmin.createNoti;
import com.sun.xml.wss.swa.MimeConstants;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.io.*;
import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
/*
 * @author Joe's
 */

public class mtnReq extends HttpServlet {

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
        Maintanance mtn = null;
        int roomid = 0;
        String message = "";
        String target = "/userMtnReq.jsp";

        boolean isMultipart = ServletFileUpload.isMultipartContent(request);

        if (isMultipart) {
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            List<String> paths = new LinkedList<String>();

            try {
                List items = upload.parseRequest(request);
                Iterator iterator = items.iterator();
                mtn = new Maintanance();
                while (iterator.hasNext()) {
                    FileItem item = (FileItem) iterator.next();
                    if (item.isFormField()) {
                        String name = item.getFieldName();
                        String value = item.getString("UTF-8");
                        if (value.equalsIgnoreCase("")) {
                            message = "Please fill in all blank!";
                            break;
                        } else if (name.equalsIgnoreCase("roomId")) {
                            roomid = Integer.parseInt(value);
                        } else if (name.equalsIgnoreCase("area")) {
                            mtn.setMtn_ServiceArea(value);
                        } else if (name.equalsIgnoreCase("stuff")) {
                            mtn.setMtn_area_stuff(value);
                        } else if (name.equalsIgnoreCase("desc")) {
                            mtn.setMtn_desc(value);
                        }
                        System.out.println(value);
                    } else if (!item.isFormField()) {
                        String fileName = item.getName();
                        if (!fileName.equalsIgnoreCase("")) {
                            String root = getServletContext().getRealPath("/");
                            File path = new File(root + "/pic");
                            if (!path.exists()) {
                                boolean status = path.mkdirs();
                            }
                            File uploadedFile = new File(path + "/" + fileName);
                            System.out.println(uploadedFile.getAbsolutePath());
                            item.write(uploadedFile);
                            paths.add("pic/" + fileName);
                        }
                    }
                }
                if (message.equalsIgnoreCase("")) {
                    mtn.writeNewRequest(roomid, paths);
                    target = "/MTNSearchRoom?id=" + roomid;
                    
                    //Create Noti
                    //String app = request.getParameter("area") + ": " + request.getParameter("stuff");
                    //createNoti("Resident","Maintenance","request "+app, Integer.parseInt(request.getParameter("roomId")));
                }
            } catch (FileUploadException e) {
                e.printStackTrace();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        /*
         if (roomId == null || area.trim().equalsIgnoreCase("") || desc.trim().equalsIgnoreCase("")) {
         message = "Please fill in all blank!";
         } else {
         int roomid = Integer.parseInt(roomId);
         mtn = new Maintanance();
         mtn.setMtn_ServiceArea(area);
         mtn.setMtn_desc(desc);
         mtn.setMtn_area_stuff(stuff);
         mtn.writeNewRequest(roomid);
         target = "/MTNSearchRoom?id=" + roomId;
         //  System.out.println("Servlet: "+desc);
         }
         */
        request.setAttribute("message", message);
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
