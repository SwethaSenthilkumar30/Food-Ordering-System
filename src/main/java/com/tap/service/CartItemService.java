package com.tap.service;

import java.util.List;

import com.tap.DAO.CartItemDAO;
import com.tap.DAOimple.CartItemDAOImpl;
import com.tap.model.CartItem;

public class CartItemService {

    private CartItemDAO cartItemDAO;

    public CartItemService() {
        cartItemDAO = new CartItemDAOImpl();
    }

    public void addCartItem(CartItem cartItem) {
        cartItemDAO.addCartItem(cartItem);
    }

    public CartItem getCartItem(int cartItemId) {
        return cartItemDAO.getCartItem(cartItemId);
    }

    public List<CartItem> getAllCartItems() {
        return cartItemDAO.getAllCartItems();
    }

    public List<CartItem> getCartItemsByCart(int cartId) {
        return cartItemDAO.getCartItemsByCart(cartId);
    }

    public void updateCartItem(CartItem cartItem) {
        cartItemDAO.updateCartItem(cartItem);
    }

    public void deleteCartItem(int cartItemId) {
        cartItemDAO.deleteCartItem(cartItemId);
    }

    public void clearCart(int cartId) {
        cartItemDAO.clearCart(cartId);
    }

    public CartItem getCartItemByCartAndMenu(int cartId, int menuId) {
        return cartItemDAO.getCartItemByCartAndMenu(cartId, menuId);
    }
}