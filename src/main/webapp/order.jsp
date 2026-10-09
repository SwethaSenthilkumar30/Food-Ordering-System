<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.tap.model.Order" %>
<%@ page import="com.tap.model.OrderItem" %>
<%@ page import="com.tap.model.Menu" %>
<%@ page import="com.tap.model.Restaurant" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Orders - FoodOrder</title>
</head>

<body style="
    margin:0;
    padding:0;
    font-family:Arial, Helvetica, sans-serif;
    background:#F7F7F7;
    color:#202020;
">

<!-- ================= HEADER ================= -->
<header style="
    width:100%;
    background:#FFFFFF;
    border-bottom:1px solid #EEEEEE;
    box-shadow:0 2px 10px rgba(0,0,0,0.05);
    position:sticky;
    top:0;
    z-index:1000;
">

    <div style="
        width:90%;
        max-width:1200px;
        min-height:74px;
        margin:auto;
        display:flex;
        align-items:center;
        justify-content:space-between;
        box-sizing:border-box;
        gap:20px;
    ">

        <!-- LOGO -->
        <a href="index.html" style="
            text-decoration:none;
            color:#FF6B35;
            font-size:28px;
            font-weight:800;
            letter-spacing:-0.7px;
            white-space:nowrap;
        ">
            FoodOrder
        </a>

        <!-- PAGE LABEL -->
        <div style="
            display:flex;
            align-items:center;
            background:#FFF3EA;
            padding:9px 14px;
            border-radius:20px;
            color:#F4511E;
            font-size:12px;
            font-weight:700;
        ">
            My Orders
        </div>

        <!-- NAVIGATION -->
        <nav style="
            display:flex;
            align-items:center;
            justify-content:flex-end;
            gap:22px;
            flex-wrap:wrap;
        ">

            <a href="index.html" style="
                text-decoration:none;
                color:#333333;
                font-size:14px;
                font-weight:600;
            ">
                Home
            </a>

            <a href="restaurants" style="
                text-decoration:none;
                color:#333333;
                font-size:14px;
                font-weight:600;
            ">
                Restaurants
            </a>

            <a href="menu" style="
                text-decoration:none;
                color:#333333;
                font-size:14px;
                font-weight:600;
            ">
                Menu
            </a>

            <a href="order" style="
                text-decoration:none;
                color:#FFFFFF;
                background:#FF6B35;
                padding:10px 15px;
                border-radius:8px;
                font-size:13px;
                font-weight:700;
            ">
                Orders
            </a>

            <a href="profile" style="
                text-decoration:none;
                color:#333333;
                font-size:14px;
                font-weight:600;
            ">
                Profile
            </a>

            <a href="cart" style="
                text-decoration:none;
                color:#333333;
                font-size:14px;
                font-weight:600;
            ">
                Cart
            </a>

            <a href="login.html" style="
                text-decoration:none;
                color:#FFFFFF;
                background:#202020;
                padding:10px 15px;
                border-radius:8px;
                font-size:13px;
                font-weight:700;
            ">
                Logout
            </a>

        </nav>
    </div>
</header>


<!-- ================= MAIN ================= -->
<main style="
    width:90%;
    max-width:1100px;
    margin:0 auto;
    padding:35px 0 60px 0;
    box-sizing:border-box;
