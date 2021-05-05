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
import java.sql.SQLException;
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
@WebServlet(urlPatterns = "/admin/adminedituser")
public class adminedituser extends HttpServlet {

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
            showEditFormUser(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(adminedituser.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    private void showEditFormUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        String USER_ID1 = request.getParameter("USER_ID");
        int USER_ID = Integer.parseInt(USER_ID1);
        user existingUser = userDAO.selectUser(USER_ID);
        String a = request.getRequestURI();
        request.setAttribute("US", existingUser);
        System.out.println(existingUser);
        RequestDispatcher dispatcher = request.getRequestDispatcher("adminuserform.jsp");
        dispatcher.forward(request, response);
    }

}
