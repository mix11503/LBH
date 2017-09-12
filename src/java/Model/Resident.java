package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Resident {
private int id;
private String name;
private String lastname;
private long phone;
private String email;
private short age;
private Date rent_start;
private Date rent_end;


    public Resident() {
    }
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

    public long getPhone() {
        return phone;
    }

    public void setPhone(long phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public short getAge() {
        return age;
    }

    public void setAge(short age) {
        this.age = age;
    }
 
    public Date getRent_start() {
        return rent_start;
    }

    public void setRent_start(Date rent_start) {
        this.rent_start = rent_start;
    }

    public Date getRent_end() {
        return rent_end;
    }

    public void setRent_end(Date rent_end) {
        this.rent_end = rent_end;
    }

    private static void orm(ResultSet rs, Resident Res) throws SQLException{
                Res.setId(rs.getInt("RESIDENT_ID"));
                Res.setName(rs.getString("RESIDENT_NAME"));
                Res.setLastname(rs.getString("RESIDENT_LASTNAME"));
                Res.setEmail(rs.getString("RESIDENT_EMAIL"));
                Res.setPhone(rs.getLong("RESIDENT_TEL"));
                Res.setAge(rs.getShort("RESIDENT_AGE"));
                Res.setRent_start(rs.getDate("RENT_START"));
                Res.setRent_end(rs.getDate("RENT_END"));
    }
    
public static Resident findById(int id){
    Resident res = null;
        try{
            Connection conn = ConnectionBuilder.getConnection();
            String sqlCmd = "SELECT * FROM Resident WHERE RESIDENT_ID = ?";
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setInt(1, id);
            ResultSet rs = pstm.executeQuery();
            if(rs.next()){
                res = new Resident();
                orm(rs,res);
            }
            conn.close();
        }catch(SQLException ex){
            System.err.println("Resident,FindById : "+ex);
        }
        return res;
}
public static List<Resident> findByRoomId(int room_id){
    List<Resident> resident = new ArrayList<Resident>();
        try{
            Connection conn = ConnectionBuilder.getConnection();
            Resident res = null;
            String sqlCmd = "SELECT * FROM Resident WHERE ROOM_ID= ?";
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setInt(1, room_id);
            ResultSet rs = pstm.executeQuery();
            while(rs.next()){
                res = new Resident();
                orm(rs, res);
                resident.add(res);
            }
            conn.close();
        }catch(SQLException ex){
            System.err.println("Resident,findByRoomId : "+ex);
        }
        return resident;
}
/*
// ============== TESTING ZONE =============

    @Override
    public String toString() {
        return "Resident{" + "id=" + id + ", name=" + name + ", lastname=" + lastname + ", phone=" + phone + ", email=" + email + ", age=" + age + ", rent_start=" + rent_start + ", rent_end=" + rent_end + '}';
    }

    public static void main(String[] args) {
        Resident r1 = Resident.findById(10001);
        System.out.println(r1.toString());
        List<Resident> r2 = Resident.findByRoomId(201);
        for(Resident r: r2){
            System.out.println(r.toString());
        }
    }
// ==========END OF TESTING ZONE ============
*/

    
}