">

    <!-- ================= HERO / PAGE INTRO ================= -->
    <section style="
        width:100%;
        min-height:220px;
        background:#FFF7F1;
        border-radius:18px;
        overflow:hidden;
        position:relative;
        display:flex;
        align-items:center;
        justify-content:space-between;
        padding:38px 45px;
        box-sizing:border-box;
        box-shadow:0 6px 20px rgba(0,0,0,0.06);
        gap:30px;
    ">

        <div style="
            width:65%;
            position:relative;
            z-index:2;
        ">

            <div style="
                display:inline-block;
                background:#FF6B35;
                color:#FFFFFF;
                padding:7px 13px;
                border-radius:6px;
                font-size:10px;
                font-weight:800;
                letter-spacing:0.6px;
                margin-bottom:14px;
            ">
                YOUR FOOD JOURNEY
            </div>

            <h1 style="
                margin:0;
                font-size:38px;
                line-height:1.08;
                color:#222222;
                letter-spacing:-1px;
            ">
                My Orders
            </h1>

            <p style="
                margin:10px 0 0 0;
                color:#6C6C6C;
                font-size:13px;
                line-height:1.6;
                max-width:600px;
            ">
                View your previous orders, order items, delivery information and current order status.
            </p>

        </div>

        <div style="
            width:35%;
            min-height:140px;
            background:#FFE9D9;
            border-radius:16px;
            display:flex;
            align-items:center;
            justify-content:center;
            text-align:center;
            box-sizing:border-box;
            padding:20px;
        ">
            <div>
                <div style="
                    font-size:44px;
                    color:#FF6B35;
                    font-weight:800;
                    line-height:1;
                ">
                    &#8377;
                </div>
                <div style="
                    margin-top:10px;
                    color:#5E5E5E;
                    font-size:12px;
                    line-height:1.5;
                    font-weight:600;
                ">
                    Your orders<br>in one place
                </div>
            </div>
        </div>

    </section>


    <!-- ================= DATA FROM SERVLET ================= -->
    <%
        List<Order> orders =
            (List<Order>) request.getAttribute("orders");

        Map<Integer, List<OrderItem>> orderItemsMap =
            (Map<Integer, List<OrderItem>>)
            request.getAttribute("orderItemsMap");

        Map<Integer, Menu> menuMap =
            (Map<Integer, Menu>)
            request.getAttribute("menuMap");

        Map<Integer, Restaurant> restaurantMap =
            (Map<Integer, Restaurant>)
            request.getAttribute("restaurantMap");

        if (orders == null || orders.isEmpty()) {
    %>

        <!-- ================= EMPTY ORDERS ================= -->
        <div style="
            background:#FFFFFF;
            margin-top:28px;
            border:1px solid #E8E8E8;
            border-radius:16px;
            padding:55px 30px;
            text-align:center;
            box-shadow:0 5px 18px rgba(0,0,0,0.05);
        ">

            <div style="
                width:72px;
                height:72px;
                line-height:72px;
                margin:0 auto 18px auto;
                border-radius:50%;
                background:#FFF1E6;
                color:#FF6B35;
                font-size:30px;
                font-weight:800;
            ">
                &#8377;
            </div>

            <h2 style="
                margin:0 0 8px 0;
                color:#222222;
                font-size:24px;
            ">
                No Orders Yet
            </h2>

            <p style="
                margin:0;
                color:#777777;
                font-size:13px;
            ">
                You have not placed any orders yet.
            </p>

            <a href="menu" style="
                display:inline-block;
                margin-top:22px;
                padding:12px 24px;
                background:#FF6B35;
                color:#FFFFFF;
                text-decoration:none;
                border-radius:8px;
                font-weight:700;
                font-size:12px;
            ">
                Order Food
            </a>

        </div>

    <%
        } else {
            for (Order order : orders) {

                int orderId = order.getOrderId();

                List<OrderItem> orderItems =
                    orderItemsMap.get(orderId);

                Restaurant restaurant =
                    restaurantMap.get(order.getRestaurantId());
    %>

        <!-- ================= ORDER CARD ================= -->
        <section style="
            background:#FFFFFF;
            border:1px solid #E8E8E8;
            border-radius:16px;
            margin-top:26px;
            padding:26px;
            box-shadow:0 5px 18px rgba(0,0,0,0.05);
        ">

            <!-- ORDER HEADER -->
            <div style="
                display:flex;
                justify-content:space-between;
                align-items:center;
                gap:15px;
                margin-bottom:20px;
                padding-bottom:16px;
                border-bottom:1px solid #EEEEEE;
                flex-wrap:wrap;
            ">

                <div>
                    <div style="
                        color:#FF6B35;
                        font-size:10px;
                        font-weight:800;
                        letter-spacing:0.7px;
                        margin-bottom:5px;
                    ">
                        ORDER DETAILS
                    </div>

                    <div style="
                        font-size:22px;
                        font-weight:800;
                        color:#202020;
                    ">
                        Order #<%= order.getOrderId() %>
                    </div>
                </div>

                <div style="
                    background:#FFF0E7;
                    color:#E85B1E;
                    padding:8px 15px;
                    border-radius:20px;
                    font-size:12px;
                    font-weight:800;
                    white-space:nowrap;
                ">
                    <%= order.getStatus() %>
                </div>

            </div>


            <!-- ORDER INFORMATION -->
            <div style="
                display:grid;
                grid-template-columns:repeat(3,1fr);
                gap:14px;
                margin-bottom:20px;
            ">

                <div style="
                    background:#FAFAFA;
                    border:1px solid #EEEEEE;
                    border-radius:10px;
                    padding:14px;
                ">
                    <div style="
                        color:#888888;
                        font-size:10px;
                        font-weight:700;
                        margin-bottom:6px;
                    ">
                        ORDER DATE
                    </div>
                    <div style="
                        color:#333333;
                        font-size:13px;
                        font-weight:700;
                    ">
                        <%= order.getOrderDate() %>
                    </div>
                </div>

                <div style="
                    background:#FAFAFA;
                    border:1px solid #EEEEEE;
                    border-radius:10px;
                    padding:14px;
                ">
                    <div style="
                        color:#888888;
                        font-size:10px;
                        font-weight:700;
                        margin-bottom:6px;
                    ">
                        PAYMENT METHOD
                    </div>
                    <div style="
                        color:#333333;
                        font-size:13px;
                        font-weight:700;
                    ">
                        <%= order.getPaymentMethod() %>
                    </div>
                </div>

                <div style="
                    background:#FAFAFA;
                    border:1px solid #EEEEEE;
                    border-radius:10px;
                    padding:14px;
                ">
                    <div style="
                        color:#888888;
                        font-size:10px;
                        font-weight:700;
                        margin-bottom:6px;
                    ">
                        RESTAURANT
                    </div>
                    <div style="
                        color:#333333;
                        font-size:13px;
                        font-weight:700;
                    ">
                    <%
                        if (restaurant != null) {
                    %>
                        <%= restaurant.getName() %>
                    <%
                        } else {
                    %>
                        Restaurant not found
                    <%
                        }
                    %>
                    </div>
                </div>

            </div>


            <!-- DELIVERY INFORMATION -->
            <div style="
                background:#FFF7F1;
                border:1px solid #F4D9C8;
                border-left:4px solid #FF6B35;
                border-radius:10px;
                padding:16px;
                margin-top:18px;
            ">

                <div style="
                    color:#E85B1E;
                    font-size:13px;
                    font-weight:800;
                    margin-bottom:5px;
                ">
                    Delivery Information
                </div>

                <div style="
                    color:#6D6D6D;
                    font-size:12px;
                    line-height:1.6;
                ">
                    Your order is being processed and will be delivered to your registered address.
                </div>

            </div>


            <!-- ORDER PROGRESS -->
            <div style="
                background:#FFFFFF;
                border:1px solid #EEEEEE;
                border-radius:12px;
                padding:18px;
                margin-top:20px;
            ">

                <div style="
                    color:#202020;
                    font-size:13px;
                    font-weight:800;
                    margin-bottom:18px;
                ">
                    Order Status
                </div>

                <div style="
                    display:flex;
                    align-items:flex-start;
                    justify-content:space-between;
                    width:100%;
                ">

                    <div style="
                        flex:1;
                        text-align:center;
                    ">
                        <div style="
                            width:32px;
                            height:32px;
                            line-height:32px;
                            margin:0 auto;
                            border-radius:50%;
                            background:#FF6B35;
                            color:#FFFFFF;
                            font-size:12px;
                            font-weight:800;
                        ">1</div>
                        <div style="
                            margin-top:7px;
                            color:#555555;
                            font-size:10px;
                            font-weight:600;
                        ">Order Placed</div>
                    </div>

                    <div style="
                        flex:0.7;
                        height:3px;
                        margin-top:15px;
                        background:#FF6B35;
                        border-radius:10px;
                    "></div>

                    <div style="
                        flex:1;
                        text-align:center;
                    ">
                        <div style="
                            width:32px;
                            height:32px;
                            line-height:32px;
                            margin:0 auto;
                            border-radius:50%;
                            background:#FF6B35;
                            color:#FFFFFF;
                            font-size:12px;
                            font-weight:800;
                        ">2</div>
                        <div style="
                            margin-top:7px;
                            color:#555555;
                            font-size:10px;
                            font-weight:600;
                        ">Preparing</div>
                    </div>

                    <div style="
                        flex:0.7;
                        height:3px;
                        margin-top:15px;
                        background:#FF6B35;
                        border-radius:10px;
                    "></div>

                    <div style="
                        flex:1;
                        text-align:center;
                    ">
                        <div style="
                            width:32px;
                            height:32px;
                            line-height:32px;
                            margin:0 auto;
                            border-radius:50%;
                            background:#FF6B35;
                            color:#FFFFFF;
                            font-size:12px;
                            font-weight:800;
                        ">3</div>
                        <div style="
                            margin-top:7px;
                            color:#555555;
                            font-size:10px;
                            font-weight:600;
                        ">Out for Delivery</div>
                    </div>

                    <div style="
                        flex:0.7;
                        height:3px;
                        margin-top:15px;
                        background:#FF6B35;
                        border-radius:10px;
                    "></div>

                    <div style="
                        flex:1;
                        text-align:center;
                    ">
                        <div style="
                            width:32px;
                            height:32px;
                            line-height:32px;
                            margin:0 auto;
                            border-radius:50%;
                            background:#FF6B35;
                            color:#FFFFFF;
                            font-size:12px;
                            font-weight:800;
                        ">4</div>
                        <div style="
                            margin-top:7px;
                            color:#555555;
                            font-size:10px;
                            font-weight:600;
                        ">Delivered</div>
                    </div>

                </div>
            </div>


            <!-- ORDERED ITEMS -->
            <div style="
                margin-top:24px;
            ">

                <div style="
                    display:flex;
                    justify-content:space-between;
                    align-items:center;
                    margin-bottom:12px;
                    padding-bottom:10px;
                    border-bottom:1px solid #EEEEEE;
                ">
                    <div style="
                        color:#202020;
                        font-size:15px;
                        font-weight:800;
                    ">
                        Ordered Items
                    </div>

                    <div style="
                        color:#FF6B35;
                        font-size:11px;
                        font-weight:700;
                    ">
                        ORDER #<%= order.getOrderId() %>
                    </div>
                </div>

            <%
                if (orderItems != null &&
                    !orderItems.isEmpty()) {

                    for (OrderItem orderItem : orderItems) {

                        Menu menu =
                            menuMap.get(orderItem.getMenuId());

                        if (menu != null) {

                            double itemTotal =
                                orderItem.getPrice()
                                * orderItem.getQuantity();
            %>

                <div style="
                    display:flex;
                    justify-content:space-between;
                    align-items:center;
                    gap:20px;
                    padding:14px 0;
                    border-bottom:1px solid #F0F0F0;
                ">

                    <div style="
                        min-width:0;
                    ">
                        <div style="
                            color:#333333;
                            font-size:14px;
                            font-weight:700;
                            margin-bottom:5px;
                        ">
                            <%= menu.getName() %>
                        </div>

                        <div style="
                            color:#777777;
                            font-size:11px;
                        ">
                            Quantity: <%= orderItem.getQuantity() %>
                            &nbsp; × &nbsp;
                            &#8377;<%= orderItem.getPrice() %>
                        </div>
                    </div>

                    <div style="
                        color:#FF6B35;
                        font-size:15px;
                        font-weight:800;
                        white-space:nowrap;
                    ">
                        &#8377;<%= itemTotal %>
                    </div>

                </div>

            <%
                        }
                    }
                } else {
            %>

                <div style="
                    color:#777777;
                    font-size:12px;
                    padding:12px 0;
                ">
                    No items found for this order.
                </div>

            <%
                }
            %>

            </div>


            <!-- TOTAL -->
            <div style="
                margin-top:20px;
                background:#FFF7F1;
                border:1px solid #F4D9C8;
                border-radius:10px;
                padding:16px;
                display:flex;
                justify-content:space-between;
                align-items:center;
                gap:15px;
            ">

                <div style="
                    color:#555555;
                    font-size:13px;
                    font-weight:700;
                ">
                    Total Amount
                </div>

                <div style="
                    color:#E85B1E;
                    font-size:21px;
                    font-weight:800;
                ">
                    &#8377;<%= order.getTotalAmount() %>
                </div>

            </div>


            <!-- ACTION BUTTONS -->
            <div style="
                margin-top:20px;
                display:flex;
                gap:10px;
                flex-wrap:wrap;
            ">

                <a href="orderDetails?orderId=<%= order.getOrderId() %>" style="
                    display:inline-block;
                    padding:10px 17px;
                    background:#FF6B35;
                    color:#FFFFFF;
                    text-decoration:none;
                    border-radius:8px;
                    font-size:11px;
                    font-weight:700;
                ">
                    View Details
                </a>

                <a href="menu" style="
                    display:inline-block;
                    padding:10px 17px;
                    background:#FF6B35;
                    color:#FFFFFF;
                    text-decoration:none;
                    border-radius:8px;
                    font-size:11px;
                    font-weight:700;
                ">
                    Order Again
                </a>

                <a href="restaurants" style="
                    display:inline-block;
                    padding:10px 17px;
                    background:#FFFFFF;
                    color:#FF6B35;
                    text-decoration:none;
                    border:1px solid #FF6B35;
                    border-radius:8px;
                    font-size:11px;
                    font-weight:700;
                ">
                    Browse Restaurants
                </a>

            <%
                if ("Preparing".equalsIgnoreCase(order.getStatus())) {
            %>

                <a href="cancelOrder?orderId=<%= order.getOrderId() %>"
                   onclick="return confirm('Are you sure you want to cancel this order?');"
                   style="
                       display:inline-block;
                       padding:10px 17px;
                       background:#FFF1F1;
                       color:#C62828;
                       text-decoration:none;
                       border:1px solid #E57373;
                       border-radius:8px;
                       font-size:11px;
                       font-weight:700;
                   ">
                    Cancel Order
                </a>

            <%
                }
            %>

            </div>

        </section>

    <%
            }
        }
    %>


    <!-- ================= BOTTOM NAVIGATION ================= -->
    <div style="
        background:#FFFFFF;
        border:1px solid #EEEEEE;
        border-radius:12px;
        margin-top:30px;
        padding:20px;
        text-align:center;
        box-shadow:0 3px 12px rgba(0,0,0,0.04);
    ">

        <a href="index.html" style="
            color:#FF6B35;
            text-decoration:none;
            font-weight:700;
            font-size:11px;
            margin:0 10px;
        ">
            Home
        </a>

        <a href="restaurants" style="
            color:#FF6B35;
            text-decoration:none;
            font-weight:700;
            font-size:11px;
            margin:0 10px;
        ">
            Restaurants
        </a>

        <a href="menu" style="
            color:#FF6B35;
            text-decoration:none;
            font-weight:700;
            font-size:11px;
            margin:0 10px;
        ">
            Menu
        </a>

        <a href="cart" style="
            color:#FF6B35;
            text-decoration:none;
            font-weight:700;
            font-size:11px;
            margin:0 10px;
        ">
            Cart
        </a>

        <a href="profile" style="
            color:#FF6B35;
            text-decoration:none;
            font-weight:700;
            font-size:11px;
            margin:0 10px;
        ">
            Profile
        </a>

    </div>

