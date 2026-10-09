<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.tap.model.Restaurant" %>

<%
    List<Restaurant> restaurants =
        (List<Restaurant>) request.getAttribute("restaurants");
%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>FoodOrder - Restaurants</title>

</head>

<body style="
    margin:0;
    padding:0;
    background:#F7F7F7;
    font-family:Arial, Helvetica, sans-serif;
    color:#1F1F1F;
">

<!-- ================= HEADER ================= -->

<header style="
    width:100%;
    background:#ffffff;
    border-bottom:1px solid #eeeeee;
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
    ">

        <!-- LOGO -->

        <a href="index.html"
           style="
               text-decoration:none;
               color:#FF6B35;
               font-size:28px;
               font-weight:800;
               letter-spacing:-0.7px;
           ">
            FoodOrder
        </a>


        <!-- PAGE LABEL -->

        <div style="
            display:flex;
            align-items:center;
            gap:8px;
            background:#FFF3EA;
            padding:9px 14px;
            border-radius:20px;
            color:#F4511E;
            font-size:12px;
            font-weight:700;
        ">
            Restaurants
        </div>


        <!-- NAVIGATION -->

        <nav style="
            display:flex;
            align-items:center;
            gap:26px;
        ">

            <a href="index.html"
               style="
                   text-decoration:none;
                   color:#333333;
                   font-size:14px;
                   font-weight:600;
               ">
                Home
            </a>

            <a href="#restaurants"
               style="
                   text-decoration:none;
                   color:#FF6B35;
                   font-size:14px;
                   font-weight:700;
               ">
                Restaurants
            </a>

            <a href="menu"
               style="
                   text-decoration:none;
                   color:#333333;
                   font-size:14px;
                   font-weight:600;
               ">
                Menu
            </a>

            <a href="order.html"
               style="
                   text-decoration:none;
                   color:#333333;
                   font-size:14px;
                   font-weight:600;
               ">
                Orders
            </a>

            <a href="profile"
               style="
                   text-decoration:none;
                   color:#333333;
                   font-size:14px;
                   font-weight:600;
               ">
                Profile
            </a>

            <a href="cart.html"
               style="
                   text-decoration:none;
                   color:#333333;
                   font-size:14px;
                   font-weight:600;
               ">
                Cart
            </a>

            <a href="login.html"
               style="
                   text-decoration:none;
                   color:#FFFFFF;
                   background:#FF6B35;
                   padding:10px 17px;
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
    max-width:1200px;
    margin:0 auto;
    padding:28px 0 55px 0;
    box-sizing:border-box;
">


<!-- ================= HERO ================= -->

<section style="
    width:100%;
    min-height:290px;
    background:#FFF7F1;
    border-radius:18px;
    overflow:hidden;
    position:relative;
    display:flex;
    align-items:stretch;
    box-shadow:0 6px 20px rgba(0,0,0,0.06);
">


    <!-- LEFT CONTENT -->

    <div style="
        width:55%;
        padding:40px 45px;
        box-sizing:border-box;
        display:flex;
        flex-direction:column;
        justify-content:center;
        position:relative;
        z-index:2;
    ">

        <div style="
            display:inline-block;
            align-self:flex-start;
            background:#FF6B35;
            color:white;
            padding:7px 13px;
            border-radius:6px;
            font-size:10px;
            font-weight:800;
            letter-spacing:0.6px;
            margin-bottom:14px;
        ">
            DISCOVER & ORDER
        </div>


        <h1 style="
            margin:0;
            font-size:38px;
            line-height:1.08;
            color:#222222;
            letter-spacing:-1px;
        ">
            Find Your Favourite
        </h1>


        <h2 style="
            margin:4px 0 12px 0;
            font-size:38px;
            line-height:1.08;
            color:#FF6B35;
            letter-spacing:-1px;
        ">
            Restaurants
        </h2>


        <p style="
            margin:0 0 20px 0;
            color:#6C6C6C;
            font-size:13px;
            line-height:1.6;
            max-width:520px;
        ">
            Explore delicious food from the best restaurants
            around you and order your favourite dishes.
        </p>


        <a href="#restaurants"
           style="
               display:inline-block;
               align-self:flex-start;
               background:#222222;
               color:#FFFFFF;
               text-decoration:none;
               padding:12px 22px;
               border-radius:8px;
               font-size:12px;
               font-weight:700;
           ">
            Explore Restaurants →
        </a>

    </div>


    <!-- RIGHT IMAGE -->

    <div style="
        width:45%;
        position:relative;
        overflow:hidden;
        background:#F6E4D6;
    ">

        <img src="images/restaurants.jpg"
             alt="Restaurants"
             style="
                 width:100%;
                 height:100%;
                 object-fit:cover;
                 display:block;
             ">


        <div style="
            position:absolute;
            top:0;
            left:0;
            width:45%;
            height:100%;
            background:linear-gradient(
                90deg,
                #FFF7F1 0%,
                rgba(255,247,241,0.80) 35%,
                rgba(255,247,241,0) 100%
            );
        ">


        <div style="
            position:absolute;
            right:18px;
            bottom:18px;
            background:#FFFFFF;
            color:#FF6B35;
            padding:9px 14px;
            border-radius:8px;
            font-size:10px;
            font-weight:800;
            box-shadow:0 4px 12px rgba(0,0,0,0.10);
        ">
            BEST FOOD AROUND YOU
        </div>

    </div>

