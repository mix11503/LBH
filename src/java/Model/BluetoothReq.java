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
import java.util.LinkedList;
import java.util.List;

/**
 *
 * @author Mix
 */
public class BluetoothReq {
    
    private int btReqId;
    private String btReqStatus;
    private String btReqCarBrand;
    private String btReqCarModel;
    private String btReqCarType;
    private String btReqCarColor;
    private String btReqCarPlate;
    private String btReqDocIdCard;
    private String btReqDocPlate;
    private String btReqDocAgreement;
    private String btReqDocTicket;
    private String btReqStatusApprove;
    private long btReqFee;
    private Date btReqDate;
    private Room room = new Room();
    
    public BluetoothReq(){}

    public BluetoothReq(int btReqId, String btReqStatus, String btReqCarBrand, String btReqCarModel, String btReqCarType, String btReqCarColor, String btReqCarPlate, String btReqDocIdCard, String btReqDocPlate, String btReqDocAgreement, String btReqDocTicket, String btReqStatusApprove, long btReqFee, Date btReqDate) {
        this.btReqId = btReqId;
        this.btReqStatus = btReqStatus;
        this.btReqCarBrand = btReqCarBrand;
        this.btReqCarModel = btReqCarModel;
        this.btReqCarType = btReqCarType;
        this.btReqCarColor = btReqCarColor;
        this.btReqCarPlate = btReqCarPlate;
        this.btReqDocIdCard = btReqDocIdCard;
        this.btReqDocPlate = btReqDocPlate;
        this.btReqDocAgreement = btReqDocAgreement;
        this.btReqDocTicket = btReqDocTicket;
        this.btReqStatusApprove = btReqStatusApprove;
        this.btReqFee = btReqFee;
        this.btReqDate = btReqDate;
    }

    public int getBtReqId() {
        return btReqId;
    }

    public void setBtReqId(int btReqId) {
        this.btReqId = btReqId;
    }

    public String getBtReqStatus() {
        return btReqStatus;
    }

    public void setBtReqStatus(String btReqStatus) {
        this.btReqStatus = btReqStatus;
    }

    public String getBtReqCarBrand() {
        return btReqCarBrand;
    }

    public void setBtReqCarBrand(String btReqCarBrand) {
        this.btReqCarBrand = btReqCarBrand;
    }

    public String getBtReqCarModel() {
        return btReqCarModel;
    }

    public void setBtReqCarModel(String btReqCarModel) {
        this.btReqCarModel = btReqCarModel;
    }

    public String getBtReqCarType() {
        return btReqCarType;
    }

    public void setBtReqCarType(String btReqCarType) {
        this.btReqCarType = btReqCarType;
    }

    public String getBtReqCarColor() {
        return btReqCarColor;
    }

    public void setBtReqCarColor(String btReqCarColor) {
        this.btReqCarColor = btReqCarColor;
    }

    public String getBtReqCarPlate() {
        return btReqCarPlate;
    }

    public void setBtReqCarPlate(String btReqCarPlate) {
        this.btReqCarPlate = btReqCarPlate;
    }

    public String getBtReqDocIdCard() {
        return btReqDocIdCard;
    }

    public void setBtReqDocIdCard(String btReqDocIdCard) {
        this.btReqDocIdCard = btReqDocIdCard;
    }

    public String getBtReqDocPlate() {
        return btReqDocPlate;
    }

    public void setBtReqDocPlate(String btReqDocPlate) {
        this.btReqDocPlate = btReqDocPlate;
    }

    public String getBtReqDocAgreement() {
        return btReqDocAgreement;
    }

    public void setBtReqDocAgreement(String btReqDocAgreement) {
        this.btReqDocAgreement = btReqDocAgreement;
    }

    public String getBtReqDocTicket() {
        return btReqDocTicket;
    }

    public void setBtReqDocTicket(String btReqDocTicket) {
        this.btReqDocTicket = btReqDocTicket;
    }

    public String getBtReqStatusApprove() {
        return btReqStatusApprove;
    }

    public void setBtReqStatusApprove(String btReqStatusApprove) {
        this.btReqStatusApprove = btReqStatusApprove;
    }

    public long getBtReqFee() {
        return btReqFee;
    }

    public void setBtReqFee(long btReqFee) {
        this.btReqFee = btReqFee;
    }

    public Date getBtReqDate() {
        return btReqDate;
    }

    public void setBtReqDate(Date btReqDate) {
        this.btReqDate = btReqDate;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }
    
    private void orm(ResultSet rs) throws SQLException{
        this.btReqId = rs.getInt("BT_ID");
        this.btReqStatus = rs.getString("BT_Status");
        this.btReqCarBrand = rs.getString("BT_Car_Brand");
        this.btReqCarModel = rs.getString("BT_Car_Model");
        this.btReqCarType = rs.getString("BT_Car_Type");
        this.btReqCarColor = rs.getString("BT_Car_Color");
        this.btReqCarPlate = rs.getString("BT_Car_Plate");
        this.btReqDocIdCard = rs.getString("BT_Doc_IDCard");
        this.btReqDocPlate = rs.getString("BT_Doc_Plate");
        this.btReqDocAgreement = rs.getString("BT_Doc_Agreement");
        this.btReqDocTicket = rs.getString("BT_Doc_Ticket");
        this.btReqStatusApprove = rs.getString("BT_Status_Approve");
        this.btReqFee = rs.getLong("BT_Fee");
        this.room = Room.findById(rs.getInt("ROOM_ID"));
    }
    
    public static BluetoothReq findById(int btReqId){
        BluetoothReq btReq = null;
        try{
            Connection conn = ConnectionBuilder.getConnection();
            String sql = "SELECT * FROM Bluetooth_Request "
                    + "WHERE BT_ID = ?";
            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setInt(1, btReqId);
            ResultSet rs = pstm.executeQuery();
            if(rs.next()){
                btReq = new BluetoothReq();
                btReq.orm(rs);
            }
            conn.close();
        }catch(SQLException ex){
            System.err.println("BluetoothReq, findById: "+ex);
        }
        return btReq;
    }
    
    public static List<BluetoothReq> findAvailableByRoomId(int roomId){
        List<BluetoothReq> btReqList = new LinkedList<>();
        try{
            Connection conn = ConnectionBuilder.getConnection();
            String sql = "SELECT * FROM Bluetooth_Request WHERE Room_ID = ? AND UPPER(BT_Status) LIKE UPPER('Available')";
            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setInt(1, roomId);
            ResultSet rs = pstm.executeQuery();
            while(rs.next()){
                BluetoothReq btReq = new BluetoothReq();
                btReq.orm(rs);
                btReqList.add(btReq);
            }
            conn.close();
        }catch(SQLException ex){
            System.err.println("BluetoothReq, findAvailableByRoomId: "+ex);
        }
        return btReqList;
    }
}
