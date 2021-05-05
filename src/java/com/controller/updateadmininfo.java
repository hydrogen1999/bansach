/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.model.admin;
import dao.adminDAO;
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
import javax.servlet.http.HttpSession;

/**
 *
 * @author ThinhNguyenCong
 */
@WebServlet(urlPatterns = "/admin/updateadmininfo")
public class updateadmininfo extends HttpServlet {

    private adminDAO adminDAO;

    public void init() {

        adminDAO = new adminDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            updateAdminInfo(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(adminupdateaccount.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    private void updateAdminInfo(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String ADMIN_ID1 = request.getParameter("ADMIN_ID");
        int ADMIN_ID = Integer.parseInt(ADMIN_ID1);
        String ADMIN_NAME = request.getParameter("ADMIN_NAME");
        byte[] bytes = ADMIN_NAME.getBytes(StandardCharsets.ISO_8859_1);
        ADMIN_NAME = new String(bytes, StandardCharsets.UTF_8);

        int PHONE = Integer.parseInt(request.getParameter("PHONE"));
        String PASSWORD = request.getParameter("PASSWORD");
        admin AM = new admin(ADMIN_ID, ADMIN_NAME, PHONE, PASSWORD);
        adminDAO.updateAdminInfo(AM);
        HttpSession ss = request.getSession();
        ss.setAttribute("AdminName", ADMIN_NAME);
        ss.setAttribute("AdminPhone", PHONE);
        ss.setAttribute("AdminPassword", PASSWORD);
        response.sendRedirect("adminhome.jsp");
    }

}
