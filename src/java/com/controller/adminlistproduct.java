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
@WebServlet(urlPatterns = "/admin/adminlistproduct")
public class adminlistproduct extends HttpServlet {
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
            listProduct(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(adminlistproduct.class.getName()).log(Level.SEVERE, null, ex);
        }
            
    }

    public void listProduct(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<product> listProduct = productDAO.getListProductAdmin();
        request.setAttribute("listProduct", listProduct);
        String a = request.getRequestURI();
        RequestDispatcher dispatcher = request.getRequestDispatcher("adminlistproduct.jsp");
        dispatcher.forward(request, response);
    }

}
