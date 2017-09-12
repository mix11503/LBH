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
import java.util.List;
import java.util.stream.Collectors;
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
public class NewKeycardRequestDocUpload extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int roomId = (int)request.getSession().getAttribute("roomId");
        int keycardId = (int)request.getSession().getAttribute("keyId");
        List<Part> fileParts = request.getParts().stream().filter(part -> "file".equals(part.getName())).collect(Collectors.toList()); // Retrieves <input type="file" name="file" multiple="true">
        String root = getServletContext().getRealPath("/");
        File upload = new File(root + "/new_request_doc/" + roomId);
        if (!upload.exists()) {
            boolean status = upload.mkdirs();
        }
        
        int i = 0;
        String idcardDoc = "";
        String leaseDoc = "";
        for (Part filePart : fileParts) {
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
            InputStream fileContent = filePart.getInputStream();
            String tempName = "";
            
            if(i == 0){
                tempName = "idcard";
            }else{
                tempName = "lease";
            }
            
            int fileVersion = 1;
            String fileType = fileName.substring(fileName.indexOf("."));   
            File fullPath = new File(upload + "/" + tempName + fileVersion + fileType);
            
            while(fullPath.exists()){
                fileVersion++;
                fullPath = new File(upload + "/" + tempName + fileVersion + fileType);
            }
            
            try (InputStream input = fileContent) {
                 Files.copy(input, fullPath.toPath());
            }
            
            if(i == 0){
                idcardDoc = tempName + fileVersion + fileType;                
            }else{
                leaseDoc = tempName + fileVersion + fileType;
            }
            i++;
        }
        KeycardReq.insertNewRequest(keycardId, idcardDoc, leaseDoc);
    }
}
