package com.tap.DAOimple;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.tap.DAO.CartDAO;
import com.tap.model.Cart;
import com.tap.utility.DBConnection;

public class CartDAOImpl implements CartDAO {

    @Override
    public void addCart(Cart cart) {

        String sql = "INSERT INTO cart (userId) VALUES (?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, cart.getUserId());

            ps.executeUpdate();

            System.out.println("Cart added successfully");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public Cart getCart(int cartId) {

        String sql = "SELECT * FROM cart WHERE cartId = ?";

        Cart cart = null;

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, cartId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                cart = new Cart();

                cart.setCartId(rs.getInt("cartId"));
                cart.setUserId(rs.getInt("userId"));
                cart.setCreatedDate(rs.getTimestamp("createdDate"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return cart;
    }

    @Override
    public Cart getCartByUser(int userId) {

        String sql = "SELECT * FROM cart WHERE userId = ?";

        Cart cart = null;

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                cart = new Cart();

                cart.setCartId(rs.getInt("cartId"));
                cart.setUserId(rs.getInt("userId"));
                cart.setCreatedDate(rs.getTimestamp("createdDate"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return cart;
    }

    @Override
    public void updateCart(Cart cart) {

        String sql = "UPDATE cart SET userId = ? WHERE cartId = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, cart.getUserId());
            ps.setInt(2, cart.getCartId());

            ps.executeUpdate();

            System.out.println("Cart updated successfully");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteCart(int cartId) {

        String sql = "DELETE FROM cart WHERE cartId = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, cartId);

            ps.executeUpdate();

            System.out.println("Cart deleted successfully");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}