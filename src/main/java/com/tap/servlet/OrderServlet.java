package com.tap.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

@WebServlet("/order")
public class OrderServlet extends HttpServlet {

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

        int userId = user.getId();

        // Get all orders of logged-in user
        List<Order> orders =
                orderService.getOrdersByUser(userId);

        // Store order items for each order
        Map<Integer, List<OrderItem>> orderItemsMap =
                new HashMap<>();

        // Store menu details
        Map<Integer, Menu> menuMap =
                new HashMap<>();

        // Store restaurant details
        Map<Integer, Restaurant> restaurantMap =
                new HashMap<>();

        for (Order order : orders) {

            int orderId = order.getOrderId();

            // Get order items
            List<OrderItem> orderItems =
                    orderItemService.getOrderItemsByOrder(orderId);

            orderItemsMap.put(orderId, orderItems);

            // Get menu details
            for (OrderItem orderItem : orderItems) {

                int menuId = orderItem.getMenuId();

                Menu menu =
                        menuService.getMenu(menuId);

                if (menu != null) {

                    menuMap.put(menuId, menu);
                }
            }

            // Get restaurant details
            int restaurantId =
                    order.getRestaurantId();

            Restaurant restaurant =
                    restaurantService.getRestaurant(restaurantId);

            if (restaurant != null) {

                restaurantMap.put(
                        restaurantId,
                        restaurant
                );
            }
        }

        request.setAttribute(
                "orders",
                orders
        );

        request.setAttribute(
                "orderItemsMap",
                orderItemsMap
        );

        request.setAttribute(
                "menuMap",
                menuMap
        );

        request.setAttribute(
                "restaurantMap",
                restaurantMap
        );

        request.getRequestDispatcher("order.jsp")
               .forward(request, response);
    }
}