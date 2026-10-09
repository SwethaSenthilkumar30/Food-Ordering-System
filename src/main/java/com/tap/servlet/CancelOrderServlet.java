package com.tap.servlet;

import java.io.IOException;

import com.tap.model.Order;
import com.tap.model.User;
import com.tap.service.OrderService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/cancelOrder")
public class CancelOrderServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private OrderService orderService;

    @Override
    public void init() throws ServletException {
        orderService = new OrderService();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
                          throws ServletException, IOException {

        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.html");
            return;
        }

        String orderIdParameter =
                request.getParameter("orderId");

        if (orderIdParameter == null ||
            orderIdParameter.isEmpty()) {

            response.sendRedirect("order");
            return;
        }

        int orderId =
                Integer.parseInt(orderIdParameter);

        Order order =
                orderService.getOrder(orderId);

        if (order == null) {
            response.sendRedirect("order");
            return;
        }

        // User can cancel only their own order

        if (order.getUserId() != user.getId()) {
            response.sendRedirect("order");
            return;
        }

        // Cancel only when order is Preparing

        if ("Preparing".equalsIgnoreCase(order.getStatus())) {

            order.setStatus("Cancelled");

            orderService.updateOrder(order);
        }

        response.sendRedirect("order");
    }
}
