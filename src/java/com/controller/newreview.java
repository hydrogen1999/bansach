/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.model.review;
import dao.reviewDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ThinhNguyenCong
 */
public class newreview extends HttpServlet {

    private reviewDAO reviewDAO;

    public void init() {

        reviewDAO = new reviewDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            insertReview(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(newreview.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(newreview.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    private void insertReview(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ParseException {
        String USER_NAME = request.getParameter("USER_NAME");
        byte[] bytes = USER_NAME.getBytes(StandardCharsets.ISO_8859_1);
        USER_NAME = new String(bytes, StandardCharsets.UTF_8);
        int PRODUCT_ID = Integer.parseInt(request.getParameter("PRODUCT_ID"));
        String EMAIL = request.getParameter("EMAIL");
        String CONTENT = request.getParameter("CONTENT");
        bytes = CONTENT.getBytes(StandardCharsets.ISO_8859_1);
        CONTENT = new String(bytes, StandardCharsets.UTF_8);
        int RATE = Integer.parseInt(request.getParameter("star"));

        review newReview = new review(USER_NAME, PRODUCT_ID, EMAIL, CONTENT, RATE, new Timestamp(new Date().getTime()));
        reviewDAO.insertReview(newReview);
        response.sendRedirect("product-details.jsp?product_id="+PRODUCT_ID);
    }

}
