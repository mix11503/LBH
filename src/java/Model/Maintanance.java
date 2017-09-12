/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

/**
 *
 * @author Joe's
 */
public class Maintanance {

    private int mtn_id;
    private int mtn_work_id;
    private boolean isPersonal;
    private Date mtn_date;
    private String mtn_ServiceArea;
    private String mtn_desc;
    private String mtn_result;
    private String mtn_material;
    private double mtn_cost;
    private String mtn_result_eva;
    private String mtn_status;
    private String mtn_eva_remark;
    private String mtn_area_stuff;
    private int mtn_room_id;
    private boolean appToken;
    private List<String> mtn_pic;

    public String getMtn_eva_remark() {
        return mtn_eva_remark;
    }

    public void setMtn_eva_remark(String mtn_eva_remark) {
        this.mtn_eva_remark = mtn_eva_remark;
    }

    public Maintanance() {
    }

    public Maintanance(int mtn_id, int mtn_work_id, boolean isPersonal, Date mtn_date, String mtn_ServiceArea, String mtn_desc, String mtn_result, String mtn_material, double mtn_cost, String mtn_result_eva, String mtn_status, String mtn_eva_remark, String mtn_area_stuff, int mtn_room_id, boolean appToken, List<String> mtn_pic) {
        this.mtn_id = mtn_id;
        this.mtn_work_id = mtn_work_id;
        this.isPersonal = isPersonal;
        this.mtn_date = mtn_date;
        this.mtn_ServiceArea = mtn_ServiceArea;
        this.mtn_desc = mtn_desc;
        this.mtn_result = mtn_result;
        this.mtn_material = mtn_material;
        this.mtn_cost = mtn_cost;
        this.mtn_result_eva = mtn_result_eva;
        this.mtn_status = mtn_status;
        this.mtn_eva_remark = mtn_eva_remark;
        this.mtn_area_stuff = mtn_area_stuff;
        this.mtn_room_id = mtn_room_id;
        this.appToken = appToken;
        this.mtn_pic = mtn_pic;
    }

    public String getMtn_result_eva() {
        return mtn_result_eva;
    }

    public void setMtn_result_eva(String mtn_result_eva) {
        this.mtn_result_eva = mtn_result_eva;
    }

    public int getMtn_id() {
        return mtn_id;
    }

    public void setMtn_id(int mtn_id) {
        this.mtn_id = mtn_id;
    }

    public int getMtn_work_id() {
        return mtn_work_id;
    }

    public void setMtn_work_id(int mtn_work_id) {
        this.mtn_work_id = mtn_work_id;
    }

    public boolean isIsPersonal() {
        return isPersonal;
    }

    public void setIsPersonal(boolean isPersonal) {
        this.isPersonal = isPersonal;
    }

    public Date getMtn_date() {
        return mtn_date;
    }

    public void setMtn_date(Date mtn_date) {
        this.mtn_date = mtn_date;
    }

    public String getMtn_ServiceArea() {
        return mtn_ServiceArea;
    }

    public void setMtn_ServiceArea(String mtn_ServiceArea) {
        this.mtn_ServiceArea = mtn_ServiceArea;
    }

    public String getMtn_desc() {
        return mtn_desc;
    }

    public void setMtn_desc(String mtn_desc) {
        this.mtn_desc = mtn_desc;
    }

    public String getMtn_result() {
        return mtn_result;
    }

    public void setMtn_result(String mtn_result) {
        this.mtn_result = mtn_result;
    }

    public String getMtn_material() {
        return mtn_material;
    }

    public void setMtn_material(String mtn_material) {
        this.mtn_material = mtn_material;
    }

    public double getMtn_cost() {
        return mtn_cost;
    }

    public void setMtn_cost(double mtn_cost) {
        this.mtn_cost = mtn_cost;
    }

    public String getMtn_status() {
        return mtn_status;
    }

    public void setMtn_status(String mtn_status) {
        this.mtn_status = mtn_status;
    }

    public List<String> getMtn_pic() {
        return mtn_pic;
    }

    public void setMtn_pic(List<String> mtn_pic) {
        this.mtn_pic = mtn_pic;
    }

