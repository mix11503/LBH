package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Staff {
    private int id;
    private String name;
    private String lastname;
    private String nickname;
    private int tel;
    private String Division;
    private String start;
    private String end;

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

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public int getTel() {
        return tel;
    }

    public void setTel(int tel) {
        this.tel = tel;
    }

    public String getDivision() {
        return Division;
    }

    public void setDivision(String Division) {
        this.Division = Division;
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

    @Override
    public String toString() {
        return "Staff{" + "id=" + id + ", name=" + name + ", lastname=" + lastname + ", nickname=" + nickname + ", tel=" + tel + ", Division=" + Division + ", start=" + start + ", end=" + end + '}';
    }
    private static void orm(ResultSet rs, Staff s) throws SQLException {
        s.setId(rs.getInt("Staff_ID"));
        s.setName(rs.getString("Staff_Name"));
        s.setLastname(rs.getString("Staff_Lastname"));
        s.setNickname(rs.getString("Staff_Nickname"));
        s.setTel(rs.getInt("Staff_Tel"));
        s.setDivision(rs.getString("Staff_Division"));
        s.setStart(rs.getString("Time_Start"));
        s.setEnd(rs.getString("Time_End"));
    }
    
    public boolean addStaff() {
        int x = 0;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            String sqlCmd = null;
            sqlCmd = "INSERT INTO Staff(Staff_Name, Staff_Lastname, Staff_Nickname, Staff_Tel, Staff_Division, Time_Start, Time_End) VALUES (?,?,?,?,?,?,?)";
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setString(1, this.name);
            pstm.setString(2, this.lastname);
            pstm.setString(3, this.nickname);
            pstm.setInt(4, this.tel);
            pstm.setString(5, this.Division);
            pstm.setString(6, this.start);
            pstm.setString(7, this.end);
            x = pstm.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.err.println("Staff, ADD : " + ex);
        }
        return x > 0;
    }
    
    public boolean editStaff(int id) {
        int x = 0;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            String sqlCmd = null;
            sqlCmd = "Update Staff set Staff_Name = ?, Staff_Lastname = ?, Staff_Nickname = ?, Staff_Tel = ?, Staff_Division = ?, Time_Start = ?, Time_End = ? where Staff_ID = "+id;
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setString(1, this.name);
            pstm.setString(2, this.lastname);
            pstm.setString(3, this.nickname);
            pstm.setInt(4, this.tel);
            pstm.setString(5, this.Division);
            pstm.setString(6, this.start);
            pstm.setString(7, this.end);
            x = pstm.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.err.println("Staff, Edit: " + ex);
        }
        return x > 0;
    }
    
    public static boolean deleteStaff(int id) {
        int x = 0;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            String sqlCmd = "Delete from Staff where Staff_ID = ?";
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setInt(1, id);
            x = pstm.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.err.println("Staff, delete: " + ex);
        }
        return x > 0;
    }
    public static List<Staff> getAll() {
        List<Staff> st = new ArrayList<Staff>();
        try {
            Connection conn = ConnectionBuilder.getConnection();
            Staff s = null;
            String sqlCmd = "SELECT * FROM Staff";
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                s = new Staff();
                orm(rs, s);
                st.add(s);
            }
            conn.close();
        } catch (SQLException ex) {
            System.err.println("Staff, getAll: " + ex);
        }
        return st;
    }
    public static Staff findById(int id) {
        Staff s = null;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            String sqlCmd = "SELECT * FROM Staff where Staff_ID = ?";
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setInt(1, id);
            ResultSet rs = pstm.executeQuery();
            if(rs.next()) {
                s = new Staff();
                orm(rs, s);
            }
            conn.close();
        } catch (SQLException ex) {
            System.err.println("Staff, FindById: " + ex);
        }
        return s;
    }
}