</section>


<!-- ================= FEATURES ================= -->

<section style="
    display:grid;
    grid-template-columns:repeat(4,1fr);
    gap:14px;
    margin-top:18px;
">

    <!-- FEATURE 1 -->

    <div style="
        background:#FFFFFF;
        border:1px solid #EEEEEE;
        border-radius:10px;
        padding:16px 18px;
        display:flex;
        align-items:center;
        gap:12px;
        box-sizing:border-box;
    ">

        <div style="
            width:42px;
            height:42px;
            border-radius:9px;
            background:#FFF0E6;
            color:#FC8019;
            display:flex;
            align-items:center;
            justify-content:center;
            font-size:20px;
            font-weight:800;
            flex-shrink:0;
        ">
            1
        </div>

        <div>

            <h3 style="
                margin:0 0 4px 0;
                font-size:13px;
            ">
                Fast Delivery
            </h3>

            <p style="
                margin:0;
                color:#8A8A8A;
                font-size:10px;
                line-height:1.4;
            ">
                Quick delivery to your doorstep
            </p>

        </div>

    </div>


    <!-- FEATURE 2 -->

    <div style="
        background:#FFFFFF;
        border:1px solid #EEEEEE;
        border-radius:10px;
        padding:16px 18px;
        display:flex;
        align-items:center;
        gap:12px;
        box-sizing:border-box;
    ">

        <div style="
            width:42px;
            height:42px;
            border-radius:9px;
            background:#FFF8E5;
            color:#F0A800;
            display:flex;
            align-items:center;
            justify-content:center;
            font-size:20px;
            font-weight:800;
            flex-shrink:0;
        ">
            2
        </div>

        <div>

            <h3 style="
                margin:0 0 4px 0;
                font-size:13px;
            ">
                Fresh Food
            </h3>

            <p style="
                margin:0;
                color:#8A8A8A;
                font-size:10px;
                line-height:1.4;
            ">
                Fresh and quality ingredients
            </p>

        </div>

    </div>


    <!-- FEATURE 3 -->

    <div style="
        background:#FFFFFF;
        border:1px solid #EEEEEE;
        border-radius:10px;
        padding:16px 18px;
        display:flex;
        align-items:center;
        gap:12px;
        box-sizing:border-box;
    ">

        <div style="
            width:42px;
            height:42px;
            border-radius:9px;
            background:#E9F7EF;
            color:#2E8B57;
            display:flex;
            align-items:center;
            justify-content:center;
            font-size:20px;
            font-weight:800;
            flex-shrink:0;
        ">
            3
        </div>

        <div>

            <h3 style="
                margin:0 0 4px 0;
                font-size:13px;
            ">
                Secure Payment
            </h3>

            <p style="
                margin:0;
                color:#8A8A8A;
                font-size:10px;
                line-height:1.4;
            ">
                Safe and secure checkout
            </p>

        </div>

    </div>


    <!-- FEATURE 4 -->

    <div style="
        background:#FFFFFF;
        border:1px solid #EEEEEE;
        border-radius:10px;
        padding:16px 18px;
        display:flex;
        align-items:center;
        gap:12px;
        box-sizing:border-box;
    ">

        <div style="
            width:42px;
            height:42px;
            border-radius:9px;
            background:#FFF4D6;
            color:#C98A00;
            display:flex;
            align-items:center;
            justify-content:center;
            font-size:20px;
            font-weight:800;
            flex-shrink:0;
        ">
            4
        </div>

        <div>

            <h3 style="
                margin:0 0 4px 0;
                font-size:13px;
            ">
                Top Rated
            </h3>

            <p style="
                margin:0;
                color:#8A8A8A;
                font-size:10px;
                line-height:1.4;
            ">
                Highly rated restaurants
            </p>

        </div>

    </div>

