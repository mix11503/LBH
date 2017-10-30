package Model;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;
import java.util.Properties;
import java.util.Random;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class mailRegister {
     // ################# E-Mail Information Section ################

    private static String SMTP_HOST_NAME = "smtp.gmail.com";
    private static String SMTP_PORT = "587";
    private static String FROM = "lbhregister@gmail.com";
    private static String TO = "";
    private static String CC = "";
    private static String SUBJECT = "LBH Condo Registration System";
    private static String PASSWORD = "lbh@sitkmutt";
    
    public static String genCode(){
        String result = "";
        char[] chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890".toCharArray();
        StringBuilder sb = new StringBuilder();
        Random random = new Random();
        for (int i = 0; i < 50; i++) {
            char c = chars[random.nextInt(chars.length)];
            sb.append(c);
        }
        result = sb.toString();
        return result;
    }
    
    public static boolean sendSetPw(String email){
        String codeGen = genCode();
        Properties props = new Properties();
        props.put("mail.smtp.host", SMTP_HOST_NAME);
        props.put("mail.smtp.port", SMTP_PORT);
        props.put("mail.smtp.starttls.enable", "true");
        props.setProperty("mail.smtp.auth", "true");

        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(FROM, PASSWORD);
            }
        });
        session.setDebug(false);
        Date now = new Date();
        boolean ckSendMail = false;
        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(FROM));
            InternetAddress[] to_address = InternetAddress.parse(email);
            message.setRecipients(Message.RecipientType.TO, to_address);
            message.setSubject(SUBJECT);

            MimeBodyPart mbp = new MimeBodyPart();
            mbp.setText(codeGen, "UTF-8");
            mbp.setHeader("Content-Type", "text/plain; charset=\"utf-8\"");
            Multipart content = new MimeMultipart();
            content.addBodyPart(mbp);
            message.setContent(content);
            Transport.send(message);
            ckSendMail = true;
            
            //add to db
            int residentId = Resident.findByEmail(email).getId();
            createOTP(email,codeGen,residentId);
            
        } catch (MessagingException mex) {
            System.out.println("\n--Exception handling in msgsendsample.java");
            System.out.println(now + " :: ==>> " + mex);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ckSendMail) {
                System.out.println("Send E-Mail Success..");
            } else {
                System.out.println("Send E-Mail Fail..");
            }
            System.out.println("Run Mail Done...");
        }
        return true;
    }
    public static boolean createOTP(String email, String otp, int id){
        int x = 0;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            String sqlCmd = null;
            sqlCmd = "INSERT INTO mailRegister(email, codeOTP, resident_id) VALUES (?,?,?)";
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setString(1, email);
            pstm.setString(2, otp);
            pstm.setInt(3, id);
            x = pstm.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.err.println("mailRegister, createOTP: " + ex);
        }
        return x > 0;
    }
    
    public static void main(String[] args) {
        //System.out.println(genCode());
        //sendSetPw("");
        //createOTP("jojoa12345@gmail.com","duoA7gww52tuZ9Wk27IniE2BJCuJmb8pIECw2npzdYg7OHi0Jy",10005);
        //int id = Resident.findByEmail("jojoa12345@gmail.com").getId();
        //System.out.println(id);
    }
    
}
