/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

import java.sql.Blob;

/**
 *
 * @author ThinhNguyenCong
 */
public class product implements Comparable<product>{

    private int PRODUCT_ID;
    private String PRODUCT_NAME;
    private int PRICE;
    private String OTHER;
    private int NUMBER;
    private int AUTHOR_ID;
    private int CATEGORY_ID;
    private String STATUS;
    private float DISCOUNT;
    private String IMAGE;
    private String DESCRIPTION;
    private String AUTHOR_NAME;
    private int NEW_PRICE;
    private String CATEGORY_NAME;

    public product(int PRODUCT_ID, int NUMBER) {
        this.PRODUCT_ID = PRODUCT_ID;
        this.NUMBER = NUMBER;
    }
    
    public product(int PRODUCT_ID, String PRODUCT_NAME, int PRICE, String OTHER,int NUMBER, int AUTHOR_ID, int CATEGORY_ID, String STATUS, float DISCOUNT, String IMAGE,String DESCRIPTION) {
        this.PRODUCT_ID = PRODUCT_ID;
        this.PRODUCT_NAME = PRODUCT_NAME;
        this.PRICE = PRICE;
        this.OTHER = OTHER;
        this.NUMBER=NUMBER;
        this.AUTHOR_ID = AUTHOR_ID;
        this.CATEGORY_ID = CATEGORY_ID;
        this.STATUS = STATUS;
        this.DISCOUNT = DISCOUNT;
        this.IMAGE=IMAGE;
        this.DESCRIPTION=DESCRIPTION;
    }

    public product(int PRODUCT_ID, String PRODUCT_NAME, int PRICE, String OTHER,int NUMBER, int AUTHOR_ID, int CATEGORY_ID, String STATUS, float DISCOUNT, String IMAGE,String DESCRIPTION, String AUTHOR_NAME,int NEW_PRICE) {
        this.PRODUCT_ID = PRODUCT_ID;
        this.PRODUCT_NAME = PRODUCT_NAME;
        this.PRICE = PRICE;
        this.OTHER = OTHER;
        this.NUMBER=NUMBER;
        this.AUTHOR_ID = AUTHOR_ID;
        this.CATEGORY_ID = CATEGORY_ID;
        this.STATUS = STATUS;
        this.DISCOUNT = DISCOUNT;
        this.IMAGE = IMAGE;
        this.DESCRIPTION=DESCRIPTION;
        this.AUTHOR_NAME = AUTHOR_NAME;
        this.NEW_PRICE=NEW_PRICE;
    }

    public product() {
    }

    public product(int PRODUCT_ID, String PRODUCT_NAME, int PRICE, String OTHER, int NUMBER, int AUTHOR_ID, int CATEGORY_ID, String STATUS, float DISCOUNT, String IMAGE, String DESCRIPTION, String AUTHOR_NAME, String CATEGORY_NAME, int NEW_PRICE) {
        this.PRODUCT_ID = PRODUCT_ID;
        this.PRODUCT_NAME = PRODUCT_NAME;
        this.PRICE = PRICE;
        this.OTHER = OTHER;
        this.NUMBER = NUMBER;
        this.AUTHOR_ID = AUTHOR_ID;
        this.CATEGORY_ID = CATEGORY_ID;
        this.STATUS = STATUS;
        this.DISCOUNT = DISCOUNT;
        this.IMAGE = IMAGE;
        this.DESCRIPTION = DESCRIPTION;
        this.AUTHOR_NAME = AUTHOR_NAME;
        this.NEW_PRICE = NEW_PRICE;
        this.CATEGORY_NAME = CATEGORY_NAME;
    }

    public product(String PRODUCT_NAME, int PRICE, String OTHER, int NUMBER, int AUTHOR_ID, int CATEGORY_ID, String STATUS, float DISCOUNT, String IMAGE, String DESCRIPTION) {
        this.PRODUCT_NAME = PRODUCT_NAME;
        this.PRICE = PRICE;
        this.OTHER = OTHER;
        this.NUMBER = NUMBER;
        this.AUTHOR_ID = AUTHOR_ID;
        this.CATEGORY_ID = CATEGORY_ID;
        this.STATUS = STATUS;
        this.DISCOUNT = DISCOUNT;
        this.IMAGE = IMAGE;
        this.DESCRIPTION = DESCRIPTION;
    }

    
    public int getNEW_PRICE() {
        return NEW_PRICE;
    }

    public void setNEW_PRICE(int NEW_PRICE) {
        this.NEW_PRICE = NEW_PRICE;
    }


    public String getIMAGE() {
        return IMAGE;
    }

    public void setIMAGE(String IMAGE) {
        this.IMAGE = IMAGE;
    }
    
    public String getAUTHOR_NAME() {
        return AUTHOR_NAME;
    }

    public void setAUTHOR_NAME(String AUTHOR_NAME) {
        this.AUTHOR_NAME = AUTHOR_NAME;
    }

    public String getDESCRIPTION() {
        return DESCRIPTION;
    }

    public void setDESCRIPTION(String DESCRIPTION) {
        this.DESCRIPTION = DESCRIPTION;
    }
    
    

    public int getPRODUCT_ID() {
        return PRODUCT_ID;
    }

    public void setPRODUCT_ID(int PRODUCT_ID) {
        this.PRODUCT_ID = PRODUCT_ID;
    }

    public String getPRODUCT_NAME() {
        return PRODUCT_NAME;
    }

    public void setPRODUCT_NAME(String PRODUCT_NAME) {
        this.PRODUCT_NAME = PRODUCT_NAME;
    }

    public int getPRICE() {
        return PRICE;
    }

    public void setPRICE(int PRICE) {
        this.PRICE = PRICE;
    }

    public String getOTHER() {
        return OTHER;
    }

    public void setOTHER(String OTHER) {
        this.OTHER = OTHER;
    }

    public int getNUMBER() {
        return NUMBER;
    }

    public void setNUMBER(int NUMBER) {
        this.NUMBER = NUMBER;
    }
    
    public int getAUTHOR_ID() {
        return AUTHOR_ID;
    }

    public void setAUTHOR_ID(int AUTHOR_ID) {
        this.AUTHOR_ID = AUTHOR_ID;
    }

    public int getCATEGORY_ID() {
        return CATEGORY_ID;
    }

    public void setCATEGORY_ID(int CATEGORY_ID) {
        this.CATEGORY_ID = CATEGORY_ID;
    }

    public String getSTATUS() {
        return STATUS;
    }

    public void setSTATUS(String STATUS) {
        this.STATUS = STATUS;
    }

    public float getDISCOUNT() {
        return DISCOUNT;
    }

    public void setDISCOUNT(float DISCOUNT) {
        this.DISCOUNT = DISCOUNT;
    }

    public String getCATEGORY_NAME() {
        return CATEGORY_NAME;
    }

    public void setCATEGORY_NAME(String CATEGORY_NAME) {
        this.CATEGORY_NAME = CATEGORY_NAME;
    }
    

    @Override
    public int compareTo(product pd) {
        return this.PRODUCT_ID-pd.PRODUCT_ID;
    }
}