</section>


<!-- ================= RESTAURANTS ================= -->

<section id="restaurants" style="
    margin-top:36px;
">


    <!-- TITLE -->

    <div style="
        display:flex;
        justify-content:space-between;
        align-items:flex-end;
        margin-bottom:18px;
    ">

        <div>

            <div style="
                color:#FC8019;
                font-size:10px;
                font-weight:800;
                letter-spacing:0.7px;
                margin-bottom:6px;
            ">
                RESTAURANTS NEAR YOU
            </div>

            <h2 style="
                margin:0;
                font-size:26px;
                font-weight:800;
                color:#202020;
                letter-spacing:-0.5px;
            ">
                Popular Restaurants
            </h2>

            <p style="
                margin:6px 0 0 0;
                color:#7A7A7A;
                font-size:12px;
            ">
                Choose from our best restaurants
            </p>

        </div>


        <a href="menu"
           style="
               display:block;
               text-align:center;
               background:#FC8019;
               color:#FFFFFF;
               text-decoration:none;
               padding:10px 14px;
               border-radius:7px;
               font-size:11px;
               font-weight:700;
           ">
            View Menu
        </a>

    </div>


    <!-- ================= RESTAURANT GRID ================= -->

    <div style="
        display:grid;
        grid-template-columns:repeat(3,1fr);
        gap:20px;
    ">


<%

    if (restaurants != null && !restaurants.isEmpty()) {

        for (Restaurant restaurant : restaurants) {

            String image = "images/restaurant.jpg";

            /*
             * RESTAURANT IMAGE MAPPING
             */

            if (restaurant.getRestaurantId() == 1) {

                image = "images/pizza.png";

            }
            else if (restaurant.getRestaurantId() == 2) {

                image = "images/biryani.png";

            }
            else if (restaurant.getRestaurantId() == 3) {

                image = "images/burgerpoint.png";

            }
            else if (restaurant.getRestaurantId() == 4) {

                image = "images/chennai-spice-kitchen.jpg";

            }
            else if (restaurant.getRestaurantId() == 5) {

                image = "images/dosa-hub.jpg";

            }
            else if (restaurant.getRestaurantId() == 6) {

                image = "images/pasta-street.jpg";

            }
            else if (restaurant.getRestaurantId() == 7) {

                image = "images/tandoori-treats.jpg";

            }
            else if (restaurant.getRestaurantId() == 8) {

                image = "images/south-indian-cafe.jpg";

            }
            else if (restaurant.getRestaurantId() == 9) {

                image = "images/royal-meals.jpg";

            }
            else if (restaurant.getRestaurantId() == 10) {

                image = "images/food-junction.jpg";

            }
            else if (restaurant.getRestaurantId() == 11) {

                image = "images/grill-house.jpg";

            }
            else if (restaurant.getRestaurantId() == 12) {

                image = "images/fresh-bowl.jpg";

            }
            else if (restaurant.getRestaurantId() == 13) {

                image = "images/andhra-spice.jpg";

            }
            else if (restaurant.getRestaurantId() == 14) {

                image = "images/coastal-bites.jpg";

            }
            else if (restaurant.getRestaurantId() == 15) {

                image = "images/urban-tiffin.jpg";

            }

%>


        <!-- ================= RESTAURANT CARD ================= -->

        <div style="
            background:#FFFFFF;
            border:1px solid #E9E9E9;
            border-radius:12px;
            overflow:hidden;
            box-shadow:0 3px 12px rgba(0,0,0,0.05);
        ">


            <!-- IMAGE -->

            <div style="
                width:100%;
                height:200px;
                overflow:hidden;
                background:#F2F2F2;
            ">

                <img src="<%= image %>"
                     alt="<%= restaurant.getName() %>"
                     style="
                         width:100%;
                         height:100%;
                         object-fit:cover;
                         display:block;
                     ">

            </div>


            <!-- CONTENT -->

            <div style="
                padding:16px 17px 18px 17px;
            ">


                <!-- NAME + RATING -->

                <div style="
                    display:flex;
                    justify-content:space-between;
                    align-items:flex-start;
                    gap:10px;
                    margin-bottom:6px;
                ">


                    <h3 style="
                        margin:0;
                        font-size:17px;
                        color:#202020;
                        line-height:1.25;
                    ">
                        <%= restaurant.getName() %>
                    </h3>


                    <div style="
                        background:#2E8B57;
                        color:white;
                        padding:5px 7px;
                        border-radius:5px;
                        font-size:10px;
                        font-weight:700;
                        white-space:nowrap;
                    ">
                        <%= restaurant.getRating() %> ★
                    </div>

                </div>


                <!-- CUISINE -->

                <p style="
                    margin:0 0 5px 0;
                    color:#6F6F6F;
                    font-size:11px;
                ">
                    <%= restaurant.getCuisineType() %>
                </p>


                <!-- DESCRIPTION -->

                <p style="
                    margin:0 0 14px 0;
                    color:#8A8A8A;
                    font-size:10px;
                ">
                    Delicious food and quality service
                </p>


                <!-- VIEW MENU -->

                <a href="menu?restaurantId=<%= restaurant.getRestaurantId() %>"
                   style="
                       display:block;
                       text-align:center;
                       background:#FC8019;
                       color:#FFFFFF;
                       text-decoration:none;
                       padding:10px 14px;
                       border-radius:7px;
                       font-size:11px;
                       font-weight:700;
                       box-sizing:border-box;
                   ">
                    View Menu
                </a>


            </div>

        </div>


<%

        }

    } else {

%>


        <!-- NO RESTAURANTS -->

        <div style="
            background:#FFFFFF;
            border:1px solid #EAEAEA;
            border-radius:12px;
            padding:25px;
            grid-column:1 / -1;
            text-align:center;
        ">

            <p style="
                color:#888;
                font-size:14px;
                margin:0;
            ">
                No restaurants available.
            </p>

        </div>


<%

    }

