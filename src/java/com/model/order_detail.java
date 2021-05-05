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
public class order_detail {
    private int ID;
    private orders ORDER;
    private int PRODUCT_ID;
    private int QUANTITY;
    private int PRICE;

    public order_detail(int ID, orders ORDER, int PRODUCT_ID, int QUANTITY, int PRICE) {
        this.ID = ID;
        this.ORDER = ORDER;
        this.PRODUCT_ID = PRODUCT_ID;
        this.QUANTITY = QUANTITY;
        this.PRICE = PRICE;
    }

   
    

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public orders getORDER() {
        return ORDER;
    }

    public void setORDER(orders ORDER) {
        this.ORDER = ORDER;
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
    
}
