<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.tap.model.Menu" %>

<%
    List<Menu> menus =
        (List<Menu>) request.getAttribute("menus");

    String selectedRestaurantId =
        request.getParameter("restaurantId");

    String selectedCategory =
        request.getParameter("category");

    boolean filterByRestaurant = false;
    int restaurantFilter = -1;

    if (selectedRestaurantId != null &&
        !selectedRestaurantId.trim().isEmpty()) {

        try {

            restaurantFilter =
                Integer.parseInt(selectedRestaurantId);

            filterByRestaurant = true;

        } catch (Exception e) {

            filterByRestaurant = false;
            restaurantFilter = -1;

        }
    }

    boolean filterByCategory =
        selectedCategory != null &&
        !selectedCategory.trim().isEmpty();


    /* =====================================================
       RESTAURANT NAME
       ===================================================== */

    String selectedRestaurantName = "";

    if (restaurantFilter == 1) {
        selectedRestaurantName = "Pizza House";
    }
    else if (restaurantFilter == 2) {
        selectedRestaurantName = "Biryani Corner";
    }
    else if (restaurantFilter == 3) {
        selectedRestaurantName = "Burger Point";
    }
    else if (restaurantFilter == 4) {
        selectedRestaurantName = "Chennai Spice Kitchen";
    }
    else if (restaurantFilter == 5) {
        selectedRestaurantName = "Dosa Hub";
    }
    else if (restaurantFilter == 6) {
        selectedRestaurantName = "Pasta Street";
    }
    else if (restaurantFilter == 7) {
        selectedRestaurantName = "Tandoori Treats";
    }
    else if (restaurantFilter == 8) {
        selectedRestaurantName = "South Indian Cafe";
    }
    else if (restaurantFilter == 9) {
        selectedRestaurantName = "Royal Meals";
    }
    else if (restaurantFilter == 10) {
        selectedRestaurantName = "The Food Junction";
    }
    else if (restaurantFilter == 11) {
        selectedRestaurantName = "Grill House";
    }
    else if (restaurantFilter == 12) {
        selectedRestaurantName = "Fresh Bowl";
    }
    else if (restaurantFilter == 13) {
        selectedRestaurantName = "Andhra Spice";
    }
    else if (restaurantFilter == 14) {
        selectedRestaurantName = "Coastal Bites";
    }
    else if (restaurantFilter == 15) {
        selectedRestaurantName = "Urban Tiffin";
    }


    /* =====================================================
       IMAGE MAP
       ===================================================== */

    Map<String,String> imageMap =
        new HashMap<String,String>();


    /* ================= PIZZA ================= */

    imageMap.put("Margherita Pizza",
                 "images/margherita.jpg");

    imageMap.put("Farmhouse Pizza",
                 "images/farmhousepizza.jpg");

    imageMap.put("Cheese Pizza",
                 "images/cheesepizza.jpg");

    imageMap.put("Paneer Pizza",
                 "images/paneer-pizza.jpg");

    imageMap.put("Corn Cheese Pizza",
                 "images/corn-cheese-pizza.jpg");

    imageMap.put("Mushroom Pizza",
                 "images/mushroom-pizza.jpg");


    /* ================= BURGER ================= */

    imageMap.put("Classic Burger",
                 "images/classicburger.jpg");

    imageMap.put("Cheese Burger",
                 "images/cheeseburger.jpg");

    imageMap.put("Veg Burger",
                 "images/vegburger.jpg");

    imageMap.put("Chicken Burger",
                 "images/chicken-burger.jpg");

    imageMap.put("Peri Peri Burger",
                 "images/peri-peri-burger.jpg");

    imageMap.put("Double Cheese Burger",
                 "images/double-cheese-burger.jpg");


    /* ================= BIRYANI ================= */

    imageMap.put("Chicken Biryani",
                 "images/chickenbiryani.jpg");

    imageMap.put("Mutton Biryani",
                 "images/muttonbiryani.jpg");

    imageMap.put("Veg Biryani",
                 "images/vegbiryani.jpg");

    imageMap.put("Egg Biryani",
                 "images/egg-biryani.jpg");

    imageMap.put("Chicken 65 Biryani",
                 "images/chicken-65-biryani.jpg");

    imageMap.put("Paneer Biryani",
                 "images/paneer-biryani.jpg");


    /* ================= SOUTH INDIAN ================= */

    imageMap.put("Masala Dosa",
                 "images/masaladosa.jpg");

    imageMap.put("Plain Dosa",
                 "images/plaindosa.jpg");

    imageMap.put("Cheese Dosa",
                 "images/cheesedosa.jpg");

    imageMap.put("Onion Dosa",
                 "images/onion-dosa.jpg");

    imageMap.put("Ghee Dosa",
                 "images/ghee-dosa.jpg");

    imageMap.put("Podi Dosa",
                 "images/podi-dosa.jpg");

    imageMap.put("Paneer Dosa",
                 "images/paneer-dosa.jpg");

    imageMap.put("Idli Sambar",
                 "images/idli-sambar.jpg");

    imageMap.put("Medu Vada",
                 "images/medu-vada.jpg");

    imageMap.put("Pongal",
                 "images/pongal.jpg");

    imageMap.put("Poori Masala",
                 "images/poori-masala.jpg");

    imageMap.put("Upma",
                 "images/upma.jpg");

    imageMap.put("Filter Coffee",
                 "images/filter-coffee.jpg");

    imageMap.put("Idli Vada",
                 "images/idli-vada.jpg");

    imageMap.put("Podi Idli",
                 "images/podi-idli.jpg");

    imageMap.put("Onion Uttapam",
                 "images/onion-uttapam.jpg");

    imageMap.put("Neer Dosa",
                 "images/neer-dosa.jpg");


    /* ================= PASTA ================= */

    imageMap.put("White Sauce Pasta",
                 "images/whitesaucepasta.jpg");

    imageMap.put("Red Sauce Pasta",
                 "images/redsaucepasta.jpg");

    imageMap.put("Cheese Pasta",
                 "images/cheesepasta.jpg");

    imageMap.put("Chicken Pasta",
                 "images/chicken-pasta.jpg");

    imageMap.put("Arrabbiata Pasta",
                 "images/arrabbiata-pasta.jpg");

    imageMap.put("Pesto Pasta",
                 "images/pesto-pasta.jpg");


    /* ================= CHINESE ================= */

    imageMap.put("Chicken Fried Rice",
                 "images/chicken-fried-rice.jpg");

    imageMap.put("Paneer Fried Rice",
                 "images/paneer-fried-rice.jpg");

    imageMap.put("Chicken Noodles",
                 "images/chicken-noodles.jpg");

    imageMap.put("Paneer Noodles",
                 "images/paneer-noodles.jpg");

    imageMap.put("Gobi Manchurian",
                 "images/gobi-manchurian.jpg");

    imageMap.put("Chilli Chicken",
                 "images/chilli-chicken.jpg");

    imageMap.put("Veg Fried Rice",
                 "images/veg-fried-rice.jpg");

    imageMap.put("Chicken Manchurian",
                 "images/chicken-manchurian.jpg");

    imageMap.put("Veg Noodles",
                 "images/veg-noodles.jpg");

    imageMap.put("French Fries",
                 "images/french-fries.jpg");

    imageMap.put("Chicken 65",
                 "images/chicken-65.jpg");


    /* ================= TANDOOR ================= */

    imageMap.put("Tandoori Chicken",
                 "images/tandoori-chicken.jpg");

    imageMap.put("Chicken Tikka",
                 "images/chicken-tikka.jpg");

    imageMap.put("Paneer Tikka",
                 "images/paneer-tikka.jpg");

    imageMap.put("Tandoori Paneer Roll",
                 "images/tandoori-paneer-roll.jpg");

    imageMap.put("Butter Chicken",
                 "images/butter-chicken.jpg");

    imageMap.put("Dal Tadka",
                 "images/dal-tadka.jpg");


    /* ================= MEALS ================= */

    imageMap.put("Veg Meals",
                 "images/veg-meals.jpg");

    imageMap.put("Chicken Meals",
                 "images/chicken-meals.jpg");

    imageMap.put("Mutton Meals",
                 "images/mutton-meals.jpg");

    imageMap.put("Paneer Butter Masala",
                 "images/paneer-butter-masala.jpg");

    imageMap.put("Chicken Curry",
                 "images/chicken-curry.jpg");

    imageMap.put("Jeera Rice",
                 "images/jeera-rice.jpg");


    /* ================= GRILL ================= */

    imageMap.put("Chicken Grill",
                 "images/chicken-grill.jpg");

    imageMap.put("Chicken Seekh Kebab",
                 "images/chicken-seekh-kebab.jpg");

    imageMap.put("Mutton Seekh Kebab",
                 "images/mutton-seekh-kebab.jpg");

    imageMap.put("Tandoori Wings",
                 "images/tandoori-wings.jpg");

    imageMap.put("Grilled Paneer",
                 "images/grilled-paneer.jpg");

    imageMap.put("Chicken Reshmi Kebab",
                 "images/chicken-reshmi-kebab.jpg");


    /* ================= HEALTHY FOOD ================= */

    imageMap.put("Veg Salad Bowl",
                 "images/veg-salad-bowl.jpg");

    imageMap.put("Chicken Salad Bowl",
                 "images/chicken-salad-bowl.jpg");

    imageMap.put("Paneer Salad Bowl",
                 "images/paneer-salad-bowl.jpg");

    imageMap.put("Fruit Bowl",
                 "images/fruit-bowl.jpg");

    imageMap.put("Sprouts Bowl",
                 "images/sprouts-bowl.jpg");

    imageMap.put("Chicken Rice Bowl",
                 "images/chicken-rice-bowl.jpg");


    /* ================= ANDHRA ================= */

    imageMap.put("Andhra Chicken Biryani",
                 "images/andhra-chicken-biryani.jpg");

    imageMap.put("Andhra Mutton Biryani",
                 "images/andhra-mutton-biryani.jpg");

    imageMap.put("Gongura Chicken",
                 "images/gongura-chicken.jpg");

    imageMap.put("Andhra Chicken Curry",
                 "images/andhra-chicken-curry.jpg");

    imageMap.put("Paneer Andhra Masala",
                 "images/paneer-andhra-masala.jpg");

    imageMap.put("Andhra Veg Meals",
                 "images/andhra-veg-meals.jpg");


    /* ================= SEAFOOD ================= */

    imageMap.put("Fish Fry",
                 "images/fish-fry.jpg");

    imageMap.put("Prawn Fry",
                 "images/prawn-fry.jpg");

    imageMap.put("Fish Curry",
                 "images/fish-curry.jpg");

    imageMap.put("Prawn Masala",
                 "images/prawn-masala.jpg");

    imageMap.put("Fish Biryani",
                 "images/fish-biryani.jpg");

