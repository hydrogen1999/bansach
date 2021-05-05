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
@WebServlet(urlPatterns = "/admin/adminlistreview")
public class adminlistreview extends HttpServlet {

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
            listReview(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(adminlistreview.class.getName()).log(Level.SEVERE, null, ex);
        }
            
    }

    public void listReview(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<review> listReview = reviewDAO.getListReview();
        request.setAttribute("listReview", listReview);
        String a = request.getRequestURI();
        RequestDispatcher dispatcher = request.getRequestDispatcher("adminlistreview.jsp");
        dispatcher.forward(request, response);
    }

}
