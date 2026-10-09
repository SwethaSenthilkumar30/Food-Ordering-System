package com.tap.DAOimple;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAO.OrderItemDAO;
import com.tap.model.OrderItem;
import com.tap.utility.DBConnection;

public class OrderItemDAOImpl implements OrderItemDAO {

    @Override
    public void addOrderItem(OrderItem orderItem) {

        String sql = "INSERT INTO orderitem " +
                "(orderId, menuId, quantity, price) " +
                "VALUES (?, ?, ?, ?)";

        try {
            Connection connection = DBConnection.getConnection();

            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setInt(1, orderItem.getOrderId());
            ps.setInt(2, orderItem.getMenuId());
            ps.setInt(3, orderItem.getQuantity());
            ps.setDouble(4, orderItem.getPrice());

            ps.executeUpdate();

            System.out.println("Order item added successfully");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public OrderItem getOrderItem(int orderItemId) {

        String sql = "SELECT * FROM orderitem WHERE orderItemId = ?";

        OrderItem orderItem = null;

        try {
            Connection connection = DBConnection.getConnection();

            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setInt(1, orderItemId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                orderItem = new OrderItem();

                orderItem.setOrderItemId(rs.getInt("orderItemId"));
                orderItem.setOrderId(rs.getInt("orderId"));
                orderItem.setMenuId(rs.getInt("menuId"));
                orderItem.setQuantity(rs.getInt("quantity"));
                orderItem.setPrice(rs.getDouble("price"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return orderItem;
    }

    @Override
    public List<OrderItem> getAllOrderItems() {

        String sql = "SELECT * FROM orderitem";

        List<OrderItem> orderItems = new ArrayList<>();

        try {
            Connection connection = DBConnection.getConnection();

            PreparedStatement ps = connection.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                OrderItem orderItem = new OrderItem();

                orderItem.setOrderItemId(rs.getInt("orderItemId"));
                orderItem.setOrderId(rs.getInt("orderId"));
                orderItem.setMenuId(rs.getInt("menuId"));
                orderItem.setQuantity(rs.getInt("quantity"));
                orderItem.setPrice(rs.getDouble("price"));

                orderItems.add(orderItem);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return orderItems;
    }

    @Override
    public List<OrderItem> getOrderItemsByOrder(int orderId) {

        String sql = "SELECT * FROM orderitem WHERE orderId = ?";

        List<OrderItem> orderItems = new ArrayList<>();

        try {
            Connection connection = DBConnection.getConnection();

            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setInt(1, orderId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                OrderItem orderItem = new OrderItem();

                orderItem.setOrderItemId(rs.getInt("orderItemId"));
                orderItem.setOrderId(rs.getInt("orderId"));
                orderItem.setMenuId(rs.getInt("menuId"));
                orderItem.setQuantity(rs.getInt("quantity"));
                orderItem.setPrice(rs.getDouble("price"));

                orderItems.add(orderItem);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return orderItems;
    }

    @Override
    public void updateOrderItem(OrderItem orderItem) {

        String sql = "UPDATE orderitem SET " +
                "orderId = ?, menuId = ?, quantity = ?, price = ? " +
                "WHERE orderItemId = ?";

        try {
            Connection connection = DBConnection.getConnection();

            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setInt(1, orderItem.getOrderId());
            ps.setInt(2, orderItem.getMenuId());
            ps.setInt(3, orderItem.getQuantity());
            ps.setDouble(4, orderItem.getPrice());
            ps.setInt(5, orderItem.getOrderItemId());

            ps.executeUpdate();

            System.out.println("Order item updated successfully");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteOrderItem(int orderItemId) {

        String sql = "DELETE FROM orderitem WHERE orderItemId = ?";

        try {
            Connection connection = DBConnection.getConnection();

            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setInt(1, orderItemId);

            ps.executeUpdate();

            System.out.println("Order item deleted successfully");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