%>


<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>FoodOrder - Menu</title>

</head>


<body style="
    margin:0;
    padding:0;
    background:#F7F7F7;
    font-family:Arial, Helvetica, sans-serif;
    color:#202020;
">


<!-- ===================================================== -->
<!-- HEADER - SAME STYLE AS RESTAURANT PAGE -->
<!-- ===================================================== -->

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

            Menu

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


            <a href="restaurants"
               style="
                   text-decoration:none;
                   color:#333333;
                   font-size:14px;
                   font-weight:600;
               ">

                Restaurants

            </a>


            <a href="menu"
               style="
                   text-decoration:none;
                   color:#FF6B35;
                   font-size:14px;
                   font-weight:700;
               ">

                Menu

            </a>


            <a href="order"
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


            <a href="cart"
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


<!-- ===================================================== -->
<!-- MAIN -->
<!-- ===================================================== -->

<main style="
    width:90%;
    max-width:1200px;
    margin:0 auto;
    padding:28px 0 55px 0;
    box-sizing:border-box;
">


<!-- ===================================================== -->
<!-- HERO - SAME STRUCTURE AS RESTAURANT PAGE -->
<!-- ===================================================== -->

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

            Discover Your

        </h1>


        <h2 style="
            margin:4px 0 12px 0;
            font-size:38px;
            line-height:1.08;
            color:#FF6B35;
            letter-spacing:-1px;
        ">

            Favourite Food

        </h2>


        <p style="
            margin:0 0 20px 0;
            color:#6C6C6C;
            font-size:13px;
            line-height:1.6;
            max-width:520px;
        ">

            Explore delicious dishes from your favourite
            restaurants and choose what you want to eat.

        </p>


        <a href="#menulist"
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

            Explore Menu →

        </a>


    </div>


    <!-- RIGHT IMAGE -->

    <div style="
        width:45%;
        position:relative;
        overflow:hidden;
        background:#F6E4D6;
    ">


        <img src="images/menu-hero.jpg"
             alt="Food Menu"
             style="
                 width:100%;
                 height:100%;
                 object-fit:cover;
                 display:block;
             ">


        <!-- IMAGE OVERLAY -->

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
        "></div>


        <!-- SMALL BADGE -->

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

            DELICIOUS FOOD

        </div>


    </div>

