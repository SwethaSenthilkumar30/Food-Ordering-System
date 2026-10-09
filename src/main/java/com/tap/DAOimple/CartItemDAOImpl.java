package com.tap.DAOimple;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAO.CartItemDAO;
import com.tap.model.CartItem;
import com.tap.utility.DBConnection;

public class CartItemDAOImpl implements CartItemDAO {

    @Override
    public void addCartItem(CartItem cartItem) {

        String sql = "INSERT INTO cartitem "
                + "(cartId, menuId, quantity) "
                + "VALUES (?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, cartItem.getCartId());
            ps.setInt(2, cartItem.getMenuId());
            ps.setInt(3, cartItem.getQuantity());

            ps.executeUpdate();

            System.out.println("Cart item added successfully");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public CartItem getCartItem(int cartItemId) {

        String sql = "SELECT * FROM cartitem WHERE cartItemId = ?";

        CartItem cartItem = null;

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, cartItemId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                cartItem = new CartItem();

                cartItem.setCartItemId(rs.getInt("cartItemId"));
                cartItem.setCartId(rs.getInt("cartId"));
                cartItem.setMenuId(rs.getInt("menuId"));
                cartItem.setQuantity(rs.getInt("quantity"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return cartItem;
    }

    @Override
    public List<CartItem> getAllCartItems() {

        String sql = "SELECT * FROM cartitem";

        List<CartItem> cartItems = new ArrayList<>();

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                CartItem cartItem = new CartItem();

                cartItem.setCartItemId(rs.getInt("cartItemId"));
                cartItem.setCartId(rs.getInt("cartId"));
                cartItem.setMenuId(rs.getInt("menuId"));
                cartItem.setQuantity(rs.getInt("quantity"));

                cartItems.add(cartItem);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return cartItems;
    }

    @Override
    public List<CartItem> getCartItemsByCart(int cartId) {

        String sql = "SELECT * FROM cartitem WHERE cartId = ?";

        List<CartItem> cartItems = new ArrayList<>();

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, cartId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                CartItem cartItem = new CartItem();

                cartItem.setCartItemId(rs.getInt("cartItemId"));
                cartItem.setCartId(rs.getInt("cartId"));
                cartItem.setMenuId(rs.getInt("menuId"));
                cartItem.setQuantity(rs.getInt("quantity"));

                cartItems.add(cartItem);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return cartItems;
    }

    @Override
    public void updateCartItem(CartItem cartItem) {

        String sql = "UPDATE cartitem SET "
                + "cartId=?, menuId=?, quantity=? "
                + "WHERE cartItemId=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, cartItem.getCartId());
            ps.setInt(2, cartItem.getMenuId());
            ps.setInt(3, cartItem.getQuantity());
            ps.setInt(4, cartItem.getCartItemId());

            ps.executeUpdate();

            System.out.println("Cart item updated successfully");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteCartItem(int cartItemId) {

        String sql = "DELETE FROM cartitem WHERE cartItemId = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, cartItemId);

            ps.executeUpdate();

            System.out.println("Cart item deleted successfully");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void clearCart(int cartId) {

        String sql = "DELETE FROM cartitem WHERE cartId = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, cartId);

            ps.executeUpdate();

            System.out.println("Cart cleared successfully");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    @Override
    public CartItem getCartItemByCartAndMenu(int cartId, int menuId) {

        String sql = "SELECT * FROM cartitem WHERE cartId = ? AND menuId = ?";

        CartItem cartItem = null;

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, cartId);
            ps.setInt(2, menuId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                cartItem = new CartItem();

                cartItem.setCartItemId(rs.getInt("cartItemId"));
                cartItem.setCartId(rs.getInt("cartId"));
                cartItem.setMenuId(rs.getInt("menuId"));
                cartItem.setQuantity(rs.getInt("quantity"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return cartItem;
    }
}
