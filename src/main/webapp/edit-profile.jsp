<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ page import="com.tap.model.User" %>

<%

    User user = (User) request.getAttribute("user");

    if (user == null) {

        response.sendRedirect("login.html");

        return;

    }

%>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <title>FoodOrder - Edit Profile</title>

</head>


<body style="
    margin:0;
    padding:0;
    background:#F7F7F7;
    font-family:Arial, Helvetica, sans-serif;
    color:#222222;
">


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
                   color:#FFFFFF;
                   background:#FF6B35;
                   padding:10px 17px;
                   border-radius:8px;
                   font-size:13px;
                   font-weight:700;
               ">

                Profile

            </a>



            <!-- CART -->

            <a href="cart"
               style="
                   text-decoration:none;
                   color:#333333;
                   font-size:14px;
                   font-weight:600;
               ">

                Cart

            </a>



            <!-- LOGOUT -->

            <a href="logout"
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
<!-- MAIN -->
<!-- ===================================================== -->

<main style="
    width:90%;
    max-width:1200px;
    margin:35px auto 55px auto;
">



    <!-- ================================================= -->
    <!-- PAGE INTRO -->
    <!-- ================================================= -->

    <section style="
        background:#FFF7F1;
        border:1px solid #F2D9C8;
        border-radius:18px;
        padding:32px 38px;
        margin-bottom:25px;
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
            letter-spacing:0.7px;
            margin-bottom:12px;
        ">

            PROFILE

        </div>



        <h1 style="
            margin:0;
            color:#222222;
            font-size:36px;
            line-height:1.15;
            letter-spacing:-0.8px;
        ">

            Edit Profile

        </h1>



        <p style="
            margin:10px 0 0 0;
            color:#6C6C6C;
            font-size:13px;
            line-height:1.6;
        ">

            Update your personal information and keep your account details current.

        </p>


    </section>



    <!-- ================================================= -->
    <!-- PROFILE CARD -->
    <!-- ================================================= -->

    <section style="
        width:100%;
        max-width:760px;
        margin:auto;
    ">


        <div style="
            background:#FFFFFF;
            border:1px solid #EAEAEA;
            border-radius:16px;
            padding:32px;
            box-shadow:0 4px 18px rgba(0,0,0,0.05);
            box-sizing:border-box;
        ">



            <!-- PROFILE HEADER -->

            <div style="
                display:flex;
                align-items:center;
                gap:18px;
                padding-bottom:24px;
                margin-bottom:25px;
                border-bottom:1px solid #EEEEEE;
            ">


                <div style="
                    width:62px;
                    height:62px;
                    border-radius:50%;
                    background:#FFF4EA;
                    color:#FF6B35;
                    display:flex;
                    align-items:center;
                    justify-content:center;
                    font-size:22px;
                    font-weight:800;
                    flex-shrink:0;
                ">

                    <%= user.getName().substring(0,1).toUpperCase() %>

                </div>



                <div>

                    <h2 style="
                        margin:0 0 6px 0;
                        color:#222222;
                        font-size:21px;
                    ">

                        Account Information

                    </h2>


                    <p style="
                        margin:0;
                        color:#777777;
                        font-size:12px;
                    ">

                        Manage your FoodOrder profile details.

                    </p>

                </div>


            </div>



            <!-- ================================================= -->
            <!-- FORM -->
            <!-- ================================================= -->

            <form action="editProfile" method="post">



                <!-- NAME -->

                <div style="
                    margin-bottom:21px;
                ">

                    <label style="
                        display:block;
                        color:#444444;
                        font-size:13px;
                        font-weight:700;
                        margin-bottom:8px;
                    ">

                        Full Name

                    </label>


                    <input
                        type="text"
                        name="name"
                        value="<%= user.getName() %>"
                        required
                        style="
                            width:100%;
                            padding:13px 14px;
                            box-sizing:border-box;
                            border:1px solid #E8DAD2;
                            border-radius:8px;
                            outline:none;
                            font-size:14px;
                            color:#222222;
                            background:#FFFFFF;
                        "
                    >

                </div>



                <!-- EMAIL -->

                <div style="
                    margin-bottom:21px;
                ">

                    <label style="
                        display:block;
                        color:#444444;
                        font-size:13px;
                        font-weight:700;
                        margin-bottom:8px;
                    ">

                        Email

                    </label>


                    <input
                        type="email"
                        value="<%= user.getEmail() %>"
                        readonly
                        style="
                            width:100%;
                            padding:13px 14px;
                            box-sizing:border-box;
                            border:1px solid #DDDDDD;
                            border-radius:8px;
                            background:#F6F6F6;
                            color:#777777;
                            font-size:14px;
                            outline:none;
                        "
                    >

                    <p style="
                        margin:6px 0 0 0;
                        color:#999999;
                        font-size:10px;
                    ">

                        Email cannot be changed here.

                    </p>

                </div>



                <!-- PHONE -->

                <div style="
                    margin-bottom:21px;
                ">

                    <label style="
                        display:block;
                        color:#444444;
                        font-size:13px;
                        font-weight:700;
                        margin-bottom:8px;
                    ">

                        Phone

                    </label>


                    <input
                        type="text"
                        name="phone"
                        value="<%= user.getPhone() %>"
                        style="
                            width:100%;
                            padding:13px 14px;
                            box-sizing:border-box;
                            border:1px solid #E8DAD2;
                            border-radius:8px;
                            outline:none;
                            font-size:14px;
                            color:#222222;
                            background:#FFFFFF;
                        "
                    >

                </div>



                <!-- ADDRESS -->

                <div style="
                    margin-bottom:25px;
                ">

                    <label style="
                        display:block;
                        color:#444444;
                        font-size:13px;
                        font-weight:700;
                        margin-bottom:8px;
                    ">

                        Address

                    </label>


                    <textarea
                        name="address"
                        rows="4"
                        style="
                            width:100%;
                            padding:13px 14px;
                            box-sizing:border-box;
                            border:1px solid #E8DAD2;
                            border-radius:8px;
                            outline:none;
                            resize:vertical;
                            font-family:Arial, Helvetica, sans-serif;
                            font-size:14px;
                            color:#222222;
                            background:#FFFFFF;
                        "
                    ><%= user.getAddress() %></textarea>

                </div>



                <!-- ================================================= -->
                <!-- BUTTONS -->
                <!-- ================================================= -->

                <div style="
                    display:flex;
                    gap:12px;
                    flex-wrap:wrap;
                ">


                    <!-- SAVE -->

                    <button
                        type="submit"
                        style="
                            border:none;
                            background:#FF6B35;
                            color:#FFFFFF;
                            padding:12px 24px;
                            border-radius:8px;
                            font-size:13px;
                            font-weight:800;
                            cursor:pointer;
                        "
                    >

                        Save Changes

                    </button>



                    <!-- CANCEL -->

                    <a href="profile"
                       style="
                           display:inline-block;
                           background:#FFFFFF;
                           color:#FF6B35;
                           border:1px solid #FF6B35;
                           text-decoration:none;
                           padding:11px 24px;
                           border-radius:8px;
                           font-size:13px;
                           font-weight:700;
                       ">

                        Cancel

                    </a>


                </div>


            </form>


        </div>


    </section>


