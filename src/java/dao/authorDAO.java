/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import com.model.author;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ThinhNguyenCong
 */
public class authorDAO {
    public authorDAO() {
    }
    private String jdbcURL = "jdbc:mysql://localhost:3306/bansach";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";

    private static final String INSERT_AT_SQL = "INSERT INTO author" + "  (AUTHOR_NAME,OTHER_AUTHOR) VALUES "
            + " (?, ?);";

    private static final String SELECT_AT_BY_AUTHOR_ID = "select AUTHOR_ID,AUTHOR_NAME,OTHER_AUTHOR from author where AUTHOR_ID = ?";
    private static final String SELECT_ALL_AUTHOR = "select * from author";
    private static final String DELETE_AT_SQL = "delete from author where AUTHOR_ID = ?;";
    private static final String UPDATE_AT_SQL = "update author set AUTHOR_NAME = ?, OTHER_AUTHOR = ? where AUTHOR_ID = ?;";

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

    public void insertAuthor(author AT) throws SQLException {
        System.out.println(INSERT_AT_SQL);
        try (
                Connection con = getConnection();
                PreparedStatement prep = con.prepareStatement(INSERT_AT_SQL);) {
            prep.setString(1, AT.getAUTHOR_NAME());
            prep.setString(2, AT.getOTHER_AUTHOR());
            

            System.out.println(prep);
            prep.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<author> getListAuthor() {
        List<author> list = new ArrayList<>();
        try (
                Connection con = getConnection();
                PreparedStatement prep = con.prepareStatement(SELECT_ALL_AUTHOR);) {
            ResultSet rs = prep.executeQuery();
            while (rs.next()) {
                int AUTHOR_ID = rs.getInt("AUTHOR_ID");
                String AUTHOR_NAME = rs.getString("AUTHOR_NAME");
                String OTHER_AUTHOR=rs.getString("OTHER_AUTHOR");

                list.add(new author(AUTHOR_ID,AUTHOR_NAME,OTHER_AUTHOR));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public author selectAuthor(int AUTHOR_ID) {
        author AT = null;
        try (
                Connection con = getConnection();
                PreparedStatement prep = con.prepareStatement(SELECT_AT_BY_AUTHOR_ID);) {
            prep.setInt(1, AUTHOR_ID);
            System.out.println(prep);
            ResultSet rs = prep.executeQuery();
            while (rs.next()) {
                String AUTHOR_NAME = rs.getString("AUTHOR_NAME");
                String OTHER_AUTHOR = rs.getString("OTHER_AUTHOR");
                AT = new author(AUTHOR_ID, AUTHOR_NAME,OTHER_AUTHOR);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return AT;
    }

    public boolean deleteAuthor(int AUTHOR_ID) throws SQLException {
        boolean rowDeleted;
        try (
                Connection con = getConnection();
                PreparedStatement prep = con.prepareStatement(DELETE_AT_SQL);) {
            prep.setInt(1, AUTHOR_ID);
            rowDeleted = prep.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateAuthor(author AT) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
                PreparedStatement prep = connection.prepareStatement(UPDATE_AT_SQL);) {
            prep.setString(1, AT.getAUTHOR_NAME());
            prep.setString(2, AT.getOTHER_AUTHOR());
            prep.setInt(3, AT.getAUTHOR_ID());
            rowUpdated = prep.executeUpdate() > 0;
        }
        return rowUpdated;
    }
}
