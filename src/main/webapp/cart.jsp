<%@ page import="java.util.List" %>

<%@ page import="com.tap.model.Cart" %>

<%@ page import="com.tap.model.CartItem" %>

<%@ page import="com.tap.model.Menu" %>
<%@ page import="com.tap.model.User" %>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <title>FoodOrder - Cart</title>

</head>

<body style="

    margin:0;

    font-family:Arial, Helvetica, sans-serif;

    background:#F7F7F7;

    color:#222222;

">

<%
    User loggedInUser = (User) session.getAttribute("user");
    boolean isLoggedIn = loggedInUser != null;
%>


<!-- ===================================================== -->

<!-- HEADER -->

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



        <!-- NAVIGATION -->

        <nav style="

            display:flex;

            align-items:center;

            gap:24px;

        ">



            <!-- HOME -->

            <a href="index.html"

               style="

                   text-decoration:none;

                   color:#333333;

                   font-size:14px;

                   font-weight:600;

               ">

                Home

            </a>



            <!-- RESTAURANTS -->

            <a href="restaurants"

               style="

                   text-decoration:none;

                   color:#333333;

                   font-size:14px;

                   font-weight:600;

               ">

                Restaurants

            </a>



            <!-- MENU -->

            <a href="menu"

               style="

                   text-decoration:none;

                   color:#333333;

                   font-size:14px;

                   font-weight:600;

               ">

                Menu

            </a>



            <!-- ORDERS -->

            <a href="order"

               style="

                   text-decoration:none;

                   color:#333333;

                   font-size:14px;

                   font-weight:600;

               ">

                Orders

            </a>



            <!-- PROFILE -->

            <a href="profile"

               style="

                   text-decoration:none;

                   color:#333333;

                   font-size:14px;

                   font-weight:600;

               ">

                Profile

            </a>



            <!-- CART -->

            <a href="cart"

               style="

                   text-decoration:none;

                   color:#FFFFFF;

                   background:#FF6B35;

                   padding:10px 18px;

                   border-radius:8px;

                   font-size:13px;

                   font-weight:700;

               ">

                Cart

            </a>



            <!-- LOGOUT -->

            <a href="login.html"

               style="

                   text-decoration:none;

                   color:#333333;

                   border:1px solid #DDDDDD;

                   padding:9px 16px;

                   border-radius:8px;

                   font-size:13px;

                   font-weight:600;

               ">

                Logout

            </a>



        </nav>

    </div>

</header>



<!-- ===================================================== -->

<!-- PAGE TITLE -->

<!-- ===================================================== -->

<section style="

    width:90%;

    max-width:1200px;

    margin:28px auto 22px auto;

">

    <div style="

        background:#FFF7F1;

        border:1px solid #F2D9C8;

        border-radius:16px;

        padding:32px 35px;

        box-sizing:border-box;

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

            margin-bottom:12px;

        ">

            YOUR CART

        </div>



        <h1 style="

            margin:0;

            color:#222222;

            font-size:36px;

            line-height:1.15;

            letter-spacing:-0.8px;

        ">

            Your Cart

        </h1>



        <p style="

            margin:10px 0 0 0;

            color:#6C6C6C;

            font-size:13px;

            line-height:1.6;

        ">

            Review your selected food items before checkout.

        </p>



    </div>

</section>





<!-- ===================================================== -->

<!-- ACCOUNT SECTION - SHOW ONLY WHEN NOT LOGGED IN -->

<!-- ===================================================== -->