%>


    </div>

</section>


<!-- ================= OFFER ================= -->

<section style="
    margin-top:36px;
    background:linear-gradient(135deg,#FC8019,#F4511E);
    border-radius:12px;
    padding:25px 30px;
    color:white;
    display:flex;
    justify-content:space-between;
    align-items:center;
    box-sizing:border-box;
">


    <div>

        <div style="
            font-size:10px;
            font-weight:800;
            letter-spacing:0.8px;
            margin-bottom:6px;
            opacity:0.9;
        ">
            FOODORDER
        </div>


        <h2 style="
            margin:0 0 6px 0;
            font-size:25px;
        ">
            Hungry? Let's fix that!
        </h2>


        <p style="
            font-size:12px;
            margin:0;
            opacity:0.92;
        ">
            Order your favourite food today.
        </p>

    </div>


    <a href="menu"
       style="
           background:white;
           color:#FC8019;
           text-decoration:none;
           padding:11px 20px;
           border-radius:7px;
           font-size:12px;
           font-weight:800;
       ">
        Order Now
    </a>

</section>


</main>


<!-- ================= FOOTER ================= -->

<footer style="
    background:#202124;
    color:white;
    padding:38px 5%;
    text-align:center;
">


    <div style="
        color:#FC8019;
        font-size:25px;
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

        <a href="index.html"
           style="
               color:#FFFFFF;
               text-decoration:none;
               margin:0 10px;
           ">
            Home
        </a>


        <a href="#restaurants"
           style="
               color:#FFFFFF;
               text-decoration:none;
               margin:0 10px;
           ">
            Restaurants
        </a>


        <a href="menu"
           style="
               color:#FFFFFF;
               text-decoration:none;
               margin:0 10px;
           ">
            Menu
        </a>


        <a href="order.html"
           style="
               color:#FFFFFF;
               text-decoration:none;
               margin:0 10px;
           ">
            Orders
        </a>


        <a href="cart.html"
           style="
               color:#FFFFFF;
               text-decoration:none;
               margin:0 10px;
           ">
            Cart
        </a>

    </div>


    <p style="
        font-size:10px;
        opacity:0.55;
        margin-top:18px;
    ">
        © 2026 FoodOrder. All Rights Reserved.
    </p>


</footer>

</body>

</html>