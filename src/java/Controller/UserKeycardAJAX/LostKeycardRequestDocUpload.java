/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.UserKeycardAJAX;

import Model.KeycardReq;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Mix
 */
@MultipartConfig
public class LostKeycardRequestDocUpload extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int roomId = (int) request.getSession().getAttribute("roomId");
        String lostKeyIdText = request.getParameter("lostKeyId");
        int lostKeyId = Integer.parseInt(lostKeyIdText);
        Part filePart = request.getPart("file");
        String root = getServletContext().getRealPath("/");
        File upload = new File(root + "/lost_request_doc/" + roomId);
        if (!upload.exists()) {
            boolean status = upload.mkdirs();
        }

        String noticeDoc = "";
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
        InputStream fileContent = filePart.getInputStream();
        String tempName = "noticeDoc";

        int fileVersion = 1;
        String fileType = fileName.substring(fileName.indexOf("."));
        File fullPath = new File(upload + "/" + tempName + fileVersion + fileType);

        while (fullPath.exists()) {
            fileVersion++;
            fullPath = new File(upload + "/" + tempName + fileVersion + fileType);
        }

        try (InputStream input = fileContent) {
            Files.copy(input, fullPath.toPath());
        }
        noticeDoc = tempName + fileVersion + fileType; 
        KeycardReq.insertLostRequest(lostKeyId, noticeDoc);
    }

}
