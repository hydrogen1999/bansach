/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import com.model.product;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

/**
 *
 * @product ThinhNguyenCong
 */
public class productDAO {

    public productDAO() {
    }
    private static String jdbcURL = "jdbc:mysql://localhost:3306/bansach";
    private static String jdbcUsername = "root";
    private static String jdbcPassword = "";

    private static final String INSERT_PD_SQL = "INSERT INTO product" + "  (PRODUCT_NAME,PRICE,OTHER,NUMBER,AUTHOR_ID,CATEGORY_ID,STATUS,DISCOUNT,IMAGE,DESCRIPTION) VALUES "
            + " (?,?, ?, ?,?,?, ?, ?,?, ?);";

    private static final String SELECT_PD_BY_PRODUCT_ID = "select  PRODUCT_ID,PRODUCT_NAME,PRICE,OTHER,NUMBER,product.AUTHOR_ID,CATEGORY_ID,STATUS,DISCOUNT,IMAGE,DESCRIPTION, AUTHOR_NAME from product,author where product.AUTHOR_ID=author.AUTHOR_ID and PRODUCT_ID = ?";
    private static final String SELECT_PD_BY_PRODUCT_NAME = "select  PRODUCT_ID,PRODUCT_NAME,PRICE,OTHER,NUMBER,product.AUTHOR_ID,CATEGORY_ID,STATUS,DISCOUNT,IMAGE,DESCRIPTION, AUTHOR_NAME from product,author where product.AUTHOR_ID=author.AUTHOR_ID and PRODUCT_NAME = ?";
    private static final String SELECT_PD_BY_AUTHOR_ID = "select  PRODUCT_ID,PRODUCT_NAME,PRICE,OTHER,NUMBER,product.AUTHOR_ID,CATEGORY_ID,STATUS,DISCOUNT,IMAGE,DESCRIPTION, AUTHOR_NAME from product,author where product.AUTHOR_ID=author.AUTHOR_ID and author.AUTHOR_ID = ?";
    private static final String SELECT_NUMBER_BY_PRODUCT_ID = "select NUMBER from product where PRODUCT_ID = ?";
    private static final String SELECT_PD_BY_CATEGORY_ID = "select  PRODUCT_ID,PRODUCT_NAME,PRICE,OTHER,NUMBER,product.AUTHOR_ID,product.CATEGORY_ID,STATUS,DISCOUNT,IMAGE,DESCRIPTION, AUTHOR_NAME,CATEGORY_NAME from category,product,author where category.CATEGORY_ID=product.CATEGORY_ID and product.AUTHOR_ID=author.AUTHOR_ID and category.CATEGORY_ID = ?";
    private static final String SELECT_PD_BY_AUTHOR_NAME = "select  PRODUCT_ID,PRODUCT_NAME,PRICE,OTHER,NUMBER,product.AUTHOR_ID,CATEGORY_ID,STATUS,DISCOUNT,IMAGE,DESCRIPTION, AUTHOR_NAME from product,author where product.AUTHOR_ID=author.AUTHOR_ID and author.AUTHOR_NAME = ?";
    private static final String SELECT_ALL_PRODUCT = "select  PRODUCT_ID,PRODUCT_NAME,PRICE,OTHER,NUMBER,product.AUTHOR_ID,CATEGORY_ID,STATUS,DISCOUNT,IMAGE,DESCRIPTION, AUTHOR_NAME from product,author where product.AUTHOR_ID=author.AUTHOR_ID;";
    private static final String SELECT_ALL_PRODUCT_ADMIN = "select  PRODUCT_ID,PRODUCT_NAME,PRICE,OTHER,NUMBER,product.AUTHOR_ID,category.CATEGORY_ID,STATUS,DISCOUNT,IMAGE,DESCRIPTION, AUTHOR_NAME,CATEGORY_NAME from category,product,author where product.AUTHOR_ID=author.AUTHOR_ID and category.CATEGORY_ID=product.CATEGORY_ID;";
    private static final String DELETE_PD_SQL = "delete from product where PRODUCT_ID = ?;";
    private static final String UPDATE_PD_SQL = "update product set PRODUCT_NAME = ?,PRICE=?, OTHER = ?, NUMBER=?,AUTHOR_ID=?,CATEGORY_ID=?,STATUS=?,DISCOUNT=?,IMAGE=? ,DESCRIPTION=? where PRODUCT_ID = ?;";
    private static final String UPDATE_NUMBER = "update product set NUMBER=? where PRODUCT_ID = ?;";

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

