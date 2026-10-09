package com.tap.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.tap.model.Cart;
import com.tap.model.CartItem;
import com.tap.model.Menu;
import com.tap.model.Order;
import com.tap.model.OrderItem;
import com.tap.model.User;
import com.tap.service.CartItemService;
import com.tap.service.CartService;
import com.tap.service.MenuService;
import com.tap.service.OrderItemService;
import com.tap.service.OrderService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/payment")
public class PaymentServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private CartService cartService;
    private CartItemService cartItemService;
    private MenuService menuService;
    private OrderService orderService;
    private OrderItemService orderItemService;

    @Override
    public void init() throws ServletException {

        cartService = new CartService();
        cartItemService = new CartItemService();
        menuService = new MenuService();
        orderService = new OrderService();
        orderItemService = new OrderItemService();
    }

    // GET - Open Payment Page
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

        // Get user's cart
        Cart cart = cartService.getCartByUser(userId);

        if (cart == null) {
            response.sendRedirect("cart");
            return;
        }

        int cartId = cart.getCartId();

        // Get cart items
        List<CartItem> cartItems =
                cartItemService.getCartItemsByCart(cartId);

        if (cartItems == null || cartItems.isEmpty()) {
            response.sendRedirect("cart");
            return;
        }

        // Get menu details
        List<Menu> menuItems =
                new ArrayList<>();

        for (CartItem cartItem : cartItems) {

            Menu menu =
                    menuService.getMenu(cartItem.getMenuId());

            if (menu != null) {
                menuItems.add(menu);
            }
        }

        // Send data to payment.jsp
        request.setAttribute("cart", cart);
        request.setAttribute("cartItems", cartItems);
        request.setAttribute("menuItems", menuItems);

        request.getRequestDispatcher("payment.jsp")
               .forward(request, response);
    }


    // POST - Place Order
    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
                          throws ServletException, IOException {

        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.html");
            return;
        }

        String paymentMethod =
                request.getParameter("paymentMethod");

        if (paymentMethod == null ||
            paymentMethod.isEmpty()) {

            response.sendRedirect("payment");
            return;
        }

        int userId = user.getId();

        Cart cart =
                cartService.getCartByUser(userId);

        if (cart == null) {
            response.sendRedirect("cart");
            return;
        }

        int cartId = cart.getCartId();

        List<CartItem> cartItems =
                cartItemService.getCartItemsByCart(cartId);

        if (cartItems == null ||
            cartItems.isEmpty()) {

            response.sendRedirect("cart");
            return;
        }

        double subtotal = 0;

        int restaurantId = 0;

        for (CartItem cartItem : cartItems) {

            Menu menu =
                    menuService.getMenu(
                            cartItem.getMenuId()
                    );

            if (menu != null) {

                subtotal =
                        subtotal +
                        (menu.getPrice()
                        * cartItem.getQuantity());

                restaurantId =
                        menu.getRestaurantId();
            }
        }

        double deliveryFee = 40;

        double tax =
                Math.round(subtotal * 0.05);

        double totalAmount =
                subtotal + deliveryFee + tax;


        // Create Order
        Order order = new Order();

        order.setUserId(userId);
        order.setRestaurantId(restaurantId);
        order.setCartId(cartId);
        order.setTotalAmount(totalAmount);
        order.setPaymentMethod(paymentMethod);
        order.setStatus("Preparing");

        int orderId =
                orderService.addOrder(order);


        // Create Order Items
        if (orderId > 0) {

            for (CartItem cartItem : cartItems) {

                Menu menu =
                        menuService.getMenu(
                                cartItem.getMenuId()
                        );

                if (menu != null) {

                    OrderItem orderItem =
                            new OrderItem();

                    orderItem.setOrderId(orderId);

                    orderItem.setMenuId(
                            cartItem.getMenuId()
                    );

                    orderItem.setQuantity(
                            cartItem.getQuantity()
                    );

                    orderItem.setPrice(
                            menu.getPrice()
                    );

                    orderItemService.addOrderItem(
                            orderItem
                    );
                }
            }

            // Clear cart after successful order
            cartItemService.clearCart(cartId);

            // Go to My Orders
            response.sendRedirect("order");

        } else {

            response.sendRedirect("payment");
        }
    }
}