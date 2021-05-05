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
import java.nio.charset.StandardCharsets;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ThinhNguyenCong
 */
public class newmessage extends HttpServlet {

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
            insertMessage(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(newmessage.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(newmessage.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    private void insertMessage(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ParseException {
        String EMAIL = request.getParameter("EMAIL");
        String MESSAGE = request.getParameter("MESSAGE");
        byte[] bytes = MESSAGE.getBytes(StandardCharsets.ISO_8859_1);
        MESSAGE = new String(bytes, StandardCharsets.UTF_8);
        
        message newMessage = new message(EMAIL, MESSAGE);
        messageDAO.insertMessage(newMessage);
        response.sendRedirect("contact.jsp");
    }

}