<%
if (!isLoggedIn) {
%>

<div style="
    width:90%;
    max-width:1200px;
    margin:0 auto 20px auto;
    background:#FFFFFF;
    border:1px solid #E5E5E5;
    box-sizing:border-box;
    padding:30px 34px;
    display:flex;
    align-items:center;
    gap:22px;
    box-shadow:0 2px 10px rgba(0,0,0,0.04);
">

    <div style="
        width:42px;
        height:42px;
        min-width:42px;
        display:flex;
        align-items:center;
        justify-content:center;
        background:#202020;
        color:#FFFFFF;
        font-size:19px;
        font-weight:800;
    ">
        &#128100;
    </div>

    <div style="flex:1;">
        <div style="
            color:#222222;
            font-size:18px;
            font-weight:800;
            margin-bottom:5px;
        ">
            Account
        </div>

        <div style="
            color:#777777;
            font-size:13px;
            line-height:1.5;
            margin-bottom:18px;
        ">
            To place your order now, log in to your existing account or sign up.
        </div>

        <div style="
            display:flex;
            gap:20px;
            align-items:center;
            flex-wrap:wrap;
        ">

            <a href="login.html"
               style="
                   display:flex;
                   flex-direction:column;
                   justify-content:center;
                   align-items:center;
                   width:180px;
                   height:52px;
                   box-sizing:border-box;
                   border:1px solid #20A878;
                   background:#FFFFFF;
                   color:#20A878;
                   text-decoration:none;
                   line-height:16px;
               ">
                <span style="font-size:12px;font-weight:400;">
                    Have an account?
                </span>
                <span style="font-size:14px;font-weight:700;">
                    LOG IN
                </span>
            </a>

            <a href="signup.html"
               style="
                   display:flex;
                   flex-direction:column;
                   justify-content:center;
                   align-items:center;
                   width:180px;
                   height:52px;
                   box-sizing:border-box;
                   border:1px solid #20A878;
                   background:#20A878;
                   color:#FFFFFF;
                   text-decoration:none;
                   line-height:16px;
               ">
                <span style="font-size:12px;font-weight:400;">
                    New to FoodOrder?
                </span>
                <span style="font-size:14px;font-weight:700;">
                    SIGN UP
                </span>
            </a>

        </div>
    </div>
</div>

<%
}
%>


<!-- ===================================================== -->

<!-- MAIN CART AREA -->

<!-- ===================================================== -->

<div style="

    width:90%;

    max-width:1200px;

    margin:0 auto;

    display:flex;

    gap:24px;

    align-items:flex-start;

    box-sizing:border-box;

