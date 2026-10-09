package com.tap.model;

import java.sql.Timestamp;

public class Cart {

    private int cartId;
    private int userId;
    private Timestamp createdDate;

    public Cart() {
    }

    public Cart(int cartId, int userId, Timestamp createdDate) {
        this.cartId = cartId;
        this.userId = userId;
        this.createdDate = createdDate;
    }

    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Timestamp getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Timestamp createdDate) {
        this.createdDate = createdDate;
    }
}
