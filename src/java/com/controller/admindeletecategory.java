/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import dao.categoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(urlPatterns = "/admin/admindeletecategory")
public class admindeletecategory extends HttpServlet {

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
            deleteCategory(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(admindeletecategory.class.getName()).log(Level.SEVERE, null, ex);
        }
            
    }
        private void deleteCategory(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String CATEGORY_ID1 = request.getParameter("CATEGORY_ID");
        int CATEGORY_ID=Integer.parseInt(CATEGORY_ID1);
        categoryDAO.deleteCategory(CATEGORY_ID);
        response.sendRedirect("adminlistcategory");

    }

}
