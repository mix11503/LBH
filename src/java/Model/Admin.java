/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Joe's
 */
public class Admin {
    private int id;
    private String name;
    private String password;
    private String email;
    private boolean suspend;
    private boolean role;

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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public boolean isSuspend() {
        return suspend;
    }

    public void setSuspend(boolean suspend) {
        this.suspend = suspend;
    }

    public boolean isRole() {
        return role;
    }

    public void setRole(boolean role) {
        this.role = role;
    }

    @Override
    public String toString() {
        return "Admin{" + "id=" + id + ", name=" + name + ", password=" + password + ", email=" + email + ", suspend=" + suspend + ", role=" + role + '}';
    }
    private static void orm(ResultSet rs, Admin ad) throws SQLException{
        ad.setId(rs.getInt("id"));
        ad.setName(rs.getString("name"));
        ad.setEmail(rs.getString("email"));
        ad.setSuspend(rs.getBoolean("suspend"));
        ad.setRole(rs.getBoolean("role"));
        ad.setPassword(rs.getString("password"));
    }
    public static Admin findById(int id){
        Admin ad = null;
            try{
                Connection conn = ConnectionBuilder.getConnection();
                String sqlCmd = "SELECT * FROM admin WHERE id = ?";
                PreparedStatement pstm = conn.prepareStatement(sqlCmd);
                pstm.setInt(1, id);
                ResultSet rs = pstm.executeQuery();
                if(rs.next()){
                    ad = new Admin();
                    orm(rs, ad);
                }
                conn.close();
            }catch(SQLException ex){
                System.err.println("Admin, FindById : "+ex);
            }
            return ad;
    }
    public static Admin findByEmail(String email){
        Admin ad = null;
            try{
                Connection conn = ConnectionBuilder.getConnection();
                String sqlCmd = "SELECT * FROM admin WHERE email = ?";
                PreparedStatement pstm = conn.prepareStatement(sqlCmd);
                pstm.setString(1, email);
                ResultSet rs = pstm.executeQuery();
                if(rs.next()){
                    ad = new Admin();
                    orm(rs, ad);
                }
                conn.close();
            }catch(SQLException ex){
                System.err.println("Admin, FindByEmail : "+ex);
            }
            return ad;
    }
    public static List<Admin> findAll(){
        List<Admin> Admin = new ArrayList<Admin>();
            try{
                Connection conn = ConnectionBuilder.getConnection();
                Admin ad = null;
                String sqlCmd = "SELECT * FROM admin";
                PreparedStatement pstm = conn.prepareStatement(sqlCmd);
                ResultSet rs = pstm.executeQuery();
                while(rs.next()){
                    ad = new Admin();
                    orm(rs, ad);
                    Admin.add(ad);
                }
                conn.close();
            }catch(SQLException ex){
                System.err.println("Admin, findAll : "+ex);
            }
            return Admin;
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
            String sqlCmd = "Update admin set suspend = ? where id = " + id;
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setBoolean(1, status);
            x = pstm.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.err.println("Admin, suspendAcc: " + ex);
        }
        return x > 0;
    }
}
