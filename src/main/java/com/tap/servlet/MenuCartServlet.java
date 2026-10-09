package com.tap.servlet;

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

@WebServlet("/menuCart")
public class MenuCartServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private CartService cartService;
    private CartItemService cartItemService;
    private MenuService menuService;

    private static final String CONFLICT_MESSAGE =
            "You already selected items from another restaurant. " +
            "Please remove the current cart items before adding food from another restaurant.";

    @Override
    public void init() throws ServletException {

        cartService = new CartService();
        cartItemService = new CartItemService();
        menuService = new MenuService();

        System.out.println("MenuCartServlet started successfully.");
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/json;charset=UTF-8");

        response.setHeader(
                "Cache-Control",
                "no-store, no-cache, must-revalidate"
        );

        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);

        String action = request.getParameter("action");

        if (action == null || action.trim().isEmpty()) {
            action = "state";
        }

        try {

            /*
             * =====================================================
             * LOAD CART STATE
             * =====================================================
             */
            if ("state".equalsIgnoreCase(action)) {

                loadCartState(request, response);

                return;
            }

            /*
             * =====================================================
             * GET MENU ID
             * =====================================================
             */
            String menuIdValue = request.getParameter("menuId");

            if (menuIdValue == null ||
                menuIdValue.trim().isEmpty()) {

                sendError(
                        response,
                        "Menu item was not selected."
                );

                return;
            }

            int menuId;

            try {

                menuId = Integer.parseInt(menuIdValue);

            } catch (NumberFormatException e) {

                sendError(
                        response,
                        "Invalid menu item."
                );

                return;
            }

            /*
             * =====================================================
             * ADD
             * =====================================================
             */
            if ("add".equalsIgnoreCase(action)) {

                addItem(
                        request,
                        response,
                        menuId
                );

                return;
            }

            /*
             * =====================================================
             * INCREASE
             * =====================================================
             */
            if ("increase".equalsIgnoreCase(action)) {

                changeQuantity(
                        request,
                        response,
                        menuId,
                        1
                );

                return;
            }

            /*
             * =====================================================
             * DECREASE
             * =====================================================
             */
            if ("decrease".equalsIgnoreCase(action)) {

                changeQuantity(
                        request,
                        response,
                        menuId,
                        -1
                );

                return;
            }

            sendError(
                    response,
                    "Invalid cart action."
            );

        } catch (Exception e) {

            e.printStackTrace();

            sendError(
                    response,
                    "Unable to update cart."
            );
        }
    }

    /*
     * =========================================================
     * ADD ITEM
     * =========================================================
     */
    private void addItem(HttpServletRequest request,
                         HttpServletResponse response,
                         int menuId)
            throws IOException {

        HttpSession session =
                request.getSession();

        /*
         * =====================================================
         * GET SELECTED MENU
         * =====================================================
         */
        Menu selectedMenu =
                menuService.getMenu(menuId);

        if (selectedMenu == null) {

            sendError(
                    response,
                    "Menu item not found."
            );

            return;
        }

        int selectedRestaurantId =
                selectedMenu.getRestaurantId();

        /*
         * =====================================================
         * CHECK LOGIN
         * =====================================================
         */
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

            if (guestCart == null) {

                guestCart =
                        new ArrayList<>();
            }

            /*
             * =================================================
             * RESTAURANT CHECK
             * =================================================
             *
             * Every existing cart item must belong
             * to the selected restaurant.
             */
            if (hasRestaurantConflict(
                    guestCart,
                    selectedRestaurantId)) {

                sendConflict(response);

                return;
            }

            /*
             * =================================================
             * FIND EXISTING ITEM
             * =================================================
             */
            CartItem existingItem =
                    findGuestItem(
                            guestCart,
                            menuId
                    );

            /*
             * =================================================
             * EXISTING ITEM
             * =================================================
             */
            if (existingItem != null) {

                existingItem.setQuantity(
                        existingItem.getQuantity() + 1
                );

                session.setAttribute(
                        "guestCart",
                        guestCart
                );

                sendSuccess(
                        response,
                        existingItem.getQuantity()
                );

                return;
            }

            /*
             * =================================================
             * NEW ITEM
             * =================================================
             */
            CartItem newItem =
                    new CartItem();

            newItem.setCartItemId(menuId);
            newItem.setCartId(0);
            newItem.setMenuId(menuId);
            newItem.setQuantity(1);

            guestCart.add(newItem);

            session.setAttribute(
                    "guestCart",
                    guestCart
            );

            sendSuccess(
                    response,
                    1
            );

            return;
        }

        /*
         * =====================================================
         * LOGGED-IN USER
         * =====================================================
         */

        int userId =
                user.getId();

        Cart cart =
                cartService.getCartByUser(userId);

        /*
         * =====================================================
         * CREATE CART
         * =====================================================
         */
        if (cart == null) {

            cart =
                    new Cart();

            cart.setUserId(userId);

            cartService.addCart(cart);

            cart =
                    cartService.getCartByUser(userId);
        }

        if (cart == null) {

            sendError(
                    response,
                    "Unable to create the cart."
            );

            return;
        }

        int cartId =
                cart.getCartId();

        /*
         * =====================================================
         * GET DATABASE CART ITEMS
         * =====================================================
         */
        List<CartItem> cartItems =
                cartItemService.getCartItemsByCart(
                        cartId
                );

        /*
         * =====================================================
         * RESTAURANT CHECK
         * =====================================================
         */
        if (hasRestaurantConflict(
                cartItems,
                selectedRestaurantId)) {

            sendConflict(response);

            return;
        }

        /*
         * =====================================================
         * FIND EXISTING ITEM
         * =====================================================
         */
        CartItem existingItem =
                cartItemService
                .getCartItemByCartAndMenu(
                        cartId,
                        menuId
                );

        /*
         * =====================================================
         * EXISTING ITEM
         * =====================================================
         */
        if (existingItem != null) {

            existingItem.setQuantity(
                    existingItem.getQuantity() + 1
            );

            cartItemService.updateCartItem(
                    existingItem
            );

            sendSuccess(
                    response,
                    existingItem.getQuantity()
            );

            return;
        }

        /*
         * =====================================================
         * NEW ITEM
         * =====================================================
         */
        CartItem newItem =
                new CartItem();

        newItem.setCartId(cartId);
        newItem.setMenuId(menuId);
        newItem.setQuantity(1);

        cartItemService.addCartItem(
                newItem
        );

        sendSuccess(
                response,
                1
        );
    }

    /*
     * =========================================================
     * CHANGE QUANTITY
     * =========================================================
     */
    private void changeQuantity(
            HttpServletRequest request,
            HttpServletResponse response,
            int menuId,
            int change)
            throws IOException {

        HttpSession session =
                request.getSession();

        User user =
                (User) session.getAttribute("user");

        /*
         * =====================================================
         * GUEST
         * =====================================================
         */
        if (user == null) {

            List<CartItem> guestCart =
                    (List<CartItem>)
                    session.getAttribute("guestCart");

            if (guestCart == null) {

                sendSuccess(
                        response,
                        0
                );

                return;
            }

            CartItem item =
                    findGuestItem(
                            guestCart,
                            menuId
                    );

            if (item == null) {

                sendSuccess(
                        response,
                        0
                );

                return;
            }

            int newQuantity =
                    item.getQuantity() + change;

            if (newQuantity <= 0) {

                guestCart.remove(item);

                session.setAttribute(
                        "guestCart",
                        guestCart
                );

                sendSuccess(
                        response,
                        0
                );

                return;
            }

            item.setQuantity(
                    newQuantity
            );

            session.setAttribute(
                    "guestCart",
                    guestCart
            );

            sendSuccess(
                    response,
                    newQuantity
            );

            return;
        }

        /*
         * =====================================================
         * LOGGED-IN USER
         * =====================================================
         */
        Cart cart =
                cartService.getCartByUser(
                        user.getId()
                );

        if (cart == null) {

            sendSuccess(
                    response,
                    0
            );

            return;
        }

        CartItem item =
                cartItemService
                .getCartItemByCartAndMenu(
                        cart.getCartId(),
                        menuId
                );

        if (item == null) {

            sendSuccess(
                    response,
                    0
            );

            return;
        }

        int newQuantity =
                item.getQuantity() + change;

        /*
         * REMOVE ITEM
         */
        if (newQuantity <= 0) {

            cartItemService.deleteCartItem(
                    item.getCartItemId()
            );

            sendSuccess(
                    response,
                    0
            );

            return;
        }

        /*
         * UPDATE QUANTITY
         */
        item.setQuantity(
                newQuantity
        );

        cartItemService.updateCartItem(
                item
        );

        sendSuccess(
                response,
                newQuantity
        );
    }

    /*
     * =========================================================
     * LOAD CART STATE
     * =========================================================
     */
    private void loadCartState(
            HttpServletRequest request,
            HttpServletResponse response)
            throws IOException {

        HttpSession session =
                request.getSession();

        User user =
                (User) session.getAttribute("user");

        StringBuilder json =
                new StringBuilder();

        json.append(
                "{\"success\":true,\"items\":{"
        );

        boolean first =
                true;

        /*
         * =====================================================
         * GUEST CART
         * =====================================================
         */
        if (user == null) {

            List<CartItem> guestCart =
                    (List<CartItem>)
                    session.getAttribute(
                            "guestCart"
                    );

            if (guestCart != null) {

                for (CartItem item :
                        guestCart) {

                    if (!first) {

                        json.append(",");
                    }

                    json.append("\"")
                        .append(item.getMenuId())
                        .append("\":")
                        .append(item.getQuantity());

                    first = false;
                }
            }
        }

        /*
         * =====================================================
         * DATABASE CART
         * =====================================================
         */
        else {

            Cart cart =
                    cartService.getCartByUser(
                            user.getId()
                    );

            if (cart != null) {

                List<CartItem> cartItems =
                        cartItemService
                        .getCartItemsByCart(
                                cart.getCartId()
                        );

                if (cartItems != null) {

                    for (CartItem item :
                            cartItems) {

                        if (!first) {

                            json.append(",");
                        }

                        json.append("\"")
                            .append(item.getMenuId())
                            .append("\":")
                            .append(item.getQuantity());

                        first = false;
                    }
                }
            }
        }

        json.append("}}");

        response.getWriter().print(
                json.toString()
        );
    }

    /*
     * =========================================================
     * RESTAURANT CHECK
     * =========================================================
     */
    private boolean hasRestaurantConflict(
            List<CartItem> cartItems,
            int selectedRestaurantId) {

        if (cartItems == null ||
            cartItems.isEmpty()) {

            return false;
        }

        /*
         * Check every item.
         */
        for (CartItem item :
                cartItems) {

            Menu existingMenu =
                    menuService.getMenu(
                            item.getMenuId()
                    );

            /*
             * If menu exists and belongs
             * to another restaurant,
             * block the add.
             */
            if (existingMenu != null &&
                existingMenu.getRestaurantId()
                        != selectedRestaurantId) {

                return true;
            }
        }

        return false;
    }

    /*
     * =========================================================
     * FIND GUEST ITEM
     * =========================================================
     */
    private CartItem findGuestItem(
            List<CartItem> guestCart,
            int menuId) {

        for (CartItem item :
                guestCart) {

            if (item.getMenuId() == menuId) {

                return item;
            }
        }

        return null;
    }

    /*
     * =========================================================
     * SUCCESS JSON
     * =========================================================
     */
    private void sendSuccess(
            HttpServletResponse response,
            int quantity)
            throws IOException {

        response.getWriter().print(
                "{\"success\":true,\"quantity\":"
                + quantity
                + "}"
        );
    }

    /*
     * =========================================================
     * CONFLICT JSON
     * =========================================================
     */
    private void sendConflict(
            HttpServletResponse response)
            throws IOException {

        response.getWriter().print(
                "{\"success\":false,"
                + "\"conflict\":true,"
                + "\"message\":\""
                + escapeJson(CONFLICT_MESSAGE)
                + "\"}"
        );
    }

    /*
     * =========================================================
     * ERROR JSON
     * =========================================================
     */
    private void sendError(
            HttpServletResponse response,
            String message)
            throws IOException {

        response.getWriter().print(
                "{\"success\":false,"
                + "\"message\":\""
                + escapeJson(message)
                + "\"}"
        );
    }

    /*
     * =========================================================
     * JSON ESCAPE
     * =========================================================
     */
    private String escapeJson(
            String value) {

        if (value == null) {

            return "";
        }

        return value
                .replace("\\", "\\\\")
                .replace("\"", "\\\"")
                .replace("\r", "\\r")
                .replace("\n", "\\n");
    }
}