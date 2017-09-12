/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.*;
import java.util.*;

/**
 *
 * @author Mix
 */
public class Keycard {
    private int keyId;
    private String keyStatus;
    private Room room = new Room();
    
    public Keycard(){}

    public Keycard(int keyId, String keyStatus, Room room) {
        this.keyId = keyId;
        this.keyStatus = keyStatus;
        this.room = room;
    }

    public int getKeyId() {
        return keyId;
    }

    public void setKeyId(int keyId) {
        this.keyId = keyId;
    }

    public String getKeyStatus() {
        return keyStatus;
    }

    public void setKeyStatus(String keyStatus) {
        this.keyStatus = keyStatus;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }
    
    private void orm(ResultSet rs) throws SQLException{
        this.keyId = rs.getInt("KEY_ID");
        this.keyStatus = rs.getString("KEY_Status");
        this.room = Room.findById(rs.getInt("ROOM_ID"));
    }
    
    public static Keycard findById(int keycardId){
        Keycard keycard = null;
        try{
            Connection conn = ConnectionBuilder.getConnection();
            String sql = "SELECT * FROM Keycard WHERE KEY_ID = ?";
            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setInt(1, keycardId);
            ResultSet rs = pstm.executeQuery();
            if(rs.next()){
                keycard = new Keycard();
                keycard.orm(rs);
            }
            conn.close();
        }catch(SQLException ex){
            System.err.println("Keycard, findByKeycardId: "+ex);
        }
        return keycard;
    }
    
    public static List<Keycard> findByRoomID(int id){
        List<Keycard> keycards = new LinkedList<Keycard>();
        Keycard keycard;
        try{
            Connection conn = ConnectionBuilder.getConnection();
            String sqlCmd = "SELECT * FROM Keycard WHERE ROOM_ID = ?";
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setInt(1, id);
            ResultSet rs = pstm.executeQuery();
            while(rs.next()){
                keycard = new Keycard();
                keycard.orm(rs);
                keycards.add(keycard);
            }
            conn.close();
        }catch(SQLException ex){
            System.err.println("Keycard,findByRoomID: "+ex);
        }
        return keycards;
    }
    
    public static void updateLostKeycard(int keycardId){
        try{
            Connection conn = ConnectionBuilder.getConnection();
            String sqlCmd = "UPDATE Keycard SET KEY_Status = 'Lost' WHERE KEY_ID = ?";
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setInt(1, keycardId);
            pstm.executeUpdate();
            conn.close();
        }catch(SQLException ex){
            System.err.println("Keycard,updateLostKeycard: "+ex);
        }
    }
    
    public static void statusAvailable(int keycardId){
        int updateRow = 0;
        try{
            Connection conn = ConnectionBuilder.getConnection();
            String sqlCmd = "UPDATE Keycard SET KEY_Status = 'Available' WHERE KEY_ID = ?";
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setInt(1, keycardId);
            pstm.executeUpdate();
            conn.close();
        }catch(SQLException ex) {
            System.err.println("Keycard,create3KeycardForNewRoom: " + ex);
        }
    }
    
    public static void create3KeycardForNewRoom(int roomId){
        try{
            Connection conn = ConnectionBuilder.getConnection();
            String sql = "INSERT INTO Keycard( KEY_Status, ROOM_ID ) VALUE( 'notAvailable', ?)";
            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setInt(1, roomId);
            for(int i = 0 ; i <= 2 ; i++){
                pstm.executeUpdate();
            }
            conn.close();
        }catch(SQLException ex){
            System.err.println("Keycard.create3KeycardForNewRoom: ");
        }
    }
    
    public static List<Keycard> findAvailableKeycard(int roomId){
        List<Keycard> keycardList = new LinkedList<>();
        try{
            Connection conn = ConnectionBuilder.getConnection();
            String sql = "SELECT * FROM Keycard WHERE ROOM_ID = ? AND UPPER(KEY_Status) LIKE UPPER('Available')";
            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setInt(1, roomId);
            ResultSet rs = pstm.executeQuery();
            while(rs.next()){
                Keycard keycard = new Keycard();
                keycard.orm(rs);
                keycardList.add(keycard);
            }
            conn.close();
        }catch(SQLException ex){
            System.err.println("Keycard, findAvailableKeycard: "+ex);
        }
        return keycardList;
    }
    
    public static void setNewAvailableByRoom(int roomId){
        try{
            Connection conn = ConnectionBuilder.getConnection();
            String sqlCmd = "UPDATE Keycard SET KEY_Status = 'Available' "
                    + "WHERE ROOM_ID = ? AND UPPER(KEY_Status) LIKE UPPER('notAvailable') ORDER BY KEY_ID LIMIT 1" ;
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setInt(1, roomId);
            pstm.executeUpdate();
            conn.close();
        }catch(SQLException ex) {
            System.err.println("Keycard,create3KeycardForNewRoom: " + ex);
        }
    }
}
