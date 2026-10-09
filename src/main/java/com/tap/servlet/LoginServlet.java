package com.tap.servlet;

import java.io.IOException;
import java.util.List;

import com.tap.model.Cart;
import com.tap.model.CartItem;
import com.tap.model.User;
import com.tap.service.CartItemService;
import com.tap.service.CartService;
import com.tap.service.UserService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private UserService userService;
    private CartService cartService;
    private CartItemService cartItemService;

    @Override
    public void init() throws ServletException {

        userService = new UserService();
        cartService = new CartService();
        cartItemService = new CartItemService();
    }

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
                           throws ServletException, IOException {

        String email = request.getParameter("email");

        String password = request.getParameter("password");

        User user = userService.getUserByEmail(email);

        /*
         * =====================================================
         * LOGIN SUCCESS
         * =====================================================
         */
        if (user != null &&
            user.getPassword().equals(password)) {

            HttpSession session = request.getSession();

            session.setAttribute("user", user);

            /*
             * =================================================
             * MOVE GUEST CART TO USER DATABASE CART
             * =================================================
             */

            List<CartItem> guestCart =
                    (List<CartItem>) session.getAttribute("guestCart");

            if (guestCart != null && !guestCart.isEmpty()) {

                Cart cart =
                        cartService.getCartByUser(user.getId());

                if (cart == null) {

                    cart = new Cart();

                    cart.setUserId(user.getId());

                    cartService.addCart(cart);

                    cart =
                        cartService.getCartByUser(user.getId());
                }

                int cartId = cart.getCartId();

                for (CartItem guestItem : guestCart) {

                    CartItem existingItem =
                            cartItemService
                            .getCartItemByCartAndMenu(
                                    cartId,
                                    guestItem.getMenuId()
                            );

                    if (existingItem != null) {

                        existingItem.setQuantity(
                                existingItem.getQuantity()
                                + guestItem.getQuantity()
                        );

                        cartItemService.updateCartItem(
                                existingItem
                        );

                    } else {

                        CartItem newItem = new CartItem();

                        newItem.setCartId(cartId);
                        newItem.setMenuId(
                                guestItem.getMenuId()
                        );
                        newItem.setQuantity(
                                guestItem.getQuantity()
                        );

                        cartItemService.addCartItem(
                                newItem
                        );
                    }
                }

                /*
                 * Guest cart is no longer needed
                 */
                session.removeAttribute("guestCart");
            }

            response.sendRedirect("cart");

        } else {

            response.sendRedirect(
                    "login.html?error=invalid"
            );
        }
    }
}