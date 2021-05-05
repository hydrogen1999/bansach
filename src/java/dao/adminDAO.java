/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import com.model.admin;
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
 * @author ThinhNguyenCong
 */
public class adminDAO {

    public adminDAO() {
    }
    
    private static String jdbcURL = "jdbc:mysql://localhost:3306/bansach";
    private static String jdbcUsername = "root";
    private static String jdbcPassword = "";

    private static final String INSERT_ADMIN_SQL = "INSERT INTO admin" + "  (ADMIN_NAME,EMAIL, PHONE,PASSWORD,TYPE) VALUES "
            + " (?, ?, ?,?, ?);";

    private static final String SELECT_ADMIN_BY_ADMIN_ID = "select ADMIN_ID,ADMIN_NAME,EMAIL,PHONE,PASSWORD,TYPE from admin where ADMIN_ID = ?";
    private static final String SELECT_ADMIN_BY_EMAIL = "select COUNT(*) from admin where EMAIL = ?";
    private static final String SELECT_ALL_ADMIN = "select * from admin";
    private static final String DELETE_ADMIN_SQL = "delete from admin where ADMIN_ID = ?;";
    private static final String UPDATE_ADMIN_SQL = "update admin set ADMIN_NAME = ?, EMAIL = ?, PHONE=?,PASSWORD=?,TYPE=? where ADMIN_ID = ?;";
    private static final String UPDATE_ADMIN_INFO_SQL = "update admin set ADMIN_NAME = ?, PHONE=?,PASSWORD=? where ADMIN_ID = ?;";

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

