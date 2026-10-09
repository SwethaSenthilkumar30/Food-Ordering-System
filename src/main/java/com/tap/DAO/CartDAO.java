package com.tap.DAO;

import com.tap.model.Cart;

public interface CartDAO {

    void addCart(Cart cart);

    Cart getCart(int cartId);

    Cart getCartByUser(int userId);

    void updateCart(Cart cart);

    void deleteCart(int cartId);
}