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
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Joe's
 */
public class MtnChat {

    private int chatId;
    private Date dt;
    private String desc;
    private int mtnId;

    public MtnChat() {
    }

    public int getChatId() {
        return chatId;
    }

    public void setChatId(int chatId) {
        this.chatId = chatId;
    }

    public Date getDt() {
        return dt;
    }

    public void setDt(Date dt) {
        this.dt = dt;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public int getMtnId() {
        return mtnId;
    }

    public void setMtnId(int mtnId) {
        this.mtnId = mtnId;
    }

    private static void orm(ResultSet rs, MtnChat c) throws SQLException {
        c.setChatId(rs.getInt("mtn_chat_id"));
        c.setDt(rs.getDate("mtn_chat_datetime"));
        c.setDesc(rs.getString("mtn_chat_desc"));
        c.setMtnId(rs.getInt("mtn_id"));
    }

    public static List<MtnChat> getChat(int mtnId) {
        List<MtnChat> chat = new ArrayList<MtnChat>();
        try {
            Connection conn = ConnectionBuilder.getConnection();
            MtnChat c = null;
            String sqlCmd = "SELECT * FROM Mtn_Chat WHERE MTN_ID = ?";
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setInt(1, mtnId);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                c = new MtnChat();
                orm(rs, c);
                chat.add(c);
            }
            conn.close();
        } catch (SQLException ex) {
            System.err.println("MChat, get : " + ex);
        }
        return chat;
    }
    
    public boolean updateChat(int mtnId){
        int x = 0;
        try{
            Connection conn = ConnectionBuilder.getConnection();
            String sqlCmd = null;
            sqlCmd = "INSERT INTO Mtn_Chat (mtn_chat_desc, mtn_id) VALUES (?,?)";
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setString(1, this.desc);
            pstm.setInt(2, mtnId);
             x = pstm.executeUpdate();
            conn.close();
        }catch(SQLException ex){
            System.err.println("chat, update: " + ex);
        }
        return x>0;
    }
    @Override
    public String toString() {
        return "MtnChat{" + "chatId=" + chatId + ", dt=" + dt + ", desc=" + desc + ", mtnId=" + mtnId + '}';
    }
/*
    public static void main(String[] args) {
        List<MtnChat> m = MtnChat.getChat(10003);
        for (MtnChat mc : m) {
            System.out.println(mc.toString());
        }
     //  MtnChat m = new MtnChat();
     //  m.setDesc("sixth");
    //   m.setMtnId(10001);
    //   m.updateChat(10001);
    }
*/
}
