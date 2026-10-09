package com.tap.servlet;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.tap.model.Cart;
import com.tap.model.CartItem;
import com.tap.model.Menu;
import com.tap.model.User;
import com.tap.service.CartItemService;
import com.tap.service.CartService;
import com.tap.service.MenuService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private CartService cartService;
    private CartItemService cartItemService;
    private MenuService menuService;

    @Override
    public void init() throws ServletException {

        cartService = new CartService();
        cartItemService = new CartItemService();
        menuService = new MenuService();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
                          throws ServletException, IOException {

        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("user");

        List<CartItem> cartItems = new ArrayList<>();
        List<Menu> menuItems = new ArrayList<>();

        /*
         * =====================================================
         * USER NOT LOGGED IN
         * SHOW SESSION CART
         * =====================================================
         */
        if (user == null) {

            List<CartItem> guestCart =
                    (List<CartItem>) session.getAttribute("guestCart");

            if (guestCart != null) {

                cartItems.addAll(guestCart);

                for (CartItem cartItem : guestCart) {

                    Menu menu = menuService.getMenu(
                            cartItem.getMenuId()
                    );

                    if (menu != null) {

                        menuItems.add(menu);
                    }
                }
            }

            request.setAttribute("cart", null);
            request.setAttribute("cartItems", cartItems);
            request.setAttribute("menuItems", menuItems);

            request.getRequestDispatcher("cart.jsp")
                   .forward(request, response);

            return;
        }

        /*
         * =====================================================
         * USER LOGGED IN
         * USE DATABASE CART
         * =====================================================
         */

        int userId = user.getId();

        Cart cart = cartService.getCartByUser(userId);

        if (cart != null) {

            int cartId = cart.getCartId();

            cartItems =
                    cartItemService.getCartItemsByCart(cartId);

            for (CartItem cartItem : cartItems) {

                Menu menu = menuService.getMenu(
                        cartItem.getMenuId()
                );

                if (menu != null) {

                    menuItems.add(menu);
                }
            }
        }

        request.setAttribute("cart", cart);
        request.setAttribute("cartItems", cartItems);
        request.setAttribute("menuItems", menuItems);

        request.getRequestDispatcher("cart.jsp")
               .forward(request, response);
    }
}