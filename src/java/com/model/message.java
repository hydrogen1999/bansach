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
public class message {
    private int MESS_ID;
    private String EMAIL;
    private String MESSAGE;

    public message(String EMAIL, String MESSAGE) {
        this.EMAIL = EMAIL;
        this.MESSAGE = MESSAGE;
    }
    
    public int getMESS_ID() {
        return MESS_ID;
    }

    public void setMESS_ID(int MESS_ID) {
        this.MESS_ID = MESS_ID;
    }

    public String getEMAIL() {
        return EMAIL;
    }

    public void setEMAIL(String EMAIL) {
        this.EMAIL = EMAIL;
    }

    public String getMESSAGE() {
        return MESSAGE;
    }

    public void setMESSAGE(String MESSAGE) {
        this.MESSAGE = MESSAGE;
    }

    public message(int MESS_ID, String EMAIL, String MESSAGE) {
        this.MESS_ID = MESS_ID;
        this.EMAIL = EMAIL;
        this.MESSAGE = MESSAGE;
    }
    
}
