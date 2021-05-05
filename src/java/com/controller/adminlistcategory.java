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
import java.util.List;
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
@WebServlet (urlPatterns="/admin/adminlistcategory")
public class adminlistcategory extends HttpServlet {

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
            listCategory(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(adminlistcategory.class.getName()).log(Level.SEVERE, null, ex);
        }
            
    }

    public void listCategory(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<category> listCategory = categoryDAO.getListCategory();
        request.setAttribute("listCategory", listCategory);
        String a = request.getRequestURI();
        RequestDispatcher dispatcher = request.getRequestDispatcher("adminlistcategory.jsp");
        dispatcher.forward(request, response);
    }

}
