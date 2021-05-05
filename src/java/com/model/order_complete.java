/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

/**
 *
 * @author ThinhNguyenCong
 */
public class order_complete {
    private int ID;
    private String ORDER_ID;
    private int PRODUCT_ID;
    private int QUANTITY;
    private int PRICE;
    private String PRODUCT_NAME;

    public order_complete(int ID, String ORDER_ID, int PRODUCT_ID, int QUANTITY, int PRICE,String PRODUCT_NAME) {
        this.ID = ID;
        this.ORDER_ID = ORDER_ID;
        this.PRODUCT_ID = PRODUCT_ID;
        this.QUANTITY = QUANTITY;
        this.PRICE = PRICE;
        this.PRODUCT_NAME=PRODUCT_NAME;
    }

    

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getORDER_ID() {
        return ORDER_ID;
    }

    public void setORDER_ID(String ORDER_ID) {
        this.ORDER_ID = ORDER_ID;
    }

    

    public int getPRODUCT_ID() {
        return PRODUCT_ID;
    }

    public void setPRODUCT_ID(int PRODUCT_ID) {
        this.PRODUCT_ID = PRODUCT_ID;
    }

  

   

    public int getQUANTITY() {
        return QUANTITY;
    }

    public void setQUANTITY(int QUANTITY) {
        this.QUANTITY = QUANTITY;
    }

    public int getPRICE() {
        return PRICE;
    }

    public void setPRICE(int PRICE) {
        this.PRICE = PRICE;
    }

    public String getPRODUCT_NAME() {
        return PRODUCT_NAME;
    }

    public void setPRODUCT_NAME(String PRODUCT_NAME) {
        this.PRODUCT_NAME = PRODUCT_NAME;
    }
    
}
