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
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ThinhNguyenCong
 */
@WebServlet(urlPatterns = "/admin/admindeleteaccount")
public class admindeleteaccount extends HttpServlet {

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
            deleteAdmin(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(admindeleteaccount.class.getName()).log(Level.SEVERE, null, ex);
        }
            
    }
        private void deleteAdmin(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String ADMIN_ID1 = request.getParameter("ADMIN_ID");
        int ADMIN_ID=Integer.parseInt(ADMIN_ID1);
        adminDAO.deleteAdmin(ADMIN_ID);
        response.sendRedirect("adminlistaccount");

    }

}
