<%@ page import="java.util.List" %>
<%@ page import="com.tap.model.Order" %>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Admin - Orders</title>

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
    width: 92%;
    max-width: 1200px;
    margin: 40px auto;
}

h1 {
    color: #b51218;
    text-align: center;
    margin-bottom: 30px;
}

.admin-card {
    background: white;
    border-radius: 15px;
    padding: 25px;
    box-shadow: 0 5px 15px rgba(181, 18, 24, 0.12);
    border: 1px solid #ffd6da;
    overflow-x: auto;
}

table {
    width: 100%;
    border-collapse: collapse;
}

th {
    background: #ffe1e5;
    color: #b51218;
    padding: 14px;
    text-align: left;
}

td {
    padding: 14px;
    border-bottom: 1px solid #f1dadd;
    color: #555;
}

tr:hover {
    background: #fff8f9;
}

.order-id {
    color: #b51218;
    font-weight: bold;
}

.status {
    background: #ffe1e5;
    color: #b51218;
    padding: 6px 12px;
    border-radius: 20px;
    font-weight: bold;
    display: inline-block;
}

.amount {
    color: #b51218;
    font-weight: bold;
}

.view-btn {
    display: inline-block;
    padding: 8px 15px;
    background: linear-gradient(90deg, #ff1f3d, #e91632);
    color: white;
    text-decoration: none;
    border-radius: 7px;
    font-weight: bold;
}

.empty {
    text-align: center;
    padding: 40px;
    color: #777;
}

.back-btn {
    display: inline-block;
    margin-top: 25px;
    padding: 12px 22px;
    background: linear-gradient(90deg, #ff1f3d, #e91632);
    color: white;
    text-decoration: none;
    border-radius: 8px;
    font-weight: bold;
}

</style>

</head>

<body>

<header>

    <div class="logo">
        FoodOrder Admin
    </div>

    <nav>

        <a href="adminOrders">Orders</a>

        <a href="restaurants">Restaurants</a>

        <a href="menu">Menu</a>

        <a href="logout">Logout</a>

    </nav>

</header>


<div class="container">

    <h1>All Orders</h1>


<%

    List<Order> orders =
        (List<Order>) request.getAttribute("orders");


    if (orders == null || orders.isEmpty()) {

%>

    <div class="admin-card">

        <div class="empty">

            <h2>No Orders Found</h2>

            <p>
                There are currently no orders in the system.
            </p>

        </div>

    </div>

<%

    } else {

%>

    <div class="admin-card">

        <table>

            <thead>

                <tr>

                    <th>Order ID</th>

                    <th>User ID</th>

                    <th>Restaurant ID</th>

                    <th>Order Date</th>

                    <th>Payment</th>

                    <th>Total</th>

                    <th>Status</th>

                    <th>Action</th>

                </tr>

            </thead>


            <tbody>

<%

        for (Order order : orders) {

%>

                <tr>

                    <td class="order-id">

                        #<%= order.getOrderId() %>

                    </td>


                    <td>

                        <%= order.getUserId() %>

                    </td>


                    <td>

                        <%= order.getRestaurantId() %>

                    </td>


                    <td>

                        <%= order.getOrderDate() %>

                    </td>


                    <td>

                        <%= order.getPaymentMethod() %>

                    </td>


                    <td class="amount">

                        &#8377;<%= order.getTotalAmount() %>

                    </td>


                    <td>

                        <span class="status">

                            <%= order.getStatus() %>

                        </span>

                    </td>


                    <td>

                        <a href="orderDetails?orderId=<%= order.getOrderId() %>"
                           class="view-btn">

                            View

                        </a>

                    </td>

                </tr>

<%

        }

%>

            </tbody>

        </table>

    </div>

<%

    }

%>


    <div style="text-align:center;">

        <a href="restaurants" class="back-btn">

            Back to Customer Site

        </a>

    </div>


</div>

</body>

</html>