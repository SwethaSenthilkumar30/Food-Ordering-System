package com.tap.servlet;

import java.io.IOException;
import java.util.List;

import com.tap.model.CartItem;
import com.tap.model.User;
import com.tap.service.CartItemService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/updateCartItem")
public class UpdateCartItemServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private CartItemService cartItemService;

    @Override
    public void init() throws ServletException {

        cartItemService = new CartItemService();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
                          throws ServletException, IOException {

        int cartItemId = Integer.parseInt(
                request.getParameter("cartItemId")
        );

        String action = request.getParameter("action");

        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("user");

        /*
         * =====================================================
         * GUEST CART
         * =====================================================
         */
        if (user == null) {

            List<CartItem> guestCart =
                    (List<CartItem>) session.getAttribute("guestCart");

            if (guestCart != null) {

                for (CartItem item : guestCart) {

                    if (item.getCartItemId() == cartItemId) {

                        int quantity = item.getQuantity();

                        if ("increase".equals(action)) {

                            quantity++;

                        } else if ("decrease".equals(action)) {

                            if (quantity > 1) {

                                quantity--;
                            }
                        }

                        item.setQuantity(quantity);

                        break;
                    }
                }

                session.setAttribute(
                        "guestCart",
                        guestCart
                );
            }

            response.sendRedirect("cart");

            return;
        }

        /*
         * =====================================================
         * LOGGED-IN USER CART
         * =====================================================
         */

        CartItem cartItem =
                cartItemService.getCartItem(cartItemId);

        if (cartItem != null) {

            int quantity = cartItem.getQuantity();

            if ("increase".equals(action)) {

                quantity++;

            } else if ("decrease".equals(action)) {

                if (quantity > 1) {

                    quantity--;
                }
            }

            cartItem.setQuantity(quantity);

            cartItemService.updateCartItem(cartItem);
        }

        response.sendRedirect("cart");
    }
}