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
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ThinhNguyenCong
 */
@WebServlet(urlPatterns = "/admin/admineditcategory")
public class admineditcategory extends HttpServlet {

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
            showEditFormCategory(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(admineditcategory.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    private void showEditFormCategory(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        String CATEGORY_ID1 = request.getParameter("CATEGORY_ID");
        int CATEGORY_ID = Integer.parseInt(CATEGORY_ID1);
        category existingCategory = categoryDAO.selectCategory(CATEGORY_ID);
        String a = request.getRequestURI();
        request.setAttribute("CG", existingCategory);
        System.out.println(existingCategory);
        RequestDispatcher dispatcher = request.getRequestDispatcher("admincategoryform.jsp");
        dispatcher.forward(request, response);
    }

}
