package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class stuff {
    private int id;
    private String desc;
    private int amt;
    private int reqId;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public int getAmt() {
        return amt;
    }

    public void setAmt(int amt) {
        this.amt = amt;
    }

    public int getReqId() {
        return reqId;
    }

    public void setReqId(int reqId) {
        this.reqId = reqId;
    }

    @Override
    public String toString() {
        return "stuff{" + "id=" + id + ", desc=" + desc + ", amt=" + amt + ", reqId=" + reqId + '}';
    }
    private static void orm(ResultSet rs, stuff s) throws SQLException {
        s.setId(rs.getInt("stuff_ID"));
        s.setDesc(rs.getString("stuff_Desc"));
        s.setAmt(rs.getInt("stuff_Amt"));
        s.setReqId(rs.getInt("request_ID"));
    }
    public static boolean addStuff(String des, int amo, int id) {
        int x = 0;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            String sqlCmd = null;
            sqlCmd = "INSERT INTO Stuff(stuff_Desc, stuff_Amt, request_ID) VALUES (?,?,?)";
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setString(1, des);
            pstm.setInt(2, amo);
            pstm.setInt(3, id);
            x = pstm.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.err.println("Stuff, ADD : " + ex);
        }
        return x > 0;
    }
    public static boolean editRequest(String des, int amo, int id) {
        int x = 0;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            String sqlCmd = null;
            sqlCmd = "Update Stuff set stuff_Desc = ?, stuff_Amt = ? where stuff_ID = " + id;
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setString(1, des);
            pstm.setInt(2, amo);
            x = pstm.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.err.println("Stuff, Edit : " + ex);
        }
        return x > 0;
    }
    public static boolean deleteStuff(int id) {
        int x = 0;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            String sqlCmd = "Delete from Stuff where stuff_ID = ?";
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setInt(1, id);
            x = pstm.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.err.println("Stuff, Delete: " + ex);
        }
        return x > 0;
    }
    public static List<stuff> getListByReqNo(int no) {
        List<stuff> stu = new ArrayList<stuff>();
        try {
            Connection conn = ConnectionBuilder.getConnection();
            stuff s = null;
            String sqlCmd = "SELECT * FROM Stuff where request_ID = "+no;
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                s = new stuff();
                orm(rs, s);
                stu.add(s);
            }
            conn.close();
        } catch (SQLException ex) {
            System.err.println("Stuff, getList: " + ex);
        }
        return stu;
    }
    public static void main(String[] args) {
        //stuff.addStuff("table", 1, 4);
        //stuff.editRequest("edit", 99, 3);
        //stuff.deleteStuff(3);
        /*
        List<stuff> stu = stuff.getListByReqNo(4);
        for(stuff s : stu){
            System.out.println(s.toString());
        }
*/
    }
}
