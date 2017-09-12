package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionBuilder {
    /*
    public static Connection getConnection(){
        Connection conn = null;
        try{
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            conn = DriverManager.getConnection("jdbc:derby://localhost:1527/TestLibrary","test","test");
        }catch(SQLException ex){
            System.out.println(ex);
        }catch(ClassNotFoundException ex){
            System.out.println(ex);
        }
        return conn;
    }
     public static void main(String[] args) {
        System.out.println(getConnection());
    }
    
*/
      public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://54.169.219.189/TestLibraryHouze?user=root&password=pass&useUnicode=true&characterEncoding=UTF-8");
            //con = DriverManager.getConnection("jdbc:mysql://54.169.219.189/TestLibraryHouze", "root", "pass");
        } catch (SQLException e) {
            System.out.println(e);

        } catch (ClassNotFoundException e) {
            System.out.println(e);
        }
        return con;
    }
/*
    public static void main(String[] args) {
        Connection con = ConnectionBuilder.getConnection();
        System.out.println(getConnection());
    }
*/
}
