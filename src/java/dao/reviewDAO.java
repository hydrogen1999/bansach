/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import com.model.review;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ThinhNguyenCong
 */
public class reviewDAO {

    public reviewDAO() {
    }

    private static String jdbcURL = "jdbc:mysql://localhost:3306/bansach";
    private static String jdbcUsername = "root";
    private static String jdbcPassword = "";

    private static final String INSERT_REVIEW_SQL = "INSERT INTO review" + "  (USER_NAME,PRODUCT_ID,EMAIL, CONTENT,RATE, DATE) VALUES "
            + " (?,?, ?, ?,?, ?);";

    private static final String SELECT_REVIEW_BY_REVIEW_ID = "select REVIEW_ID,USER_NAME,PRODUCT_ID,EMAIL, CONTENT,RATE, DATE from review where REVIEW_ID = ?";
    private static final String SELECT_REVIEW_BY_PRODUCT_ID = "select REVIEW_ID,USER_NAME,PRODUCT_ID,EMAIL, CONTENT,RATE, DATE from review where PRODUCT_ID = ?";
    private static final String SELECT_REVIEW_BY_EMAIL = "select COUNT(*) from review where EMAIL = ?";
    private static final String SELECT_ALL_REVIEW = "select * from review";
    private static final String DELETE_REVIEW_SQL = "delete from review where REVIEW_ID = ?;";
    private static final String UPDATE_REVIEW_SQL = "update review set CONTENT=?,RATE=? where REVIEW_ID = ?;";
    private static final String AVG_RATE = "select AVG(RATE) AS AVG_RATE from review where PRODUCT_ID=?";

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

    public void insertReview(review REVIEW) throws SQLException {
        System.out.println(INSERT_REVIEW_SQL);
        try (
                Connection con = getConnection();
                PreparedStatement prep = con.prepareStatement(INSERT_REVIEW_SQL);) {
            prep.setString(1, REVIEW.getUSER_NAME());
            prep.setInt(2, REVIEW.getPRODUCT_ID());
            prep.setString(3, REVIEW.getEMAIL());
            prep.setString(4, REVIEW.getCONTENT());
            prep.setInt(5, REVIEW.getRATE());
            prep.setTimestamp(6, REVIEW.getDATE());
            System.out.println(prep);
            prep.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<review> getListReview() {
        List<review> list = new ArrayList<>();
        try (
                Connection con = getConnection();
                PreparedStatement prep = con.prepareStatement(SELECT_ALL_REVIEW);) {
            ResultSet rs = prep.executeQuery();
            while (rs.next()) {
                int REVIEW_ID = rs.getInt("REVIEW_ID");
                String USER_NAME = rs.getString("USER_NAME");
                int PRODUCT_ID = rs.getInt("PRODUCT_ID");
                String EMAIL = rs.getString("EMAIL");
                String CONTENT = rs.getString("CONTENT");
                int RATE = rs.getInt("RATE");
                Timestamp DATE = rs.getTimestamp("DATE");

                list.add(new review(REVIEW_ID, USER_NAME, PRODUCT_ID, EMAIL, CONTENT, RATE, DATE));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public review selectReview(int REVIEW_ID) {
        review REVIEW = null;
        try (
                Connection con = getConnection();
                PreparedStatement prep = con.prepareStatement(SELECT_REVIEW_BY_REVIEW_ID);) {
            prep.setInt(1, REVIEW_ID);
            System.out.println(prep);
            ResultSet rs = prep.executeQuery();
            while (rs.next()) {
                String USER_NAME = rs.getString("USER_NAME");
                int PRODUCT_ID = rs.getInt("PRODUCT_ID");
                String EMAIL = rs.getString("EMAIL");
                String CONTENT = rs.getString("CONTENT");
                int RATE = rs.getInt("RATE");
                Timestamp DATE = rs.getTimestamp("DATE");
                REVIEW = new review(REVIEW_ID, USER_NAME, PRODUCT_ID, EMAIL, CONTENT, RATE, DATE);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return REVIEW;
    }

    public List<review> getListReviewByProductID(int PRODUCT_ID) {
        List<review> list = new ArrayList<>();
        try (
                Connection con = getConnection();
                PreparedStatement prep = con.prepareStatement(SELECT_REVIEW_BY_PRODUCT_ID);) {
            prep.setInt(1, PRODUCT_ID);
            ResultSet rs = prep.executeQuery();
            while (rs.next()) {
                int REVIEW_ID = rs.getInt("REVIEW_ID");
                String USER_NAME = rs.getString("USER_NAME");
                String EMAIL = rs.getString("EMAIL");
                String CONTENT = rs.getString("CONTENT");
                int RATE = rs.getInt("RATE");
                Timestamp DATE = rs.getTimestamp("DATE");

                list.add(new review(REVIEW_ID, USER_NAME, PRODUCT_ID, EMAIL, CONTENT, RATE, DATE));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean deleteReview(int REVIEW_ID) throws SQLException {
        boolean rowDeleted;
        try (
                Connection con = getConnection();
                PreparedStatement prep = con.prepareStatement(DELETE_REVIEW_SQL);) {
            prep.setInt(1, REVIEW_ID);
            rowDeleted = prep.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateReview(review REVIEW) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
                PreparedStatement prep = connection.prepareStatement(UPDATE_REVIEW_SQL);) {
            prep.setString(1, REVIEW.getCONTENT());
            prep.setInt(2, REVIEW.getRATE());
            prep.setInt(3, REVIEW.getREVIEW_ID());

            rowUpdated = prep.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    public float AVG_RATE(int PRODUCT_ID) throws SQLException {
        float AVG = 0;
        try (
                Connection con = getConnection();
                PreparedStatement prep = con.prepareStatement(AVG_RATE);) {
            prep.setInt(1, PRODUCT_ID);
            ResultSet rs = prep.executeQuery();
            while (rs.next()) {
                AVG=rs.getFloat("AVG_RATE");
            }
        }

        return AVG;
    }
}
