/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import dao.messageDAO;
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
 * @message ThinhNguyenCong
 */
@WebServlet(urlPatterns = "/admin/admindeletemessage")
public class admindeletemessage extends HttpServlet {

    private messageDAO messageDAO;

    public void init() {

        messageDAO = new messageDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
        try {
            deleteMessage(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(admindeletemessage.class.getName()).log(Level.SEVERE, null, ex);
        }
            
    }
        private void deleteMessage(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String MESS_ID1 = request.getParameter("MESS_ID");
        int MESS_ID=Integer.parseInt(MESS_ID1);
        messageDAO.deleteMessage(MESS_ID);
        response.sendRedirect("adminlistmessage");

    }

}
