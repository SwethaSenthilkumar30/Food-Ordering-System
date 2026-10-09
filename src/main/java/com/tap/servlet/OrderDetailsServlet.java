package com.tap.servlet;

import java.io.IOException;
import java.util.List;

import com.tap.model.Menu;
import com.tap.model.Order;
import com.tap.model.OrderItem;
import com.tap.model.Restaurant;
import com.tap.model.User;
import com.tap.service.MenuService;
import com.tap.service.OrderItemService;
import com.tap.service.OrderService;
import com.tap.service.RestaurantService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/orderDetails")
public class OrderDetailsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private OrderService orderService;
    private OrderItemService orderItemService;
    private MenuService menuService;
    private RestaurantService restaurantService;

    @Override
    public void init() throws ServletException {

        orderService = new OrderService();
        orderItemService = new OrderItemService();
        menuService = new MenuService();
        restaurantService = new RestaurantService();
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

        // Security check:
        // User can only view their own order

        if (order.getUserId() != user.getId()) {
            response.sendRedirect("order");
            return;
        }

        List<OrderItem> orderItems =
                orderItemService.getOrderItemsByOrder(orderId);

        Restaurant restaurant =
                restaurantService.getRestaurant(
                        order.getRestaurantId());

        request.setAttribute("order", order);
        request.setAttribute("orderItems", orderItems);
        request.setAttribute("restaurant", restaurant);

        request.getRequestDispatcher(
                "order-details.jsp")
                .forward(request, response);
    }
}
