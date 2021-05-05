/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import com.model.category;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @category ThinhNguyenCong
 */
public class categoryDAO {
    public categoryDAO() {
    }
    private String jdbcURL = "jdbc:mysql://localhost:3306/bansach";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";

    private static final String INSERT_CG_SQL = "INSERT INTO category" + "  (CATEGORY_NAME) VALUES "
            + " (?);";

    private static final String SELECT_CG_BY_CATEGORY_ID = "select CATEGORY_ID,CATEGORY_NAME from category where CATEGORY_ID = ?";
    private static final String SELECT_ALL_CATEGORY = "select * from category";
    private static final String DELETE_CG_SQL = "delete from category where CATEGORY_ID = ?;";
    private static final String UPDATE_CG_SQL = "update category set CATEGORY_NAME = ? where CATEGORY_ID = ?;";

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

    public void insertCategory(category CG) throws SQLException {
        System.out.println(INSERT_CG_SQL);
        try (
                Connection con = getConnection();
                PreparedStatement prep = con.prepareStatement(INSERT_CG_SQL);) {
            prep.setString(1, CG.getCATEGORY_NAME());
         
            System.out.println(prep);
            prep.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<category> getListCategory() {
        List<category> list = new ArrayList<>();
        try (
                Connection con = getConnection();
                PreparedStatement prep = con.prepareStatement(SELECT_ALL_CATEGORY);) {
            ResultSet rs = prep.executeQuery();
            while (rs.next()) {
                int CATEGORY_ID = rs.getInt("CATEGORY_ID");
                String CATEGORY_NAME = rs.getString("CATEGORY_NAME");
             
                list.add(new category(CATEGORY_ID,CATEGORY_NAME));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public category selectCategory(int CATEGORY_ID) {
        category CG = null;
        try (
                Connection con = getConnection();
                PreparedStatement prep = con.prepareStatement(SELECT_CG_BY_CATEGORY_ID);) {
            prep.setInt(1, CATEGORY_ID);
            System.out.println(prep);
            ResultSet rs = prep.executeQuery();
            while (rs.next()) {
                String CATEGORY_NAME = rs.getString("CATEGORY_NAME");
               
                CG = new category(CATEGORY_ID, CATEGORY_NAME);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return CG;
    }

    public boolean deleteCategory(int CATEGORY_ID) throws SQLException {
        boolean rowDeleted;
        try (
                Connection con = getConnection();
                PreparedStatement prep = con.prepareStatement(DELETE_CG_SQL);) {
            prep.setInt(1, CATEGORY_ID);
            rowDeleted = prep.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateCategory(category CG) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
                PreparedStatement prep = connection.prepareStatement(UPDATE_CG_SQL);) {
            prep.setString(1, CG.getCATEGORY_NAME());
            prep.setInt(2, CG.getCATEGORY_ID());
            rowUpdated = prep.executeUpdate() > 0;
        }
        return rowUpdated;
    }
}
