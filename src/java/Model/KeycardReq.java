/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import java.util.*;

/**
 *
 * @author Mix
 */
public class KeycardReq {

    private int key_req_id;
    private String key_doc_idCard;
    private String key_doc_agreement;
    private String key_doc_ticket;
    private String key_status_approve;
    private long key_fee;
    private Date key_date;
    private Keycard keycard;

    public KeycardReq() {
    }

    public KeycardReq( int key_req_id, String key_doc_idCard, String key_doc_agreement, String key_doc_ticket, String key_status_approve, long key_fee, Date key_date, Keycard keycard) {
        this.key_req_id = key_req_id;
        this.key_doc_idCard = key_doc_idCard;
        this.key_doc_agreement = key_doc_agreement;
        this.key_doc_ticket = key_doc_ticket;
        this.key_status_approve = key_status_approve;
        this.key_fee = key_fee;
        this.key_date = key_date;
        this.keycard = keycard;
    }

    public String getKey_doc_idCard() {
        return key_doc_idCard;
    }

    public void setKey_doc_idCard(String key_doc_idCard) {
        this.key_doc_idCard = key_doc_idCard;
    }

    public String getKey_doc_agreement() {
        return key_doc_agreement;
    }

    public void setKey_doc_agreement(String key_doc_agreement) {
        this.key_doc_agreement = key_doc_agreement;
    }

    public String getKey_doc_ticket() {
        return key_doc_ticket;
    }

    public void setKey_doc_ticket(String key_doc_ticket) {
        this.key_doc_ticket = key_doc_ticket;
    }

    public String getKey_status_approve() {
        return key_status_approve;
    }

    public void setKey_status_approve(String key_status_approve) {
        this.key_status_approve = key_status_approve;
    }

    public long getKey_fee() {
        return key_fee;
    }

    public void setKey_fee(long key_fee) {
        this.key_fee = key_fee;
    }

    public Date getKey_date() {
        return key_date;
    }

    public void setKey_date(Date key_date) {
        this.key_date = key_date;
    }

    public Keycard getKeycard() {
        return keycard;
    }

    public void setKeycard(Keycard keycard) {
        this.keycard = keycard;
    }

    public int getKey_req_id() {
        return key_req_id;
    }

    public void setKey_req_id(int key_req_id) {
        this.key_req_id = key_req_id;
    }
    
    private void orm(ResultSet rs) throws SQLException{
        this.key_req_id = rs.getInt("KEY_Req_ID");
        this.key_doc_idCard = rs.getString("KEY_Doc_IDCard");
        this.key_doc_agreement = rs.getString("KEY_Doc_Agreement");
        this.key_doc_ticket = rs.getString("KEY_Doc_Ticket");
        this.key_status_approve = rs.getString("KEY_Status_Approve");
        this.key_fee = rs.getLong("KEY_Req_Fee");
        this.key_date = rs.getDate("KEY_Req_Date");
        this.keycard = Keycard.findById(rs.getInt("KEY_ID"));
    }
    
    public static KeycardReq listWaitingRequestByRoom(int roomId){
        KeycardReq keycardReq = null;
        try{
            Connection conn = ConnectionBuilder.getConnection();
            String sql = "SELECT * FROM Keycard_Request kr "
                    + "INNER JOIN Keycard k ON kr.KEY_ID = k.KEY_ID "
                    + "WHERE k.ROOM_ID = ? AND UPPER(kr.KEY_Status_Approve) like UPPER('Waiting%')";
            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setInt(1, roomId);
            ResultSet rs = pstm.executeQuery();
            if(rs.next()){
                keycardReq = new KeycardReq();
                keycardReq.orm(rs);
            }
            conn.close();
        }catch(SQLException ex){
            System.err.println("KeycardReq,searchWaitingRequset: "+ex);
        }
        return keycardReq;
    }
    
    public static void insertNewRequest(int keycardId, String idcard, String lease){
        try{
            Connection conn = ConnectionBuilder.getConnection();
            String sql = "INSERT INTO Keycard_Request(KEY_Doc_IDCard, KEY_Doc_Agreement, KEY_Status_Approve, KEY_Req_Date, KEY_ID) "
                    + "VALUE( ?, ?, 'WaitingNew', CURDATE(), ?)";
            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setString(1, idcard);
            pstm.setString(2, lease);
            pstm.setInt(3, keycardId);
            pstm.executeUpdate();
            conn.close();
        }catch(SQLException ex){
            System.err.println("KeycardReq,insertNewRequest: "+ex);
        }
    }
    