</section>


<!-- ===================================================== -->
<!-- MENU INTRO -->
<!-- ===================================================== -->

<section id="menulist" style="
    background:#FFFFFF;
    border-radius:16px;
    padding:28px 35px;
    margin-top:22px;
    margin-bottom:25px;
    border:1px solid #EEEEEE;
    box-shadow:0 5px 18px rgba(0,0,0,0.05);
">


    <div style="
        color:#FF6B35;
        font-size:10px;
        font-weight:800;
        letter-spacing:1px;
        margin-bottom:8px;
    ">

        FOODORDER MENU

    </div>


    <h2 style="
        margin:0 0 8px 0;
        font-size:28px;
        color:#202020;
    ">

        Delicious Menu

    </h2>


    <p style="
        margin:0;
        color:#777777;
        font-size:13px;
        line-height:1.6;
    ">

        Choose your favourite food and add it to your cart.

    </p>


    <% if (filterByRestaurant) { %>


    <div style="
        display:inline-block;
        margin-top:18px;
        background:#FFF0E6;
        color:#F4511E;
        padding:9px 14px;
        border-radius:7px;
        font-size:12px;
        font-weight:700;
    ">

        Showing menu for <%= selectedRestaurantName %>

    </div>


    <% } %>


</section>


<!-- ===================================================== -->
<!-- CATEGORY BUTTONS -->
<!-- ===================================================== -->

<div style="
    display:flex;
    flex-wrap:wrap;
    gap:10px;
    margin-bottom:30px;
