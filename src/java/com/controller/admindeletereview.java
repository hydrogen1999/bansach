/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import dao.reviewDAO;
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
@WebServlet(urlPatterns = "/admin/admindeletereview")
public class admindeletereview extends HttpServlet {

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
            deleteReview(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(admindeletereview.class.getName()).log(Level.SEVERE, null, ex);
        }
            
    }
        private void deleteReview(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String REVIEW_ID1 = request.getParameter("REVIEW_ID");
        int REVIEW_ID=Integer.parseInt(REVIEW_ID1);
        reviewDAO.deleteReview(REVIEW_ID);
        response.sendRedirect("adminlistreview");

    }

}
