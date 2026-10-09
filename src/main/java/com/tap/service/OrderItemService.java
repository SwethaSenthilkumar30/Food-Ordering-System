package com.tap.service;

import java.util.List;

import com.tap.DAO.OrderItemDAO;
import com.tap.DAOimple.OrderItemDAOImpl;
import com.tap.model.OrderItem;

public class OrderItemService {

    private OrderItemDAO orderItemDAO;

    public OrderItemService() {
        orderItemDAO = new OrderItemDAOImpl();
    }

    public void addOrderItem(OrderItem orderItem) {
        orderItemDAO.addOrderItem(orderItem);
    }

    public OrderItem getOrderItem(int orderItemId) {
        return orderItemDAO.getOrderItem(orderItemId);
    }

    public List<OrderItem> getAllOrderItems() {
        return orderItemDAO.getAllOrderItems();
    }

    public List<OrderItem> getOrderItemsByOrder(int orderId) {
        return orderItemDAO.getOrderItemsByOrder(orderId);
    }

    public void updateOrderItem(OrderItem orderItem) {
        orderItemDAO.updateOrderItem(orderItem);
    }

    public void deleteOrderItem(int orderItemId) {
        orderItemDAO.deleteOrderItem(orderItemId);
    }
}
