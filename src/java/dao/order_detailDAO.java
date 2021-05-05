/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import com.model.order_complete;
import com.model.order_detail;
import com.model.orders;
import java.sql.Connection;
import java.sql.Date;
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
public class order_detailDAO {
    public order_detailDAO() {
    }
     private String jdbcURL = "jdbc:mysql://localhost:3306/bansach";
    private String jdbcOrdername = "root";
    private String jdbcPassword = "";

    private static final String INSERT_ORDER_DETAIL_SQL = "INSERT INTO orders_detail" + "  (ID,ORDER_ID,PRODUCT_ID,QUANTITY,PRICE) VALUES "
            + " (?,?, ?,?, ?);";

    private static final String SELECT_ORDER_DETAIL_BY_ORDER_ID = "select ID,ORDER_ID,orders_detail.PRODUCT_ID,QUANTITY,orders_detail.PRICE,PRODUCT_NAME from orders_detail,product where orders_detail.PRODUCT_ID=product.PRODUCT_ID and ORDER_ID = ?";
    private static final String SELECT_ALL_ORDER_DETAIL = "select * from orders_detail";
    private static final String DELETE_ORDER_DETAIL_SQL = "delete from orders_detail where ORDER_ID = ?;";
    private static final String UPDATE_ORDER_DETAIL_SQL = "update orders_detail set ORDER_ID = ?, PRODUCT_ID = ?,QUANTITY = ?,PRICE=? where ORDER_ID = ?;";
    
    protected Connection getConnection() {
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

    public void insertOrderDetail(order_detail ORDERDT) throws SQLException {
        System.out.println(INSERT_ORDER_DETAIL_SQL);
        try (
            Connection con = getConnection();
            PreparedStatement prep = con.prepareStatement(INSERT_ORDER_DETAIL_SQL);) {
            prep.setInt(1, ORDERDT.getID());
            prep.setString(2, ORDERDT.getORDER().getORDER_ID());
            prep.setInt(3, ORDERDT.getPRODUCT_ID());
            prep.setInt(4, ORDERDT.getQUANTITY());
            prep.setInt(5, ORDERDT.getPRICE());
            System.out.println(prep);
            prep.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public List<order_complete> getListOrderDetail(String ORDER_ID) {
        List<order_complete> list = new ArrayList<>();
        try (
                Connection con = getConnection();
                PreparedStatement prep = con.prepareStatement(SELECT_ORDER_DETAIL_BY_ORDER_ID);) {
            prep.setString(1, ORDER_ID);
            ResultSet rs = prep.executeQuery();
            while (rs.next()) {
                int ID =rs.getInt("ID");
                int PRODUCT_ID =rs.getInt("PRODUCT_ID");
                int QUANTITY=rs.getInt("QUANTITY");
                int PRICE=rs.getInt("PRICE");
                String PRODUCT_NAME=rs.getString("PRODUCT_NAME");
                list.add(new order_complete(ID, ORDER_ID, PRODUCT_ID, QUANTITY, PRICE,PRODUCT_NAME));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
