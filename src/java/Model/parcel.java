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
public class parcel {
    private int id;
    private String name;
    private String barcode;
    private Boolean status;
    private Date date;
    private int roomId;
    private String pickStamp;

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

    public String getBarcode() {
        return barcode;
    }

    public void setBarcode(String barcode) {
        this.barcode = barcode;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getRoomId() {
        return roomId;
    }

    public void setRoomId(int roomId) {
        this.roomId = roomId;
    }

    @Override
    public String toString() {
        return "parcel{" + "id=" + id + ", name=" + name + ", barcode=" + barcode + ", status=" + status + ", date=" + date + ", roomId=" + roomId + ", pickStamp=" + pickStamp + '}';
    }
    
    public boolean addParcel(int roomId) {
        int x = 0;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            String sqlCmd = null;
            sqlCmd = "INSERT INTO Parcel(Receiver_Name, Parcel_Barcode, Parcel_Status, Parcel_Date, Room_ID) VALUES (?,?,?,?,?)";
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setString(1, this.name);
            pstm.setString(2, this.barcode.toUpperCase());
            pstm.setBoolean(3, false);
            pstm.setDate(4, new java.sql.Date(new Date().getTime()));
            pstm.setInt(5, roomId);
            x = pstm.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.err.println("Parcel, addParcel: " + ex);
        }
        return x > 0;
    }
    
    public static List<parcel> getAllParcel() {
        List<parcel> parcel = new ArrayList<parcel>();
        try {
            Connection conn = ConnectionBuilder.getConnection();
            parcel p = null;
            String sqlCmd = "SELECT * FROM Parcel ORDER BY Parcel_ID DESC";
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                p = new parcel();
                orm(rs, p);
                parcel.add(p);
            }
            conn.close();
        } catch (SQLException ex) {
            System.err.println("Parcel, getAll: " + ex);
        }
        return parcel;
    }
    
    public static List<parcel> getExistParcel() {
        List<parcel> parcel = new ArrayList<parcel>();
        try {
            Connection conn = ConnectionBuilder.getConnection();
            parcel p = null;
            String sqlCmd = "SELECT * FROM Parcel where Parcel_Status = false ORDER BY Parcel_ID DESC";
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                p = new parcel();
                orm(rs, p);
                parcel.add(p);
            }
            conn.close();
        } catch (SQLException ex) {
            System.err.println("Parcel, getExist: " + ex);
        }
        return parcel;
    }
    
    public static List<parcel> getParcelByRoomId(int roomId) {
        List<parcel> parcel = new ArrayList<parcel>();
        try {
            Connection conn = ConnectionBuilder.getConnection();
            parcel p = null;
            String sqlCmd = "SELECT * FROM Parcel where Room_ID = ? ORDER BY Parcel_ID DESC";
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setInt(1, roomId);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                p = new parcel();
                orm(rs, p);
                parcel.add(p);
            }
            conn.close();
        } catch (SQLException ex) {
            System.err.println("Parcel, getByRoomID: " + ex);
        }
        return parcel;
    }
    
    public static List<parcel> searchParcelByDate(String date) {
        List<parcel> parcel = new ArrayList<parcel>();
        try {
            Connection conn = ConnectionBuilder.getConnection();
            parcel p = null;
            String sqlCmd = "SELECT * FROM Parcel where Parcel_Date = ?";
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setString(1, date);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                p = new parcel();
                orm(rs, p);
                parcel.add(p);
            }
            conn.close();
        } catch (SQLException ex) {
            System.err.println("Parcel, searchParcelDate: " + ex);
        }
        return parcel;
    }
    
    public static List<parcel> searchParcelInRange(String start, String end) {
        List<parcel> parcel = new ArrayList<parcel>();
        try {
            Connection conn = ConnectionBuilder.getConnection();
            parcel p = null;
            String sqlCmd = "SELECT * FROM Parcel where Parcel_Date >= ? and Parcel_Date <= ?";
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setString(1, start);
            pstm.setString(2, end);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                p = new parcel();
                orm(rs, p);
                parcel.add(p);
            }
            conn.close();
        } catch (SQLException ex) {
            System.err.println("Parcel, searchParcelInRange: " + ex);
        }
        return parcel;
    }
    
    public static parcel searchByBarcode(String barcode) {
        parcel p = null;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            String sqlCmd = "SELECT * FROM Parcel where Parcel_Barcode like ?";
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setString(1, barcode.toUpperCase());
            ResultSet rs = pstm.executeQuery();
            if(rs.next()) {
                p = new parcel();
                orm(rs, p);
            }
            conn.close();
        } catch (SQLException ex) {
            System.err.println("Parcel, searchByBarcode: " + ex);
        }
        return p;
    }
    
    public static boolean deleteParcel(int id) {
        int x = 0;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            String sqlCmd = "Delete from Parcel where Parcel_ID = ?";
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setInt(1, id);
            x = pstm.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.err.println("Parcel, Delete: " + ex);
        }
        return x > 0;
    }
    
    public static boolean pickStatus(int id) {
        int x = 0;
        DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", new Locale("en","TH"));
        try {
            Connection conn = ConnectionBuilder.getConnection();
            String sqlCmd = "Update Parcel set Parcel_Status = ?, pick_DateTime = ? where Parcel_ID = " + id;
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setBoolean(1, true);
            pstm.setString(2, sdf.format(new Date()));
            x = pstm.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.err.println("parcel, pickStatus: " + ex);
        }
        return x > 0;
    }
    
    private static void orm(ResultSet rs, parcel p) throws SQLException {
        p.setId(rs.getInt("Parcel_ID"));
        p.setBarcode(rs.getString("Parcel_Barcode"));
        p.setName(rs.getString("Receiver_Name"));
        p.setStatus(rs.getBoolean("Parcel_Status"));
        p.setRoomId(rs.getInt("Room_ID"));
        p.setDate(rs.getDate("Parcel_Date"));
        p.setPickStamp(rs.getString("pick_DateTime"));
    }
    
    public static void main(String[] args) {
/*        parcel p = new parcel();
        p.setName("Jo");
        p.setBarcode("AA123456789TH");
        p.addParcel(201);
*/
/*
    List<parcel> p = parcel.searchParcelInRange("2017-09-04", "2017-09-05");
    for(parcel pp : p){
        System.out.println(pp.toString());
    }
  */
/*
parcel p = parcel.searchByBarcode("AB12345TH");
        System.out.println(p.getPickStamp());
*/
/*
    parcel.deleteParcel(2);
        System.out.println("success");
*/
/*
        parcel.pickStatus(7);
        System.out.println("success");
*/

    }

    public String getPickStamp() {
        return pickStamp;
    }

    public void setPickStamp(String pickStamp) {
        this.pickStamp = pickStamp;
    }
}
