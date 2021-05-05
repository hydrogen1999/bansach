/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.model.category;
import dao.categoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ThinhNguyenCong
 */
@WebServlet(urlPatterns = "/admin/adminupdatecategory")
public class adminupdatecategory extends HttpServlet {

    private categoryDAO categoryDAO;

    public void init() {

        categoryDAO = new categoryDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            updateCategory(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(adminupdatecategory.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    private void updateCategory(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String CATEGORY_ID1=request.getParameter("CATEGORY_ID");
        int CATEGORY_ID=Integer.parseInt(CATEGORY_ID1);
        String CATEGORY_NAME = request.getParameter("CATEGORY_NAME");
        byte[] bytes = CATEGORY_NAME.getBytes(StandardCharsets.ISO_8859_1);
        CATEGORY_NAME = new String(bytes, StandardCharsets.UTF_8);

        category CG = new category(CATEGORY_ID, CATEGORY_NAME);
        categoryDAO.updateCategory(CG);
        response.sendRedirect("adminlistcategory");
    }

}
