package com.tap.service;

import com.tap.DAO.CartDAO;
import com.tap.DAOimple.CartDAOImpl;
import com.tap.model.Cart;

public class CartService {

    private CartDAO cartDAO;

    public CartService() {
        cartDAO = new CartDAOImpl();
    }

    public void addCart(Cart cart) {
        cartDAO.addCart(cart);
    }

    public Cart getCart(int cartId) {
        return cartDAO.getCart(cartId);
    }

    public Cart getCartByUser(int userId) {
        return cartDAO.getCartByUser(userId);
    }

    public void updateCart(Cart cart) {
        cartDAO.updateCart(cart);
    }

    public void deleteCart(int cartId) {
        cartDAO.deleteCart(cartId);
    }
}