">


    <a href="<%= filterByRestaurant ? "menu?restaurantId=" + restaurantFilter : "menu" %>"
       style="
           display:inline-block;
           background:#FF6B35;
           color:white;
           padding:10px 20px;
           border-radius:22px;
           text-decoration:none;
           font-size:12px;
           font-weight:700;
       ">

        All

    </a>


    <a href="#pizza"
       style="
           display:inline-block;
           background:white;
           color:#FF6B35;
           border:1px solid #FF6B35;
           padding:10px 20px;
           border-radius:22px;
           text-decoration:none;
           font-size:12px;
           font-weight:700;
       ">

        Pizza

    </a>


    <a href="#burger"
       style="
           display:inline-block;
           background:white;
           color:#FF6B35;
           border:1px solid #FF6B35;
           padding:10px 20px;
           border-radius:22px;
           text-decoration:none;
           font-size:12px;
           font-weight:700;
       ">

        Burger

    </a>


    <a href="#biryani"
       style="
           display:inline-block;
           background:white;
           color:#FF6B35;
           border:1px solid #FF6B35;
           padding:10px 20px;
           border-radius:22px;
           text-decoration:none;
           font-size:12px;
           font-weight:700;
       ">

        Biryani

    </a>


    <a href="#southindian"
       style="
           display:inline-block;
           background:white;
           color:#FF6B35;
           border:1px solid #FF6B35;
           padding:10px 20px;
           border-radius:22px;
           text-decoration:none;
           font-size:12px;
           font-weight:700;
       ">

        South Indian

    </a>


    <a href="#pasta"
       style="
           display:inline-block;
           background:white;
           color:#FF6B35;
           border:1px solid #FF6B35;
           padding:10px 20px;
           border-radius:22px;
           text-decoration:none;
           font-size:12px;
           font-weight:700;
       ">

        Pasta

    </a>


</div>


<!-- ===================================================== -->
<!-- MENU CONTAINER -->
<!-- ===================================================== -->

<div style="width:100%;">


