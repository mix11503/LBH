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

/**
 *
 * @author Mix
 */
public class WorkCalendarEvent {
    private int id;
    private String title;
    private Date start;
    private Date end;
    private String detail;
    private String url;
    private String color;

    public WorkCalendarEvent() {
    }

    public WorkCalendarEvent(int id, String title, Date start, Date end, String detail, String url, String color) {
        this.id = id;
        this.title = title;
        this.start = start;
        this.end = end;
        this.detail = detail;
        this.url = url;
        this.color = color;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Date getStart() {
        return start;
    }

    public void setStart(Date start) {
        this.start = start;
    }

    public Date getEnd() {
        return end;
    }

    public void setEnd(Date end) {
        this.end = end;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }
    
    private void orm(ResultSet rs) throws SQLException{
        this.id = rs.getInt("Event_ID");
        this.title = rs.getString("Event_Title");
        this.start = rs.getDate("Event_Start");
        this.end = rs.getDate("Event_End");
        this.detail = rs.getString("Event_Detail");
        this.url = rs.getString("Event_Url");
        this.color = rs.getString("Event_Color");
    }
    
    public static void createNewEvent(String title, String detail, Date start, Date end, String url, String color){
        try{
            Connection conn = ConnectionBuilder.getConnection();
            String sql = "INSERT INTO Work_Calendar_Event(Event_Title, Event_Detail, Event_Start, Event_End, Event_Url, Event_Color) "
                    + "VALUE( ?, ?, ?, ?, ?, ?)";
            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setString(1, title);
            pstm.setString(2, detail);
            pstm.setDate(3, start);
            pstm.setDate(4, end);
            pstm.setString(5, url);
            pstm.setString(6, color);
            pstm.executeUpdate();
            conn.close();
        }catch(SQLException ex){
            System.err.println("KeycardReq,insertLostRequest: "+ex);
        }
    }
}
