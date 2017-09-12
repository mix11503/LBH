/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author Joe's
 */
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
public class Room {
    private int room_id;
    private String status;
    private short size;

    public Room(int room_id, short size, String status) {
        this.room_id = room_id;
        this.size = size;
        this.status = status;
    }

    public Room() {
    }

    public int getRoom_id() {
        return room_id;
    }

    public void setRoom_id(int room_id) {
        this.room_id = room_id;
    }


    public int getSize() {
        return size;
    }

    public void setSize(short size) {
        this.size = size;
    }
   public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    private void orm(ResultSet rs) throws SQLException{
        this.room_id = rs.getInt("Room_ID");
        this.status = rs.getString("Room_Status");
        this.size = rs.getByte("Room_Area");
    }
    
    public static Room findById(int id){
        Room rm = null;
        try{
            Connection conn = ConnectionBuilder.getConnection();
            String sqlCmd = "SELECT * FROM Room WHERE ROOM_ID = ?";
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setInt(1, id);
            ResultSet rs = pstm.executeQuery();
            if(rs.next()){
                rm = new Room();
                rm.orm(rs);
            }
            conn.close();
        }catch(SQLException ex){
            System.err.println("Room,70: "+ex);
        }
        return rm;
    }

/*    
    public static void main(String[] args) {
        Room rm = Room.findById(501);
        System.out.println("Room ID: "+rm.getRoom_id());
        System.out.println("Room size: "+rm.getSize()+" Sq.m.");
        System.out.println("Status: "+rm.getStatus());
    }
*/

}
 
