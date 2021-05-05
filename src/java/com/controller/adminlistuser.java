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
@WebServlet (urlPatterns="/admin/adminlistuser")
public class adminlistuser extends HttpServlet {

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
            listUser(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(adminlistuser.class.getName()).log(Level.SEVERE, null, ex);
        }
            
    }

    public void listUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<user> listUser = userDAO.getListUser();
        request.setAttribute("listUser", listUser);
        String a = request.getRequestURI();
        RequestDispatcher dispatcher = request.getRequestDispatcher("adminlistuser.jsp");
        dispatcher.forward(request, response);
    }

}
