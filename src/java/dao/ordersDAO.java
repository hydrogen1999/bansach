/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import com.model.cart;
import com.model.orders;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ThinhNguyenCong
 */
public class ordersDAO {

    public ordersDAO() {
    }
    private static String jdbcURL = "jdbc:mysql://localhost:3306/bansach";
    private static String jdbcOrdername = "root";
    private static String jdbcPassword = "";

    private static final String INSERT_ORDER_SQL = "INSERT INTO orders" + "  (ORDER_ID,USER_ID,DATE,TOTAL,METHOD, DIACHI,STATUS) VALUES "
            + " (?,?, ?, ?,?,?,?);";

    private static final String SELECT_ORDER_BY_ORDER_ID = "select ORDER_ID,orders.USER_ID,DATE,TOTAL,METHOD,DIACHI,STATUS,USER_NAME from orders,user where user.USER_ID=orders.USER_ID and ORDER_ID = ?";
    private static final String SELECT_ORDER_BY_USER_ID = "select ORDER_ID,orders.USER_ID,DATE,TOTAL,METHOD,DIACHI,STATUS,USER_NAME from orders,user where user.USER_ID=orders.USER_ID and orders.USER_ID = ?";
    private static final String SELECT_ALL_ORDER = "select ORDER_ID,orders.USER_ID,DATE,TOTAL,METHOD,DIACHI,STATUS,USER_NAME from orders,user where user.USER_ID=orders.USER_ID and STATUS=?";
    private static final String DELETE_ORDER_SQL = "delete from orders where ORDER_ID = ?;";
    private static final String UPDATE_ORDER_SQL = "update orders set USER_ID = ?,DATE= ?, TOTAL = ?, METHOD = ?,DIACHI=?, STATUS=? where ORDER_ID = ?;";
    private static final String UPDATE_ORDER_SQL_ON_STATUS = "update orders set STATUS=? where ORDER_ID = ?;";

    protected static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(jdbcURL, jdbcOrdername, jdbcPassword);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        return con;
    }

    public void insertOrder(orders ORDER) throws SQLException {
        System.out.println(INSERT_ORDER_SQL);
        try (
                Connection con = getConnection();
                PreparedStatement prep = con.prepareStatement(INSERT_ORDER_SQL);) {
            prep.setString(1, ORDER.getORDER_ID());
            prep.setInt(2, ORDER.getUSER_ID());
            prep.setTimestamp(3, (Timestamp) ORDER.getDATE());
            prep.setInt(4, ORDER.getTOTAL());
            prep.setString(5, ORDER.getMETHOD());
            prep.setString(6, ORDER.getDIACHI());
            prep.setString(7, ORDER.getSTATUS());
            System.out.println(prep);
            prep.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<orders> getListOrder(String STATUS) {
        List<orders> list = new ArrayList<>();
        try (
                Connection con = getConnection();
                PreparedStatement prep = con.prepareStatement(SELECT_ALL_ORDER);) {
            prep.setString(1, STATUS); 
            ResultSet rs = prep.executeQuery();
            while (rs.next()) {
                String ORDER_ID = rs.getString("ORDER_ID");
                int USER_ID = rs.getInt("USER_ID");
                Timestamp DATE = rs.getTimestamp("DATE");
                int TOTAL = rs.getInt("TOTAL");
                String METHOD = rs.getString("METHOD");
                String DIACHI = rs.getString("DIACHI");
                String USER_NAME=rs.getString("USER_NAME");

                list.add(new orders(ORDER_ID, USER_ID, DATE, TOTAL, METHOD, DIACHI, STATUS, USER_NAME));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public orders selectOrder(String ORDER_ID) {
        orders ORDER = null;
        try (
                Connection con = getConnection();
                PreparedStatement prep = con.prepareStatement(SELECT_ORDER_BY_ORDER_ID);) {
            prep.setString(1, ORDER_ID); 
            System.out.println(prep);
            ResultSet rs = prep.executeQuery();
            while (rs.next()) {
                int USER_ID = rs.getInt("USER_ID");
                Timestamp DATE = rs.getTimestamp("DATE");
                int TOTAL = rs.getInt("TOTAL");
                String METHOD = rs.getString("METHOD");
                String DIACHI = rs.getString("DIACHI");
                String STATUS = rs.getString("STATUS");
                String USER_NAME = rs.getString("USER_NAME");
                ORDER = new orders(ORDER_ID, USER_ID, DATE, TOTAL, METHOD, DIACHI, STATUS,USER_NAME);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ORDER;
    }

    public boolean deleteOrder(String ORDER_ID) throws SQLException {
        boolean rowDeleted;
        try (
                Connection con = getConnection();
                PreparedStatement prep = con.prepareStatement(DELETE_ORDER_SQL);) {
            prep.setString(1, ORDER_ID);
            rowDeleted = prep.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateOrder(orders ORDER) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
                PreparedStatement prep = connection.prepareStatement(UPDATE_ORDER_SQL);) {
            prep.setString(1, ORDER.getORDER_ID());
            prep.setInt(2, ORDER.getUSER_ID());
            prep.setTimestamp(3, (Timestamp) ORDER.getDATE());
            prep.setInt(4, ORDER.getTOTAL());
            prep.setString(5, ORDER.getMETHOD());
            prep.setString(6, ORDER.getDIACHI());
            prep.setString(7, ORDER.getSTATUS());
            prep.setString(8, ORDER.getORDER_ID());
            rowUpdated = prep.executeUpdate() > 0;
        }
        return rowUpdated;
    }
    public boolean updateOrderStatus(orders ORDER) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
                PreparedStatement prep = connection.prepareStatement(UPDATE_ORDER_SQL_ON_STATUS);) {
            prep.setString(1, ORDER.getSTATUS());
            prep.setString(2, ORDER.getORDER_ID());
            rowUpdated = prep.executeUpdate() > 0;
        }
        return rowUpdated;
    }
    
    public List<orders> getListOrderByUserID(int USER_ID) {
        List<orders> list = new ArrayList<>();
        try (
                Connection con = getConnection();
                PreparedStatement prep = con.prepareStatement(SELECT_ORDER_BY_USER_ID);) {
            prep.setInt(1, USER_ID);
            ResultSet rs = prep.executeQuery();
            while (rs.next()) {
                String ORDER_ID = rs.getString("ORDER_ID");
                Timestamp DATE = rs.getTimestamp("DATE");
                int TOTAL = rs.getInt("TOTAL");
                String METHOD = rs.getString("METHOD");
                String DIACHI = rs.getString("DIACHI");
                String STATUS = rs.getString("STATUS");

                list.add(new orders(ORDER_ID, USER_ID, DATE, TOTAL, METHOD, DIACHI, STATUS));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
