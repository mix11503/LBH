package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Owner {
private int id;
private String name;
private String lastname;
private long phone;
private String email;
private short age;

    public Owner() {
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
 
    private static void orm(ResultSet rs, Owner own) throws SQLException{
                own.setId(rs.getInt("OWNER_ID"));
                own.setName(rs.getString("OWNER_NAME"));
                own.setLastname(rs.getString("OWNER_SURNAME"));
                own.setEmail(rs.getString("OWNER_EMAIL"));
                own.setPhone(rs.getLong("OWNER_TEL"));
                own.setAge(rs.getShort("OWNER_AGE"));
    }
    
public static Owner findById(int id){
    Owner own = null;
        try{
            Connection conn = ConnectionBuilder.getConnection();
            String sqlCmd = "SELECT * FROM OWNER WHERE OWNER_ID = ?";
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setInt(1, id);
            ResultSet rs = pstm.executeQuery();
            if(rs.next()){
                own = new Owner();
                orm(rs,own);
            }
            conn.close();
        }catch(SQLException ex){
            System.err.println("Owner,FindById : "+ex);
        }
        return own;
}
/*
public static List<Owner> findByRoomId(int room_id){
    List<Owner> owner = new ArrayList<Owner>();
        try{
            Connection conn = ConnectionBuilder.getConnection();
            Owner own = null;
            String sqlCmd = "SELECT * FROM Owner WHERE ROOM_ID= ?"; // Need Join if wanted to use
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setInt(1, room_id);
            ResultSet rs = pstm.executeQuery();
            while(rs.next()){
                own = new Owner();
                orm(rs, own);
                owner.add(own);
            }
            conn.close();
        }catch(SQLException ex){
            System.err.println("Resident,findByRoomId : "+ex);
        }
        return owner;
}
*/
/*
// ============== TESTING ZONE =============
    @Override
    public String toString() {
        return "Owner{" + "id=" + id + ", name=" + name + ", lastname=" + lastname + ", picture=" + picture + ", phone=" + phone + ", line_id=" + line_id + ", address=" + address + ", room_id=" + room_id + '}';
    }

  

    public static void main(String[] args) {
        Owner o = Owner.findByRoomId(202);
        System.out.println(o.toString());
    }
// ==========END OF TESTING ZONE ============
*/

    
}
