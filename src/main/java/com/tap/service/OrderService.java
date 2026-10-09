package com.tap.service;

import java.util.List;

import com.tap.DAO.OrderDAO;
import com.tap.DAOimple.OrderDAOImpl;
import com.tap.model.Order;

public class OrderService {

    private OrderDAO orderDAO;

    public OrderService() {
        orderDAO = new OrderDAOImpl();
    }

    public int addOrder(Order order) {
        return orderDAO.addOrder(order);
    }

    public Order getOrder(int orderId) {
        return orderDAO.getOrder(orderId);
    }

    public List<Order> getAllOrders() {
        return orderDAO.getAllOrders();
    }

    public List<Order> getOrdersByUser(int userId) {
        return orderDAO.getOrdersByUser(userId);
    }

    public void updateOrder(Order order) {
        orderDAO.updateOrder(order);
    }

    public void deleteOrder(int orderId) {
        orderDAO.deleteOrder(orderId);
    }
    
}