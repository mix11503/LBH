package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

public class notifyUser {
    private int id;
    private String datetime;
    private String action;
    private String message;
    private Date expire;
    private int room;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDatetime() {
        return datetime;
    }

    public void setDatetime(String datetime) {
        this.datetime = datetime;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
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
    
    public Date getExpire() {
        return expire;
    }

    public void setExpire(Date expire) {
        this.expire = expire;
    }

    @Override
    public String toString() {
        return "notifyUser{" + "id=" + id + ", datetime=" + datetime + ", action=" + action + ", message=" + message + ", expire=" + expire + ", room=" + room + '}';
    }
    
    private static void orm(ResultSet rs, notifyUser nu) throws SQLException {
        nu.setId(rs.getInt("notiM_id"));
        nu.setDatetime(rs.getString("notiM_datetime"));
        nu.setAction(rs.getString("notiM_action"));
        nu.setExpire(rs.getDate("notiM_expired"));
        nu.setMessage(rs.getString("notiM_message"));
        
        nu.setRoom(rs.getInt("notiM_room"));
    }
    public static boolean createNotiMtn(String action, String message, int room) {
        int x = 0;
        DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", new Locale("en","TH"));
        try {
            Connection conn = ConnectionBuilder.getConnection();
            String sqlCmd = null;
            sqlCmd = "INSERT INTO notiMtnUser(notiM_datetime, notiM_action, notiM_message, notiM_expired, notiM_room) VALUES (?,?,?,?,?)";
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setString(1, sdf.format(new Date()));
            pstm.setString(2, action);
            pstm.setString(3, message);
            pstm.setString(4, LocalDate.now().plusWeeks(1).toString());
            pstm.setInt(5, room);
            x = pstm.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.err.println("notifyUser, createNotiMtn : " + ex);
        }
        return x > 0;
    }
    public static List<notifyUser> getNotiMtnByRoom(int roomId) {
        List<notifyUser> noti = new ArrayList<notifyUser>();
        try {
            Connection conn = ConnectionBuilder.getConnection();
            notifyUser nu = null;
            String sqlCmd = "SELECT * FROM notiMtnUser where notiM_room = ? and notiM_expired >= ? ORDER BY notiM_id DESC";
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setInt(1, roomId);
            pstm.setString(2, LocalDate.now().toString());
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                nu = new notifyUser();
                orm(rs, nu);
                noti.add(nu);
            }
            conn.close();
        } catch (SQLException ex) {
            System.err.println("notifyUser, getNotiMtnByRoom: " + ex);
        }
        return noti;
    }
    public static void main(String[] args) {
        //createNotiMtn("create","add expired",201);
     /*   List<notifyUser> noti = notifyUser.getNotiMtnByRoom(201);
        for(notifyUser n : noti){
            System.out.println(n.toString());
        }
     */
        //System.out.println(notifyUser.getNotiMtnByRoom(201).size());
    }

}
