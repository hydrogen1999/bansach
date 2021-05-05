/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import com.model.user;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @user ThinhNguyenCong
 */
public class userDAO {

    public userDAO() {
    }
    private static String jdbcURL = "jdbc:mysql://localhost:3306/bansach";
    private static String jdbcUsername = "root";
    private static String jdbcPassword = "";

    private static final String INSERT_USER_SQL = "INSERT INTO user" + "  (USER_NAME,EMAIL, PHONE,PASSWORD) VALUES "
            + " (?, ?, ?, ?);";

    private static final String SELECT_USER_BY_USER_ID = "select USER_ID,USER_NAME,EMAIL,PHONE,PASSWORD from user where USER_ID = ?";
    private static final String SELECT_USER_BY_EMAIL = "select COUNT(*) from user where EMAIL = ?";
    private static final String SELECT_ALL_USER = "select * from user";
    private static final String DELETE_USER_SQL = "delete from user where USER_ID = ?;";
    private static final String UPDATE_USER_SQL = "update user set USER_NAME = ?, EMAIL = ?, PHONE=?,PASSWORD=? where USER_ID = ?;";
    private static final String UPDATE_USER_SQL2 = "update user set USER_NAME = ?, PHONE=?,PASSWORD = ? where USER_ID = ?;";