    private static void orm(ResultSet rs, Maintanance mtn) throws SQLException {
        mtn.setMtn_id(rs.getInt("MTN_ID"));
        mtn.setIsPersonal(rs.getBoolean("MTN_ISPERSONAL"));
        mtn.setMtn_ServiceArea(rs.getString("MTN_SERVICEAREA"));
        mtn.setMtn_cost(rs.getDouble("MTN_COST"));
        mtn.setMtn_date(rs.getDate("MTN_DATE"));
        mtn.setMtn_desc(rs.getString("MTN_DESC"));
        mtn.setMtn_material(rs.getString("MTN_MATERIAL"));
        mtn.setMtn_result(rs.getString("MTN_RESULT"));
        mtn.setMtn_result_eva(rs.getString("MTN_RESULT_EVALUATE"));
        mtn.setMtn_status(rs.getString("MTN_STATUS"));
        mtn.setMtn_work_id(rs.getInt("MTN_WORKID"));
        mtn.setMtn_eva_remark(rs.getString("MTN_Eva_Remark"));
        mtn.setMtn_area_stuff(rs.getString("mtn_area_stuff"));
        mtn.setMtn_room_id(rs.getInt("Room_ID"));
        mtn.setAppToken(rs.getBoolean("appToken"));
    }

    public static List<Maintanance> findByStatus(String status) {
        List<Maintanance> main = new ArrayList<Maintanance>();
        try {
            Connection conn = ConnectionBuilder.getConnection();
            Maintanance mtn = null;
            String sqlCmd = "SELECT * FROM Maintanance WHERE MTN_STATUS = ? ORDER BY Mtn_id DESC";
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setString(1, status);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                mtn = new Maintanance();
                orm(rs, mtn);
                main.add(mtn);
            }
            conn.close();
        } catch (SQLException ex) {
            System.err.println("MTN,FindByStatus : " + ex);
        }
        return main;
    }

    public static List<Maintanance> findByDate(String date) {
        List<Maintanance> main = new ArrayList<Maintanance>();
        try {
            Connection conn = ConnectionBuilder.getConnection();
            Maintanance mtn = null;
            String sqlCmd = "SELECT * FROM Maintanance WHERE MTN_DATE = ?";
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setString(1, date);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                mtn = new Maintanance();
                orm(rs, mtn);
                main.add(mtn);
            }
            conn.close();
        } catch (SQLException ex) {
            System.err.println("MTN,FindBydate : " + ex);
        }
        return main;
    }

    public static List<Maintanance> findByRoomId(int roomId) {
        List<Maintanance> main = new ArrayList<Maintanance>();
        try {
            Connection conn = ConnectionBuilder.getConnection();
            Maintanance mtn = null;
            String sqlCmd = "SELECT * FROM Maintanance WHERE ROOM_ID = ? ORDER BY MTN_ID DESC";
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setInt(1, roomId);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                mtn = new Maintanance();
                sqlCmd = "SELECT * FROM MTN_Pic WHERE MTN_ID = ?";
                pstm = conn.prepareStatement(sqlCmd);
                pstm.setInt(1, rs.getInt("MTN_ID"));
                ResultSet pics = pstm.executeQuery();
                mtn.mtn_pic = new LinkedList<String>();
                while (pics.next()) {
                    mtn.mtn_pic.add(pics.getString("MTN_Pic_Path"));
                }
                orm(rs, mtn);
                main.add(mtn);
            }

            conn.close();
        } catch (SQLException ex) {
            System.err.println("MTN,FindByRoomId : " + ex);
        }
        return main;
    }

    public static Maintanance findBymtnId(int mtnId) {
        List<Maintanance> main = new ArrayList<Maintanance>();
        Maintanance mtn = null;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            String sqlCmd = "SELECT * FROM Maintanance WHERE MTN_ID = ?";
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setInt(1, mtnId);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                mtn = new Maintanance();
                sqlCmd = "SELECT * FROM MTN_Pic WHERE MTN_ID = ?";
                pstm = conn.prepareStatement(sqlCmd);
                pstm.setInt(1, rs.getInt("MTN_ID"));
                ResultSet pics = pstm.executeQuery();
                mtn.mtn_pic = new LinkedList<String>();
                while (pics.next()) {
                    mtn.mtn_pic.add(pics.getString("MTN_Pic_Path"));
                }
                orm(rs, mtn);
                main.add(mtn);
            }
            conn.close();
        } catch (SQLException ex) {
            System.err.println("MTN,FindBymtnId : " + ex);
        }
        return mtn;
    }
    
    public static List<Maintanance> findByStuff(String area, String stuff){
        List<Maintanance> main = new ArrayList<Maintanance>();
        try {
            Connection conn = ConnectionBuilder.getConnection();
            Maintanance mtn = null;
            String sqlCmd = "SELECT * FROM Maintanance WHERE MTN_ServiceArea = ? AND mtn_area_stuff = ?";
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setString(1, area);
            pstm.setString(2, stuff);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                mtn = new Maintanance();
                sqlCmd = "SELECT * FROM MTN_Pic WHERE MTN_ID = ?";
                pstm = conn.prepareStatement(sqlCmd);
                pstm.setInt(1, rs.getInt("MTN_ID"));
                ResultSet pics = pstm.executeQuery();
                mtn.mtn_pic = new LinkedList<String>();
                while (pics.next()) {
                    mtn.mtn_pic.add(pics.getString("MTN_Pic_Path"));
                }
                orm(rs, mtn);
                main.add(mtn);
            }

            conn.close();
        } catch (SQLException ex) {
            System.err.println("MTN,FindByRoomId : " + ex);
        }
        return main;
    }

    public boolean updateAction(int mtn_id) {
        int x = 0;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            String sqlCmd = "Update Maintanance set MTN_result=?, MTN_material=?, MTN_Cost=? where MTN_ID = " + mtn_id;
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setString(1, this.mtn_result);
            pstm.setString(2, this.mtn_material);
            pstm.setDouble(3, this.mtn_cost);
            x = pstm.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.err.println("MTN, updateAction: " + ex);
        }
        return x > 0;
    }

    public boolean updateStatus(int mtn_id, String status) {
        int x = 0;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            String sqlCmd = "Update Maintanance set MTN_STATUS = ? where MTN_ID = " + mtn_id;
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setString(1, status);
            x = pstm.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.err.println("MTN, updateStatus: " + ex);
        }
        return x > 0;
    }

    public boolean writeNewRequest(int roomId, List<String> paths) {
        int x = 0;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            String sqlCmd = null;
            Date date = new Date();
            sqlCmd = "INSERT INTO Maintanance"
                    + "( MTN_IsPersonal, MTN_Date, MTN_ServiceArea, mtn_area_stuff, MTN_Desc, "
                    + "MTN_Status, Room_ID) VALUES (?,?,?,?,?,?,?)";
            /*        }else{
             sqlCmd = "Update Maintanance set MTN_WorkID = ?, MTN_IsPersonal = ?, MTN_Date = ?, MTN_ServiceArea = ?, MTN_Desc = ?, "
             + "MTN_Result = ?, MTN_Material = ?, MTN_Cost = ?, MTN_Result_Evaluate = ?, MTN_Status = ?, Room_ID = ?";
             */
            PreparedStatement pstm = conn.prepareStatement(sqlCmd, Statement.RETURN_GENERATED_KEYS);
            pstm.setBoolean(1, true);
            pstm.setDate(2, new java.sql.Date(date.getTime()));
            pstm.setString(3, this.mtn_ServiceArea);
            pstm.setString(4, this.mtn_area_stuff);
            pstm.setString(5, this.mtn_desc);
            pstm.setString(6, "New");
            pstm.setInt(7, roomId);
            //  System.err.println("value: "+this.mtn_desc);
            x = pstm.executeUpdate();
            ResultSet rs = pstm.getGeneratedKeys();
            if (rs.next()) {
                int key = rs.getInt(1);
                for (int i = 0; i < paths.size(); i++) {
                    sqlCmd = "INSERT INTO MTN_Pic"
                            + "(MTN_Pic_ID, MTN_ID, MTN_Pic_Path) "
                            + "value(?, ?, ?) ";
                    pstm = conn.prepareStatement(sqlCmd);
                    pstm.setInt(1, i + 1);
                    pstm.setInt(2, key);
                    pstm.setString(3, paths.get(i));
                    pstm.executeUpdate();
                }
            }
            conn.close();
        } catch (SQLException ex) {
            System.err.println("MTN, Update: " + ex);
        }
        return x > 0;
    }

    public static int getReqAmountByStatus(String status) {
        int req = 0;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String sqlCmd = "SELECT COUNT(*) FROM Maintanance WHERE MTN_STATUS = ?";
            PreparedStatement pstm = con.prepareStatement(sqlCmd);
            pstm.setString(1, status);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                req = rs.getInt("count(*)");
            }
            con.close();

        } catch (SQLException ex) {
            System.err.println(ex);
        }
        return req;

    }

    public boolean writeEvaluation(int mtn_id) {
        int x = 0;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            String sqlCmd = "Update Maintanance set MTN_Result_Evaluate = ?, MTN_Eva_Remark = ? where MTN_ID = " + mtn_id;
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setString(1, this.mtn_result_eva);
            pstm.setString(2, this.mtn_eva_remark);
            x = pstm.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.err.println("MTN, Evaluation: " + ex);
        }
        return x > 0;
    }

    public boolean setAppToken(int mtn_id) {
        int x = 0;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            String sqlCmd = "Update Maintanance set appToken = ? where MTN_ID = " + mtn_id;
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setBoolean(1, this.appToken);
            x = pstm.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.err.println("MTN, appToken: " + ex);
        }
        return x > 0;
    }

    @Override
    public String toString() {
        return "Maintanance{" + "mtn_id=" + mtn_id + ", mtn_work_id=" + mtn_work_id + ", isPersonal=" + isPersonal + ", mtn_date=" + mtn_date + ", mtn_ServiceArea=" + mtn_ServiceArea + ", mtn_desc=" + mtn_desc + ", mtn_result=" + mtn_result + ", mtn_material=" + mtn_material + ", mtn_cost=" + mtn_cost + ", mtn_result_eva=" + mtn_result_eva + ", mtn_status=" + mtn_status + '}';
    }
    /*
     public static void main(String[] args) {
     Maintanance m = new Maintanance();
     // m.setMtn_ServiceArea("Front door");
     //  m.setMtn_desc("it's broken!");
     // m.writeNewRequest(201);
     m.setMtn_result_eva("Sastisfy");
     m.setMtn_eva_remark("It's really good.");
     m.writeEvaluation(10012);
     }
     */
    /* 
     public static void main(String[] args) {
        
     //Maintanance m1 = Maintanance.findByDate("2017-01-20");
     List<Maintanance> m2 = Maintanance.findByStatus("Done");
     // List<Maintanance> m3 = Maintanance.findByRoomId(201);
     //  Maintanance m5 = Maintanance.findByWorkId(12005);
     for(Maintanance m: m2){
     System.out.println(m.toString());
     //    }
     //     System.out.println("======================================");
     //    System.out.println(m3.isEmpty());
     //    for(Maintanance m: m3){
     //    System.out.println(m.toString());
     //     System.out.println("======================================");
     //     System.out.println(m5.toString());
     }
     }
     */

    public static void main(String[] args) {
        Maintanance mm = Maintanance.findBymtnId(10062);
        for (String path : mm.getMtn_pic()) {
            System.out.println(path + "");
        }
    }

    public String getMtn_area_stuff() {
        return mtn_area_stuff;
    }

    public void setMtn_area_stuff(String mtn_area_stuff) {
        this.mtn_area_stuff = mtn_area_stuff;
    }

    public int getMtn_room_id() {
        return mtn_room_id;
    }

    public void setMtn_room_id(int mtn_room_id) {
        this.mtn_room_id = mtn_room_id;
    }

    public boolean isAppToken() {
        return appToken;
    }

    public void setAppToken(boolean appToken) {
        this.appToken = appToken;
    }

}