<% if (filterByRestaurant) { %>


<!-- ===================================================== -->
<!-- SELECTED RESTAURANT MENU -->
<!-- ===================================================== -->

<section style="
    width:100%;
    margin-bottom:35px;
">


    <div style="
        background:#FFF7F1;
        border:1px solid #FFE0CC;
        border-radius:14px;
        padding:22px 25px;
        margin-bottom:22px;
        box-sizing:border-box;
    ">


        <div style="
            color:#FC8019;
            font-size:10px;
            font-weight:800;
            letter-spacing:1px;
            margin-bottom:7px;
        ">

            RESTAURANT MENU

        </div>


        <h2 style="
            margin:0 0 7px 0;
            font-size:28px;
            color:#202020;
        ">

            <%= selectedRestaurantName %>

        </h2>


        <p style="
            margin:0;
            color:#777777;
            font-size:12px;
        ">

            Explore the food available at this restaurant.

        </p>


    </div>


    <!-- RESTAURANT MENU GRID -->

    <div style="
        display:grid;
        grid-template-columns:repeat(3,1fr);
        gap:20px;
    ">


<%

    boolean restaurantHasMenu = false;

    if (menus != null && !menus.isEmpty()) {

        for (Menu menu : menus) {

            boolean showRestaurantMenu = false;


            /* =============================================
               RESTAURANT FILTER
               ============================================= */

            if (menu.getRestaurantId() == restaurantFilter) {

                showRestaurantMenu = true;

            }


            /* =============================================
               PIZZA HOUSE = ONLY PIZZA
               ============================================= */

            if (restaurantFilter == 1 &&
                !"Pizza".equalsIgnoreCase(menu.getCategory())) {

                showRestaurantMenu = false;

            }


            /* =============================================
               BIRYANI CORNER = ONLY BIRYANI
               ============================================= */

            if (restaurantFilter == 2 &&
                !"Biryani".equalsIgnoreCase(menu.getCategory())) {

                showRestaurantMenu = false;

            }


            /* =============================================
               BURGER POINT = ONLY BURGER
               ============================================= */

            if (restaurantFilter == 3 &&
                !"Burger".equalsIgnoreCase(menu.getCategory()) &&
                !"Burgers".equalsIgnoreCase(menu.getCategory())) {

                showRestaurantMenu = false;

            }


            if (showRestaurantMenu) {

                restaurantHasMenu = true;


                String image =
                    imageMap.get(menu.getName());


                if (image == null) {

                    image =
                        "images/restaurant.jpg";

                }

%>


        <!-- MENU CARD -->

        <div style="
            background:#FFFFFF;
            border:1px solid #EAEAEA;
            border-radius:12px;
            overflow:hidden;
            box-shadow:0 4px 14px rgba(0,0,0,0.06);
        ">


            <div style="
                width:100%;
                height:190px;
                overflow:hidden;
                background:#F2F2F2;
            ">


                <img src="<%= image %>"
                     alt="<%= menu.getName() %>"
                     style="
                         width:100%;
                         height:100%;
                         object-fit:cover;
                         display:block;
                     ">


            </div>


            <div style="
                padding:17px;
            ">


                <h3 style="
                    margin:0 0 7px 0;
                    font-size:17px;
                    color:#202020;
                ">

                    <%= menu.getName() %>

                </h3>


                <p style="
                    margin:0 0 13px 0;
                    color:#777777;
                    font-size:11px;
                    line-height:1.5;
                    min-height:32px;
                ">

                    <%= menu.getDescription() %>

                </p>


                <div style="
                    display:inline-block;
                    background:#FFF0E6;
                    color:#F4511E;
                    padding:5px 9px;
                    border-radius:5px;
                    font-size:9px;
                    font-weight:700;
                    margin-bottom:13px;
                ">

                    <%= menu.getCategory() %>

                </div>


                <div style="
                    display:flex;
                    justify-content:space-between;
                    align-items:center;
                ">


                    <span style="
                        color:#FF6B35;
                        font-size:18px;
                        font-weight:800;
                    ">

                        &#8377;<%= menu.getPrice() %>

                    </span>


                    <div id="cart-control-<%= menu.getMenuId() %>" style="display:flex;align-items:center;gap:7px;">

    <button
        id="add-button-<%= menu.getMenuId() %>"
        type="button"
        onclick="addMenuItem(<%= menu.getMenuId() %>)"
        style="
            background:#FF6B35;
            color:#FFFFFF;
            border:none;
            padding:9px 15px;
            border-radius:7px;
            font-size:11px;
            font-weight:700;
            cursor:pointer;
        ">
        Add to Cart
    </button>

</div>


                </div>


            </div>

        </div>


<%

            }

        }

    }

%>


    </div>


<% if (!restaurantHasMenu) { %>


    <div style="
        background:#FFFFFF;
        border:1px solid #EEEEEE;
        border-radius:12px;
        padding:30px;
        text-align:center;
        margin-top:20px;
    ">


        <h3 style="
            margin:0 0 8px 0;
            color:#202020;
            font-size:18px;
        ">

            Menu Coming Soon

        </h3>


        <p style="
            margin:0;
            color:#777777;
            font-size:12px;
        ">

            No menu items are available for this restaurant.

        </p>


    </div>


<% } %>


</section>


<!-- BACK TO RESTAURANTS -->

<div style="
    text-align:center;
    margin-top:25px;
">


    <a href="restaurants"
       style="
           display:inline-block;
           background:#202020;
           color:#FFFFFF;
           text-decoration:none;
           padding:11px 22px;
           border-radius:7px;
           font-size:12px;
           font-weight:700;
       ">

        ← Back to Restaurants

    </a>


</div>


<% } else { %>


<!-- ===================================================== -->
<!-- NORMAL CATEGORY MENU -->
<!-- ===================================================== -->


<!-- ===================================================== -->
<!-- PIZZA -->
<!-- ===================================================== -->

<%
if (!filterByCategory || "Pizza".equalsIgnoreCase(selectedCategory)) {
%>


<h2 id="pizza" style="
    margin:35px 0 18px 0;
    font-size:23px;
    color:#202020;
">

    Pizza

</h2>


<div style="
    display:grid;
    grid-template-columns:repeat(3,1fr);
    gap:20px;
">


<%
if (menus != null) {

    for (Menu menu : menus) {

        if ("Pizza".equalsIgnoreCase(menu.getCategory())) {

            String image =
                imageMap.get(menu.getName());


            if (image == null) {

                image =
                    "images/restaurant.jpg";

            }

%>


<div style="
    background:#FFFFFF;
    border:1px solid #EAEAEA;
    border-radius:12px;
    overflow:hidden;
    box-shadow:0 4px 14px rgba(0,0,0,0.06);
">


    <img src="<%= image %>"
         alt="<%= menu.getName() %>"
         style="
             width:100%;
             height:190px;
             object-fit:cover;
             display:block;
         ">


    <div style="padding:17px;">


        <h3 style="
            margin:0 0 7px 0;
            font-size:17px;
            color:#202020;
        ">

            <%= menu.getName() %>

        </h3>


        <p style="
            margin:0 0 13px 0;
            color:#777777;
            font-size:11px;
            line-height:1.5;
        ">

            <%= menu.getDescription() %>

        </p>


        <div style="
            display:flex;
            justify-content:space-between;
            align-items:center;
        ">


            <span style="
                color:#FF6B35;
                font-size:18px;
                font-weight:800;
            ">

                &#8377;<%= menu.getPrice() %>

            </span>


            <div id="cart-control-<%= menu.getMenuId() %>" style="display:flex;align-items:center;gap:7px;">

    <button
        id="add-button-<%= menu.getMenuId() %>"
        type="button"
        onclick="addMenuItem(<%= menu.getMenuId() %>)"
        style="
            background:#FF6B35;
            color:#FFFFFF;
            border:none;
            padding:9px 15px;
            border-radius:7px;
            font-size:11px;
            font-weight:700;
            cursor:pointer;
        ">
        Add to Cart
    </button>

</div>


        </div>

    </div>

</div>


<%
        }

    }

}
%>


</div>


<%
}
%>


<!-- ===================================================== -->
<!-- BURGER -->
<!-- ===================================================== -->

<%
if (!filterByCategory ||
    "Burger".equalsIgnoreCase(selectedCategory) ||
    "Burgers".equalsIgnoreCase(selectedCategory)) {
%>


<h2 id="burger" style="
    margin:42px 0 18px 0;
    font-size:23px;
    color:#202020;
">

    Burgers

</h2>


<div style="
    display:grid;
    grid-template-columns:repeat(3,1fr);
    gap:20px;
">


<%
if (menus != null) {

    for (Menu menu : menus) {

        if ("Burger".equalsIgnoreCase(menu.getCategory())
            || "Burgers".equalsIgnoreCase(menu.getCategory())) {


            String image =
                imageMap.get(menu.getName());


            if (image == null) {

                image =
                    "images/restaurant.jpg";

            }

%>


<div style="
    background:#FFFFFF;
    border:1px solid #EAEAEA;
    border-radius:12px;
    overflow:hidden;
    box-shadow:0 4px 14px rgba(0,0,0,0.06);
">


    <img src="<%= image %>"
         alt="<%= menu.getName() %>"
         style="
             width:100%;
             height:190px;
             object-fit:cover;
             display:block;
         ">


    <div style="padding:17px;">


        <h3 style="
            margin:0 0 7px 0;
            font-size:17px;
            color:#202020;
        ">

            <%= menu.getName() %>

        </h3>


        <p style="
            margin:0 0 13px 0;
            color:#777777;
            font-size:11px;
            line-height:1.5;
        ">

            <%= menu.getDescription() %>

        </p>


        <div style="
            display:flex;
            justify-content:space-between;
            align-items:center;
        ">


            <span style="
                color:#FF6B35;
                font-size:18px;
                font-weight:800;
            ">

                &#8377;<%= menu.getPrice() %>

            </span>


            <div id="cart-control-<%= menu.getMenuId() %>" style="display:flex;align-items:center;gap:7px;">

    <button
        id="add-button-<%= menu.getMenuId() %>"
        type="button"
        onclick="addMenuItem(<%= menu.getMenuId() %>)"
        style="
            background:#FF6B35;
            color:#FFFFFF;
            border:none;
            padding:9px 15px;
            border-radius:7px;
            font-size:11px;
            font-weight:700;
            cursor:pointer;
        ">
        Add to Cart
    </button>

</div>


        </div>


    </div>

</div>


<%
        }

    }

}
%>


</div>


<%
}
%>


<!-- ===================================================== -->
<!-- BIRYANI -->
<!-- ===================================================== -->

<%
if (!filterByCategory ||
    "Biryani".equalsIgnoreCase(selectedCategory)) {
%>


<h2 id="biryani" style="
    margin:42px 0 18px 0;
    font-size:23px;
    color:#202020;
">

    Biryani

</h2>


<div style="
    display:grid;
    grid-template-columns:repeat(3,1fr);
    gap:20px;
">


<%
if (menus != null) {

    for (Menu menu : menus) {

        if ("Biryani".equalsIgnoreCase(menu.getCategory())) {


            String image =
                imageMap.get(menu.getName());


            if (image == null) {

                image =
                    "images/restaurant.jpg";

            }

%>


<div style="
    background:#FFFFFF;
    border:1px solid #EAEAEA;
    border-radius:12px;
    overflow:hidden;
    box-shadow:0 4px 14px rgba(0,0,0,0.06);
">


    <img src="<%= image %>"
         alt="<%= menu.getName() %>"
         style="
             width:100%;
             height:190px;
             object-fit:cover;
             display:block;
         ">


    <div style="padding:17px;">


        <h3 style="
            margin:0 0 7px 0;
            font-size:17px;
            color:#202020;
        ">

            <%= menu.getName() %>

        </h3>


        <p style="
            margin:0 0 13px 0;
            color:#777777;
            font-size:11px;
            line-height:1.5;
        ">

            <%= menu.getDescription() %>

        </p>


        <div style="
            display:flex;
            justify-content:space-between;
            align-items:center;
        ">


            <span style="
                color:#FF6B35;
                font-size:18px;
                font-weight:800;
            ">

                &#8377;<%= menu.getPrice() %>

            </span>


            <div id="cart-control-<%= menu.getMenuId() %>" style="display:flex;align-items:center;gap:7px;">

    <button
        id="add-button-<%= menu.getMenuId() %>"
        type="button"
        onclick="addMenuItem(<%= menu.getMenuId() %>)"
        style="
            background:#FF6B35;
            color:#FFFFFF;
            border:none;
            padding:9px 15px;
            border-radius:7px;
            font-size:11px;
            font-weight:700;
            cursor:pointer;
        ">
        Add to Cart
    </button>

</div>


        </div>

    </div>

</div>


<%
        }

    }

}
%>


</div>


<%
}
%>


<!-- ===================================================== -->
<!-- SOUTH INDIAN -->
<!-- ===================================================== -->

<%
if (!filterByCategory ||
    "South Indian".equalsIgnoreCase(selectedCategory)) {
%>


<h2 id="southindian" style="
    margin:42px 0 18px 0;
    font-size:23px;
    color:#202020;
">

    South Indian

</h2>


<div style="
    display:grid;
    grid-template-columns:repeat(3,1fr);
    gap:20px;
">


<%
if (menus != null) {

    for (Menu menu : menus) {

        if ("South Indian".equalsIgnoreCase(menu.getCategory())) {


            String image =
                imageMap.get(menu.getName());


            if (image == null) {

                image =
                    "images/restaurant.jpg";

            }

%>


<div style="
    background:#FFFFFF;
    border:1px solid #EAEAEA;
    border-radius:12px;
    overflow:hidden;
    box-shadow:0 4px 14px rgba(0,0,0,0.06);
">


    <img src="<%= image %>"
         alt="<%= menu.getName() %>"
         style="
             width:100%;
             height:190px;
             object-fit:cover;
             display:block;
         ">


    <div style="padding:17px;">


        <h3 style="
            margin:0 0 7px 0;
            font-size:17px;
            color:#202020;
        ">

            <%= menu.getName() %>

        </h3>


        <p style="
            margin:0 0 13px 0;
            color:#777777;
            font-size:11px;
            line-height:1.5;
        ">

            <%= menu.getDescription() %>

        </p>


        <div style="
            display:flex;
            justify-content:space-between;
            align-items:center;
        ">


            <span style="
                color:#FF6B35;
                font-size:18px;
                font-weight:800;
            ">

                &#8377;<%= menu.getPrice() %>

            </span>


            <div id="cart-control-<%= menu.getMenuId() %>" style="display:flex;align-items:center;gap:7px;">

    <button
        id="add-button-<%= menu.getMenuId() %>"
        type="button"
        onclick="addMenuItem(<%= menu.getMenuId() %>)"
        style="
            background:#FF6B35;
            color:#FFFFFF;
            border:none;
            padding:9px 15px;
            border-radius:7px;
            font-size:11px;
            font-weight:700;
            cursor:pointer;
        ">
        Add to Cart
    </button>

</div>


        </div>

    </div>

</div>


<%
        }

    }

}
%>


</div>


<%
}
%>


<!-- ===================================================== -->
<!-- PASTA -->
<!-- ===================================================== -->

<%
if (!filterByCategory ||
    "Pasta".equalsIgnoreCase(selectedCategory)) {
%>


<h2 id="pasta" style="
    margin:42px 0 18px 0;
    font-size:23px;
    color:#202020;
">

    Pasta

</h2>


<div style="
    display:grid;
    grid-template-columns:repeat(3,1fr);
    gap:20px;
">


<%
if (menus != null) {

    for (Menu menu : menus) {

        if ("Pasta".equalsIgnoreCase(menu.getCategory())) {


            String image =
                imageMap.get(menu.getName());


            if (image == null) {

                image =
                    "images/restaurant.jpg";

            }

%>


<div style="
    background:#FFFFFF;
    border:1px solid #EAEAEA;
    border-radius:12px;
    overflow:hidden;
    box-shadow:0 4px 14px rgba(0,0,0,0.06);
">


    <img src="<%= image %>"
         alt="<%= menu.getName() %>"
         style="
             width:100%;
             height:190px;
             object-fit:cover;
             display:block;
         ">


    <div style="padding:17px;">


        <h3 style="
            margin:0 0 7px 0;
            font-size:17px;
            color:#202020;
        ">

            <%= menu.getName() %>

        </h3>


        <p style="
            margin:0 0 13px 0;
            color:#777777;
            font-size:11px;
            line-height:1.5;
        ">

            <%= menu.getDescription() %>

        </p>


        <div style="
            display:flex;
            justify-content:space-between;
            align-items:center;
        ">


            <span style="
                color:#FF6B35;
                font-size:18px;
                font-weight:800;
            ">

                &#8377;<%= menu.getPrice() %>

            </span>


            <div id="cart-control-<%= menu.getMenuId() %>" style="display:flex;align-items:center;gap:7px;">

    <button
        id="add-button-<%= menu.getMenuId() %>"
        type="button"
        onclick="addMenuItem(<%= menu.getMenuId() %>)"
        style="
            background:#FF6B35;
            color:#FFFFFF;
            border:none;
            padding:9px 15px;
            border-radius:7px;
            font-size:11px;
            font-weight:700;
            cursor:pointer;
        ">
        Add to Cart
    </button>

</div>


        </div>

    </div>

</div>


<%
        }

    }

}
%>


</div>


<%
}
%>


<% } %>


