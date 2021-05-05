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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ThinhNguyenCong
 */
public class updateuserinfo extends HttpServlet {

    private userDAO userDAO;

    public void init() {

        userDAO = new userDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            updateUserInfo(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(updateuserinfo.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    private void updateUserInfo(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String USER_ID1 = request.getParameter("USER_ID");
        int USER_ID = Integer.parseInt(USER_ID1);
        String USER_NAME = request.getParameter("USER_NAME");
        byte[] bytes = USER_NAME.getBytes(StandardCharsets.ISO_8859_1);
        USER_NAME = new String(bytes, StandardCharsets.UTF_8);

        int PHONE = Integer.parseInt(request.getParameter("PHONE"));
        String PASSWORD = request.getParameter("PASSWORD");
        user US = new user(USER_ID, USER_NAME, PHONE, PASSWORD);
        userDAO.updateUserInfo(US);
        HttpSession ss = request.getSession();
        ss.setAttribute("UserName", USER_NAME);
        ss.setAttribute("UserID", USER_ID);
        ss.setAttribute("Phone", PHONE);
        ss.setAttribute("Password", PASSWORD);
        response.sendRedirect("my-account.jsp");
    }

}
