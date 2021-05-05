/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.model.cart;
import com.model.order_detail;
import com.model.orders;
import com.model.product;
import dao.order_detailDAO;
import dao.ordersDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Map;
import java.util.TreeMap;
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
public class thanhtoanservlet extends HttpServlet {

    private ordersDAO ordersDAO = new ordersDAO();
    private order_detailDAO order_detailDAO = new order_detailDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        
        HttpSession ss = request.getSession();
        Object USER_ID1 = ss.getAttribute("UserID");
        int USER_ID = Integer.parseInt(USER_ID1.toString());

        String DIACHI = request.getParameter("diachi");
        String METHOD = request.getParameter("method");
        String STATUS = "Đặt hàng";
        
        cart cart = (cart) ss.getAttribute("cart");
        Object TOTAL1 = ss.getAttribute("totalmoney");
        int TOTAL = Integer.parseInt(TOTAL1.toString());
        try {
            Date date = new Date();
            String ORDER_ID = "" + date.getTime();
            orders hd = new orders(ORDER_ID, USER_ID, new Timestamp(new Date().getTime()), TOTAL, METHOD, DIACHI, STATUS);
            hd.setORDER_ID(ORDER_ID);
            ordersDAO.insertOrder(hd);
            ss.setAttribute("ORDER_ID", ORDER_ID);
            TreeMap<product, Integer> list = cart.getList();
            System.out.println(list);
            for (Map.Entry<product, Integer> ds : list.entrySet()) {
                
                order_detailDAO.insertOrderDetail(new order_detail(0,hd, ds.getKey().getPRODUCT_ID(), ds.getValue(), ds.getKey().getNEW_PRICE()));
            }
            ss.setAttribute("cart", null);
            RequestDispatcher rd = request.getRequestDispatcher("order-complete.jsp");
            rd.forward(request, response);
        } catch (Exception e) {
        }
    }

}
