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
@WebServlet(urlPatterns = "/admin/adminupdateproduct")
public class adminupdateproduct extends HttpServlet {

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
            updateProduct(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(adminupdateproduct.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String PRODUCT_ID1=request.getParameter("PRODUCT_ID");
        int PRODUCT_ID=Integer.parseInt(PRODUCT_ID1);
        String PRODUCT_NAME = request.getParameter("PRODUCT_NAME");
        byte[] bytes = PRODUCT_NAME.getBytes(StandardCharsets.ISO_8859_1);
        PRODUCT_NAME = new String(bytes, StandardCharsets.UTF_8);
        int PRICE = Integer.parseInt(request.getParameter("PRICE"));

        String OTHER = request.getParameter("OTHER");
        bytes = OTHER.getBytes(StandardCharsets.ISO_8859_1);
        OTHER = new String(bytes, StandardCharsets.UTF_8);

        int NUMBER = Integer.parseInt(request.getParameter("NUMBER"));
        int AUTHOR_ID = Integer.parseInt(request.getParameter("AUTHOR_ID"));
        int CATEGORY_ID = Integer.parseInt(request.getParameter("CATEGORY_ID"));
        String STATUS = request.getParameter("STATUS");
        bytes = STATUS.getBytes(StandardCharsets.ISO_8859_1);
        STATUS = new String(bytes, StandardCharsets.UTF_8);
        
        float DISCOUNT =Float.parseFloat(request.getParameter("DISCOUNT"));
        String IMAGE = request.getParameter("IMAGE");
        String DESCRIPTION = request.getParameter("DESCRIPTION");
        bytes = DESCRIPTION.getBytes(StandardCharsets.ISO_8859_1);
        DESCRIPTION = new String(bytes, StandardCharsets.UTF_8);
        product PD = new product(PRODUCT_ID, PRODUCT_NAME, PRICE, OTHER, NUMBER, AUTHOR_ID, CATEGORY_ID, STATUS, DISCOUNT, IMAGE, DESCRIPTION);
        productDAO.updateProduct(PD);
        response.sendRedirect("adminlistproduct");
    }

}
