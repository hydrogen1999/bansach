/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import com.model.message;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @message ThinhNguyenCong
 */
public class messageDAO {
    public messageDAO() {
    }
    private String jdbcURL = "jdbc:mysql://localhost:3306/bansach";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";

    private static final String INSERT_MS_SQL = "INSERT INTO message" + "  (EMAIL,MESSAGE) VALUES "
            + " (?, ?);";

    private static final String SELECT_MS_BY_MESSAGE_ID = "select MESS_ID,EMAIL,MESSAGE from message where MESS_ID = ?";
    private static final String SELECT_ALL_MESSAGE = "select * from message";
    private static final String DELETE_MS_SQL = "delete from message where MESS_ID = ?;";
    private static final String UPDATE_MS_SQL = "update message set MESSAGE = ? where MESSAGE_ID = ?;";

    protected Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        return con;
    }

    public void insertMessage(message MS) throws SQLException {
        System.out.println(INSERT_MS_SQL);
        try (
                Connection con = getConnection();
                PreparedStatement prep = con.prepareStatement(INSERT_MS_SQL);) {
            prep.setString(1, MS.getEMAIL());
            prep.setString(2, MS.getMESSAGE());
            

            System.out.println(prep);
            prep.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<message> getListMessage() {
        List<message> list = new ArrayList<>();
        try (
                Connection con = getConnection();
                PreparedStatement prep = con.prepareStatement(SELECT_ALL_MESSAGE);) {
            ResultSet rs = prep.executeQuery();
            while (rs.next()) {
                int MESS_ID = rs.getInt("MESS_ID");
                String EMAIL = rs.getString("EMAIL");
                String MESSAGE=rs.getString("MESSAGE");

                list.add(new message(MESS_ID, EMAIL, MESSAGE));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public message selectMessage(int MESS_ID) {
        message MS = null;
        try (
                Connection con = getConnection();
                PreparedStatement prep = con.prepareStatement(SELECT_MS_BY_MESSAGE_ID);) {
            prep.setInt(1, MESS_ID);
            System.out.println(prep);
            ResultSet rs = prep.executeQuery();
            while (rs.next()) {
                String EMAIL = rs.getString("EMAIL");
                String MESSAGE = rs.getString("MESSAGE");
                MS = new message(MESS_ID, EMAIL, MESSAGE);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return MS;
    }

    public boolean deleteMessage(int MESS_ID) throws SQLException {
        boolean rowDeleted;
        try (
                Connection con = getConnection();
                PreparedStatement prep = con.prepareStatement(DELETE_MS_SQL);) {
            prep.setInt(1, MESS_ID);
            rowDeleted = prep.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateMessage(message MS) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
                PreparedStatement prep = connection.prepareStatement(UPDATE_MS_SQL);) {
            prep.setString(1, MS.getEMAIL());
            prep.setInt(3, MS.getMESS_ID());
            rowUpdated = prep.executeUpdate() > 0;
        }
        return rowUpdated;
    }
}
