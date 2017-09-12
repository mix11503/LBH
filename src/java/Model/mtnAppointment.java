package Model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;

public class mtnAppointment {
   private String app_date1;
   private String app_time1;
   private String app_timeend1;
   private String app_date2;
   private String app_time2;
   private String app_timeend2;
   private String app_remark;
   public String getApp_date1() {
        return app_date1;
    }

    public void setApp_date1(String app_date1) {
        this.app_date1 = app_date1;
    }

    public String getApp_time1() {
        return app_time1;
    }

    public void setApp_time1(String app_time1) {
        this.app_time1 = app_time1;
    }

    public String getApp_timeend1() {
        return app_timeend1;
    }

    public void setApp_timeend1(String app_timeend1) {
        this.app_timeend1 = app_timeend1;
    }

    public String getApp_date2() {
        return app_date2;
    }

    public void setApp_date2(String app_date2) {
        this.app_date2 = app_date2;
    }

    public String getApp_time2() {
        return app_time2;
    }

    public void setApp_time2(String app_time2) {
        this.app_time2 = app_time2;
    }

    public String getApp_timeend2() {
        return app_timeend2;
    }

    public void setApp_timeend2(String app_timeend2) {
        this.app_timeend2 = app_timeend2;
    }

    public String getApp_remark() {
        return app_remark;
    }

    public void setApp_remark(String app_remark) {
        this.app_remark = app_remark;
    }

    @Override
    public String toString() {
        return "mtnAppointment{" + "app_date1=" + app_date1 + ", app_time1=" + app_time1 + ", app_timeend1=" + app_timeend1 + ", app_date2=" + app_date2 + ", app_time2=" + app_time2 + ", app_timeend2=" + app_timeend2 + ", app_remark=" + app_remark + '}';
    }
    
    
   public boolean updateAppointment(int mtn_id){
        int x = 0;
        try{
            Connection conn = ConnectionBuilder.getConnection();
            String sqlCmd = "INSERT INTO mtn_Appointment"
                    + "(app_date1, app_time1, app_timeend1, app_date2, app_time2, app_timeend2, app_remark, mtn_id) VALUES (?,?,?,?,?,?,?,?)"; 
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setString(1, this.app_date1);
            pstm.setString(2, this.app_time1);
            pstm.setString(3, this.app_timeend1);
            pstm.setString(4, this.app_date2);
            pstm.setString(5, this.app_time2);
            pstm.setString(6, this.app_timeend2);
            pstm.setString(7, this.app_remark);
            pstm.setInt(8, mtn_id);
             x = pstm.executeUpdate();
            conn.close();
        }catch(SQLException ex){
            System.err.println("mtnApp, updateApp: " + ex);
        }
        return x>0;
    }
   // private static void orm(ResultSet rs, mtnAppointment mtn) throws SQLException{
  //  mtn.setApp_date1(rs.getDate("app_date1").toString());
 //   }
    
   public static mtnAppointment getAppInfo(int mtnId){
    mtnAppointment mtn = null;
        try{
            Connection conn = ConnectionBuilder.getConnection();
            String sqlCmd = "SELECT * FROM mtn_Appointment WHERE mtn_id = ?";
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setInt(1, mtnId);
            ResultSet rs = pstm.executeQuery();
            if(rs.next()){
                mtn = new mtnAppointment();
                mtn.setApp_date1(rs.getDate("app_date1")+"");
                mtn.setApp_date2(rs.getDate("app_date2")+"");
                mtn.setApp_time1(rs.getTime("app_time1")+"");
                mtn.setApp_time2(rs.getTime("app_time2")+"");
                mtn.setApp_timeend1(rs.getTime("app_timeend1")+"");
                mtn.setApp_timeend2(rs.getTime("app_timeend2")+"");
                mtn.setApp_remark(rs.getString("app_remark"));
            }
            conn.close();
        }catch(SQLException ex){
            System.err.println("MTNAPP,getAppInfo : "+ex);
        }
        return mtn;
}
   /*
    public static void main(String[] args) {
    //    mtnAppointment m = new mtnAppointment();
    //    m.setApp_date1("2017-10-02");
    //    m.setApp_time1("15:00");
    //    m.updateAppointment(10001);
    mtnAppointment m = mtnAppointment.getAppInfo(10002);
        System.out.println(m.toString());

    }
   */
    
}
