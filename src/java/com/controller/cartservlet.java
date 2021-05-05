/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.model.cart;
import com.model.product;
import dao.productDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
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
public class cartservlet extends HttpServlet {

    private productDAO productDAO = new productDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        cart cart = (cart) session.getAttribute("cart");
        String product_id1 = request.getParameter("product_id");
        int product_id = Integer.parseInt(product_id1);
        String command = request.getParameter("command");
        ArrayList<Long> listBuy = null;
        String url="/cart.jsp";
        try {
            listBuy = (ArrayList<Long>) session.getAttribute("cartID");
            long idBuy = 0;
            if (request.getParameter("cartID") != null) {
                idBuy = Long.parseLong(request.getParameter("cartID"));
            }
            product pd = productDAO.selectProduct(product_id);
            switch (command) {
                case "insert":
                    if (listBuy == null) {
                        listBuy =new ArrayList<>();
                        session.setAttribute("cartID",listBuy);
                    }
                    if(listBuy.indexOf(idBuy)==-1){
                        cart.addToCart(pd, 1);
                        listBuy.add(idBuy);
                    }
                    url="/cart.jsp";
                    break;
                case "plus":
                    if(listBuy==null){
                        listBuy =new ArrayList<>();
                        session.setAttribute("cartID",listBuy);
                    }
                    if(listBuy.indexOf(idBuy)==-1){
                        cart.addToCart(pd, 1);
                        listBuy.add(idBuy);
                    }
                    url="/cart.jsp";
                    break;
                case "sub":
                    if(listBuy==null){
                        listBuy =new ArrayList<>();
                        session.setAttribute("cartID",listBuy);
                    }
                    if(listBuy.indexOf(idBuy)==-1){
                        cart.subToCart(pd, 1);
                        listBuy.add(idBuy);
                    }
                    url="/cart.jsp";
                    break;
                case "remove":
                    cart.removeToCart(pd);
                    url="/cart.jsp";
                    break;
                default:
                    break;
            }
            RequestDispatcher rd=getServletContext().getRequestDispatcher(url);
            rd.forward(request, response);
        } catch (Exception e) {
            
        }
    }

}
