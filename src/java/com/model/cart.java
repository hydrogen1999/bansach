/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

import java.util.TreeMap;

/**
 *
 * @author ThinhNguyenCong
 */
public class cart {

    private TreeMap<product, Integer> list;
    private long cartID;

    public TreeMap<product, Integer> getList() {
        return list;
    }

    public void setList(TreeMap<product, Integer> list) {
        this.list = list;
    }

    public long getCartID() {
        return cartID;
    }

    public void setCartID(long cartID) {
        this.cartID = cartID;
    }

    public cart() {
        list = new TreeMap<>();
        cartID = System.currentTimeMillis();
    }

    public cart(TreeMap<product, Integer> list, long cartID) {
        this.list = list;
        this.cartID = cartID;
    }

    public void addToCart(product pd, int number) {
        boolean bln = list.containsKey(pd);
        if (bln) {
            int s1=list.get(pd);
            number +=s1;
            list.put(pd, number);
        } else {
            list.put(pd, number);
        }
    }
    
    public void subToCart(product pd, int number){
        boolean bln = list.containsKey(pd);
        if (bln) {
            int s1=list.get(pd);
            number = s1-number;
            if(number<0){
                list.remove(pd);
            }else{
                list.remove(pd);
                list.put(pd, number);
            }
            
        }
    }
    public void removeToCart(product pd){
        boolean bln = list.containsKey(pd);
        if (bln) {
            list.remove(pd);
        }
    }
}