</main>


<!-- ================= FOOTER ================= -->
<footer style="
    background:#202020;
    color:#FFFFFF;
    margin-top:0;
    padding:42px 25px 25px 25px;
    text-align:center;
">

    <div style="
        color:#FF6B35;
        font-size:24px;
        font-weight:800;
        margin-bottom:8px;
    ">
        FoodOrder
    </div>

    <p style="
        font-size:11px;
        opacity:0.75;
        margin:0;
    ">
        Delicious food delivered fast to your doorstep.
    </p>

    <div style="
        margin-top:18px;
        font-size:11px;
    ">

        <a href="index.html" style="
            color:#FFFFFF;
            text-decoration:none;
            margin:0 9px;
        ">
            Home
        </a>

        <a href="restaurants" style="
            color:#FFFFFF;
            text-decoration:none;
            margin:0 9px;
        ">
            Restaurants
        </a>

        <a href="menu" style="
            color:#FFFFFF;
            text-decoration:none;
            margin:0 9px;
        ">
            Menu
        </a>

        <a href="order" style="
            color:#FFFFFF;
            text-decoration:none;
            margin:0 9px;
        ">
            Orders
        </a>

        <a href="profile" style="
            color:#FFFFFF;
            text-decoration:none;
            margin:0 9px;
        ">
            Profile
        </a>

        <a href="cart" style="
            color:#FFFFFF;
            text-decoration:none;
            margin:0 9px;
        ">
            Cart
        </a>

    </div>

    <p style="
        font-size:10px;
        opacity:0.5;
        margin-top:18px;
    ">
        © 2026 FoodOrder. All Rights Reserved.
    </p>

</footer>

</body>
</html>
