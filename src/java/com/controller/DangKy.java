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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.sql.Date;
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
public class DangKy extends HttpServlet {

    public DangKy() {
        super();
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet XuLiDangKy</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet XuLiDangKy at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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

        String USER_NAME = request.getParameter("name");
        byte[] bytes = USER_NAME.getBytes(StandardCharsets.ISO_8859_1);
        USER_NAME = new String(bytes, StandardCharsets.UTF_8);
        String EMAIL = request.getParameter("email");
        String PHONE1 = request.getParameter("phone");
        int PHONE = Integer.parseInt(PHONE1);
        String PASSWORD = request.getParameter("password");
        userDAO v1 = new userDAO();
        System.out.println("Ahihi da vao den day");
        user USER = new user(USER_NAME, EMAIL, PHONE, PASSWORD);
        System.out.println(USER_NAME);
        try {
            if (userDAO.checkDuplicate(EMAIL).equals("0")) {
                userDAO.DangKyDao(USER);
                 HttpSession ss=request.getSession();
                ss.setAttribute("UserName", USER_NAME);
                int UserID=v1.getUserID(EMAIL);
                ss.setAttribute("UserID", UserID);
                ss.setAttribute("Email", EMAIL);
                ss.setAttribute("Phone", PHONE);
                ss.setAttribute("Password", PASSWORD);
                RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
                rd.forward(request, response);
            } else {
                HttpSession ss=request.getSession();
                ss.setAttribute("exist", true);
                RequestDispatcher rd = request.getRequestDispatcher("login-register.jsp");
                rd.forward(request, response);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DangKy.class.getName()).log(Level.SEVERE, null, ex);
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
