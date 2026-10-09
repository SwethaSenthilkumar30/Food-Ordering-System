<%@ page import="java.util.List" %>
<%@ page import="com.tap.model.Order" %>
<%@ page import="com.tap.model.OrderItem" %>
<%@ page import="com.tap.model.Restaurant" %>
<%@ page import="com.tap.model.Menu" %>
<%@ page import="com.tap.service.MenuService" %>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Order Details</title>

<style>

body {
    margin: 0;
    font-family: Arial, sans-serif;
    background: #fff4f5;
}

header {
    background: linear-gradient(90deg, #ff1f3d, #e91632);
    color: white;
    padding: 18px 40px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.logo {
    font-size: 26px;
    font-weight: bold;
}

nav a {
    color: white;
    text-decoration: none;
    margin-left: 25px;
    font-weight: bold;
}

.container {
    width: 90%;
    max-width: 900px;
    margin: 40px auto;
}

.page-title {
    text-align: center;
    color: #b51218;
    margin-bottom: 30px;
}

.order-card {
    background: white;
    border-radius: 15px;
    padding: 30px;
    box-shadow: 0 5px 15px rgba(181, 18, 24, 0.12);
    border: 1px solid #ffd6da;
}

.order-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding-bottom: 20px;
    border-bottom: 1px solid #f1dadd;
}

.order-id {
    font-size: 22px;
    font-weight: bold;
    color: #b51218;
}

.status {
    background: #ffe1e5;
    color: #b51218;
    padding: 8px 16px;
    border-radius: 20px;
    font-weight: bold;
}

.order-info {
    margin-top: 15px;
    color: #555;
}

.info-title {
    color: #b51218;
    font-weight: bold;
}

.restaurant-box {
    margin-top: 25px;
    padding: 18px;
    background: #fff4f5;
    border-radius: 10px;
    border-left: 4px solid #ff1f3d;
}

.restaurant-name {
    color: #b51218;
    font-size: 18px;
    font-weight: bold;
    margin-bottom: 8px;
}

.items-title {
    color: #b51218;
    font-size: 18px;
    font-weight: bold;
    margin-top: 30px;
    margin-bottom: 10px;
}

.item {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 15px 0;
    border-bottom: 1px solid #f1dadd;
}

.item-name {
    font-weight: bold;
    color: #333;
}

.item-details {
    color: #777;
    font-size: 14px;
    margin-top: 5px;
}

.item-price {
    color: #b51218;
    font-weight: bold;
}

.total {
    text-align: right;
    font-size: 20px;
    font-weight: bold;
    color: #b51218;
    margin-top: 25px;
}

.button-area {
    margin-top: 30px;
    display: flex;
    gap: 12px;
    flex-wrap: wrap;
}

.btn {
    display: inline-block;
    padding: 12px 22px;
    background: linear-gradient(90deg, #ff1f3d, #e91632);
    color: white;
    text-decoration: none;
    border-radius: 8px;
    font-weight: bold;
}

.btn-secondary {
    background: white;
    color: #b51218;
    border: 1px solid #ff1f3d;
}

</style>

</head>


<body>

<header>

    <div class="logo">
        FoodOrder
    </div>

    <nav>

        <a href="restaurants">Restaurants</a>

        <a href="menu">Menu</a>

        <a href="cart">Cart</a>

        <a href="order">Orders</a>

        <a href="logout">Logout</a>

    </nav>

</header>


<div class="container">

    <h1 class="page-title">
        Order Details
    </h1>


<%

    Order order =
        (Order) request.getAttribute("order");

    List<OrderItem> orderItems =
        (List<OrderItem>) request.getAttribute("orderItems");

    Restaurant restaurant =
        (Restaurant) request.getAttribute("restaurant");

    MenuService menuService =
        new MenuService();

%>


<%

    if (order == null) {

%>

    <div class="order-card">

        <h2>Order Not Found</h2>

        <p>
            The requested order could not be found.
        </p>

        <a href="order" class="btn">
            Back to Orders
        </a>

    </div>

<%

    } else {

%>


    <div class="order-card">


        <!-- Order Header -->

        <div class="order-header">

            <div class="order-id">

                Order #<%= order.getOrderId() %>

            </div>

            <div class="status">

                <%= order.getStatus() %>

            </div>

        </div>


        <!-- Order Date -->

        <div class="order-info">

            <span class="info-title">
                Order Date:
            </span>

            <%= order.getOrderDate() %>

        </div>


        <!-- Payment Method -->

        <div class="order-info">

            <span class="info-title">
                Payment Method:
            </span>

            <%= order.getPaymentMethod() %>

        </div>


        <!-- Restaurant -->

        <div class="restaurant-box">

<%

        if (restaurant != null) {

%>

            <div class="restaurant-name">

                <%= restaurant.getName() %>

            </div>

            <div>

                <%= restaurant.getAddress() %>

            </div>

            <div>

                Cuisine:
                <%= restaurant.getCuisineType() %>

            </div>

<%

        } else {

%>

            <div class="restaurant-name">

                Restaurant not found

            </div>

<%

        }

%>

        </div>


        <!-- Ordered Items -->

        <div class="items-title">

            Ordered Items

        </div>


<%

        if (orderItems != null &&
            !orderItems.isEmpty()) {

            for (OrderItem orderItem : orderItems) {

                Menu menu =
                    menuService.getMenu(
                        orderItem.getMenuId()
                    );

                if (menu != null) {

                    double itemTotal =
                        orderItem.getPrice()
                        * orderItem.getQuantity();

%>


        <div class="item">

            <div>

                <div class="item-name">

                    <%= menu.getName() %>

                </div>

                <div class="item-details">

                    Quantity:
                    <%= orderItem.getQuantity() %>

                    &nbsp; × &nbsp;

                    &#8377;<%= orderItem.getPrice() %>

                </div>

            </div>


            <div class="item-price">

                &#8377;<%= itemTotal %>

            </div>

        </div>


<%

                }

            }

        } else {

%>

        <div class="item-details">

            No items found for this order.

        </div>

<%

        }

%>


        <!-- Total -->

        <div class="total">

            Total Amount:

            &#8377;<%= order.getTotalAmount() %>

        </div>


        <!-- Buttons -->

        <div class="button-area">

            <a href="order" class="btn">
                Back to Orders
            </a>

            <a href="menu"
               class="btn btn-secondary">
                Order Again
            </a>

        </div>


    </div>


<%

    }

%>

</div>

</body>

</html>