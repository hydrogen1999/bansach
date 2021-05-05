/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.model.order_complete;
import com.model.orders;
import com.model.product;
import dao.order_detailDAO;
import dao.ordersDAO;
import dao.productDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.sql.SQLException;
import java.util.ArrayList;
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
@WebServlet(urlPatterns = "/admin/adminprocessorder")
public class adminprocessorder extends HttpServlet {

    private ordersDAO ordersDAO;

    public void init() {

        ordersDAO = new ordersDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            updateOrder(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(adminprocessorder.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    private void updateOrder(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String status = request.getParameter("status");
        String ORDER_ID = request.getParameter("ORDER_ID");
        String STATUS = null;
        String url = "/admin/adminpendingorder.jsp";
        switch (status) {
            case "pended":
                STATUS = "Đã xử lý";
                updateNumberProduct(ORDER_ID);
                url = "/admin/adminpendedorder.jsp";
                break;
            case "shipping":
                STATUS = "Đang giao";
                url = "/admin/adminshippingorder.jsp";
                break;

            case "shipped":
                STATUS = "Đã giao";
                url = "/admin/adminshippedorder.jsp";
                break;
            case "remove":
                STATUS = "Hủy đơn";
                url = "/admin/adminremoveorder.jsp";
                break;
            default:
                break;
        }
        orders AM = new orders(ORDER_ID, STATUS);
        ordersDAO.updateOrderStatus(AM);
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);
    }

    private void updateNumberProduct(String ORDER_ID) throws IOException, SQLException {
        order_detailDAO vo = new order_detailDAO();
        List< order_complete> ds5 = new ArrayList<>();
        ds5 = vo.getListOrderDetail(ORDER_ID);
        for (order_complete cc : ds5) {
            int a = cc.getPRODUCT_ID();
            int b = cc.getQUANTITY();
            updateNumber(a, b);
        }
    }

    private void updateNumber(int PRODUCT_ID, int QUANTITY) throws IOException, SQLException {
        product aa = productDAO.selectNumber(PRODUCT_ID);
        int number = aa.getNUMBER();
        int NUMBER = number - QUANTITY;
        product PD = new product(PRODUCT_ID, NUMBER);
        productDAO.updateNumber(PD);
    }
}
