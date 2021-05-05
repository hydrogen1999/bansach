/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import dao.productDAO;
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
@WebServlet(urlPatterns = "/admin/admindeleteproduct")
public class admindeleteproduct extends HttpServlet {

    private productDAO productDAO;

    public void init() {

        productDAO = new productDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
        try {
            deleteProduct(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(admindeleteproduct.class.getName()).log(Level.SEVERE, null, ex);
        }
            
    }
        private void deleteProduct(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String PRODUCT_ID1 = request.getParameter("PRODUCT_ID");
        int PRODUCT_ID=Integer.parseInt(PRODUCT_ID1);
        productDAO.deleteProduct(PRODUCT_ID);
        response.sendRedirect("adminlistproduct");

    }

}
