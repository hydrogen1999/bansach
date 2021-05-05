/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.model.product;
import dao.productDAO;
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
@WebServlet(urlPatterns = "/admin/admineditproduct")
public class admineditproduct extends HttpServlet {

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
            showEditFormProduct(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(admineditproduct.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    private void showEditFormProduct(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        String PRODUCT_ID1 = request.getParameter("PRODUCT_ID");
        int PRODUCT_ID = Integer.parseInt(PRODUCT_ID1);
        product existingProduct = productDAO.selectProductAdmin(PRODUCT_ID);
        String a = request.getRequestURI();
        request.setAttribute("PD", existingProduct);
        System.out.println(existingProduct);
        RequestDispatcher dispatcher = request.getRequestDispatcher("adminproductform.jsp");
        dispatcher.forward(request, response);
    }

}
