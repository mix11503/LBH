package Model;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Resident {
private int id;
private String name;
private String lastname;
private long phone;
private String email;
private String rent_start;
private String rent_end;
private boolean suspend;
private boolean isOwner;
private String password;
private int Room_ID;
    
public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public long getPhone() {
        return phone;
    }

    public void setPhone(long phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRent_start() {
        return rent_start;
    }

    public void setRent_start(String rent_start) {
        this.rent_start = rent_start;
    }

    public String getRent_end() {
        return rent_end;
    }

    public void setRent_end(String rent_end) {
        this.rent_end = rent_end;
    }
    
    
    public boolean isSuspend() {
        return suspend;
    }

    public void setSuspend(boolean suspend) {
        this.suspend = suspend;
    }

    public boolean isIsOwner() {
        return isOwner;
    }

    public void setIsOwner(boolean isOwner) {
        this.isOwner = isOwner;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    public int getRoom_ID() {
        return Room_ID;
    }

    public void setRoom_ID(int Room_ID) {
        this.Room_ID = Room_ID;
    }

    @Override
    public String toString() {
        return "Resident{" + "id=" + id + ", name=" + name + ", lastname=" + lastname + ", phone=" + phone + ", email=" + email + ", rent_start=" + rent_start + ", rent_end=" + rent_end + ", suspend=" + suspend + ", isOwner=" + isOwner + ", password=" + password + ", Room_ID=" + Room_ID + '}';
    }
    
    private static void orm(ResultSet rs, Resident Res) throws SQLException{
        Res.setId(rs.getInt("RESIDENT_ID"));
        Res.setName(rs.getString("RESIDENT_NAME"));
        Res.setLastname(rs.getString("RESIDENT_LASTNAME"));
        Res.setEmail(rs.getString("RESIDENT_EMAIL"));
        Res.setPhone(rs.getLong("RESIDENT_TEL"));
        Res.setRent_start(rs.getString("RENT_START"));
        Res.setRent_end(rs.getString("RENT_END"));
        Res.setSuspend(rs.getBoolean("suspend"));
        Res.setIsOwner(rs.getBoolean("isOwner"));
        Res.setPassword(rs.getString("password"));
        Res.setRoom_ID(rs.getInt("Room_ID"));
    }
    
    public boolean createAccount(int roomId) {
        int x = 0;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            String sqlCmd = null;
            sqlCmd = "INSERT INTO Resident(RESIDENT_NAME, RESIDENT_LASTNAME, RESIDENT_EMAIL, RENT_START, RENT_END, isOwner, Room_ID, RESIDENT_TEL) VALUES (?,?,?,?,?,?,?,?)";
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setString(1, this.name);
            pstm.setString(2, this.lastname);
            pstm.setString(3, this.email);
            pstm.setString(4, this.rent_start);
            pstm.setString(5, this.rent_end);
            pstm.setBoolean(6, this.isOwner);
            pstm.setInt(7,roomId);
            pstm.setLong(8, this.phone);
            x = pstm.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.err.println("Resident, createAccount: " + ex);
        }
        return x > 0;
    }
    
    public static Resident findById(int id){
        Resident res = null;
            try{
                Connection conn = ConnectionBuilder.getConnection();
                String sqlCmd = "SELECT * FROM Resident WHERE RESIDENT_ID = ?";
                PreparedStatement pstm = conn.prepareStatement(sqlCmd);
                pstm.setInt(1, id);
                ResultSet rs = pstm.executeQuery();
                if(rs.next()){
                    res = new Resident();
                    orm(rs,res);
                }
                conn.close();
            }catch(SQLException ex){
                System.err.println("Resident,FindById : "+ex);
            }
            return res;
    }
    
    public static Resident findByEmail(String email){
        Resident res = null;
            try{
                Connection conn = ConnectionBuilder.getConnection();
                String sqlCmd = "SELECT * FROM Resident WHERE RESIDENT_EMAIL = ?";
                PreparedStatement pstm = conn.prepareStatement(sqlCmd);
                pstm.setString(1, email);
                ResultSet rs = pstm.executeQuery();
                if(rs.next()){
                    res = new Resident();
                    orm(rs,res);
                }
                conn.close();
            }catch(SQLException ex){
                System.err.println("Resident,FindByEmail : "+ex);
            }
            return res;
    }
    
    public static List<Resident> findByRoomId(int room_id){
        List<Resident> resident = new ArrayList<Resident>();
            try{
                Connection conn = ConnectionBuilder.getConnection();
                Resident res = null;
                String sqlCmd = "SELECT * FROM Resident WHERE ROOM_ID= ?";
                PreparedStatement pstm = conn.prepareStatement(sqlCmd);
                pstm.setInt(1, room_id);
                ResultSet rs = pstm.executeQuery();
                while(rs.next()){
                    res = new Resident();
                    orm(rs, res);
                    resident.add(res);
                }
                conn.close();
            }catch(SQLException ex){
                System.err.println("Resident,findByRoomId : "+ex);
            }
            return resident;
    }
    
    public static List<Resident> findAll(){
        List<Resident> resident = new ArrayList<Resident>();
            try{
                Connection conn = ConnectionBuilder.getConnection();
                Resident res = null;
                String sqlCmd = "SELECT * FROM Resident";
                PreparedStatement pstm = conn.prepareStatement(sqlCmd);
                ResultSet rs = pstm.executeQuery();
                while(rs.next()){
                    res = new Resident();
                    orm(rs, res);
                    resident.add(res);
                }
                conn.close();
            }catch(SQLException ex){
                System.err.println("Resident,findAll : "+ex);
            }
            return resident;
    }
    
    public static String checkOTP(String email){
        String otp = "";
        try{
                Connection conn = ConnectionBuilder.getConnection();
                String sqlCmd = "SELECT * FROM Resident r join mailRegister m on r.Resident_ID = m.resident_id WHERE r.Resident_Email = ? and m.otpCheck = false";
                PreparedStatement pstm = conn.prepareStatement(sqlCmd);
                pstm.setString(1, email);
                ResultSet rs = pstm.executeQuery();
                if(rs.next()){
                    otp = rs.getString("m.codeOTP");
                }
                conn.close();
            }catch(SQLException ex){
                System.err.println("Resident,checkOTP : "+ex);
            }
        return otp;
    }
    public static Resident getInfoByOTP(String OTP){
        Resident res = null;
            try{
                Connection conn = ConnectionBuilder.getConnection();
                String sqlCmd = "SELECT * FROM Resident r join mailRegister m on r.Resident_ID = m.resident_id WHERE m.codeOTP = ? and otpCheck = false";
                PreparedStatement pstm = conn.prepareStatement(sqlCmd);
                pstm.setString(1, OTP);
                ResultSet rs = pstm.executeQuery();
                if(rs.next()){
                    res = new Resident();
                    orm(rs,res);
                }
                conn.close();
            }catch(SQLException ex){
                System.err.println("Resident,getInfoByOTP : "+ex);
            }
            return res;
    }
    
    public static boolean resetPw(int id, String password) {
        int x = 0;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            String sqlCmd = "Update Resident r join mailRegister m on r.Resident_ID = m.resident_id set r.password = ? , m.otpCheck = true where r.RESIDENT_ID = " + id;
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setString(1, password);
            x = pstm.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.err.println("Resident, setPw: " + ex);
        }
        return x > 0;
    }
    
    public static String MD5Encrypt(String pw){
        String original = pw;
        StringBuffer sb = null;
        try{
		MessageDigest md = MessageDigest.getInstance("MD5");
		md.update(original.getBytes());
		byte[] digest = md.digest();
		sb = new StringBuffer();
		for (byte b : digest) {
			sb.append(String.format("%02x", b & 0xff));
		}
        }catch(Exception e){       
            System.out.println("MD5Encrypt: "+e);
        }
        return sb.toString();
    }
    
    public static boolean suspendAccount(int id, Boolean status) {
        int x = 0;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            String sqlCmd = "Update Resident set suspend = ? where RESIDENT_ID = " + id;
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setBoolean(1, status);
            x = pstm.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.err.println("Resident, suspendAcc: " + ex);
        }
        return x > 0;
    }
    
    public boolean updateAccount(int id) {
        int x = 0;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            String sqlCmd = null;
            sqlCmd = "Update Resident set RESIDENT_NAME = ?, RESIDENT_LASTNAME = ?, RESIDENT_EMAIL = ?, RESIDENT_TEL = ? where RESIDENT_ID = " + id;
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setString(1, this.name);
            pstm.setString(2, this.lastname);
            pstm.setString(3, this.email);
            pstm.setLong(4, this.phone);
            x = pstm.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.err.println("Resident, updateAccount: " + ex);
        }
        return x > 0;
    }
    
    
