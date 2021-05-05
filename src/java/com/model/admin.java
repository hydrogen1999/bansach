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
public class admin {
    private int ADMIN_ID;
    private String ADMIN_NAME;
    private String EMAIL;
    private int PHONE;
    private String PASSWORD;
    private String TYPE;

    public admin(int ADMIN_ID, String ADMIN_NAME, int PHONE, String PASSWORD) {
        this.ADMIN_ID = ADMIN_ID;
        this.ADMIN_NAME = ADMIN_NAME;
        this.PHONE = PHONE;
        this.PASSWORD = PASSWORD;
    }

    
    public admin(int ADMIN_ID, String ADMIN_NAME, String EMAIL, int PHONE, String PASSWORD, String TYPE) {
        this.ADMIN_ID = ADMIN_ID;
        this.ADMIN_NAME = ADMIN_NAME;
        this.EMAIL = EMAIL;
        this.PHONE = PHONE;
        this.PASSWORD = PASSWORD;
        this.TYPE = TYPE;
    }

    public admin(String EMAIL, String PASSWORD, String TYPE) {
        this.EMAIL = EMAIL;
        this.PASSWORD = PASSWORD;
        this.TYPE = TYPE;
    }

    public admin(String ADMIN_NAME, String EMAIL, int PHONE, String PASSWORD, String TYPE) {
        this.ADMIN_NAME = ADMIN_NAME;
        this.EMAIL = EMAIL;
        this.PHONE = PHONE;
        this.PASSWORD = PASSWORD;
        this.TYPE = TYPE;
    }
    
    public int getADMIN_ID() {
        return ADMIN_ID;
    }

    public void setADMIN_ID(int ADMIN_ID) {
        this.ADMIN_ID = ADMIN_ID;
    }

    public String getADMIN_NAME() {
        return ADMIN_NAME;
    }

    public void setADMIN_NAME(String ADMIN_NAME) {
        this.ADMIN_NAME = ADMIN_NAME;
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

    public String getTYPE() {
        return TYPE;
    }

    public void setTYPE(String TYPE) {
        this.TYPE = TYPE;
    }
    
}
