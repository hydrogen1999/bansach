/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

import java.sql.Date;
import java.sql.Timestamp;

/**
 *
 * @author ThinhNguyenCong
 */
public class orders {
    private String ORDER_ID;
    private int USER_ID;
    private Timestamp DATE;
    private int TOTAL;
    private String METHOD;
    private String DIACHI;
    private String STATUS;
    private String USER_NAME;

    public orders(String ORDER_ID, String STATUS) {
        this.ORDER_ID = ORDER_ID;
        this.STATUS = STATUS;
    }

    
    public orders(String ORDER_ID, int USER_ID, Timestamp DATE, int TOTAL, String METHOD, String DIACHI, String STATUS, String USER_NAME) {
        this.ORDER_ID = ORDER_ID;
        this.USER_ID = USER_ID;
        this.DATE = DATE;
        this.TOTAL = TOTAL;
        this.METHOD = METHOD;
        this.DIACHI = DIACHI;
        this.STATUS = STATUS;
        this.USER_NAME = USER_NAME;
    }

    public orders(int USER_ID, Timestamp DATE, int TOTAL, String METHOD, String DIACHI, String STATUS) {
        this.USER_ID = USER_ID;
        this.DATE = DATE;
        this.TOTAL = TOTAL;
        this.METHOD = METHOD;
        this.DIACHI = DIACHI;
        this.STATUS = STATUS;
    }

    public String getSTATUS() {
        return STATUS;
    }

    public void setSTATUS(String STATUS) {
        this.STATUS = STATUS;
    }

    public String getDIACHI() {
        return DIACHI;
    }

    public void setDIACHI(String DIACHI) {
        this.DIACHI = DIACHI;
    }

    public String getUSER_NAME() {
        return USER_NAME;
    }

    public void setUSER_NAME(String USER_NAME) {
        this.USER_NAME = USER_NAME;
    }

    public orders(String ORDER_ID, int USER_ID, Timestamp DATE, int TOTAL, String METHOD, String DIACHI, String STATUS) {
        this.ORDER_ID = ORDER_ID;
        this.USER_ID=USER_ID;
        this.DATE = DATE;
        this.TOTAL = TOTAL;
        this.METHOD = METHOD;
        this.DIACHI=DIACHI;
        this.STATUS=STATUS;
    }

    public orders(String ORDER_ID, String USER_NAME, int TOTAL) {
        this.ORDER_ID = ORDER_ID;
        this.USER_NAME=USER_NAME;
        this.TOTAL = TOTAL;
    }

    public String getORDER_ID() {
        return ORDER_ID;
    }

    public void setORDER_ID(String ORDER_ID) {
        this.ORDER_ID = ORDER_ID;
    }

    public int getUSER_ID() {
        return USER_ID;
    }

    public void setUSER_ID(int USER_ID) {
        this.USER_ID=USER_ID;
    }

    public Timestamp getDATE() {
        return DATE;
    }

    public void setDATE(Timestamp DATE) {
        this.DATE = DATE;
    }

    public int getTOTAL() {
        return TOTAL;
    }

    public void setTOTAL(int TOTAL) {
        this.TOTAL = TOTAL;
    }

    public String getMETHOD() {
        return METHOD;
    }

    public void setMETHOD(String METHOD) {
        this.METHOD = METHOD;
    }
}
