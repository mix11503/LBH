package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Moving {
    private int id;
    private Date reqDate;
    private boolean inOrOut;
    private String remark;
    private String dateMove;
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

    public boolean isInOrOut() {
        return inOrOut;
    }

    public void setInOrOut(boolean inOrOut) {
        this.inOrOut = inOrOut;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getDateMove() {
        return dateMove;
    }

    public void setDateMove(String dateMove) {
        this.dateMove = dateMove;
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
        return "Moving{" + "id=" + id + ", reqDate=" + reqDate + ", inOrOut=" + inOrOut + ", remark=" + remark + ", dateMove=" + dateMove + ", status=" + status + ", roomId=" + roomId + '}';
    }
    private static void orm(ResultSet rs, Moving m) throws SQLException {
        m.setId(rs.getInt("MV_ID"));
        m.setDateMove(rs.getString("MV_DateMove"));
        m.setInOrOut(rs.getBoolean("MV_InOrOut"));
        m.setRemark(rs.getString("MV_Remark"));
        m.setReqDate(rs.getDate("MV_DateRequest"));
        m.setRoomId(rs.getInt("Room_ID"));
        m.setStatus(rs.getBoolean("MV_Status"));
        m.setUsName(rs.getString("usName"));
    }
    public boolean createRequest(int roomId) {
        int x = 0;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            String sqlCmd = null;
            sqlCmd = "INSERT INTO StuffMoving_Request(MV_DateMove, MV_InOrOut, MV_Remark, MV_DateRequest, MV_Status, usName, Room_ID) VALUES (?,?,?,?,?,?,?)";
            PreparedStatement pstm = conn.prepareStatement(sqlCmd, Statement.RETURN_GENERATED_KEYS);
            pstm.setString(1, this.dateMove);
            pstm.setBoolean(2, this.inOrOut);
            pstm.setString(3, this.remark);
            pstm.setDate(4, new java.sql.Date(new Date().getTime()));
            pstm.setBoolean(5, false);
            pstm.setString(6, this.usName);
            pstm.setInt(7, roomId);
            x = pstm.executeUpdate();
            ResultSet rs = pstm.getGeneratedKeys();
            if(rs.next()){
                this.id = rs.getInt(1);
            }
            conn.close();
        } catch (SQLException ex) {
            System.err.println("Moving, ADD : " + ex);
        }
        return x > 0;
    }
    public boolean editRequest(int id) {
        int x = 0;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            String sqlCmd = null;
            sqlCmd = "Update StuffMoving_Request set MV_DateMove = ? , MV_InOrOut = ?, MV_Remark = ? where MV_ID = " + id;
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setString(1, this.dateMove);
            pstm.setBoolean(2, this.inOrOut);
            pstm.setString(3, this.remark);
            x = pstm.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.err.println("Moving, Edit : " + ex);
        }
        return x > 0;
    }
    public static boolean deleteRequest(int id) {
        int x = 0;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            String sqlCmd = "Delete from StuffMoving_Request where MV_ID = ?";
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setInt(1, id);
            x = pstm.executeUpdate();
            conn.close();
            
            //delete stuff in request
            List<stuff> stu = stuff.getListByReqNo(id);
            for(stuff s : stu){stuff.deleteStuff(s.getId());}
            
        } catch (SQLException ex) {
            System.err.println("Moving, Delete: " + ex);
        }
        return x > 0;
    }
    public static boolean Approved(int id) {
        int x = 0;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            String sqlCmd = "Update StuffMoving_Request set MV_Status = ? where MV_ID = " + id;
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setBoolean(1, true);
            x = pstm.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.err.println("Moving, Approve: " + ex);
        }
        return x > 0;
    }
    public static List<Moving> getAllRequest() {
        List<Moving> mov = new ArrayList<Moving>();
        try {
            Connection conn = ConnectionBuilder.getConnection();
            Moving m = null;
            String sqlCmd = "SELECT * FROM StuffMoving_Request ORDER BY MV_ID DESC";
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                m = new Moving();
                orm(rs, m);
                mov.add(m);
            }
            conn.close();
        } catch (SQLException ex) {
            System.err.println("Mov, getAll: " + ex);
        }
        return mov;
    }
    public static List<Moving> getNewRequest() {
        List<Moving> mov = new ArrayList<Moving>();
        try {
            Connection conn = ConnectionBuilder.getConnection();
            Moving m = null;
            String sqlCmd = "SELECT * FROM StuffMoving_Request where MV_status = false ORDER BY MV_ID DESC";
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                m = new Moving();
                orm(rs, m);
                mov.add(m);
            }
            conn.close();
        } catch (SQLException ex) {
            System.err.println("Mov, getNew: " + ex);
        }
        return mov;
    }
    public static List<Moving> searchMovInRange(String start, String end) {
        List<Moving> mov = new ArrayList<Moving>();
        try {
            Connection conn = ConnectionBuilder.getConnection();
            Moving m = null;
            String sqlCmd = "SELECT * FROM StuffMoving_Request where MV_DateRequest >= ? and MV_DateRequest <= ?";
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setString(1, start);
            pstm.setString(2, end);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                m = new Moving();
                orm(rs, m);
                mov.add(m);
            }
            conn.close();
        } catch (SQLException ex) {
            System.err.println("Mov, searchInRange: " + ex);
        }
        return mov;
    }
    public static Moving findById(int id) {
        Moving m = null;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            String sqlCmd = "SELECT * FROM StuffMoving_Request where MV_ID = ?";
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setInt(1, id);
            ResultSet rs = pstm.executeQuery();
            if(rs.next()) {
                m = new Moving();
                orm(rs, m);
            }
            conn.close();
        } catch (SQLException ex) {
            System.err.println("Mov, FindById: " + ex);
        }
        return m;
    }
    public static List<Moving> getRequestByRoomNo(int RoomId) {
        List<Moving> mov = new ArrayList<Moving>();
        try {
            Connection conn = ConnectionBuilder.getConnection();
            Moving m = null;
            String sqlCmd = "SELECT * FROM StuffMoving_Request where Room_ID = "+RoomId+" ORDER BY MV_ID DESC";
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                m = new Moving();
                orm(rs, m);
                mov.add(m);
            }
            conn.close();
        } catch (SQLException ex) {
            System.err.println("Mov, getByRoomId: " + ex);
        }
        return mov;
    }
    public static int getAmountReqNoti(int RoomId) {
        int amt = -1;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            String sqlCmd = "SELECT COUNT(*) AS AMT FROM StuffMoving_Request where Room_ID = ? and MV_Status = ? and MV_DateMove >= ?";
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setInt(1, RoomId);
            pstm.setBoolean(2, true);
            pstm.setDate(3, new java.sql.Date(new Date().getTime()));
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                amt = rs.getInt("AMT");
            }
            conn.close();
        } catch (SQLException ex) {
            System.err.println("Move, getAmtNoti: " + ex);
        }
        return amt;
    }
    public static void main(String[] args) {
        /*
        Moving m = new Moving();
        m.setDateMove("2017-10-18 15:00:00");
        m.setInOrOut(true);
        m.setRemark("test edit");
        m.editRequest(3);
*/
        
        //Moving.deleteRequest(7);
        //Moving.Approved(2);

        /*
        List<Moving> m = Moving.searchMovInRange("2017-09-15","2017-09-17");
        for(Moving mm : m){
            System.out.println(mm.toString());
        }
*/
       //System.out.println(Moving.findById(2).toString());
        //System.out.println(getAmountReqNoti(202));
    }

    public String getUsName() {
        return usName;
    }

    public void setUsName(String usName) {
        this.usName = usName;
    }
}
