/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ThinhNguyenCong
 */
public class searchservlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String PRODUCT_NAME = request.getParameter("product_name");
        if (PRODUCT_NAME != null) {
            HttpSession ss = request.getSession();
            ss.setAttribute("product_name", PRODUCT_NAME);
            RequestDispatcher dispatcher = request.getRequestDispatcher("search-list.jsp");
            dispatcher.forward(request, response);
        } else {
             HttpSession ss = request.getSession();
            ss.setAttribute("product_name", null);
            RequestDispatcher dispatcher = request.getRequestDispatcher("search-list.jsp");
            dispatcher.forward(request, response);
        }
    }

}