</main>



<!-- ===================================================== -->
<!-- BOTTOM NAVIGATION -->
<!-- ===================================================== -->

<div style="
    width:90%;
    max-width:1200px;
    margin:0 auto;
    padding:22px 0;
    border-top:1px solid #EEEEEE;
    text-align:center;
">


    <a href="index.html"
       style="
           color:#FF6B35;
           text-decoration:none;
           font-size:12px;
           font-weight:700;
           margin:0 12px;
       ">

        Home

    </a>


    <a href="restaurants"
       style="
           color:#FF6B35;
           text-decoration:none;
           font-size:12px;
           font-weight:700;
           margin:0 12px;
       ">

        Restaurants

    </a>


    <a href="menu"
       style="
           color:#FF6B35;
           text-decoration:none;
           font-size:12px;
           font-weight:700;
           margin:0 12px;
       ">

        Menu

    </a>


    <a href="order"
       style="
           color:#FF6B35;
           text-decoration:none;
           font-size:12px;
           font-weight:700;
           margin:0 12px;
       ">

        Orders

    </a>


    <a href="profile"
       style="
           color:#FF6B35;
           text-decoration:none;
           font-size:12px;
           font-weight:700;
           margin:0 12px;
       ">

        Profile

    </a>


    <a href="cart"
       style="
           color:#FF6B35;
           text-decoration:none;
           font-size:12px;
           font-weight:700;
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
    padding:40px 25px 25px 25px;
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


        <a href="cart"
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