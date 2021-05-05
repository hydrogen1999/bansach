/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.model.author;
import dao.authorDAO;
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
@WebServlet (urlPatterns="/admin/adminlistauthor")
public class adminlistauthor extends HttpServlet {

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
            listAuthor(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(adminlistauthor.class.getName()).log(Level.SEVERE, null, ex);
        }
            
    }

    public void listAuthor(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<author> listAuthor = authorDAO.getListAuthor();
        request.setAttribute("listAuthor", listAuthor);
        String a = request.getRequestURI();
        RequestDispatcher dispatcher = request.getRequestDispatcher("adminlistauthor.jsp");
        dispatcher.forward(request, response);
    }

}