// ============== TESTING ZONE =============

    public static void main(String[] args){
       // Resident r1 = Resident.findById(10001);
      //  System.out.println(r1.toString());
      //  List<Resident> r2 = Resident.findByRoomId(201);
      //  for(Resident r: r2){
      //      System.out.println(r.toString());
       // }
       /*
       Resident r = new Resident();
       r.setName("Joe");
       r.setLastname("KS");
       r.setEmail("joeks@mail.com");
       r.setPhone(66841212098l);
       r.setIsOwner(false);
       r.setRent_start("2017-10-10");
       r.setRent_end("2018-10-10");
       r.createAccount(201);
        System.out.println("success!!");
       */
       
       /*//validate roomNo
       String room = null;
       int x = 2;
       java.util.Scanner sc = new java.util.Scanner(System.in);
       while(x!=1){
       System.out.print("Enter: ");
       room = sc.next();
       String messageError = null;
       if(Integer.parseInt(room)<=200 || Integer.parseInt(room)>832){
            messageError = "Invalid RoomNumber";
        }else if(((Integer.parseInt(room)/10)%10)>3){
            messageError = "Invalid RoomNumber";
        }else if(((Integer.parseInt(room)/10)%10)==3 && (Integer.parseInt(room)%10)>2){
            messageError = "Invalid RoomNumber";             
        }else{
            messageError = "Valid";
        }
        System.out.println(messageError);
       }
        //End Validate Code*/
        //System.out.println(checkOTP("jojoa55555@gmail.com"));
        //Resident r = Resident.findByEmail("aaron@mail.com");
        //System.out.println(r);
        //System.out.println(resetPw(10005,"test"));
        //System.out.println(MD5Encrypt("joe"));
    }
// ==========END OF TESTING ZONE ============


    
}
