/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.model.user;
import dao.userDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ThinhNguyenCong
 */
public class DangNhap extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DangNhap</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DangNhap at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String EMAIL = request.getParameter("email1");

        String PASSWORD = request.getParameter("password1");
        userDAO v1 = new userDAO();
        user USER = new user(EMAIL, PASSWORD);
        System.out.println(EMAIL);
        if (userDAO.kiemTraDangNhap(EMAIL, PASSWORD)) {
            String UserName = null;
            String Email=null;
            int UserID = 0;
            int Phone=0;
            String Password=null;
            try {
                UserName = v1.getUserName(EMAIL);
                UserID = v1.getUserID(EMAIL);
                Phone = v1.getUserPhone(EMAIL);
                Email=EMAIL;
                Password=v1.getUserPassword(EMAIL);
            } catch (SQLException ex) {
                Logger.getLogger(DangNhap.class.getName()).log(Level.SEVERE, null, ex);
            }
            HttpSession ss = request.getSession();
            ss.setAttribute("UserName", UserName);
            ss.setAttribute("Email", Email);
            ss.setAttribute("UserID", UserID);
            ss.setAttribute("Phone", Phone);
            ss.setAttribute("Password", Password);
            response.sendRedirect("home.jsp");
        } else {
            RequestDispatcher rd = request.getRequestDispatcher("login-register.jsp");
            rd.forward(request, response);
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
