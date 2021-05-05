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
public class author {
    private int AUTHOR_ID;
    private String AUTHOR_NAME;
    private String OTHER_AUTHOR;

    public author(int AUTHOR_ID, String AUTHOR_NAME, String OTHER_AUTHOR) {
        this.AUTHOR_ID = AUTHOR_ID;
        this.AUTHOR_NAME = AUTHOR_NAME;
        this.OTHER_AUTHOR = OTHER_AUTHOR;
    }

    public author(String AUTHOR_NAME, String OTHER_AUTHOR) {
        this.AUTHOR_NAME = AUTHOR_NAME;
        this.OTHER_AUTHOR = OTHER_AUTHOR;
    }
    
    public int getAUTHOR_ID() {
        return AUTHOR_ID;
    }

    public void setAUTHOR_ID(int AUTHOR_ID) {
        this.AUTHOR_ID = AUTHOR_ID;
    }

    public String getAUTHOR_NAME() {
        return AUTHOR_NAME;
    }

    public void setAUTHOR_NAME(String AUTHOR_NAME) {
        this.AUTHOR_NAME = AUTHOR_NAME;
    }

    public String getOTHER_AUTHOR() {
        return OTHER_AUTHOR;
    }

    public void setOTHER(String OTHER) {
        this.OTHER_AUTHOR = OTHER_AUTHOR;
    }
}
