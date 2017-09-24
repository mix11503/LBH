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
import java.util.LinkedList;
import java.util.List;

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
    private String urlPage;
    private String color;
    private String type;

    public WorkCalendarEvent() {
    }

    public WorkCalendarEvent(int id, String title, Date start, Date end, String detail, String url, String color, String type) {
        this.id = id;
        this.title = title;
        this.start = start;
        this.end = end;
        this.detail = detail;
        this.urlPage = url;
        this.color = color;
        this.type = type;
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

    public String getUrlPage() {
        return urlPage;
    }

    public void setUrlPage(String urlPage) {
        this.urlPage = urlPage;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
    
    
    private void orm(ResultSet rs) throws SQLException{
        this.id = rs.getInt("Event_ID");
        this.title = rs.getString("Event_Title");
        this.start = rs.getDate("Event_Start");
        this.end = rs.getDate("Event_End");
        this.detail = rs.getString("Event_Detail");
        this.urlPage = rs.getString("Event_Url");
        this.color = rs.getString("Event_Color");
        this.type = rs.getString("Event_Type");
    }
    
    public static void createNewEvent(String title, String detail, Date start, Date end, String url, String color, String type){
        try{
            Connection conn = ConnectionBuilder.getConnection();
            String sql = "INSERT INTO Work_Calendar_Event(Event_Title, Event_Detail, Event_Start, Event_End, Event_Url, Event_Color, Event_Type) "
                    + "VALUE( ?, ?, ?, ?, ?, ?, ? )";
            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setString(1, title);
            pstm.setString(2, detail);
            pstm.setDate(3, start);
            pstm.setDate(4, end);
            pstm.setString(5, url);
            pstm.setString(6, color);
            pstm.setString(7, type);
            pstm.executeUpdate();
            conn.close();
        }catch(SQLException ex){
            System.err.println("WorkCalendarEvent,createNewEvent: "+ex);
        }
    }
    
    public static List<WorkCalendarEvent> findEventByMonthAndYear(int month, int year){
        List<WorkCalendarEvent> eventList = new LinkedList<>();
        try{
            Connection conn = ConnectionBuilder.getConnection();
            String sql = "SELECT * FROM Work_Calendar_Event "
                    + "WHERE (MONTH(Event_Start) = ? OR MONTH(Event_End) = ?) "
                    + "AND (YEAR(Event_Start) = ? OR YEAR(Event_End) = ?) ";
            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setInt(1, month);
            pstm.setInt(2, month);
            pstm.setInt(3, year);
            pstm.setInt(4, year);
            ResultSet rs = pstm.executeQuery();
            while(rs.next()){
                WorkCalendarEvent event = new WorkCalendarEvent();
                event.orm(rs);
                eventList.add(event);
            }
            conn.close();
        }catch(SQLException ex){
            System.err.println("KeycardReq,insertLostRequest: "+ex);
        }
        return eventList;
    }
    
    public static List<WorkCalendarEvent> findAllEvent(){
        List<WorkCalendarEvent> eventList = new LinkedList<>();
        try{
            Connection conn = ConnectionBuilder.getConnection();
            String sql = "SELECT * FROM Work_Calendar_Event ";
            PreparedStatement pstm = conn.prepareStatement(sql);
            ResultSet rs = pstm.executeQuery();
            while(rs.next()){
                WorkCalendarEvent event = new WorkCalendarEvent();
                event.orm(rs);
                eventList.add(event);
            }
            conn.close();
        }catch(SQLException ex){
            System.err.println("KeycardReq,insertLostRequest: "+ex);
        }
        return eventList;
    }
    
    public static void deleteEvent(int id){
        try{
            Connection conn = ConnectionBuilder.getConnection();
            String sql = "DELETE FROM Work_Calendar_Event WHERE Event_ID = ? ";
            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setInt(1, id);
            pstm.executeUpdate();
            conn.close();
        }catch(SQLException ex){
            System.err.println("KeycardReq,insertLostRequest: "+ex);
        }
    }
}
