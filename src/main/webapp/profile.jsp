<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.tap.model.User" %>

<%
User user = (User) request.getAttribute("user");

if (user == null) {
    response.sendRedirect("login.html");
    return;
}

String name = user.getName();
String firstLetter = "U";

if (name != null && !name.trim().isEmpty()) {
    firstLetter = name.trim().substring(0, 1).toUpperCase();
}
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Profile - FoodOrder</title>
</head>

<body style="margin:0; padding:0; background:#fff7f2; font-family:Arial,Helvetica,sans-serif; color:#222;">

    <!-- Navbar -->
    <header style="
        background:#ffffff;
        height:75px;
        display:flex;
        align-items:center;
        justify-content:space-between;
        padding:0 55px;
        box-sizing:border-box;
        border-bottom:1px solid #f0e0d8;
        box-shadow:0 2px 10px rgba(0,0,0,0.05);
    ">

        <!-- Logo -->
        <div style="
            font-size:30px;
            font-weight:bold;
            color:#fc8019;
            letter-spacing:-1px;
        ">
            FoodOrder
        </div>

        <!-- Navigation -->
        <nav style="display:flex; align-items:center; gap:32px;">

            <a href="index.html"
               style="
               text-decoration:none;
               color:#333;
               font-size:16px;
               font-weight:600;
               ">
                Home
            </a>

            <a href="restaurants"
               style="
               text-decoration:none;
               color:#333;
               font-size:16px;
               font-weight:600;
               ">
                Restaurants
            </a>

            <a href="menu"
               style="
               text-decoration:none;
               color:#333;
               font-size:16px;
               font-weight:600;
               ">
                Menu
            </a>

            <a href="order"
               style="
               text-decoration:none;
               color:#333;
               font-size:16px;
               font-weight:600;
               ">
                Orders
            </a>

            <a href="cart"
               style="
               text-decoration:none;
               color:#333;
               font-size:16px;
               font-weight:600;
               ">
                Cart
            </a>

            <a href="profile"
               style="
               text-decoration:none;
               color:#fc8019;
               font-size:16px;
               font-weight:700;
               border-bottom:2px solid #fc8019;
               padding-bottom:5px;
               ">
                Profile
            </a>

            <a href="logout"
               style="
               text-decoration:none;
               color:#333;
               font-size:16px;
               font-weight:600;
               ">
                Logout
            </a>

        </nav>
    </header>


    <!-- Main Profile Section -->
    <main style="
        width:100%;
        min-height:calc(100vh - 135px);
        padding:50px 20px;
        box-sizing:border-box;
    ">

        <!-- Profile Card -->
        <div style="
            width:100%;
            max-width:850px;
            margin:0 auto;
            background:#ffffff;
            border-radius:20px;
            padding:40px 50px;
            box-sizing:border-box;
            box-shadow:0 8px 30px rgba(0,0,0,0.08);
            border:1px solid #f2ddd3;
        ">

            <!-- Profile Heading -->
            <div style="
                text-align:center;
                margin-bottom:40px;
            ">

                <!-- Profile Circle -->
                <div style="
                    width:90px;
                    height:90px;
                    margin:0 auto 15px auto;
                    border-radius:50%;
                    background:#fc8019;
                    color:white;
                    display:flex;
                    align-items:center;
                    justify-content:center;
                    font-size:38px;
                    font-weight:bold;
                    box-shadow:0 5px 15px rgba(252,128,25,0.25);
                ">
                    <%= firstLetter %>
                </div>

                <h1 style="
                    margin:0;
                    color:#222;
                    font-size:30px;
                    font-weight:700;
                ">
                    My Profile
                </h1>

                <p style="
                    margin:8px 0 0 0;
                    color:#777;
                    font-size:15px;
                ">
                    View and manage your account information
                </p>

            </div>


            <!-- Full Name -->
            <div style="
                padding:18px 5px;
                border-bottom:1px solid #f0d8ce;
            ">

                <div style="
                    font-size:14px;
                    color:#888;
                    margin-bottom:7px;
                ">
                    Full Name
                </div>

                <div style="
                    font-size:17px;
                    color:#222;
                    font-weight:500;
                ">
                    <%= user.getName() %>
                </div>

            </div>


            <!-- Email -->
            <div style="
                padding:18px 5px;
                border-bottom:1px solid #f0d8ce;
            ">

                <div style="
                    font-size:14px;
                    color:#888;
                    margin-bottom:7px;
                ">
                    Email
                </div>

                <div style="
                    font-size:17px;
                    color:#222;
                    font-weight:500;
                ">
                    <%= user.getEmail() %>
                </div>

            </div>


            <!-- Phone -->
            <div style="
                padding:18px 5px;
                border-bottom:1px solid #f0d8ce;
            ">

                <div style="
                    font-size:14px;
                    color:#888;
                    margin-bottom:7px;
                ">
                    Phone
                </div>

                <div style="
                    font-size:17px;
                    color:#222;
                    font-weight:500;
                ">
                    <%= user.getPhone() %>
                </div>

            </div>


            <!-- Address -->
            <div style="
                padding:18px 5px;
                border-bottom:1px solid #f0d8ce;
            ">

                <div style="
                    font-size:14px;
                    color:#888;
                    margin-bottom:7px;
                ">
                    Address
                </div>

                <div style="
                    font-size:17px;
                    color:#222;
                    font-weight:500;
                ">
                    <%= user.getAddress() %>
                </div>

            </div>


            <!-- Account Type -->
            <div style="
                padding:18px 5px;
                border-bottom:1px solid #f0d8ce;
            ">

                <div style="
                    font-size:14px;
                    color:#888;
                    margin-bottom:7px;
                ">
                    Account Type
                </div>

                <div style="
                    font-size:17px;
                    color:#222;
                    font-weight:500;
                    text-transform:uppercase;
                ">
                    <%= user.getRole() %>
                </div>

            </div>


            <!-- Buttons -->
            <div style="
                margin-top:30px;
                display:flex;
                flex-wrap:wrap;
                gap:15px;
                align-items:center;
            ">

                <!-- Edit Profile -->
                <a href="editProfile"
                   style="
                   text-decoration:none;
                   background:#fc8019;
                   color:#ffffff;
                   padding:14px 25px;
                   border-radius:9px;
                   font-size:15px;
                   font-weight:700;
                   display:inline-block;
                   ">
                    Edit Profile
                </a>


                <!-- Delete Account -->
                <a href="deleteAccount"
                   onclick="return confirm('Are you sure you want to delete your account?');"
                   style="
                   text-decoration:none;
                   background:#d32f2f;
                   color:#ffffff;
                   padding:14px 25px;
                   border-radius:9px;
                   font-size:15px;
                   font-weight:700;
                   display:inline-block;
                   ">
                    Delete Account
                </a>


                <!-- My Orders -->
                <a href="order"
                   style="
                   text-decoration:none;
                   background:#ffffff;
                   color:#fc8019;
                   padding:13px 25px;
                   border-radius:9px;
                   font-size:15px;
                   font-weight:700;
                   display:inline-block;
                   border:1px solid #fc8019;
                   ">
                    My Orders
                </a>


                <!-- Continue Shopping -->
                <a href="menu"
                   style="
                   text-decoration:none;
                   background:#ffffff;
                   color:#fc8019;
                   padding:13px 25px;
                   border-radius:9px;
                   font-size:15px;
                   font-weight:700;
                   display:inline-block;
                   border:1px solid #fc8019;
                   ">
                    Continue Shopping
                </a>

            </div>

        </div>

    </main>


    <!-- Footer -->
    <footer style="
        background:#202020;
        color:#ffffff;
        text-align:center;
        padding:22px 15px;
        font-size:14px;
    ">
        © 2026 FoodOrder. All rights reserved.
    </footer>

</body>
</html>