">



    <!-- ================================================= -->

    <!-- LEFT CART -->

    <!-- ================================================= -->

    <div style="

        flex:2;

        background:#FFFFFF;

        border:1px solid #EAEAEA;

        border-radius:14px;

        padding:24px;

        box-shadow:0 4px 16px rgba(0,0,0,0.05);

        box-sizing:border-box;

    ">



        <!-- SELECTED ITEMS HEADER -->

        <div style="

            display:flex;

            justify-content:space-between;

            align-items:center;

            border-bottom:1px solid #EEEEEE;

            padding-bottom:15px;

            margin-bottom:4px;

        ">



            <h2 style="

                margin:0;

                color:#222222;

                font-size:21px;

            ">

                Selected Items

            </h2>



            <span style="

                background:#FFF4EA;

                color:#FF6B35;

                padding:7px 12px;

                border-radius:20px;

                font-size:10px;

                font-weight:800;

                letter-spacing:0.4px;

            ">

                FOOD ORDER

            </span>



        </div>





        <%

            List<CartItem> cartItems =

                (List<CartItem>) request.getAttribute("cartItems");

            List<Menu> menuItems =

                (List<Menu>) request.getAttribute("menuItems");

            if (cartItems == null || cartItems.isEmpty()) {

        %>



        <!-- ================================================= -->

        <!-- EMPTY CART -->

        <!-- ================================================= -->

        <div style="

            text-align:center;

            padding:60px 20px;

        ">



            <div style="

                width:72px;

                height:72px;

                line-height:72px;

                margin:0 auto 18px auto;

                border-radius:50%;

                background:#FFF4EA;

                color:#FF6B35;

                font-size:18px;

                font-weight:800;

                letter-spacing:0.5px;

            ">

                CART

            </div>



            <h2 style="

                margin:0 0 9px 0;

                color:#222222;

                font-size:24px;

            ">

                Your Cart is Empty

            </h2>



            <p style="

                margin:0;

                color:#777777;

                font-size:13px;

            ">

                You haven't added any food items yet.

            </p>



            <a href="menu"

               style="

                   display:inline-block;

                   margin-top:20px;

                   padding:12px 24px;

                   background:#FF6B35;

                   color:#FFFFFF;

                   text-decoration:none;

                   border-radius:8px;

                   font-size:13px;

                   font-weight:700;

               ">

                Browse Menu

            </a>



        </div>



        <%

            } else {

                double subtotal = 0;

                for (int i = 0; i < cartItems.size(); i++) {

                    CartItem item = cartItems.get(i);

                    Menu menu = menuItems.get(i);

                    double itemTotal =

                        menu.getPrice() * item.getQuantity();

                    subtotal = subtotal + itemTotal;



                    String image = "images/restaurant.jpg";



                    if (menu.getName().equals("Margherita Pizza")) {

                        image = "images/margherita.jpg";

                    }

                    else if (menu.getName().equals("Farmhouse Pizza")) {

                        image = "images/farmhousepizza.jpg";

                    }

                    else if (menu.getName().equals("Cheese Pizza")) {

                        image = "images/cheesepizza.jpg";

                    }

                    else if (menu.getName().equals("Classic Burger")) {

                        image = "images/classicburger.jpg";

                    }

                    else if (menu.getName().equals("Cheese Burger")) {

                        image = "images/cheeseburger.jpg";

                    }

                    else if (menu.getName().equals("Veg Burger")) {

                        image = "images/vegburger.jpg";

                    }

                    else if (menu.getName().equals("Chicken Biryani")) {

                        image = "images/chickenbiryani.jpg";

                    }

                    else if (menu.getName().equals("Mutton Biryani")) {

                        image = "images/muttonbiryani.jpg";

                    }

                    else if (menu.getName().equals("Veg Biryani")) {

                        image = "images/vegbiryani.jpg";

                    }

                    else if (menu.getName().equals("Masala Dosa")) {

                        image = "images/masaladosa.jpg";

                    }

                    else if (menu.getName().equals("Plain Dosa")) {

                        image = "images/plaindosa.jpg";

                    }

                    else if (menu.getName().equals("Cheese Dosa")) {

                        image = "images/cheesedosa.jpg";

                    }

                    else if (menu.getName().equals("Paneer Pizza")) {

                        image = "images/paneer-pizza.jpg";

                    }

                    else if (menu.getName().equals("Corn Cheese Pizza")) {

                        image = "images/corn-cheese-pizza.jpg";

                    }

                    else if (menu.getName().equals("Mushroom Pizza")) {

                        image = "images/mushroom-pizza.jpg";

                    }

                    else if (menu.getName().equals("Egg Biryani")) {

                        image = "images/egg-biryani.jpg";

                    }

                    else if (menu.getName().equals("Chicken 65 Biryani")) {

                        image = "images/chicken-65-biryani.jpg";

                    }

                    else if (menu.getName().equals("Paneer Biryani")) {

                        image = "images/paneer-biryani.jpg";

                    }

                    else if (menu.getName().equals("Chicken Burger")) {

                        image = "images/chicken-burger.jpg";

                    }

                    else if (menu.getName().equals("Peri Peri Burger")) {

                        image = "images/peri-peri-burger.jpg";

                    }

                    else if (menu.getName().equals("Double Cheese Burger")) {

                        image = "images/double-cheese-burger.jpg";

                    }

                    else if (menu.getName().equals("Onion Dosa")) {

                        image = "images/onion-dosa.jpg";

                    }

                    else if (menu.getName().equals("Ghee Dosa")) {

                        image = "images/ghee-dosa.jpg";

                    }

                    else if (menu.getName().equals("Podi Dosa")) {

                        image = "images/podi-dosa.jpg";

                    }

                    else if (menu.getName().equals("Paneer Dosa")) {

                        image = "images/paneer-dosa.jpg";

                    }

                    else if (menu.getName().equals("Neer Dosa")) {

                        image = "images/neer-dosa.jpg";

                    }

                    else if (menu.getName().equals("Idli Sambar")) {

                        image = "images/idli-sambar.jpg";

                    }

                    else if (menu.getName().equals("Medu Vada")) {

                        image = "images/medu-vada.jpg";

                    }

                    else if (menu.getName().equals("Pongal")) {

                        image = "images/pongal.jpg";

                    }

                    else if (menu.getName().equals("Poori Masala")) {

                        image = "images/poori-masala.jpg";

                    }

                    else if (menu.getName().equals("Upma")) {

                        image = "images/upma.jpg";

                    }

                    else if (menu.getName().equals("Filter Coffee")) {

                        image = "images/filter-coffee.jpg";

                    }

                    else if (menu.getName().equals("White Sauce Pasta")) {

                        image = "images/whitesaucepasta.jpg";

                    }

                    else if (menu.getName().equals("Red Sauce Pasta")) {

                        image = "images/redsaucepasta.jpg";

                    }

                    else if (menu.getName().equals("Cheese Pasta")) {

                        image = "images/cheesepasta.jpg";

                    }

                    else if (menu.getName().equals("Chicken Pasta")) {

                        image = "images/chicken-pasta.jpg";

                    }

                    else if (menu.getName().equals("Arrabbiata Pasta")) {

                        image = "images/arrabbiata-pasta.jpg";

                    }

                    else if (menu.getName().equals("Pesto Pasta")) {

                        image = "images/pesto-pasta.jpg";

                    }

                    else if (menu.getName().equals("Chicken Fried Rice")) {

                        image = "images/chicken-fried-rice.jpg";

                    }

                    else if (menu.getName().equals("Paneer Fried Rice")) {

                        image = "images/paneer-fried-rice.jpg";

                    }

                    else if (menu.getName().equals("Chicken Noodles")) {

                        image = "images/chicken-noodles.jpg";

                    }

                    else if (menu.getName().equals("Paneer Noodles")) {

                        image = "images/paneer-noodles.jpg";

                    }

                    else if (menu.getName().equals("Gobi Manchurian")) {

                        image = "images/gobi-manchurian.jpg";

                    }

                    else if (menu.getName().equals("Chilli Chicken")) {

                        image = "images/chilli-chicken.jpg";

                    }

                    else if (menu.getName().equals("Tandoori Chicken")) {

                        image = "images/tandoori-chicken.jpg";

                    }

                    else if (menu.getName().equals("Chicken Tikka")) {

                        image = "images/chicken-tikka.jpg";

                    }

                    else if (menu.getName().equals("Paneer Tikka")) {

                        image = "images/paneer-tikka.jpg";

                    }

                    else if (menu.getName().equals("Tandoori Paneer Roll")) {

                        image = "images/tandoori-paneer-roll.jpg";

                    }

                    else if (menu.getName().equals("Butter Chicken")) {

                        image = "images/butter-chicken.jpg";

                    }

                    else if (menu.getName().equals("Dal Tadka")) {

                        image = "images/dal-tadka.jpg";

                    }

                    else if (menu.getName().equals("Veg Meals")) {

                        image = "images/veg-meals.jpg";

                    }

                    else if (menu.getName().equals("Chicken Meals")) {

                        image = "images/chicken-meals.jpg";

                    }

                    else if (menu.getName().equals("Mutton Meals")) {

                        image = "images/mutton-meals.jpg";

                    }

                    else if (menu.getName().equals("Paneer Butter Masala")) {

                        image = "images/paneer-butter-masala.jpg";

                    }

                    else if (menu.getName().equals("Chicken Curry")) {

                        image = "images/chicken-curry.jpg";

                    }

                    else if (menu.getName().equals("Jeera Rice")) {

                        image = "images/jeera-rice.jpg";

                    }

                    else if (menu.getName().equals("Veg Fried Rice")) {

                        image = "images/veg-fried-rice.jpg";

                    }

                    else if (menu.getName().equals("Chicken Manchurian")) {

                        image = "images/chicken-manchurian.jpg";

                    }

                    else if (menu.getName().equals("Veg Noodles")) {

                        image = "images/veg-noodles.jpg";

                    }

                    else if (menu.getName().equals("French Fries")) {

                        image = "images/french-fries.jpg";

                    }

                    else if (menu.getName().equals("Chicken 65")) {

                        image = "images/chicken-65.jpg";

                    }

                    else if (menu.getName().equals("Chicken Grill")) {

                        image = "images/chicken-grill.jpg";

                    }

                    else if (menu.getName().equals("Chicken Seekh Kebab")) {

                        image = "images/chicken-seekh-kebab.jpg";

                    }

                    else if (menu.getName().equals("Mutton Seekh Kebab")) {

                        image = "images/mutton-seekh-kebab.jpg";

                    }

                    else if (menu.getName().equals("Tandoori Wings")) {

                        image = "images/tandoori-wings.jpg";

                    }

                    else if (menu.getName().equals("Grilled Paneer")) {

                        image = "images/grilled-paneer.jpg";

                    }

                    else if (menu.getName().equals("Chicken Reshmi Kebab")) {

                        image = "images/chicken-reshmi-kebab.jpg";

                    }

                    else if (menu.getName().equals("Veg Salad Bowl")) {

                        image = "images/veg-salad-bowl.jpg";

                    }

                    else if (menu.getName().equals("Chicken Salad Bowl")) {

                        image = "images/chicken-salad-bowl.jpg";

                    }

                    else if (menu.getName().equals("Paneer Salad Bowl")) {

                        image = "images/paneer-salad-bowl.jpg";

                    }

                    else if (menu.getName().equals("Fruit Bowl")) {

                        image = "images/fruit-bowl.jpg";

                    }

                    else if (menu.getName().equals("Sprouts Bowl")) {

                        image = "images/sprouts-bowl.jpg";

                    }

                    else if (menu.getName().equals("Chicken Rice Bowl")) {

                        image = "images/chicken-rice-bowl.jpg";

                    }

                    else if (menu.getName().equals("Andhra Chicken Biryani")) {

                        image = "images/andhra-chicken-biryani.jpg";

                    }

                    else if (menu.getName().equals("Andhra Mutton Biryani")) {

                        image = "images/andhra-mutton-biryani.jpg";

                    }

                    else if (menu.getName().equals("Gongura Chicken")) {

                        image = "images/gongura-chicken.jpg";

                    }

                    else if (menu.getName().equals("Andhra Chicken Curry")) {

                        image = "images/andhra-chicken-curry.jpg";

                    }

                    else if (menu.getName().equals("Paneer Andhra Masala")) {

                        image = "images/paneer-andhra-masala.jpg";

                    }

                    else if (menu.getName().equals("Andhra Veg Meals")) {

                        image = "images/andhra-veg-meals.jpg";

                    }

                    else if (menu.getName().equals("Fish Fry")) {

                        image = "images/fish-fry.jpg";

                    }

                    else if (menu.getName().equals("Prawn Fry")) {

                        image = "images/prawn-fry.jpg";

                    }

                    else if (menu.getName().equals("Fish Curry")) {

                        image = "images/fish-curry.jpg";

                    }

                    else if (menu.getName().equals("Prawn Masala")) {

                        image = "images/prawn-masala.jpg";

                    }

                    else if (menu.getName().equals("Fish Biryani")) {

                        image = "images/fish-biryani.jpg";

                    }

                    else if (menu.getName().equals("Idli Vada")) {

                        image = "images/idli-vada.jpg";

                    }

                    else if (menu.getName().equals("Podi Idli")) {

                        image = "images/podi-idli.jpg";

                    }

                    else if (menu.getName().equals("Onion Uttapam")) {

                        image = "images/onion-uttapam.jpg";

                    }

        %>



        <!-- ================================================= -->

        <!-- CART ITEM -->

        <!-- ================================================= -->

        <div style="

            display:flex;

            align-items:center;

            justify-content:space-between;

            gap:18px;

            padding:20px 0;

            border-bottom:1px solid #EEEEEE;

        ">



            <!-- FOOD IMAGE + NAME -->

            <div style="

                display:flex;

                align-items:center;

                gap:15px;

                min-width:0;

            ">



                <img src="<%= image %>"

                     alt="<%= menu.getName() %>"

                     style="

                         width:92px;

                         height:78px;

                         object-fit:cover;

                         border-radius:11px;

                         display:block;

                         border:1px solid #EEEEEE;

                     ">



                <div style="

                    min-width:0;

                ">



                    <h3 style="

                        margin:0 0 7px 0;

                        color:#222222;

                        font-size:17px;

                    ">

                        <%= menu.getName() %>

                    </h3>



                    <p style="

                        margin:0;

                        color:#FF6B35;

                        font-weight:800;

                        font-size:15px;

                    ">

                        &#8377;<%= menu.getPrice() %>

                    </p>



                </div>

            </div>





            <!-- ================================================= -->

            <!-- QUANTITY -->

            <!-- ================================================= -->

            <div style="

                display:flex;

                align-items:center;

                gap:9px;

                flex-shrink:0;

            ">



                <button

                    onclick="decreaseQuantity(<%= item.getCartItemId() %>)"

                    style="

                        width:32px;

                        height:32px;

                        border:1px solid #FF6B35;

                        background:#FFFFFF;

                        color:#FF6B35;

                        border-radius:7px;

                        cursor:pointer;

                        font-size:17px;

                        font-weight:700;

                    ">

                    -

                </button>



                <span style="

                    font-weight:800;

                    min-width:22px;

                    text-align:center;

                    color:#333333;

                ">

                    <%= item.getQuantity() %>

                </span>



                <button

                    onclick="increaseQuantity(<%= item.getCartItemId() %>)"

                    style="

                        width:32px;

                        height:32px;

                        border:none;

                        background:#FF6B35;

                        color:#FFFFFF;

                        border-radius:7px;

                        cursor:pointer;

                        font-size:17px;

                        font-weight:700;

                    ">

                    +

                </button>



            </div>





            <!-- ================================================= -->

            <!-- ITEM TOTAL -->

            <!-- ================================================= -->

            <div style="

                text-align:right;

                min-width:105px;

                flex-shrink:0;

            ">



                <p style="

                    margin:0 0 7px 0;

                    font-weight:800;

                    color:#222222;

                    font-size:15px;

                ">

                    &#8377;<%= itemTotal %>

                </p>



                <button

                    onclick="removeItem(<%= item.getCartItemId() %>)"

                    style="

                        border:none;

                        background:none;

                        color:#E85D2A;

                        cursor:pointer;

                        font-size:12px;

                        padding:0;

                        font-weight:600;

                    ">

                    Remove

                </button>



            </div>



        </div>



        <%

                }



                double deliveryFee = 40;



                double tax =

                    Math.round(subtotal * 0.05);



                double total =

                    subtotal + deliveryFee + tax;

        %>





        <!-- ================================================= -->

        <!-- BILL DETAILS -->

        <!-- ================================================= -->

        <div style="

            margin-top:28px;

            border-top:1px solid #EEEEEE;

            padding-top:22px;

        ">



            <h2 style="

                margin:0 0 18px 0;

                color:#222222;

                font-size:21px;

            ">

                Bill Details

            </h2>





            <div style="

                display:flex;

                justify-content:space-between;

                margin:13px 0;

                color:#555555;

                font-size:13px;

            ">

                <span>

                    Subtotal

                </span>



                <span>

                    &#8377;<%= subtotal %>

                </span>

            </div>





            <div style="

                display:flex;

                justify-content:space-between;

                margin:13px 0;

                color:#555555;

                font-size:13px;

            ">

                <span>

                    Delivery Fee

                </span>



                <span>

                    &#8377;<%= deliveryFee %>

                </span>

            </div>





            <div style="

                display:flex;

                justify-content:space-between;

                margin:13px 0;

                color:#555555;

                font-size:13px;

            ">

                <span>

                    Tax

                </span>



                <span>

                    &#8377;<%= tax %>

                </span>

            </div>





            <div style="

                border-top:1px solid #DDDDDD;

                padding-top:16px;

                display:flex;

                justify-content:space-between;

                font-size:20px;

                font-weight:800;

                color:#222222;

            ">

                <span>

                    Total

                </span>



                <span style="

                    color:#FF6B35;

                ">

                    &#8377;<%= total %>

                </span>

            </div>





            <button onclick="checkout()"

                    style="

                        width:100%;

                        margin-top:24px;

                        padding:14px;

                        border:none;

                        border-radius:8px;

                        background:#FF6B35;

                        color:#FFFFFF;

                        font-size:14px;

                        font-weight:800;

                        cursor:pointer;

                    ">

                Proceed to Payment

            </button>



        </div>



        <%

            }

        %>



    </div>





    <!-- ================================================= -->

    <!-- RIGHT ORDER SUMMARY -->

    <!-- ================================================= -->

    <div style="

        flex:1;

        background:#FFFFFF;

        border:1px solid #EAEAEA;

        border-radius:14px;

        padding:24px;

        box-shadow:0 4px 16px rgba(0,0,0,0.05);

        position:sticky;

        top:94px;

        box-sizing:border-box;

    ">



        <div style="

            display:inline-block;

            background:#FFF4EA;

            color:#FF6B35;

            padding:7px 11px;

            border-radius:20px;

            font-size:10px;

            font-weight:800;

            letter-spacing:0.5px;

            margin-bottom:10px;

        ">

            SUMMARY

        </div>



        <h2 style="

            margin:0 0 18px 0;

            color:#222222;

            font-size:21px;

            padding-bottom:15px;

            border-bottom:1px solid #EEEEEE;

        ">

            Order Summary

        </h2>





        <%

            double rightSubtotal = 0;



            if (cartItems != null && !cartItems.isEmpty()) {

                for (int i = 0; i < cartItems.size(); i++) {

                    CartItem item = cartItems.get(i);

                    Menu menu = menuItems.get(i);



                    rightSubtotal =

                        rightSubtotal +

                        (menu.getPrice() * item.getQuantity());

                }

            }





            double rightDelivery =

                cartItems != null && !cartItems.isEmpty() ? 40 : 0;





            double rightTax =

                Math.round(rightSubtotal * 0.05);





            double rightTotal =

                rightSubtotal + rightDelivery + rightTax;

        %>





        <div style="

            display:flex;

            justify-content:space-between;

            margin:14px 0;

            color:#555555;

            font-size:13px;

        ">

            <span>

                Subtotal

            </span>



            <span>

                &#8377;<%= rightSubtotal %>

            </span>

        </div>





        <div style="

            display:flex;

            justify-content:space-between;

            margin:14px 0;

            color:#555555;

            font-size:13px;

        ">

            <span>

                Delivery

            </span>



            <span>

                &#8377;<%= rightDelivery %>

            </span>

        </div>





        <div style="

            display:flex;

            justify-content:space-between;

            margin:14px 0;

            color:#555555;

            font-size:13px;

        ">

            <span>

                Tax

            </span>



            <span>

                &#8377;<%= rightTax %>

            </span>

        </div>





        <div style="

            border-top:1px solid #DDDDDD;

            padding-top:16px;

            display:flex;

            justify-content:space-between;

            font-size:20px;

            font-weight:800;

            color:#222222;

        ">

            <span>

                Total

            </span>



            <span style="

                color:#FF6B35;

            ">

                &#8377;<%= rightTotal %>

            </span>

        </div>





        <%

            if (cartItems != null && !cartItems.isEmpty()) {

        %>





        <button onclick="checkout()"

                style="

                    width:100%;

                    margin-top:22px;

                    padding:14px;

                    border:none;

                    border-radius:8px;

                    background:#FF6B35;

                    color:#FFFFFF;

                    font-size:14px;

                    font-weight:800;

                    cursor:pointer;

                ">

            Proceed to Payment

        </button>



        <%

            }

        %>





        <a href="menu"

           style="

               display:block;

               text-align:center;

               margin-top:18px;

               color:#FF6B35;

               text-decoration:none;

               font-size:13px;

               font-weight:700;

           ">

            &larr; Continue Shopping

        </a>



    </div>

