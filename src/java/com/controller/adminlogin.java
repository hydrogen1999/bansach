/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import dao.adminDAO;
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
import javax.servlet.http.HttpSession;

/**
 *
 * @author ThinhNguyenCong
 */
@WebServlet (urlPatterns="/admin/adminlogin")
public class adminlogin extends HttpServlet {

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
            out.println("<title>Servlet adminlogin</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet adminlogin at " + request.getContextPath() + "</h1>");
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
        adminDAO admin = new adminDAO();
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String type = request.getParameter("type");

        if (adminDAO.kiemTraDangNhap(email, password, type)) {
            String AdminName=null;
            String Email=null;
            String Password=null;
            int AdminID=0;
            int Phone=0;
            String Type=null;
            try {
                AdminName=admin.getAdminName(email);
                Email=email;
                Password=password;
                AdminID=admin.getAdminID(email);
                Phone=admin.getAdminPhone(email);
                Type=admin.getAdminType(email);
            } catch (SQLException ex) {
                Logger.getLogger(adminlogin.class.getName()).log(Level.SEVERE, null, ex);
            }
            HttpSession ss = request.getSession();
            ss.setAttribute("AdminName", AdminName);
            ss.setAttribute("AdminEmail", Email);
            ss.setAttribute("AdminID", AdminID);
            ss.setAttribute("AdminPhone", Phone);
            ss.setAttribute("AdminType", Type);
            ss.setAttribute("AdminPassword", Password);
            RequestDispatcher rd = request.getRequestDispatcher("adminhome.jsp");
            rd.forward(request, response);
        } else {
            RequestDispatcher rd = request.getRequestDispatcher("adminlogin.jsp");
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
