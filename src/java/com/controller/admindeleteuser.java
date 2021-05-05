/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import dao.userDAO;
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
@WebServlet(urlPatterns = "/admin/admindeleteuser")
public class admindeleteuser extends HttpServlet {

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
            deleteUser(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(admindeleteuser.class.getName()).log(Level.SEVERE, null, ex);
        }
            
    }
        private void deleteUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String USER_ID1 = request.getParameter("USER_ID");
        int USER_ID=Integer.parseInt(USER_ID1);
        userDAO.deleteUser(USER_ID);
        response.sendRedirect("adminlistuser");

    }

}