</div>


<!-- ===================================================== -->
<!-- BOTTOM NAVIGATION -->
<!-- ===================================================== -->

<div style="
    background:#FFFFFF;
    border-top:1px solid #EEEEEE;
    margin-top:45px;
    padding:25px;
    text-align:center;
">


    <a href="index.html"
       style="
           color:#FF6B35;
           text-decoration:none;
           font-weight:700;
           font-size:12px;
           margin:0 12px;
       ">

        Home

    </a>


    <a href="restaurants"
       style="
           color:#FF6B35;
           text-decoration:none;
           font-weight:700;
           font-size:12px;
           margin:0 12px;
       ">

        Restaurants

    </a>


    <a href="cart"
       style="
           color:#FF6B35;
           text-decoration:none;
           font-weight:700;
           font-size:12px;
           margin:0 12px;
       ">

        View Cart

    </a>


    <a href="order"
       style="
           color:#FF6B35;
           text-decoration:none;
           font-weight:700;
           font-size:12px;
           margin:0 12px;
       ">

        My Orders

    </a>


</div>


</main>


<!-- ===================================================== -->
<!-- FOOTER -->
<!-- ===================================================== -->

<footer style="
    background:#202124;
    color:white;
    text-align:center;
    padding:38px 20px;
">


    <div style="
        color:#FF6B35;
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


    <p style="
        font-size:10px;
        opacity:0.5;
        margin-top:18px;
    ">

        © 2026 FoodOrder. All Rights Reserved.

    </p>


