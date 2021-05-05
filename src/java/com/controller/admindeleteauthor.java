/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import dao.authorDAO;
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
@WebServlet(urlPatterns = "/admin/admindeleteauthor")
public class admindeleteauthor extends HttpServlet {

    private authorDAO authorDAO;

    public void init() {

        authorDAO = new authorDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
        try {
            deleteAuthor(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(admindeleteauthor.class.getName()).log(Level.SEVERE, null, ex);
        }
            
    }
        private void deleteAuthor(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String AUTHOR_ID1 = request.getParameter("AUTHOR_ID");
        int AUTHOR_ID=Integer.parseInt(AUTHOR_ID1);
        authorDAO.deleteAuthor(AUTHOR_ID);
        response.sendRedirect("adminlistauthor");

    }
}