</div>





<!-- ===================================================== -->

<!-- BOTTOM NAVIGATION -->

<!-- ===================================================== -->

<div style="

    width:90%;

    max-width:1200px;

    margin:28px auto 0 auto;

    padding:22px 0;

    border-top:1px solid #EEEEEE;

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



    <a href="menu"

       style="

           color:#FF6B35;

           text-decoration:none;

           font-weight:700;

           font-size:12px;

           margin:0 12px;

       ">

        Menu

    </a>



    <a href="order"

       style="

           color:#FF6B35;

           text-decoration:none;

           font-weight:700;

           font-size:12px;

           margin:0 12px;

       ">

        Orders

    </a>



    <a href="profile"

       style="

           color:#FF6B35;

           text-decoration:none;

           font-weight:700;

           font-size:12px;

           margin:0 12px;

       ">

        Profile

    </a>



    <a href="cart"

       style="

           color:#FF6B35;

           text-decoration:none;

           font-weight:700;

           font-size:12px;

           margin:0 12px;

       ">

        Cart

    </a>



</div>





<!-- ===================================================== -->

<!-- FOOTER -->

<!-- ===================================================== -->

<footer style="

    background:#202020;

    color:#FFFFFF;

    margin-top:0;

    padding:38px 25px 25px 25px;

    text-align:center;

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



        <a href="restaurants"

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



        <a href="order"

           style="

               color:#FFFFFF;

               text-decoration:none;

               margin:0 10px;

           ">

            Orders

        </a>



        <a href="profile"

           style="

               color:#FFFFFF;

               text-decoration:none;

               margin:0 10px;

           ">

            Profile

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





<!-- ===================================================== -->

<!-- JAVASCRIPT -->

<!-- ===================================================== -->

<script>

function increaseQuantity(cartItemId) {

    window.location.href =

        "updateCartItem?cartItemId=" + cartItemId + "&action=increase";

}



function decreaseQuantity(cartItemId) {

    window.location.href =

        "updateCartItem?cartItemId=" + cartItemId + "&action=decrease";

}



function removeItem(cartItemId) {

    window.location.href =

        "deleteCartItem?cartItemId=" + cartItemId;

}



function checkout() {

    window.location.href = "payment";

}

</script>




<!-- RESTAURANT CART CONFLICT MESSAGE -->
<script>
    const restaurantError = new URLSearchParams(window.location.search).get("restaurantError");

    if (restaurantError === "true") {
        alert("You already selected items from another restaurant.\n\nPlease remove the current cart items before adding food from another restaurant.");

        window.history.replaceState({}, document.title, window.location.pathname);
    }
</script>

</body>

</html>