    protected static Connection getConnection() {
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

    public void insertUser(user USER) throws SQLException {
        System.out.println(INSERT_USER_SQL);
        try (
                Connection con = getConnection();
                PreparedStatement prep = con.prepareStatement(INSERT_USER_SQL);) {
           
            prep.setString(1, USER.getUSER_NAME());
            prep.setString(2, USER.getEMAIL());
            prep.setInt(3, USER.getPHONE());
            prep.setString(4, USER.getPASSWORD());

            System.out.println(prep);
            prep.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<user> getListUser() {
        List<user> list = new ArrayList<>();
        try (
                Connection con = getConnection();
                PreparedStatement prep = con.prepareStatement(SELECT_ALL_USER);) {
            ResultSet rs = prep.executeQuery();
            while (rs.next()) {
                int USER_ID = rs.getInt("USER_ID");
                String USER_NAME = rs.getString("USER_NAME");
                String EMAIL = rs.getString("EMAIL");
                int PHONE = rs.getInt("PHONE");
                String PASSWORD = rs.getString("PASSWORD");

                list.add(new user(USER_ID, USER_NAME, EMAIL, PHONE, PASSWORD));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public user selectUser(int USER_ID) {
        user USER = null;
        try (
                Connection con = getConnection();
                PreparedStatement prep = con.prepareStatement(SELECT_USER_BY_USER_ID);) {
            prep.setInt(1, USER_ID);
            System.out.println(prep);
            ResultSet rs = prep.executeQuery();
            while (rs.next()) {
                String USER_NAME = rs.getString("USER_NAME");
                String EMAIL = rs.getString("EMAIL");
                int PHONE = rs.getInt("PHONE");
                String PASSWORD = rs.getString("PASSWORD");
                USER = new user(USER_ID, USER_NAME, EMAIL, PHONE, PASSWORD);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return USER;
    }

    public boolean deleteUser(int USER_ID) throws SQLException {
        boolean rowDeleted;
        try (
                Connection con = getConnection();
                PreparedStatement prep = con.prepareStatement(DELETE_USER_SQL);) {
            prep.setInt(1, USER_ID);
            rowDeleted = prep.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateUser(user USER) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
                PreparedStatement prep = connection.prepareStatement(UPDATE_USER_SQL);) {
            prep.setString(1, USER.getUSER_NAME());
            prep.setString(2, USER.getEMAIL());
            prep.setInt(3, USER.getPHONE());
            prep.setString(4, USER.getPASSWORD());
            prep.setInt(5, USER.getUSER_ID());
            rowUpdated = prep.executeUpdate() > 0;
        }
        return rowUpdated;
    }
    
     public boolean updateUserInfo(user USER) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
                PreparedStatement prep = connection.prepareStatement(UPDATE_USER_SQL2);) {
            prep.setString(1, USER.getUSER_NAME());
            prep.setInt(2, USER.getPHONE());
            prep.setString(3, USER.getPASSWORD());
            prep.setInt(4, USER.getUSER_ID());
            rowUpdated = prep.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    public static void DangKyDao(user USER) throws SQLException {
        try (
                Connection con = getConnection();
                PreparedStatement prep = con.prepareStatement(INSERT_USER_SQL);) {
            prep.setString(1, USER.getUSER_NAME());
            System.out.println(USER.getUSER_NAME());
            prep.setString(2, USER.getEMAIL());
            prep.setInt(3, USER.getPHONE());
            prep.setString(4, USER.getPASSWORD());
            System.out.println("%%%%%%%%    " + prep);
            prep.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public user layThongTinTaiKhoan(String EMAIL) {
        user user = null;
        try (
                Connection con = getConnection();
                PreparedStatement prep = con.prepareStatement("select * from user where EMAIL='" + EMAIL + "'");) {

            ResultSet rs = prep.executeQuery();
            while (rs.next()) {
                String email = rs.getString("EMAIL");
                String password = rs.getString("PASSWORD");
                user = new user(email, password);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static boolean kiemTraDangNhap(String email, String password) {

        user user = null;
        try (
                Connection con = getConnection();
                PreparedStatement prep = con.prepareStatement("select * from user where EMAIL='" + email + "'");) {
            ResultSet rs = prep.executeQuery();
            while (rs.next()) {
                System.out.println("Email là:"+rs.getString("EMAIL"));
                System.out.println("");
                if (rs.getString("EMAIL").equals(email) && rs.getString("PASSWORD").equals(password)) {
                    return true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }

        return false;
    }

    public static String checkDuplicate(String EMAIL) {
        String exist = null;
        try (
                Connection con = getConnection();
                PreparedStatement prep = con.prepareStatement(SELECT_USER_BY_EMAIL);) {
            prep.setString(1, EMAIL);
            System.out.println(prep);
            ResultSet rs = prep.executeQuery();
            rs.next();
            exist = rs.getString(1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return exist;
    }

    public String getUserName(String email) throws SQLException {
        Connection con = getConnection();
        String kqua=null;
        try {
            String viewId = "Select USER_NAME from user where EMAIL= '" + email + "';";
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            rs = stmt.executeQuery(viewId);
            while (rs.next()) {
                kqua = rs.getString("USER_NAME");
            }
            con.close();
        } catch (SQLException x) {
        }
        return kqua;
    }
    public int getUserID(String email) throws SQLException {
        Connection con = getConnection();
        int kqua=0;
        try {
            String viewId = "Select USER_ID from user where EMAIL= '" + email + "';";
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            rs = stmt.executeQuery(viewId);
            while (rs.next()) {
                kqua = rs.getInt("USER_ID");
            }
            con.close();
        } catch (SQLException x) {
        }
        return kqua;
    }
    public int getUserPhone(String email) throws SQLException {
        Connection con = getConnection();
        int kqua=0;
        try {
            String viewId = "Select PHONE from user where EMAIL= '" + email + "';";
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            rs = stmt.executeQuery(viewId);
            while (rs.next()) {
                kqua = rs.getInt("PHONE");
            }
            con.close();
        } catch (SQLException x) {
        }
        return kqua;
    }
    
    public String getUserPassword(String email) throws SQLException {
        Connection con = getConnection();
        String kqua= null;
        try {
            String viewId = "Select PASSWORD from user where EMAIL= '" + email + "';";
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            rs = stmt.executeQuery(viewId);
            while (rs.next()) {
                kqua = rs.getString("PASSWORD");
            }
            con.close();
        } catch (SQLException x) {
        }
        return kqua;
    }
}
