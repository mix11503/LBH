package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

public class notifyAdmin {
    private int id;
    private String name;
    private String datetime;
    private String type;
    private String message;
    private int room;
    private String action;

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

    public String getDatetime() {
        return datetime;
    }

    public void setDatetime(String datetime) {
        this.datetime = datetime;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public int getRoom() {
        return room;
    }

    public void setRoom(int room) {
        this.room = room;
    }
    
    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    @Override
    public String toString() {
        return "notifyAdmin{" + "id=" + id + ", name=" + name + ", datetime=" + datetime + ", type=" + type + ", message=" + message + ", room=" + room + ", action=" + action + '}';
    }
    
    private static void orm(ResultSet rs, notifyAdmin na) throws SQLException {
        na.setId(rs.getInt("notify_id"));
        na.setDatetime(rs.getString("noti_datetime"));
        na.setName(rs.getString("noti_name"));
        na.setType(rs.getString("noti_type"));
        na.setMessage(rs.getString("noti_message"));
        na.setRoom(rs.getInt("noti_room"));
        na.setAction(rs.getString("noti_action"));
    }
    
    public static boolean createNoti(String name, String type, String message, String action, int room) {
        int x = 0;
        DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", new Locale("en","TH"));
        try {
            Connection conn = ConnectionBuilder.getConnection();
            String sqlCmd = null;
            sqlCmd = "INSERT INTO notify(noti_datetime, noti_name, noti_type, noti_message, noti_action, noti_room) VALUES (?,?,?,?,?,?)";
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setString(1, sdf.format(new Date()));
            pstm.setString(2, name);
            pstm.setString(3, type);
            pstm.setString(4, message);
            pstm.setString(5, action);
            pstm.setInt(6, room);
            x = pstm.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.err.println("notifyAdmin, create : " + ex);
        }
        return x > 0;
    }
    
    public static List<notifyAdmin> getNotiInfo() {
        List<notifyAdmin> noti = new ArrayList<notifyAdmin>();
        try {
            Connection conn = ConnectionBuilder.getConnection();
            notifyAdmin na = null;
            String sqlCmd = "SELECT * FROM notify ORDER BY notify_id DESC LIMIT 15";
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                na = new notifyAdmin();
                orm(rs, na);
                noti.add(na);
            }
            conn.close();
        } catch (SQLException ex) {
            System.err.println("notifyAdmin, getNotiInfo: " + ex);
        }
        return noti;
    }
    /*
    public static void main(String[] args) {
    
        List<notifyAdmin> noti = notifyAdmin.getNotiInfo();
        for(notifyAdmin n : noti){
            System.out.println(n.toString());
        }

       // createNoti("Kritsana","Noti","update datetime",201);
    }
*/

}