    public void insertProduct(product PD) throws SQLException {
        System.out.println(INSERT_PD_SQL);
        try (
                Connection con = getConnection();
                PreparedStatement prep = con.prepareStatement(INSERT_PD_SQL);) {
            prep.setString(1, PD.getPRODUCT_NAME());
            prep.setInt(2, PD.getPRICE());
            prep.setString(3, PD.getOTHER());
            prep.setInt(4, PD.getNUMBER());

            prep.setInt(5, PD.getAUTHOR_ID());
            prep.setInt(6, PD.getCATEGORY_ID());
            prep.setString(7, PD.getSTATUS());
            prep.setFloat(8, PD.getDISCOUNT());
            prep.setString(9, PD.getIMAGE());
            prep.setString(10, PD.getDESCRIPTION());
            System.out.println(prep);
            prep.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static List<product> getListProduct() throws IOException {
        List<product> list = new ArrayList<>();
        try (
                Connection con = getConnection();
                PreparedStatement prep = con.prepareStatement(SELECT_ALL_PRODUCT);) {
            ResultSet rs = prep.executeQuery();
            while (rs.next()) {
                int PRODUCT_ID = rs.getInt("PRODUCT_ID");
                String PRODUCT_NAME = rs.getString("PRODUCT_NAME");
                int PRICE = rs.getInt("PRICE");
                String OTHER = rs.getString("OTHER");
                int NUMBER = rs.getInt("NUMBER");
                int AUTHOR_ID = rs.getInt("AUTHOR_ID");
                int CATEGORY_ID = rs.getInt("CATEGORY_ID");
                String STATUS = rs.getString("STATUS");
                float DISCOUNT1 = rs.getFloat("DISCOUNT");
                float DISCOUNT = DISCOUNT1 * 100;
                String IMAGE = rs.getString("IMAGE");
                String DESCRIPTION = rs.getString("DESCRIPTION");
                String AUTHOR_NAME = rs.getString("AUTHOR_NAME");
                float NEW_PRICE1 = PRICE * (1 - DISCOUNT1);
                int NEW_PRICE = Math.round(NEW_PRICE1);
                list.add(new product(PRODUCT_ID, PRODUCT_NAME, PRICE, OTHER, NUMBER, AUTHOR_ID, CATEGORY_ID, STATUS, DISCOUNT, IMAGE, DESCRIPTION, AUTHOR_NAME, NEW_PRICE));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public static List<product> getListProductAdmin() throws IOException {
        List<product> list = new ArrayList<>();
        try (
                Connection con = getConnection();
                PreparedStatement prep = con.prepareStatement(SELECT_ALL_PRODUCT_ADMIN);) {
            ResultSet rs = prep.executeQuery();
            while (rs.next()) {
                int PRODUCT_ID = rs.getInt("PRODUCT_ID");
                String PRODUCT_NAME = rs.getString("PRODUCT_NAME");
                int PRICE = rs.getInt("PRICE");
                String OTHER = rs.getString("OTHER");
                int NUMBER = rs.getInt("NUMBER");
                int AUTHOR_ID = rs.getInt("AUTHOR_ID");
                int CATEGORY_ID = rs.getInt("CATEGORY_ID");
                String STATUS = rs.getString("STATUS");
                float DISCOUNT1 = rs.getFloat("DISCOUNT");
                float DISCOUNT = DISCOUNT1 * 100;
                String IMAGE = rs.getString("IMAGE");
                String DESCRIPTION = rs.getString("DESCRIPTION");
                String AUTHOR_NAME = rs.getString("AUTHOR_NAME");
                String CATEGORY_NAME = rs.getString("CATEGORY_NAME");
                float NEW_PRICE1 = PRICE * (1 - DISCOUNT1);
                int NEW_PRICE = Math.round(NEW_PRICE1);
                list.add(new product(PRODUCT_ID, PRODUCT_NAME, PRICE, OTHER, NUMBER, AUTHOR_ID, CATEGORY_ID, STATUS, DISCOUNT, IMAGE, DESCRIPTION, AUTHOR_NAME, CATEGORY_NAME, NEW_PRICE));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public static List<product> getListProductAuthorID(int AUTHOR_ID) throws IOException {
        List<product> list = new ArrayList<>();
        try (
                Connection con = getConnection();
                PreparedStatement prep = con.prepareStatement(SELECT_PD_BY_AUTHOR_ID);) {
            prep.setInt(1, AUTHOR_ID);
            ResultSet rs = prep.executeQuery();
            while (rs.next()) {
                int PRODUCT_ID = rs.getInt("PRODUCT_ID");
                String PRODUCT_NAME = rs.getString("PRODUCT_NAME");
                int PRICE = rs.getInt("PRICE");
                String OTHER = rs.getString("OTHER");
                int NUMBER = rs.getInt("NUMBER");
                int CATEGORY_ID = rs.getInt("CATEGORY_ID");
                String STATUS = rs.getString("STATUS");
                float DISCOUNT1 = rs.getFloat("DISCOUNT");
                float DISCOUNT = DISCOUNT1 * 100;
                String IMAGE = rs.getString("IMAGE");
                String DESCRIPTION = rs.getString("DESCRIPTION");
                String AUTHOR_NAME = rs.getString("AUTHOR_NAME");
                float NEW_PRICE1 = PRICE * (1 - DISCOUNT1);
                int NEW_PRICE = Math.round(NEW_PRICE1);
                list.add(new product(PRODUCT_ID, PRODUCT_NAME, PRICE, OTHER, NUMBER, AUTHOR_ID, CATEGORY_ID, STATUS, DISCOUNT, IMAGE, DESCRIPTION, AUTHOR_NAME, NEW_PRICE));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public static List<product> getListProductCategoryID(int CATEGORY_ID) throws IOException {
        List<product> list = new ArrayList<>();
        try (
                Connection con = getConnection();
                PreparedStatement prep = con.prepareStatement(SELECT_PD_BY_CATEGORY_ID);) {
            prep.setInt(1, CATEGORY_ID);
            ResultSet rs = prep.executeQuery();
            while (rs.next()) {
                int PRODUCT_ID = rs.getInt("PRODUCT_ID");
                String PRODUCT_NAME = rs.getString("PRODUCT_NAME");
                int PRICE = rs.getInt("PRICE");
                String OTHER = rs.getString("OTHER");
                int NUMBER = rs.getInt("NUMBER");
                int AUTHOR_ID = rs.getInt("AUTHOR_ID");
                String STATUS = rs.getString("STATUS");
                float DISCOUNT1 = rs.getFloat("DISCOUNT");
                float DISCOUNT = DISCOUNT1 * 100;
                String IMAGE = rs.getString("IMAGE");
                String DESCRIPTION = rs.getString("DESCRIPTION");
                String AUTHOR_NAME = rs.getString("AUTHOR_NAME");
                float NEW_PRICE1 = PRICE * (1 - DISCOUNT1);
                int NEW_PRICE = Math.round(NEW_PRICE1);
                list.add(new product(PRODUCT_ID, PRODUCT_NAME, PRICE, OTHER, NUMBER, AUTHOR_ID, CATEGORY_ID, STATUS, DISCOUNT, IMAGE, DESCRIPTION, AUTHOR_NAME, NEW_PRICE));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public static List<product> getListProductAuthorName(String AUTHOR_NAME) throws IOException {
        List<product> list = new ArrayList<>();
        try (
                Connection con = getConnection();
                PreparedStatement prep = con.prepareStatement(SELECT_PD_BY_AUTHOR_NAME);) {
            prep.setString(1, AUTHOR_NAME);
            ResultSet rs = prep.executeQuery();
            while (rs.next()) {
                int PRODUCT_ID = rs.getInt("PRODUCT_ID");
                String PRODUCT_NAME = rs.getString("PRODUCT_NAME");
                int PRICE = rs.getInt("PRICE");
                String OTHER = rs.getString("OTHER");
                int NUMBER = rs.getInt("NUMBER");
                int AUTHOR_ID = rs.getInt("AUTHOR_ID");
                int CATEGORY_ID = rs.getInt("CATEGORY_ID");
                String STATUS = rs.getString("STATUS");
                float DISCOUNT1 = rs.getFloat("DISCOUNT");
                float DISCOUNT = DISCOUNT1 * 100;
                String IMAGE = rs.getString("IMAGE");
                String DESCRIPTION = rs.getString("DESCRIPTION");
                float NEW_PRICE1 = PRICE * (1 - DISCOUNT1);
                int NEW_PRICE = Math.round(NEW_PRICE1);
                list.add(new product(PRODUCT_ID, PRODUCT_NAME, PRICE, OTHER, NUMBER, AUTHOR_ID, CATEGORY_ID, STATUS, DISCOUNT, IMAGE, DESCRIPTION, AUTHOR_NAME, NEW_PRICE));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public static product selectProduct(int PRODUCT_ID) throws IOException {
        product PD = null;
        try (
                Connection con = getConnection();
                PreparedStatement prep = con.prepareStatement(SELECT_PD_BY_PRODUCT_ID);) {
            prep.setInt(1, PRODUCT_ID);
            System.out.println(prep);
            ResultSet rs = prep.executeQuery();
            while (rs.next()) {
                String PRODUCT_NAME = rs.getString("PRODUCT_NAME");
                int PRICE = rs.getInt("PRICE");
                String OTHER = rs.getString("OTHER");
                int NUMBER = rs.getInt("NUMBER");
                int AUTHOR_ID = rs.getInt("AUTHOR_ID");
                int CATEGORY_ID = rs.getInt("CATEGORY_ID");
                String STATUS = rs.getString("STATUS");
                float DISCOUNT1 = rs.getFloat("DISCOUNT");
                float DISCOUNT = DISCOUNT1 * 100;
                String IMAGE = rs.getString("IMAGE");
                String DESCRIPTION = rs.getString("DESCRIPTION");
                String AUTHOR_NAME = rs.getString("AUTHOR_NAME");
                float NEW_PRICE1 = PRICE * (1 - DISCOUNT1);
                int NEW_PRICE = Math.round(NEW_PRICE1);

                PD = new product(PRODUCT_ID, PRODUCT_NAME, PRICE, OTHER, NUMBER, AUTHOR_ID, CATEGORY_ID, STATUS, DISCOUNT, IMAGE, DESCRIPTION, AUTHOR_NAME, NEW_PRICE);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return PD;
    }

    public static product selectProductAdmin(int PRODUCT_ID) throws IOException {
        product PD = null;
        try (
                Connection con = getConnection();
                PreparedStatement prep = con.prepareStatement(SELECT_PD_BY_PRODUCT_ID);) {
            prep.setInt(1, PRODUCT_ID);
            System.out.println(prep);
            ResultSet rs = prep.executeQuery();
            while (rs.next()) {
                String PRODUCT_NAME = rs.getString("PRODUCT_NAME");
                int PRICE = rs.getInt("PRICE");
                String OTHER = rs.getString("OTHER");
                int NUMBER = rs.getInt("NUMBER");
                int AUTHOR_ID = rs.getInt("AUTHOR_ID");
                int CATEGORY_ID = rs.getInt("CATEGORY_ID");
                String STATUS = rs.getString("STATUS");
                float DISCOUNT = rs.getFloat("DISCOUNT");
                String IMAGE = rs.getString("IMAGE");
                String DESCRIPTION = rs.getString("DESCRIPTION");
                PD = new product(PRODUCT_ID, PRODUCT_NAME, PRICE, OTHER, NUMBER, AUTHOR_ID, CATEGORY_ID, STATUS, DISCOUNT, IMAGE, DESCRIPTION);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return PD;
    }
    public static product selectNumber(int PRODUCT_ID) throws IOException {
        product PD = null;
        try (
                Connection con = getConnection();
                PreparedStatement prep = con.prepareStatement(SELECT_NUMBER_BY_PRODUCT_ID);) {
            prep.setInt(1, PRODUCT_ID);
            System.out.println(prep);
            ResultSet rs = prep.executeQuery();
            while (rs.next()) {              
                int NUMBER = rs.getInt("NUMBER");        
                PD = new product(PRODUCT_ID, NUMBER);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return PD;
    }
    public static product selectProductName(String PRODUCT_NAME) throws IOException {
        product PD = null;
        try (
                Connection con = getConnection();
                PreparedStatement prep = con.prepareStatement(SELECT_PD_BY_PRODUCT_NAME);) {
            prep.setString(1, PRODUCT_NAME);
            System.out.println(prep);
            ResultSet rs = prep.executeQuery();
            while (rs.next()) {
                int PRODUCT_ID = rs.getInt("PRODUCT_ID");
                int PRICE = rs.getInt("PRICE");
                String OTHER = rs.getString("OTHER");
                int NUMBER = rs.getInt("NUMBER");
                int AUTHOR_ID = rs.getInt("AUTHOR_ID");
                int CATEGORY_ID = rs.getInt("CATEGORY_ID");
                String STATUS = rs.getString("STATUS");
                float DISCOUNT1 = rs.getFloat("DISCOUNT");
                float DISCOUNT = DISCOUNT1 * 100;
                String IMAGE = rs.getString("IMAGE");
                String DESCRIPTION = rs.getString("DESCRIPTION");
                String AUTHOR_NAME = rs.getString("AUTHOR_NAME");
                float NEW_PRICE1 = PRICE * (1 - DISCOUNT1);
                int NEW_PRICE = Math.round(NEW_PRICE1);
                PD = new product(PRODUCT_ID, PRODUCT_NAME, PRICE, OTHER, NUMBER, AUTHOR_ID, CATEGORY_ID, STATUS, DISCOUNT, IMAGE, DESCRIPTION, AUTHOR_NAME, NEW_PRICE);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return PD;
    }

    public boolean deleteProduct(int PRODUCT_ID) throws SQLException {
        boolean rowDeleted;
        try (
                Connection con = getConnection();
                PreparedStatement prep = con.prepareStatement(DELETE_PD_SQL);) {
            prep.setInt(1, PRODUCT_ID);
            rowDeleted = prep.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateProduct(product PD) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
                PreparedStatement prep = connection.prepareStatement(UPDATE_PD_SQL);) {
            prep.setString(1, PD.getPRODUCT_NAME());
            prep.setInt(2, PD.getPRICE());
            prep.setString(3, PD.getOTHER());
            prep.setInt(4, PD.getNUMBER());

            prep.setInt(5, PD.getAUTHOR_ID());
            prep.setInt(6, PD.getCATEGORY_ID());
            prep.setString(7, PD.getSTATUS());
            prep.setFloat(8, PD.getDISCOUNT());
            prep.setString(9, PD.getIMAGE());
            prep.setString(10, PD.getDESCRIPTION());
            prep.setInt(11, PD.getPRODUCT_ID());
            rowUpdated = prep.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    public static  boolean updateNumber(product PD) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
                PreparedStatement prep = connection.prepareStatement(UPDATE_NUMBER);) {

            prep.setInt(1, PD.getNUMBER());

            prep.setInt(2, PD.getPRODUCT_ID());
            rowUpdated = prep.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    public List<product> getListProductByPage(List<product> list, int start, int end) {
        List<product> arr = new ArrayList<>();
        for (int i = start; i <= end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }
}
