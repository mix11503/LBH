package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class newsUpdate {

    private int news_id;
    private String news_topic;
    private String news_desc;
    private Date start_date;
    private Date end_date;
    private int roomTag;
    private boolean hidden;
    private String cate;

    public int getNews_id() {
        return news_id;
    }

    public void setNews_id(int news_id) {
        this.news_id = news_id;
    }

    public String getNews_topic() {
        return news_topic;
    }

    public void setNews_topic(String news_topic) {
        this.news_topic = news_topic;
    }

    public String getNews_desc() {
        return news_desc;
    }

    public void setNews_desc(String news_desc) {
        this.news_desc = news_desc;
    }

    public Date getStart_date() {
        return start_date;
    }

    public void setStart_date(Date start_date) {
        this.start_date = start_date;
    }

    public Date getEnd_date() {
        return end_date;
    }

    public void setEnd_date(Date end_date) {
        this.end_date = end_date;
    }

    @Override
    public String toString() {
        return "newsUpdate{" + "news_id=" + news_id + ", news_topic=" + news_topic + ", news_desc=" + news_desc + ", start_date=" + start_date + ", end_date=" + end_date + ", roomTag=" + roomTag + ", hidden=" + hidden + ", cate=" + cate + '}';
    }

    public boolean createNews(String start, String end) {
        int x = 0;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            String sqlCmd = null;
            sqlCmd = "INSERT INTO News( News_Topic, News_Desc, hidden, News_Start, News_End, category) VALUES (?,?,?,?,?,?)";
            PreparedStatement pstm = conn.prepareStatement(sqlCmd, Statement.RETURN_GENERATED_KEYS);
            pstm.setString(1, this.news_topic);
            pstm.setString(2, this.news_desc);
            pstm.setBoolean(3, false);
            pstm.setString(4, start);
            pstm.setString(5, end);
            pstm.setString(6, this.cate);
            x = pstm.executeUpdate();
            ResultSet rs = pstm.getGeneratedKeys();
            if (rs.next()) {
                this.news_id = rs.getInt(1);
                System.out.println(this.news_id);
            }
            conn.close();
        } catch (SQLException ex) {
            System.err.println("News, createNews: " + ex);
        }
        return x > 0;
    }
    
    public boolean editNews(int newsID, String start, String End) {
        int x = 0;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            String sqlCmd = "Update News set News_Topic=?, News_Desc=?, News_Start=?, News_End=?, category=? where News_ID = " + newsID;
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setString(1, this.news_topic);
            pstm.setString(2, this.news_desc);
            pstm.setString(3, start);
            pstm.setString(4, End);
            pstm.setString(5, this.cate);
            x = pstm.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.err.println("News, editNews: " + ex);
        }
        return x > 0;
    }
    
    public boolean removeNews(int newsID, boolean remove) {
        int x = 0;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            String sqlCmd = "Update News set hidden = ? where News_ID = " + newsID;
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setBoolean(1, remove);
            x = pstm.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.err.println("News, removeNews: " + ex);
        }
        return x > 0;
    }

    public static newsUpdate findByNewsID(int newsID) {
        newsUpdate nu = null;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            String sqlCmd = "SELECT * FROM News where News_ID = ?";
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setInt(1, newsID);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                nu = new newsUpdate();
                orm(rs, nu);
            }
            conn.close();
        } catch (SQLException ex) {
            System.err.println("news FindByID: " + ex);
        }
        return nu;
    }

    public boolean attachedTag(int newsID, int roomTag) {
        int x = 0;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            String sqlCmd = null;
            sqlCmd = "INSERT INTO Mapping_Room_News( Room_ID, News_ID ) VALUES (?,?)";
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setInt(1, roomTag);
            pstm.setInt(2, newsID);
            x = pstm.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.err.println("News, attachedTag: " + ex);
        }
        return x > 0;
    }

    private static void orm(ResultSet rs, newsUpdate news) throws SQLException {
        news.setNews_id(rs.getInt("News_ID"));
        news.setNews_topic(rs.getString("News_Topic"));
        news.setNews_desc(rs.getString("News_Desc"));
        news.setStart_date(rs.getDate("News_Start"));
        news.setEnd_date(rs.getDate("News_End"));
        news.setHidden(rs.getBoolean("hidden"));
        news.setCate(rs.getString("category"));
    }

    public static List<newsUpdate> getAllNews() {
        List<newsUpdate> news = new ArrayList<newsUpdate>();
        try {
            Connection conn = ConnectionBuilder.getConnection();
            newsUpdate n = null;
            String sqlCmd = "SELECT * FROM News where hidden = false ORDER BY News_ID DESC";
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                n = new newsUpdate();
                orm(rs, n);
                news.add(n);
            }
            conn.close();
        } catch (SQLException ex) {
            System.err.println("News getAllNews : " + ex);
        }
        return news;
    }

    public static List<newsUpdate> getCurrentNews() {
        List<newsUpdate> news = new ArrayList<newsUpdate>();
        try {
            Connection conn = ConnectionBuilder.getConnection();
            newsUpdate n = null;
            String sqlCmd = "SELECT * FROM News WHERE News_Start<= ? and News_End >= ? and hidden = false ORDER BY News_ID DESC";
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setDate(1, new java.sql.Date(new Date().getTime()));
            pstm.setDate(2, new java.sql.Date(new Date().getTime()));
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                n = new newsUpdate();
                orm(rs, n);
                news.add(n);
            }
            conn.close();
        } catch (SQLException ex) {
            System.err.println("News getCurrentNews: " + ex);
        }
        return news;
    }

    public static List<newsUpdate> getOldNews() {
        List<newsUpdate> news = new ArrayList<newsUpdate>();
        try {
            Connection conn = ConnectionBuilder.getConnection();
            newsUpdate n = null;
            String sqlCmd = "SELECT * FROM News WHERE News_End < ? and hidden = false ORDER BY News_ID DESC";
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setDate(1, new java.sql.Date(new Date().getTime()));
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                n = new newsUpdate();
                orm(rs, n);
                news.add(n);
            }
            conn.close();
        } catch (SQLException ex) {
            System.err.println("News getCurrentNews: " + ex);
        }
        return news;
    }
    
    public static List<newsUpdate> getRemoveNews() {
        List<newsUpdate> news = new ArrayList<newsUpdate>();
        try {
            Connection conn = ConnectionBuilder.getConnection();
            newsUpdate n = null;
            String sqlCmd = "SELECT * FROM News where hidden = true";
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                n = new newsUpdate();
                orm(rs, n);
                news.add(n);
            }
            conn.close();
        } catch (SQLException ex) {
            System.err.println("News getRemoveNews : " + ex);
        }
        return news;
    }

    public static List<newsUpdate> searchNewsInRange(String start, String end) {
        List<newsUpdate> news = new ArrayList<newsUpdate>();
        try {
            Connection conn = ConnectionBuilder.getConnection();
            newsUpdate n = null;
            String sqlCmd = "SELECT * FROM News WHERE News_End >= ? and News_End <= ? and hidden = false";
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setString(1, start);
            pstm.setString(2, end);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                n = new newsUpdate();
                orm(rs, n);
                news.add(n);
            }
            conn.close();
        } catch (SQLException ex) {
            System.err.println("News searchNewsInRange: " + ex);
        }
        return news;
    }

    public static List<newsUpdate> searchNewsByKeyword(String keyword) {
        List<newsUpdate> news = new ArrayList<newsUpdate>();
        try {
            Connection conn = ConnectionBuilder.getConnection();
            newsUpdate n = null;
            String sqlCmd = "SELECT * FROM News WHERE News_Topic like ? and hidden = false";
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setString(1, "%" + keyword + "%");
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                n = new newsUpdate();
                orm(rs, n);
                news.add(n);
            }
            conn.close();
        } catch (SQLException ex) {
            System.err.println("News searchbyKeyword: " + ex);
        }
        return news;
    }
    
    public static List<newsUpdate> searchNewsByCate(String cate) {
        List<newsUpdate> news = new ArrayList<newsUpdate>();
        try {
            Connection conn = ConnectionBuilder.getConnection();
            newsUpdate n = null;
            String sqlCmd = "SELECT * FROM News WHERE category like ? and hidden = false";
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setString(1, cate);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                n = new newsUpdate();
                orm(rs, n);
                news.add(n);
            }
            conn.close();
        } catch (SQLException ex) {
            System.err.println("News searchbyCate: " + ex);
        }
        return news;
    }
    
    public static List<newsUpdate> getCurrentNewsByKeyword(String keyword) {
        List<newsUpdate> news = new ArrayList<newsUpdate>();
        try {
            Connection conn = ConnectionBuilder.getConnection();
            newsUpdate n = null;
            String sqlCmd = "SELECT * FROM News WHERE News_Topic like ? and News_End >= ? and hidden = false";
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setString(1, "%" + keyword + "%");
            pstm.setDate(2, new java.sql.Date(new Date().getTime()));
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                n = new newsUpdate();
                orm(rs, n);
                news.add(n);
            }
            conn.close();
        } catch (SQLException ex) {
            System.err.println("News currentbyKeyword: " + ex);
        }
        return news;
    }

    public static void main(String[] args) {

        //List<newsUpdate> news = newsUpdate.searchNewsInRange("2017-08-01", "2017-08-28");
           List<newsUpdate> news = newsUpdate.getCurrentNews();
        for(newsUpdate n : news){
            System.out.println(n.toString());
        }
         
 /*
        if(new java.sql.Date(new Date().getTime()).equals("2017-08-20")){
            System.out.println("True");
        }
        System.out.println(new java.sql.Date(new Date().getTime()).toString());
        System.out.println(new java.sql.Date(new Date().getTime()));
         */
 /*
     newsUpdate n = new newsUpdate();
     n.setNews_topic("testhidden");
     n.setNews_desc("hidden");
     n.createNews("2017-08-08", "2017-08-08");
        System.out.println("DONE");
         */
 /*
     newsUpdate n = new newsUpdate();
    // n.attachedTag(10002, 201);
    n.removeNews(10048, true);
      */   
 
 /*    newsUpdate n = newsUpdate.findByNewsID(10011);
        System.out.println(n.toString() + "cate: "+n.getCate());
*/
 /*
    newsUpdate n = new newsUpdate();
    n.setNews_topic("editTest");
    n.setNews_desc("edit Desc");
    n.editNews(10044, "2017-08-20", "2017-08-23");
*/
    }

    public int getRoomTag() {
        return roomTag;
    }

    public void setRoomTag(int roomTag) {
        this.roomTag = roomTag;
    }

    public boolean isHidden() {
        return hidden;
    }

    public void setHidden(boolean hidden) {
        this.hidden = hidden;
    }

    public String getCate() {
        return cate;
    }

    public void setCate(String cate) {
        this.cate = cate;
    }
}
