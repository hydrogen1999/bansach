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
import java.nio.charset.StandardCharsets;
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
@WebServlet(urlPatterns = "/admin/adminupdateauthor")
public class adminupdateauthor extends HttpServlet {

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
            updateAuthor(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(adminupdateauthor.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    private void updateAuthor(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String AUTHOR_ID1=request.getParameter("AUTHOR_ID");
        int AUTHOR_ID=Integer.parseInt(AUTHOR_ID1);
        String AUTHOR_NAME = request.getParameter("AUTHOR_NAME");
        byte[] bytes = AUTHOR_NAME.getBytes(StandardCharsets.ISO_8859_1);
        AUTHOR_NAME = new String(bytes, StandardCharsets.UTF_8);

        String OTHER_AUTHOR = request.getParameter("OTHER_AUTHOR");
        bytes = OTHER_AUTHOR.getBytes(StandardCharsets.ISO_8859_1);
        OTHER_AUTHOR = new String(bytes, StandardCharsets.UTF_8);
        author AT = new author(AUTHOR_ID, AUTHOR_NAME,OTHER_AUTHOR);
        authorDAO.updateAuthor(AT);
        response.sendRedirect("adminlistauthor");
    }


}
