package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Problem {
    private int id;
    private Date reqDate;
    private String topic;
    private String desc;
    private boolean status;
    private int roomId;
    private String usName;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getReqDate() {
        return reqDate;
    }

    public void setReqDate(Date reqDate) {
        this.reqDate = reqDate;
    }

    public String getTopic() {
        return topic;
    }

    public void setTopic(String topic) {
        this.topic = topic;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public int getRoomId() {
        return roomId;
    }

    public void setRoomId(int roomId) {
        this.roomId = roomId;
    }
    

    @Override
    public String toString() {
        return "Problem{" + "id=" + id + ", reqDate=" + reqDate + ", topic=" + topic + ", desc=" + desc + ", status=" + status + ", roomId=" + roomId + '}';
    }
    private static void orm(ResultSet rs, Problem p) throws SQLException {
        p.setId(rs.getInt("PBM_ID"));
        p.setReqDate(rs.getDate("PBM_Date"));
        p.setTopic(rs.getString("PBM_Name"));
        p.setDesc(rs.getString("PBM_Desc"));
        p.setStatus(rs.getBoolean("PBM_Status"));
        p.setRoomId(rs.getInt("Room_ID"));
        p.setUsName(rs.getString("usName"));
    }
    
    public boolean createRequest(int roomId) {
        int x = 0;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            String sqlCmd = null;
            sqlCmd = "INSERT INTO Problem_Report(PBM_Date, PBM_Name, PBM_Desc, PBM_Status, usName, Room_ID) VALUES (?,?,?,?,?,?)";
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setDate(1, new java.sql.Date(new Date().getTime()));
            pstm.setString(2, this.topic);
            pstm.setString(3, this.desc);
            pstm.setBoolean(4, false);
            pstm.setString(5, this.usName);
            pstm.setInt(6, roomId);
            x = pstm.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.err.println("Problem, ADD : " + ex);
        }
        return x > 0;
    }
    public boolean editRequest(int id) {
        int x = 0;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            String sqlCmd = null;
            sqlCmd = "Update Problem_Report set PBM_Name = ?, PBM_Desc = ? where PBM_ID = " + id;
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setString(1, this.topic);
            pstm.setString(2, this.desc);
            x = pstm.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.err.println("Problem, Edit : " + ex);
        }
        return x > 0;
    }
    public static boolean deleteRequest(int id) {
        int x = 0;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            String sqlCmd = "Delete from Problem_Report where PBM_ID = ?";
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setInt(1, id);
            x = pstm.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.err.println("Problem, Delete: " + ex);
        }
        return x > 0;
    }
    public static boolean Acknowledged(int id) {
        int x = 0;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            String sqlCmd = "Update Problem_Report set PBM_Status = ? where PBM_ID = " + id;
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setBoolean(1, true);
            x = pstm.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.err.println("PBM, Ack: " + ex);
        }
        return x > 0;
    }
    public static List<Problem> getAllRequest() {
        List<Problem> pbm = new ArrayList<Problem>();
        try {
            Connection conn = ConnectionBuilder.getConnection();
            Problem p = null;
            String sqlCmd = "SELECT * FROM Problem_Report ORDER BY PBM_ID DESC";
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                p = new Problem();
                orm(rs, p);
                pbm.add(p);
            }
            conn.close();
        } catch (SQLException ex) {
            System.err.println("Pbm, getAll: " + ex);
        }
        return pbm;
    }
    public static List<Problem> getNewRequest() {
        List<Problem> pbm = new ArrayList<Problem>();
        try {
            Connection conn = ConnectionBuilder.getConnection();
            Problem p = null;
            String sqlCmd = "SELECT * FROM Problem_Report where PBM_Status = false ORDER BY PBM_ID DESC";
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                p = new Problem();
                orm(rs, p);
                pbm.add(p);
            }
            conn.close();
        } catch (SQLException ex) {
            System.err.println("Pbm, getNew: " + ex);
        }
        return pbm;
    }
    public static List<Problem> searchPbmInRange(String start, String end) {
        List<Problem> pbm = new ArrayList<Problem>();
        try {
            Connection conn = ConnectionBuilder.getConnection();
            Problem p = null;
            String sqlCmd = "SELECT * FROM Problem_Report where PBM_Date >= ? and PBM_Date <= ?";
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setString(1, start);
            pstm.setString(2, end);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                p = new Problem();
                orm(rs, p);
                pbm.add(p);
            }
            conn.close();
        } catch (SQLException ex) {
            System.err.println("Pbm, searchInRange: " + ex);
        }
        return pbm;
    }
    public static Problem findById(int id) {
        Problem p = null;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            String sqlCmd = "SELECT * FROM Problem_Report where PBM_ID = ?";
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setInt(1, id);
            ResultSet rs = pstm.executeQuery();
            if(rs.next()) {
                p = new Problem();
                orm(rs, p);
            }
            conn.close();
        } catch (SQLException ex) {
            System.err.println("Pbm, FindById: " + ex);
        }
        return p;
    }
    public static List<Problem> getRequestByRoomNo(int RoomId) {
        List<Problem> pbm = new ArrayList<Problem>();
        try {
            Connection conn = ConnectionBuilder.getConnection();
            Problem p = null;
            String sqlCmd = "SELECT * FROM Problem_Report where Room_ID = "+RoomId+" ORDER BY PBM_ID DESC";
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                p = new Problem();
                orm(rs, p);
                pbm.add(p);
            }
            conn.close();
        } catch (SQLException ex) {
            System.err.println("PBM, getByRoomId: " + ex);
        }
        return pbm;
    }
    public static void main(String[] args) {
        /*
        List<Problem> pb = Problem.searchPbmInRange("2017-09-14", "2017-09-14");
        for(Problem p : pb){
            System.out.println(p.toString());
        }
*/
        //Problem p = Problem.findById(2);
        //System.out.println(p.toString());
        //Problem.deleteRequest(4);
        /*
        Problem p = new Problem();
        p.setTopic("test");
        p.setDesc("testtest");
        p.editRequest(6);
*/
    }

    public String getUsName() {
        return usName;
    }

    public void setUsName(String usName) {
        this.usName = usName;
    }
}
