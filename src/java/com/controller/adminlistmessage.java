/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.model.message;
import dao.messageDAO;
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
 * @message ThinhNguyenCong
 */
@WebServlet (urlPatterns="/admin/adminlistmessage")
public class adminlistmessage extends HttpServlet {

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
            listMessage(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(adminlistmessage.class.getName()).log(Level.SEVERE, null, ex);
        }
            
    }

    public void listMessage(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<message> listMessage = messageDAO.getListMessage();
        request.setAttribute("listMessage", listMessage);
        String a = request.getRequestURI();
        RequestDispatcher dispatcher = request.getRequestDispatcher("adminlistmessage.jsp");
        dispatcher.forward(request, response);
    }

}
