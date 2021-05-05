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
@WebServlet(urlPatterns = "/admin/adminnewuser")
public class adminnewuser extends HttpServlet {

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
            insertUser(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(adminnewuser.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(adminnewuser.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    private void insertUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ParseException {
        String USER_NAME = request.getParameter("USER_NAME");
        byte[] bytes = USER_NAME.getBytes(StandardCharsets.ISO_8859_1);
        USER_NAME = new String(bytes, StandardCharsets.UTF_8);

        
        String EMAIL = request.getParameter("EMAIL");
        
        int PHONE = Integer.parseInt(request.getParameter("PHONE"));
        String PASSWORD = request.getParameter("PASSWORD");
        user newUser = new user(USER_NAME, EMAIL, PHONE, PASSWORD);
        userDAO.insertUser(newUser);
        response.sendRedirect("adminlistuser");
    }

}