</footer>




<!-- ===================================================== -->
<!-- MENU CART JAVASCRIPT -->
<!-- ===================================================== -->
<script>

function renderMenuCartControl(menuId, quantity) {

    var control = document.getElementById("cart-control-" + menuId);

    if (!control) {
        return;
    }

    if (quantity <= 0) {

        control.innerHTML =
            '<button type="button" ' +
            'onclick="addMenuItem(' + menuId + ')" ' +
            'style="' +
                'background:#FF6B35;' +
                'color:#FFFFFF;' +
                'border:none;' +
                'padding:9px 15px;' +
                'border-radius:7px;' +
                'font-size:11px;' +
                'font-weight:700;' +
                'cursor:pointer;' +
            '">' +
            'Add to Cart' +
            '</button>';

        return;
    }

    control.innerHTML =
        '<button type="button" ' +
        'onclick="changeMenuQuantity(' + menuId + ', \'decrease\')" ' +
        'style="' +
            'width:32px;' +
            'height:32px;' +
            'border:1px solid #FF6B35;' +
            'background:#FFFFFF;' +
            'color:#FF6B35;' +
            'border-radius:7px;' +
            'cursor:pointer;' +
            'font-size:17px;' +
            'font-weight:700;' +
            'padding:0;' +
        '">' +
        '-</button>' +

        '<span id="menu-qty-' + menuId + '" ' +
        'style="' +
            'font-weight:800;' +
            'min-width:22px;' +
            'text-align:center;' +
            'color:#333333;' +
            'font-size:14px;' +
        '">' +
        quantity +
        '</span>' +

        '<button type="button" ' +
        'onclick="changeMenuQuantity(' + menuId + ', \'increase\')" ' +
        'style="' +
            'width:32px;' +
            'height:32px;' +
            'border:none;' +
            'background:#FF6B35;' +
            'color:#FFFFFF;' +
            'border-radius:7px;' +
            'cursor:pointer;' +
            'font-size:17px;' +
            'font-weight:700;' +
            'padding:0;' +
        '">' +
        '+</button>';
}


