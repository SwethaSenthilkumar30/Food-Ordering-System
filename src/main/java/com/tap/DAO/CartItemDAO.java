package com.tap.DAO;

import java.util.List;

import com.tap.model.CartItem;

public interface CartItemDAO {

    void addCartItem(CartItem cartItem);

    CartItem getCartItem(int cartItemId);

    List<CartItem> getAllCartItems();

    List<CartItem> getCartItemsByCart(int cartId);

    void updateCartItem(CartItem cartItem);

    void deleteCartItem(int cartItemId);

    void clearCart(int cartId);
    
    CartItem getCartItemByCartAndMenu(int cartId, int menuId);
}
