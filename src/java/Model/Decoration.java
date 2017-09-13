package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Decoration {
    private int id;
    private String desc;
    private String start;
    private String end;
    private Boolean status;
    private int roomId;
    private Date reqDate;

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

    public String getStart() {
        return start;
    }

    public void setStart(String start) {
        this.start = start;
    }

    public String getEnd() {
        return end;
    }

    public void setEnd(String end) {
        this.end = end;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
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
        return "Decoration{" + "id=" + id + ", desc=" + desc + ", start=" + start + ", end=" + end + ", status=" + status + ", roomId=" + roomId + ", reqDate=" + reqDate + '}';
    }
   
    private static void orm(ResultSet rs, Decoration d) throws SQLException {
        d.setId(rs.getInt("DEC_ID"));
        d.setDesc(rs.getString("DEC_Desc"));
        d.setStart(rs.getString("DEC_Start"));
        d.setEnd(rs.getString("DEC_End"));
        d.setStatus(rs.getBoolean("DEC_status"));
        d.setRoomId(rs.getInt("Room_ID"));
        d.setReqDate(rs.getDate("DEC_ReqDate"));
    }
    
    public boolean createRequest(int roomId) {
        int x = 0;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            String sqlCmd = null;
            sqlCmd = "INSERT INTO DecorateRequest(DEC_Desc, DEC_Start, DEC_End, DEC_Status, Room_ID, DEC_ReqDate) VALUES (?,?,?,?,?,?)";
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setString(1, this.desc);
            pstm.setString(2, this.start);
            pstm.setString(3, this.end);
            pstm.setBoolean(4, false);
            pstm.setInt(5, roomId);
            pstm.setDate(6, new java.sql.Date(new Date().getTime()));
            x = pstm.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.err.println("Decorate, ADD : " + ex);
        }
        return x > 0;
    }
    public boolean editRequest(int roomId) {
        int x = 0;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            String sqlCmd = null;
            sqlCmd = "Update DecorateRequest set DEC_Desc = ?, DEC_Start = ?, DEC_End = ? where Room_ID = " + roomId;
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setString(1, this.desc);
            pstm.setString(2, this.start);
            pstm.setString(3, this.end);
            x = pstm.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.err.println("Decorate, Edit : " + ex);
        }
        return x > 0;
    }
    public static boolean deleteRequest(int id) {
        int x = 0;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            String sqlCmd = "Delete from DecorateRequest where DEC_ID = ?";
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setInt(1, id);
            x = pstm.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.err.println("Decorate, Delete: " + ex);
        }
        return x > 0;
    }
    public static boolean Approved(int id) {
        int x = 0;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            String sqlCmd = "Update DecorateRequest set DEC_Status = ? where DEC_ID = " + id;
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setBoolean(1, true);
            x = pstm.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.err.println("Decorate, Approve: " + ex);
        }
        return x > 0;
    }
    public static List<Decoration> getAllRequest() {
        List<Decoration> dec = new ArrayList<Decoration>();
        try {
            Connection conn = ConnectionBuilder.getConnection();
            Decoration d = null;
            String sqlCmd = "SELECT * FROM DecorateRequest ORDER BY DEC_ID DESC";
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                d = new Decoration();
                orm(rs, d);
                dec.add(d);
            }
            conn.close();
        } catch (SQLException ex) {
            System.err.println("Dec, getAll: " + ex);
        }
        return dec;
    }
    public static List<Decoration> getNewRequest() {
        List<Decoration> dec = new ArrayList<Decoration>();
        try {
            Connection conn = ConnectionBuilder.getConnection();
            Decoration d = null;
            String sqlCmd = "SELECT * FROM DecorateRequest where DEC_status = false ORDER BY DEC_ID DESC";
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                d = new Decoration();
                orm(rs, d);
                dec.add(d);
            }
            conn.close();
        } catch (SQLException ex) {
            System.err.println("Dec, getNew: " + ex);
        }
        return dec;
    }
    public static List<Decoration> searchDecInRange(String start, String end) {
        List<Decoration> dec = new ArrayList<Decoration>();
        try {
            Connection conn = ConnectionBuilder.getConnection();
            Decoration d = null;
            String sqlCmd = "SELECT * FROM DecorateRequest where DEC_ReqDate >= ? and DEC_ReqDate <= ?";
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setString(1, start);
            pstm.setString(2, end);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                d = new Decoration();
                orm(rs, d);
                dec.add(d);
            }
            conn.close();
        } catch (SQLException ex) {
            System.err.println("Dec, searchInRange: " + ex);
        }
        return dec;
    }
    public static Decoration findById(int id) {
        Decoration d = null;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            String sqlCmd = "SELECT * FROM DecorateRequest where DEC_ID = ?";
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setInt(1, id);
            ResultSet rs = pstm.executeQuery();
            if(rs.next()) {
                d = new Decoration();
                orm(rs, d);
            }
            conn.close();
        } catch (SQLException ex) {
            System.err.println("DEC, FindById: " + ex);
        }
        return d;
    }
    public static void main(String[] args) {
        /*
        Decoration d = new Decoration();
        d.setDesc("Bedroom");
        d.setStart("2017-09-12");
        d.setEnd("2017-09-15");
        d.createRequest(202);
        System.out.println("success");
*/
       // Decoration.deleteRequest(1);
       /*
       List<Decoration> dec = Decoration.getAllRequest();
       for(Decoration d : dec){
           System.out.println(d.toString());
       }
       */
        //System.out.println(Decoration.findById(2).toString());
}

    public Date getReqDate() {
        return reqDate;
    }

    public void setReqDate(Date reqDate) {
        this.reqDate = reqDate;
    }

          
}
