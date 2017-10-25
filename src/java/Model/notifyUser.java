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
    private boolean clicked;
    
    private int news_id;
    private String news_action;
    private String news_topic;
    private String news_cate;
    private String news_datetime;

    
    public boolean isClicked() {
        return clicked;
    }

    public void setClicked(boolean clicked) {
        this.clicked = clicked;
    }

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
    
    
    public int getNews_id() {
        return news_id;
    }

    public void setNews_id(int news_id) {
        this.news_id = news_id;
    }

    public String getNews_action() {
        return news_action;
    }

    public void setNews_action(String news_action) {
        this.news_action = news_action;
    }

    public String getNews_topic() {
        return news_topic;
    }

    public void setNews_topic(String news_topic) {
        this.news_topic = news_topic;
    }

    public String getNews_cate() {
        return news_cate;
    }

    public void setNews_cate(String news_cate) {
        this.news_cate = news_cate;
    }

    public String getNews_datetime() {
        return news_datetime;
    }

    public void setNews_datetime(String news_datetime) {
        this.news_datetime = news_datetime;
    }

    public String toStringMtn() {
        return "notifyUser{" + "id=" + id + ", datetime=" + datetime + ", action=" + action + ", message=" + message + ", expire=" + expire + ", room=" + room+'}';
    }
    
    public String toStringNews() {
        return "notifyUser{" + ", news_id=" + news_id + ", news_action=" + news_action + ", news_topic=" + news_topic + ", news_cate=" + news_cate + ", news_datetime=" + news_datetime + '}';
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
    public static boolean notifyClicked(int id) {
        int x = 0;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            String sqlCmd = "Update notiMtnUser set clicked = true where notiM_id = ?";
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setInt(1, id);
            x = pstm.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.err.println("notifyUser, clicked: " + ex);
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
                //getDataFromDBtoNU
                nu.setId(rs.getInt("notiM_id"));
                nu.setDatetime(rs.getString("notiM_datetime"));
                nu.setAction(rs.getString("notiM_action"));
                nu.setExpire(rs.getDate("notiM_expired"));
                nu.setMessage(rs.getString("notiM_message"));
                nu.setRoom(rs.getInt("notiM_room"));
                nu.setClicked(rs.getBoolean("clicked"));
                noti.add(nu);
            }
            conn.close();
        } catch (SQLException ex) {
            System.err.println("notifyUser, getNotiMtnByRoom: " + ex);
        }
        return noti;
    }
    public static int getAmtNewMtnNotifyByRoom(int roomId) {
        int amt = -1;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            String sqlCmd = "SELECT count(*) AS AMT FROM notiMtnUser where notiM_room = ? and notiM_expired >= ? and clicked = false";
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setInt(1, roomId);
            pstm.setString(2, LocalDate.now().toString());
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                amt = rs.getInt("amt");
            }
            conn.close();
        } catch (SQLException ex) {
            System.err.println("notifyUser, getNotiMtnNewAmtByRoom: " + ex);
        }
        return amt;
    }
    public static boolean createNotiNews(String action, int newsID, int roomTag) {
        int x = 0;
        DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", new Locale("en","TH"));
        try {
            Connection conn = ConnectionBuilder.getConnection();
            String sqlCmd = null;
            sqlCmd = "INSERT INTO notiNews(notiNews_datetime, notiNews_action, roomTag, newsID) VALUES (?,?,?,?)";
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setString(1, sdf.format(new Date()));
            pstm.setString(2, action);
            pstm.setInt(3, roomTag);
            pstm.setInt(4, newsID);
            x = pstm.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.err.println("notifyUser, createNotiNews : " + ex);
        }
        return x > 0;
    }
    public static List<notifyUser> getNotiNewsByRoom(int roomId) {
        List<notifyUser> noti = new ArrayList<notifyUser>();
        try {
            Connection conn = ConnectionBuilder.getConnection();
            notifyUser nu = null;
            String sqlCmd = "SELECT * FROM notiNews nn join News n ON nn.newsID = n.News_ID  where nn.roomTag = 0 OR nn.roomTag = ? "
                    + "and n.News_Start<= ? and n.News_End >= ? and n.hidden = false ORDER BY nn.newsID DESC";
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            int tag = (roomId/100)*100;
            pstm.setInt(1, tag);
            pstm.setDate(2, new java.sql.Date(new Date().getTime()));
            pstm.setDate(3, new java.sql.Date(new Date().getTime()));
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                nu = new notifyUser();
                nu.setNews_id(rs.getInt("nn.newsID"));
                nu.setNews_action(rs.getString("nn.notiNews_action"));
                nu.setNews_topic(rs.getString("n.News_Topic"));
                nu.setNews_cate(rs.getString("n.category"));
                nu.setNews_datetime(rs.getString("nn.notiNews_datetime"));
                noti.add(nu);
            }
            conn.close();
        } catch (SQLException ex) {
            System.err.println("notifyUser, getNotiNewsByRoom: " + ex);
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
        //createNotiNews("/test",10071,300);
        /*
        List<notifyUser> noti = notifyUser.getNotiNewsByRoom(201);
        for(notifyUser n : noti){
            System.out.println(n.toStringNews());
        }
*/
        //System.out.println(getAmtNewMtnNotifyByRoom(201));
       // System.out.println(getAmtNewMtnNotifyByRoom(202));
       //notifyClicked(12);
    }

}