function setMenuCartBusy(menuId, busy) {

    var control = document.getElementById("cart-control-" + menuId);

    if (!control) {
        return;
    }

    var buttons = control.getElementsByTagName("button");

    for (var i = 0; i < buttons.length; i++) {
        buttons[i].disabled = busy;
        buttons[i].style.opacity = busy ? "0.60" : "1";
        buttons[i].style.cursor = busy ? "wait" : "pointer";
    }
}


async function addMenuItem(menuId) {

    setMenuCartBusy(menuId, true);

    try {

        var response = await fetch(
            "menuCart?action=add&menuId=" + menuId,
            {
                method: "GET",
                cache: "no-store"
            }
        );

        var data = await response.json();

        if (data.success) {

            renderMenuCartControl(menuId, data.quantity);

        } else if (data.conflict) {

            alert(data.message);

        } else {

            alert(data.message || "Unable to add item to cart.");
        }

    } catch (error) {

        alert("Unable to connect to the cart. Please try again.");

    } finally {

        setMenuCartBusy(menuId, false);
    }
}


async function changeMenuQuantity(menuId, action) {

    setMenuCartBusy(menuId, true);

    try {

        var response = await fetch(
            "menuCart?action=" + action + "&menuId=" + menuId,
            {
                method: "GET",
                cache: "no-store"
            }
        );

        var data = await response.json();

        if (data.success) {

            renderMenuCartControl(menuId, data.quantity);

        } else if (data.conflict) {

            alert(data.message);

        } else {

            alert(data.message || "Unable to update cart.");
        }

    } catch (error) {

        alert("Unable to update the cart. Please try again.");

    } finally {

        setMenuCartBusy(menuId, false);
    }
}


async function loadMenuCartState() {

    try {

        var response = await fetch(
            "menuCart?action=state",
            {
                method: "GET",
                cache: "no-store"
            }
        );

        var data = await response.json();

        if (!data.success) {
            return;
        }

        var items = data.items || {};

        var controls = document.querySelectorAll(
            '[id^="cart-control-"]'
        );

        for (var i = 0; i < controls.length; i++) {

            var id = controls[i].id.replace("cart-control-", "");

            var quantity = parseInt(items[id] || "0", 10);

            renderMenuCartControl(
                parseInt(id, 10),
                quantity
            );
        }

    } catch (error) {
        // Keep the normal Add to Cart buttons when state loading fails.
    }
}


document.addEventListener(
    "DOMContentLoaded",
    function () {
        loadMenuCartState();
    }
);

</script>

</body>

</html>