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
public class user {
    private int USER_ID;
    private String USER_NAME;
    private String EMAIL;
    private int PHONE;
    private String PASSWORD;
    
    public user(String EMAIL, String PASSWORD) {
        this.EMAIL = EMAIL;
        this.PASSWORD = PASSWORD;
    }

    public user(int USER_ID, String USER_NAME, int PHONE, String PASSWORD) {
        this.USER_ID = USER_ID;
        this.USER_NAME = USER_NAME;
        this.PHONE = PHONE;
        this.PASSWORD = PASSWORD;
    }
    
    public user(int USER_ID, String USER_NAME, String EMAIL, int PHONE, String PASSWORD) {
        this.USER_ID = USER_ID;
        this.USER_NAME = USER_NAME;
        this.EMAIL = EMAIL;
        this.PHONE = PHONE;
        this.PASSWORD = PASSWORD;
    }


    public user(String USER_NAME, String EMAIL, int PHONE, String PASSWORD) {
        this.USER_NAME = USER_NAME;
        this.EMAIL = EMAIL;
        this.PHONE = PHONE;
        this.PASSWORD = PASSWORD;
    }

    public int getUSER_ID() {
        return USER_ID;
    }

    public void setUSER_ID(int USER_ID) {
        this.USER_ID = USER_ID;
    }

    public String getUSER_NAME() {
        return USER_NAME;
    }

    public void setUSER_NAME(String USER_NAME) {
        this.USER_NAME = USER_NAME;
    }

    public String getEMAIL() {
        return EMAIL;
    }

    public void setEMAIL(String EMAIL) {
        this.EMAIL = EMAIL;
    }

    public int getPHONE() {
        return PHONE;
    }

    public void setPHONE(int PHONE) {
        this.PHONE = PHONE;
    }

    public String getPASSWORD() {
        return PASSWORD;
    }

    public void setPASSWORD(String PASSWORD) {
        this.PASSWORD = PASSWORD;
    }
}