    public void insertAdmin(admin ADMIN) throws SQLException {
        System.out.println(INSERT_ADMIN_SQL);
        try (
                Connection con = getConnection();
                PreparedStatement prep = con.prepareStatement(INSERT_ADMIN_SQL);) {
            prep.setString(1, ADMIN.getADMIN_NAME());
            prep.setString(2, ADMIN.getEMAIL());
            prep.setInt(3, ADMIN.getPHONE());
            prep.setString(4, ADMIN.getPASSWORD());
            prep.setString(5, ADMIN.getTYPE());

            System.out.println(prep);
            prep.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<admin> getListAdmin() {
        List<admin> list = new ArrayList<>();
        try (
                Connection con = getConnection();
                PreparedStatement prep = con.prepareStatement(SELECT_ALL_ADMIN);) {
            ResultSet rs = prep.executeQuery();
            while (rs.next()) {
                int ADMIN_ID = rs.getInt("ADMIN_ID");
                String ADMIN_NAME = rs.getString("ADMIN_NAME");
                String EMAIL = rs.getString("EMAIL");
                int PHONE = rs.getInt("PHONE");
                String PASSWORD = rs.getString("PASSWORD");
                String TYPE = rs.getString("TYPE");

                list.add(new admin(ADMIN_ID, ADMIN_NAME, EMAIL, PHONE, PASSWORD,TYPE));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public admin selectAdmin(int ADMIN_ID) {
        admin ADMIN = null;
        try (
                Connection con = getConnection();
                PreparedStatement prep = con.prepareStatement(SELECT_ADMIN_BY_ADMIN_ID);) {
            prep.setInt(1, ADMIN_ID);
            System.out.println(prep);
            ResultSet rs = prep.executeQuery();
            while (rs.next()) {
                String ADMIN_NAME = rs.getString("ADMIN_NAME");
                String EMAIL = rs.getString("EMAIL");
                int PHONE = rs.getInt("PHONE");
                String PASSWORD = rs.getString("PASSWORD");
                String TYPE = rs.getString("TYPE");
                ADMIN = new admin(ADMIN_ID, ADMIN_NAME, EMAIL, PHONE, PASSWORD,TYPE);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ADMIN;
    }

    public boolean deleteAdmin(int ADMIN_ID) throws SQLException {
        boolean rowDeleted;
        try (
                Connection con = getConnection();
                PreparedStatement prep = con.prepareStatement(DELETE_ADMIN_SQL);) {
            prep.setInt(1, ADMIN_ID);
            rowDeleted = prep.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateAdmin(admin ADMIN) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
                PreparedStatement prep = connection.prepareStatement(UPDATE_ADMIN_SQL);) {
            prep.setString(1, ADMIN.getADMIN_NAME());
            prep.setString(2, ADMIN.getEMAIL());
            prep.setInt(3, ADMIN.getPHONE());
            prep.setString(4, ADMIN.getPASSWORD());
            prep.setString(5, ADMIN.getTYPE());
            prep.setInt(6, ADMIN.getADMIN_ID());
            rowUpdated = prep.executeUpdate() > 0;
        }
        return rowUpdated;
    }
    public boolean updateAdminInfo(admin ADMIN) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
                PreparedStatement prep = connection.prepareStatement(UPDATE_ADMIN_INFO_SQL);) {
            prep.setString(1, ADMIN.getADMIN_NAME());
            prep.setInt(2, ADMIN.getPHONE());
            prep.setString(3, ADMIN.getPASSWORD());
            prep.setInt(4, ADMIN.getADMIN_ID());
            rowUpdated = prep.executeUpdate() > 0;
        }
        return rowUpdated;
    }
    public static void DangKyDao(admin ADMIN) throws SQLException {
        try (
                Connection con = getConnection();
                PreparedStatement prep = con.prepareStatement(INSERT_ADMIN_SQL);) {
            prep.setString(1, ADMIN.getADMIN_NAME());
            System.out.println(ADMIN.getADMIN_NAME());
            prep.setString(2, ADMIN.getEMAIL());
            prep.setInt(3, ADMIN.getPHONE());
            prep.setString(4, ADMIN.getPASSWORD());
            prep.setString(5, ADMIN.getTYPE());
            System.out.println("%%%%%%%%    " + prep);
            prep.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public admin layThongTinTaiKhoan(String EMAIL) {
        admin admin = null;
        try (
                Connection con = getConnection();
                PreparedStatement prep = con.prepareStatement("select * from admin where EMAIL='" + EMAIL + "'");) {

            ResultSet rs = prep.executeQuery();
            while (rs.next()) {
                String email = rs.getString("EMAIL");
                String password = rs.getString("PASSWORD");
                String type=rs.getString("TYPE");
                admin = new admin(email, password,type);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static boolean kiemTraDangNhap(String email, String password, String type) {

        admin admin = null;
        try (
                Connection con = getConnection();
                PreparedStatement prep = con.prepareStatement("select * from admin where EMAIL='" + email + "'");) {
            ResultSet rs = prep.executeQuery();
            while (rs.next()) {
                System.out.println("Email là:"+rs.getString("EMAIL"));
                System.out.println("");
                if (rs.getString("EMAIL").equals(email) && rs.getString("PASSWORD").equals(password) && rs.getString("TYPE").equals(type)) {
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
                PreparedStatement prep = con.prepareStatement(SELECT_ADMIN_BY_EMAIL);) {
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

    public String getAdminName(String email) throws SQLException {
        Connection con = getConnection();
        String kqua=null;
        try {
            String viewId = "Select ADMIN_NAME from admin where EMAIL= '" + email + "';";
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            rs = stmt.executeQuery(viewId);
            while (rs.next()) {
                kqua = rs.getString("ADMIN_NAME");
            }
            con.close();
        } catch (SQLException x) {
        }
        return kqua;
    }
    public int getAdminID(String email) throws SQLException {
        Connection con = getConnection();
        int kqua=0;
        try {
            String viewId = "Select ADMIN_ID from admin where EMAIL= '" + email + "';";
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            rs = stmt.executeQuery(viewId);
            while (rs.next()) {
                kqua = rs.getInt("ADMIN_ID");
            }
            con.close();
        } catch (SQLException x) {
        }
        return kqua;
    }
    public int getAdminPhone(String email) throws SQLException {
        Connection con = getConnection();
        int kqua=0;
        try {
            String viewId = "Select PHONE from admin where EMAIL= '" + email + "';";
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
    public String getAdminType(String email) throws SQLException {
        Connection con = getConnection();
        String kqua=null;
        try {
            String viewId = "Select TYPE from admin where EMAIL= '" + email + "';";
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            rs = stmt.executeQuery(viewId);
            while (rs.next()) {
                kqua = rs.getString("TYPE");
            }
            con.close();
        } catch (SQLException x) {
        }
        return kqua;
    }
}
