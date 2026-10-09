package com.tap.DAOimple;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAO.OrderDAO;
import com.tap.model.Order;
import com.tap.utility.DBConnection;

public class OrderDAOImpl implements OrderDAO {

	@Override
	public int addOrder(Order order) {

	    String sql = "INSERT INTO orders " +
	            "(userId, restaurantId, cartId, totalAmount, paymentMethod, status) " +
	            "VALUES (?, ?, ?, ?, ?, ?)";

	    int orderId = 0;

	    try {
	        Connection connection = DBConnection.getConnection();

	        PreparedStatement ps = connection.prepareStatement(
	                sql,
	                java.sql.Statement.RETURN_GENERATED_KEYS
	        );

	        ps.setInt(1, order.getUserId());
	        ps.setInt(2, order.getRestaurantId());
	        ps.setInt(3, order.getCartId());
	        ps.setDouble(4, order.getTotalAmount());
	        ps.setString(5, order.getPaymentMethod());
	        ps.setString(6, order.getStatus());

	        ps.executeUpdate();

	        ResultSet rs = ps.getGeneratedKeys();

	        if (rs.next()) {
	            orderId = rs.getInt(1);
	        }

	        System.out.println("Order added successfully");
	        System.out.println("Order ID: " + orderId);

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return orderId;
	}

    @Override
    public Order getOrder(int orderId) {

        String sql = "SELECT * FROM orders WHERE orderId = ?";

        Order order = null;

        try {
            Connection connection = DBConnection.getConnection();

            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setInt(1, orderId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                order = new Order();

                order.setOrderId(rs.getInt("orderId"));
                order.setUserId(rs.getInt("userId"));
                order.setRestaurantId(rs.getInt("restaurantId"));
                order.setCartId(rs.getInt("cartId"));
                order.setOrderDate(rs.getTimestamp("orderDate"));
                order.setTotalAmount(rs.getDouble("totalAmount"));
                order.setPaymentMethod(rs.getString("paymentMethod"));
                order.setStatus(rs.getString("status"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return order;
    }

    @Override
    public List<Order> getAllOrders() {

        String sql = "SELECT * FROM orders";

        List<Order> orders = new ArrayList<>();

        try {
            Connection connection = DBConnection.getConnection();

            PreparedStatement ps = connection.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Order order = new Order();

                order.setOrderId(rs.getInt("orderId"));
                order.setUserId(rs.getInt("userId"));
                order.setRestaurantId(rs.getInt("restaurantId"));
                order.setCartId(rs.getInt("cartId"));
                order.setOrderDate(rs.getTimestamp("orderDate"));
                order.setTotalAmount(rs.getDouble("totalAmount"));
                order.setPaymentMethod(rs.getString("paymentMethod"));
                order.setStatus(rs.getString("status"));

                orders.add(order);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return orders;
    }

    @Override
    public List<Order> getOrdersByUser(int userId) {

        String sql = "SELECT * FROM orders WHERE userId = ?";

        List<Order> orders = new ArrayList<>();

        try {
            Connection connection = DBConnection.getConnection();

            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Order order = new Order();

                order.setOrderId(rs.getInt("orderId"));
                order.setUserId(rs.getInt("userId"));
                order.setRestaurantId(rs.getInt("restaurantId"));
                order.setCartId(rs.getInt("cartId"));
                order.setOrderDate(rs.getTimestamp("orderDate"));
                order.setTotalAmount(rs.getDouble("totalAmount"));
                order.setPaymentMethod(rs.getString("paymentMethod"));
                order.setStatus(rs.getString("status"));

                orders.add(order);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return orders;
    }

    @Override
    public void updateOrder(Order order) {

        String sql = "UPDATE orders SET status = ? WHERE orderId = ?";

        try {

            Connection connection = DBConnection.getConnection();

            PreparedStatement ps =
                    connection.prepareStatement(sql);

            ps.setString(1, order.getStatus());
            ps.setInt(2, order.getOrderId());

            int rowsUpdated = ps.executeUpdate();

            if (rowsUpdated > 0) {

                System.out.println(
                        "Order status updated successfully"
                );

                System.out.println(
                        "Order ID: " + order.getOrderId()
                );

                System.out.println(
                        "New Status: " + order.getStatus()
                );

            } else {

                System.out.println(
                        "No order found for ID: "
                        + order.getOrderId()
                );
            }

        } catch (Exception e) {

            e.printStackTrace();
        }
    }
    @Override
    public void deleteOrder(int orderId) {

        String sql = "DELETE FROM orders WHERE orderId = ?";

        try {
            Connection connection = DBConnection.getConnection();

            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setInt(1, orderId);

            ps.executeUpdate();

            System.out.println("Order deleted successfully");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}