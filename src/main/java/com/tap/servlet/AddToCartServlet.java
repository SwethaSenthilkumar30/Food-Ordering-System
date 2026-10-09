package com.tap.servlet;

import java.io.IOException;
import java.io.PrintWriter;
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

@WebServlet("/addToCart")
public class AddToCartServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private CartService cartService;
    private CartItemService cartItemService;
    private MenuService menuService;

    private static final String RESTAURANT_CONFLICT_MESSAGE =
            "You already selected items from another restaurant. " +
            "Please remove the current cart items before adding food from another restaurant.";


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

        HttpSession session =
                request.getSession();


        /*
         * =====================================================
         * AJAX CHECK
         * =====================================================
         */

        boolean ajaxRequest =
                isAjaxRequest(request);


        /*
         * =====================================================
         * GET PARAMETERS
         * =====================================================
         */

        String menuIdParameter =
                request.getParameter("menuId");

        String action =
                request.getParameter("action");


        if (action == null ||
            action.trim().isEmpty()) {

            action = "add";
        }


        /*
         * =====================================================
         * CHECK MENU ID
         * =====================================================
         */

        if (menuIdParameter == null ||
            menuIdParameter.trim().isEmpty()) {

            if (ajaxRequest) {

                sendJsonError(
                        response,
                        "Menu item was not selected."
                );

            } else {

                response.sendRedirect("menu");
            }

            return;
        }


        int menuId;

        try {

            menuId =
                    Integer.parseInt(
                            menuIdParameter
                    );

        } catch (NumberFormatException e) {

            if (ajaxRequest) {

                sendJsonError(
                        response,
                        "Invalid menu item."
                );

            } else {

                response.sendRedirect("menu");
            }

            return;
        }


        /*
         * =====================================================
         * GET SELECTED MENU
         * =====================================================
         */

        Menu selectedMenu =
                menuService.getMenu(menuId);


        if (selectedMenu == null) {

            if (ajaxRequest) {

                sendJsonError(
                        response,
                        "Menu item not found."
                );

            } else {

                response.sendRedirect("menu");
            }

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
             * ADD / INCREASE
             * =================================================
             */

            if ("add".equalsIgnoreCase(action) ||
                "increase".equalsIgnoreCase(action)) {


                /*
                 * Check restaurant restriction
                 */

                if (!guestCart.isEmpty()) {

                    CartItem firstItem =
                            guestCart.get(0);


                    Menu existingMenu =
                            menuService.getMenu(
                                    firstItem.getMenuId()
                            );


                    if (existingMenu != null) {

                        int existingRestaurantId =
                                existingMenu.getRestaurantId();


                        /*
                         * DIFFERENT RESTAURANT
                         */

                        if (existingRestaurantId
                                != selectedRestaurantId) {

                            if (ajaxRequest) {

                                sendRestaurantConflictJson(
                                        response
                                );

                            } else {

                                showRestaurantPopup(
                                        response
                                );
                            }

                            return;
                        }
                    }
                }


                /*
                 * Find existing item
                 */

                CartItem existingItem =
                        null;


                for (CartItem item : guestCart) {

                    if (item.getMenuId() == menuId) {

                        existingItem = item;
                        break;
                    }
                }


                /*
                 * Increase existing quantity
                 */

                if (existingItem != null) {

                    existingItem.setQuantity(
                            existingItem.getQuantity() + 1
                    );


                    session.setAttribute(
                            "guestCart",
                            guestCart
                    );


                    if (ajaxRequest) {

                        sendJsonSuccess(
                                response,
                                menuId,
                                existingItem.getQuantity()
                        );

                    } else {

                        response.sendRedirect("cart");
                    }

                    return;
                }


                /*
                 * Add new item
                 */

                CartItem cartItem =
                        new CartItem();


                /*
                 * Temporary guest ID
                 */

                cartItem.setCartItemId(menuId);

                cartItem.setCartId(0);

                cartItem.setMenuId(menuId);

                cartItem.setQuantity(1);


                guestCart.add(cartItem);


                session.setAttribute(
                        "guestCart",
                        guestCart
                );


                if (ajaxRequest) {

                    sendJsonSuccess(
                            response,
                            menuId,
                            1
                    );

                } else {

                    response.sendRedirect("cart");
                }


                return;
            }


            /*
             * =================================================
             * DECREASE
             * =================================================
             */

            if ("decrease".equalsIgnoreCase(action)) {

                CartItem existingItem =
                        null;


                for (CartItem item : guestCart) {

                    if (item.getMenuId() == menuId) {

                        existingItem = item;
                        break;
                    }
                }


                int newQuantity =
                        0;


                if (existingItem != null) {

                    /*
                     * Quantity greater than 1
                     */

                    if (existingItem.getQuantity() > 1) {

                        existingItem.setQuantity(
                                existingItem.getQuantity() - 1
                        );

                        newQuantity =
                                existingItem.getQuantity();
                    }


                    /*
                     * Quantity is 1
                     * Remove item completely
                     */

                    else {

                        guestCart.remove(
                                existingItem
                        );

                        newQuantity = 0;
                    }
                }


                session.setAttribute(
                        "guestCart",
                        guestCart
                );


                if (ajaxRequest) {

                    sendJsonSuccess(
                            response,
                            menuId,
                            newQuantity
                    );

                } else {

                    response.sendRedirect("cart");
                }


                return;
            }


            /*
             * Invalid action
             */

            if (ajaxRequest) {

                sendJsonError(
                        response,
                        "Invalid cart action."
                );

            } else {

                response.sendRedirect("menu");
            }


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
                cartService.getCartByUser(
                        userId
                );


        /*
         * =====================================================
         * CREATE CART FOR ADD
         * =====================================================
         */

        if (cart == null &&
            ("add".equalsIgnoreCase(action) ||
             "increase".equalsIgnoreCase(action))) {

            cart =
                    new Cart();


            cart.setUserId(
                    userId
            );


            cartService.addCart(
                    cart
            );


            cart =
                    cartService.getCartByUser(
                            userId
                    );
        }


        /*
         * =====================================================
         * NO CART
         * =====================================================
         */

        if (cart == null) {

            if (ajaxRequest) {

                sendJsonError(
                        response,
                        "Unable to create the cart."
                );

            } else {

                response.sendRedirect("cart");
            }

            return;
        }


        int cartId =
                cart.getCartId();


        List<CartItem> existingCartItems =
                cartItemService.getCartItemsByCart(
                        cartId
                );


        /*
         * =====================================================
         * ADD / INCREASE
         * =====================================================
         */

        if ("add".equalsIgnoreCase(action) ||
            "increase".equalsIgnoreCase(action)) {


            /*
             * Check restaurant restriction
             */

            if (existingCartItems != null &&
                !existingCartItems.isEmpty()) {


                CartItem firstItem =
                        existingCartItems.get(0);


                Menu existingMenu =
                        menuService.getMenu(
                                firstItem.getMenuId()
                        );


                if (existingMenu != null) {

                    int existingRestaurantId =
                            existingMenu.getRestaurantId();


                    /*
                     * DIFFERENT RESTAURANT
                     */

                    if (existingRestaurantId
                            != selectedRestaurantId) {

                        if (ajaxRequest) {

                            sendRestaurantConflictJson(
                                    response
                            );

                        } else {

                            showRestaurantPopup(
                                    response
                            );
                        }

                        return;
                    }
                }
            }


            /*
             * Find existing item
             */

            CartItem existingItem =
                    cartItemService
                    .getCartItemByCartAndMenu(
                            cartId,
                            menuId
                    );


            /*
             * Existing item
             */

            if (existingItem != null) {

                existingItem.setQuantity(
                        existingItem.getQuantity() + 1
                );


                cartItemService.updateCartItem(
                        existingItem
                );


                if (ajaxRequest) {

                    sendJsonSuccess(
                            response,
                            menuId,
                            existingItem.getQuantity()
                    );

                } else {

                    response.sendRedirect("cart");
                }
            }


            /*
             * New item
             */

            else {

                CartItem cartItem =
                        new CartItem();


                cartItem.setCartId(
                        cartId
                );


                cartItem.setMenuId(
                        menuId
                );


                cartItem.setQuantity(
                        1
                );


                cartItemService.addCartItem(
                        cartItem
                );


                if (ajaxRequest) {

                    sendJsonSuccess(
                            response,
                            menuId,
                            1
                    );

                } else {

                    response.sendRedirect("cart");
                }
            }


            return;
        }


        /*
         * =====================================================
         * DECREASE
         * =====================================================
         */

        if ("decrease".equalsIgnoreCase(action)) {

            CartItem existingItem =
                    cartItemService
                    .getCartItemByCartAndMenu(
                            cartId,
                            menuId
                    );


            int newQuantity =
                    0;


            if (existingItem != null) {


                /*
                 * Quantity > 1
                 */

                if (existingItem.getQuantity() > 1) {

                    existingItem.setQuantity(
                            existingItem.getQuantity() - 1
                    );


                    cartItemService.updateCartItem(
                            existingItem
                    );


                    newQuantity =
                            existingItem.getQuantity();
                }


                /*
                 * Quantity = 1
                 * Delete item
                 */

                else {

                    cartItemService.deleteCartItem(
                            existingItem.getCartItemId()
                    );


                    newQuantity = 0;
                }
            }


            if (ajaxRequest) {

                sendJsonSuccess(
                        response,
                        menuId,
                        newQuantity
                );

            } else {

                response.sendRedirect("cart");
            }


            return;
        }


        /*
         * =====================================================
         * INVALID ACTION
         * =====================================================
         */

        if (ajaxRequest) {

            sendJsonError(
                    response,
                    "Invalid cart action."
            );

        } else {

            response.sendRedirect("menu");
        }
    }


    /*
     * =========================================================
     * CHECK AJAX REQUEST
     * =========================================================
     */

    private boolean isAjaxRequest(
            HttpServletRequest request) {

        String ajaxParameter =
                request.getParameter("ajax");


        String requestedWith =
                request.getHeader("X-Requested-With");


        return
            "true".equalsIgnoreCase(
                    ajaxParameter
            )
            ||
            "XMLHttpRequest".equalsIgnoreCase(
                    requestedWith
            );
    }


    /*
     * =========================================================
     * JSON SUCCESS
     * =========================================================
     */

    private void sendJsonSuccess(
            HttpServletResponse response,
            int menuId,
            int quantity)
            throws IOException {

        response.setContentType(
                "application/json;charset=UTF-8"
        );


        PrintWriter out =
                response.getWriter();


        out.print(
            "{\"success\":true,\"menuId\":" +
            menuId +
            ",\"quantity\":" +
            quantity +
            "}"
        );
    }


    /*
     * =========================================================
     * JSON ERROR
     * =========================================================
     */

    private void sendJsonError(
            HttpServletResponse response,
            String message)
            throws IOException {

        response.setContentType(
                "application/json;charset=UTF-8"
        );


        PrintWriter out =
                response.getWriter();


        out.print(
            "{\"success\":false,\"message\":\"" +
            jsonEscape(message) +
            "\"}"
        );
    }


    /*
     * =========================================================
     * RESTAURANT CONFLICT JSON
     * =========================================================
     */

    private void sendRestaurantConflictJson(
            HttpServletResponse response)
            throws IOException {

        sendJsonError(
                response,
                RESTAURANT_CONFLICT_MESSAGE
        );
    }


    /*
     * =========================================================
     * JSON ESCAPE
     * =========================================================
     */

    private String jsonEscape(
            String value) {

        return value
                .replace("\\", "\\\\")
                .replace("\"", "\\\"")
                .replace("\r", "\\r")
                .replace("\n", "\\n");
    }


    /*
     * =========================================================
     * FALLBACK POPUP
     * =========================================================
     */

    private void showRestaurantPopup(
            HttpServletResponse response)
            throws IOException {

        response.setContentType(
                "text/html;charset=UTF-8"
        );


        PrintWriter out =
                response.getWriter();


        out.println("<!DOCTYPE html>");

        out.println("<html>");

        out.println("<head>");

        out.println("<meta charset='UTF-8'>");

        out.println("<title>FoodOrder</title>");

        out.println("</head>");

        out.println("<body>");

        out.println("<script>");


        out.println(
            "alert(\"You already selected items from another restaurant.\\n\\n" +
            "Please remove the current cart items before adding food from another restaurant.\");"
        );


        out.println(
            "window.location.href='cart';"
        );


        out.println("</script>");

        out.println("</body>");

        out.println("</html>");
    }
}