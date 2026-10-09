package com.tap.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

@WebServlet("/menu")
public class MenuServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private MenuService menuService;
    private CartService cartService;
    private CartItemService cartItemService;

    @Override
    public void init() throws ServletException {

        menuService = new MenuService();
        cartService = new CartService();
        cartItemService = new CartItemService();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
                          throws ServletException, IOException {

        // Get all menu items
        List<Menu> menus =
                menuService.getAllMenus();

        /*
         * =====================================================
         * STORE CURRENT CART QUANTITY FOR EACH MENU ITEM
         * =====================================================
         *
         * Example:
         *
         * menuId 1 -> quantity 2
         * menuId 2 -> quantity 1
         *
         * menu.jsp will use this information to show
         * - 2 + instead of Add to Cart.
         */

        Map<Integer, Integer> cartQuantities =
                new HashMap<>();

        HttpSession session =
                request.getSession();

        User user =
                (User) session.getAttribute("user");


        /*
         * =====================================================
         * GUEST USER
         * =====================================================
         */

        if (user == null) {

            List<CartItem> guestCart =
                    (List<CartItem>)
                    session.getAttribute("guestCart");

            if (guestCart != null) {

                for (CartItem item : guestCart) {

                    cartQuantities.put(
                            item.getMenuId(),
                            item.getQuantity()
                    );
                }
            }
        }


        /*
         * =====================================================
         * LOGGED-IN USER
         * =====================================================
         */

        else {

            Cart cart =
                    cartService.getCartByUser(
                            user.getId()
                    );

            if (cart != null) {

                List<CartItem> cartItems =
                        cartItemService.getCartItemsByCart(
                                cart.getCartId()
                        );

                if (cartItems != null) {

                    for (CartItem item : cartItems) {

                        cartQuantities.put(
                                item.getMenuId(),
                                item.getQuantity()
                        );
                    }
                }
            }
        }


        /*
         * =====================================================
         * SEND DATA TO menu.jsp
         * =====================================================
         */

        request.setAttribute(
                "menus",
                menus
        );

        request.setAttribute(
                "cartQuantities",
                cartQuantities
        );


        request.getRequestDispatcher("menu.jsp")
               .forward(request, response);
    }
}