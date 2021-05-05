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
@WebServlet (urlPatterns="/admin/adminlistaccount")
public class adminlistaccount extends HttpServlet {

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
            listAdmin(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(adminlistaccount.class.getName()).log(Level.SEVERE, null, ex);
        }
            
    }

    public void listAdmin(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<admin> listAdmin = adminDAO.getListAdmin();
        request.setAttribute("listAdmin", listAdmin);
        String a = request.getRequestURI();
        RequestDispatcher dispatcher = request.getRequestDispatcher("adminlistaccount.jsp");
        dispatcher.forward(request, response);
    }

}