    public static void insertLostRequest(int keycardId, String noticDoc){
        try{
            Connection conn = ConnectionBuilder.getConnection();
            String sql = "INSERT INTO Keycard_Request(KEY_Doc_Ticket, KEY_Status_Approve, KEY_Req_Date, KEY_ID) "
                    + "VALUE( ?, 'WaitingLost', CURDATE(), ?)";
            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setString(1, noticDoc);
            pstm.setInt(2, keycardId);
            pstm.executeUpdate();
            conn.close();
        }catch(SQLException ex){
            System.err.println("KeycardReq,insertLostRequest: "+ex);
        }
    }
    
    public static void insertAddRequest(int keycardId){
        try{
            Connection conn = ConnectionBuilder.getConnection();
            String sql = "INSERT INTO Keycard_Request(KEY_Status_Approve, KEY_Req_Date, KEY_ID) "
                    + "VALUE('WaitingAdd', CURDATE(), ?)";
            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setInt(1, keycardId);
            pstm.executeUpdate();
            conn.close();
        }catch(SQLException ex){
            System.err.println("KeycardReq,insertLostRequest: "+ex);
        }
    }
    
    public static List<KeycardReq> listWaitingRequest(){
        List<KeycardReq> keycardReqList = new LinkedList<>();
        try{
            Connection conn = ConnectionBuilder.getConnection();
            String sql = "SELECT * FROM Keycard_Request "
                    + "WHERE UPPER(KEY_Status_Approve) LIKE UPPER('Waiting%') "
                    + "ORDER BY KEY_Req_ID DESC";
            PreparedStatement pstm = conn.prepareStatement(sql);
            ResultSet rs = pstm.executeQuery();
            while(rs.next()){
                KeycardReq keycardReq = new KeycardReq();
                keycardReq.orm(rs);
                keycardReqList.add(keycardReq);
            }
            conn.close();
        }catch(SQLException ex){
            System.err.println("KeycardReq,insertLostRequest: "+ex);
        }
        return keycardReqList;
    }
    
    public static KeycardReq findById(int keycardReqId){
        KeycardReq keycardReq = null;
        try{
            Connection conn = ConnectionBuilder.getConnection();
            String sql = "SELECT * FROM Keycard_Request "
                    + "WHERE KEY_Req_ID = ?";
            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setInt(1, keycardReqId);
            ResultSet rs = pstm.executeQuery();
            if(rs.next()){
                keycardReq = new KeycardReq();
                keycardReq.orm(rs);
            }
            conn.close();
        }catch(SQLException ex){
            System.err.println("KeycardReq,searchWaitingRequset: "+ex);
        }
        return keycardReq;
    }
    
    public static void approve(int keycardReqId){
        try{
            Connection conn = ConnectionBuilder.getConnection();
            String sql = "UPDATE Keycard_Request "
                    + "SET KEY_Status_Approve = 'Approve'"
                    + "WHERE KEY_Req_ID = ?";
            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setInt(1, keycardReqId);
            pstm.executeUpdate();
            conn.close();
        }catch(SQLException ex){
            System.err.println("KeycardReq,searchWaitingRequset: "+ex);
        }
    }
    
    public static void reject(int keycardReqId){
        try{
            Connection conn = ConnectionBuilder.getConnection();
            String sql = "UPDATE Keycard_Request "
                    + "SET KEY_Status_Approve = 'Rejected'"
                    + "WHERE KEY_Req_ID = ?";
            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setInt(1, keycardReqId);
            pstm.executeUpdate();
            conn.close();
        }catch(SQLException ex){
            System.err.println("KeycardReq,searchWaitingRequset: "+ex);
        }
    }
    
    public static List<KeycardReq> listRequestByRoom(int roomId){
        List<KeycardReq> keycardReqList = new LinkedList<>();
        try{
            Connection conn = ConnectionBuilder.getConnection();
            String sql = "SELECT * FROM Keycard_Request kr "
                    + "INNER JOIN Keycard k ON kr.KEY_ID = k.KEY_ID "
                    + "WHERE k.ROOM_ID = ? "
                    + "ORDER BY kr.KEY_Req_ID DESC";
            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setInt(1, roomId);
            ResultSet rs = pstm.executeQuery();
            while(rs.next()){
                KeycardReq keycardReq = new KeycardReq();
                keycardReq.orm(rs);
                keycardReqList.add(keycardReq);
            }
            conn.close();
        }catch(SQLException ex){
            System.err.println("KeycardReq,insertLostRequest: "+ex);
        }
        return keycardReqList;
    }
}
