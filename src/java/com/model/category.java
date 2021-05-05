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
public class category {
    private int CATEGORY_ID;
    private String CATEGORY_NAME;

    public category(String CATEGORY_NAME) {
        this.CATEGORY_NAME = CATEGORY_NAME;
    }

    
    public category(int CATEGORY_ID, String CATEGORY_NAME) {
        this.CATEGORY_ID = CATEGORY_ID;
        this.CATEGORY_NAME = CATEGORY_NAME;
    }

    public int getCATEGORY_ID() {
        return CATEGORY_ID;
    }

    public void setCATEGORY_ID(int CATEGORY_ID) {
        this.CATEGORY_ID = CATEGORY_ID;
    }

    public String getCATEGORY_NAME() {
        return CATEGORY_NAME;
    }

    public void setCATEGORY_NAME(String CATEGORY_NAME) {
        this.CATEGORY_NAME = CATEGORY_NAME;
    }
}
