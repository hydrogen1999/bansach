/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

import java.sql.Timestamp;

/**
 *
 * @author ThinhNguyenCong
 */
public class review {
    private int REVIEW_ID;
    private String USER_NAME;
    private int PRODUCT_ID;
    private String EMAIL;
    private String CONTENT;
    private int RATE;
    private Timestamp DATE;

    public review(int REVIEW_ID, String USER_NAME, int PRODUCT_ID, String EMAIL, String CONTENT, int RATE, Timestamp DATE) {
        this.REVIEW_ID = REVIEW_ID;
        this.USER_NAME = USER_NAME;
        this.PRODUCT_ID = PRODUCT_ID;
        this.EMAIL = EMAIL;
        this.CONTENT = CONTENT;
        this.RATE = RATE;
        this.DATE = DATE;
    }

    public review(String USER_NAME, int PRODUCT_ID, String EMAIL, String CONTENT, int RATE, Timestamp DATE) {
        this.USER_NAME = USER_NAME;
        this.PRODUCT_ID = PRODUCT_ID;
        this.EMAIL = EMAIL;
        this.CONTENT = CONTENT;
        this.RATE = RATE;
        this.DATE = DATE;
    }
    

    public Timestamp getDATE() {
        return DATE;
    }

    public void setDATE(Timestamp DATE) {
        this.DATE = DATE;
    }

    
    
    public int getREVIEW_ID() {
        return REVIEW_ID;
    }

    public void setREVIEW_ID(int REVIEW_ID) {
        this.REVIEW_ID = REVIEW_ID;
    }

    public String getUSER_NAME() {
        return USER_NAME;
    }

    public void setUSER_NAME(String USER_NAME) {
        this.USER_NAME = USER_NAME;
    }

    public int getPRODUCT_ID() {
        return PRODUCT_ID;
    }

    public void setPRODUCT_ID(int PRODUCT_ID) {
        this.PRODUCT_ID = PRODUCT_ID;
    }

    public String getEMAIL() {
        return EMAIL;
    }

    public void setEMAIL(String EMAIL) {
        this.EMAIL = EMAIL;
    }

    public String getCONTENT() {
        return CONTENT;
    }

    public void setCONTENT(String CONTENT) {
        this.CONTENT = CONTENT;
    }

    public int getRATE() {
        return RATE;
    }

    public void setRATE(int RATE) {
        this.RATE = RATE;
    }
    
}
