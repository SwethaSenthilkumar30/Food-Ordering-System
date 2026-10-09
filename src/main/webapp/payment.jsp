<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.tap.model.CartItem" %>
<%@ page import="com.tap.model.Menu" %>

<%
    List<CartItem> cartItems =
        (List<CartItem>) request.getAttribute("cartItems");

    List<Menu> menuItems =
        (List<Menu>) request.getAttribute("menuItems");

    double subtotal = 0;

    if (cartItems != null && menuItems != null) {

        for (int i = 0; i < cartItems.size(); i++) {

            CartItem cartItem = cartItems.get(i);

            Menu menu = menuItems.get(i);

            if (menu != null) {

                subtotal =
                    subtotal +
                    (menu.getPrice() * cartItem.getQuantity());
            }
        }
    }

    double deliveryFee = 40;

    double tax = Math.round(subtotal * 0.05);

    double total = subtotal + deliveryFee + tax;
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Payment - FoodOrder</title>

</head>


<body style="
    margin:0;
    padding:0;
    background:#fff7f2;
    font-family:Arial,Helvetica,sans-serif;
    color:#222;
">


<!-- ===================================================== -->
<!-- HEADER -->
<!-- ===================================================== -->

<header style="
    width:100%;
    background:#ffffff;
    border-bottom:1px solid #eeeeee;
    box-shadow:0 2px 12px rgba(0,0,0,0.06);
">

    <div style="
        max-width:1200px;
        margin:0 auto;
        padding:18px 25px;
        display:flex;
        align-items:center;
        justify-content:space-between;
        box-sizing:border-box;
    ">


        <!-- LOGO -->

        <a href="index.html"
           style="
               text-decoration:none;
               color:#fc8019;
               font-size:28px;
               font-weight:800;
               letter-spacing:-0.5px;
           ">

            FoodOrder

        </a>


        <!-- NAVIGATION -->

        <nav style="
            display:flex;
            align-items:center;
            gap:28px;
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
                   color:#333333;
                   font-size:14px;
                   font-weight:600;
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


            <a href="logout"
               style="
                   text-decoration:none;
                   background:#fc8019;
                   color:#ffffff;
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
    max-width:1100px;
    margin:0 auto;
    padding:45px 0 60px 0;
    box-sizing:border-box;
">


    <!-- ================================================= -->
    <!-- PAGE TITLE -->
    <!-- ================================================= -->

    <div style="
        text-align:center;
        margin-bottom:35px;
    ">

        <div style="
            color:#fc8019;
            font-size:11px;
            font-weight:800;
            letter-spacing:1px;
            margin-bottom:8px;
        ">

            SECURE CHECKOUT

        </div>


        <h1 style="
            margin:0;
            color:#222222;
            font-size:34px;
            font-weight:800;
        ">

            Payment

        </h1>


        <p style="
            margin:10px 0 0 0;
            color:#777777;
            font-size:14px;
        ">

            Complete your payment to place the order

        </p>

    </div>



    <!-- ================================================= -->
    <!-- PAYMENT + SUMMARY -->
    <!-- ================================================= -->

    <div style="
        display:flex;
        align-items:flex-start;
        gap:25px;
        flex-wrap:wrap;
    ">


        <!-- ================================================= -->
        <!-- PAYMENT CARD -->
        <!-- ================================================= -->

        <div style="
            flex:1;
            min-width:500px;
            background:#ffffff;
            border:1px solid #eeeeee;
            border-radius:18px;
            padding:30px;
            box-sizing:border-box;
            box-shadow:0 6px 20px rgba(0,0,0,0.06);
        ">


            <!-- PAYMENT HEADING -->

            <div style="
                margin-bottom:22px;
                padding-bottom:15px;
                border-bottom:1px solid #eeeeee;
            ">

                <div style="
                    color:#fc8019;
                    font-size:11px;
                    font-weight:800;
                    letter-spacing:0.7px;
                    margin-bottom:6px;
                ">

                    CHECKOUT

                </div>


                <h2 style="
                    margin:0;
                    color:#222222;
                    font-size:23px;
                    font-weight:800;
                ">

                    Choose Payment Method

                </h2>

            </div>



            <!-- ================================================= -->
            <!-- UPI -->
            <!-- ================================================= -->

            <div id="upiOption"
                 onclick="selectPaymentBox('upi')"
                 style="
                     border:1px solid #e5e5e5;
                     border-radius:12px;
                     padding:18px;
                     margin-bottom:14px;
                     background:#ffffff;
                     cursor:pointer;
                     box-sizing:border-box;
                     transition:0.2s;
                 ">

                <label style="
                    display:flex;
                    align-items:center;
                    cursor:pointer;
                    font-size:15px;
                    font-weight:700;
                    color:#333333;
                ">

                    <input
                        type="radio"
                        name="payment"
                        value="UPI"
                        onclick="showPayment('upi'); event.stopPropagation();"
                        style="
                            width:17px;
                            height:17px;
                            margin-right:12px;
                            accent-color:#fc8019;
                        "
                    >

                    UPI

                </label>


                <div id="upiBox"
                     style="
                         display:none;
                         margin-top:15px;
                         padding:15px;
                         background:#fff7f2;
                         border-radius:10px;
                         box-sizing:border-box;
                     ">

                    <div style="
                        color:#777777;
                        font-size:12px;
                        margin-bottom:8px;
                    ">

                        Enter your UPI ID

                    </div>


                    <input
                        type="text"
                        id="upiId"
                        placeholder="example@upi"
                        style="
                            width:100%;
                            height:44px;
                            box-sizing:border-box;
                            padding:0 13px;
                            border:1px solid #dddddd;
                            border-radius:8px;
                            outline:none;
                            background:#ffffff;
                            font-size:13px;
                        "
                    >

                </div>

            </div>



            <!-- ================================================= -->
            <!-- CREDIT / DEBIT CARD -->
            <!-- ================================================= -->

            <div id="cardOption"
                 onclick="selectPaymentBox('card')"
                 style="
                     border:1px solid #e5e5e5;
                     border-radius:12px;
                     padding:18px;
                     margin-bottom:14px;
                     background:#ffffff;
                     cursor:pointer;
                     box-sizing:border-box;
                 ">

                <label style="
                    display:flex;
                    align-items:center;
                    cursor:pointer;
                    font-size:15px;
                    font-weight:700;
                    color:#333333;
                ">

                    <input
                        type="radio"
                        name="payment"
                        value="Card"
                        onclick="showPayment('card'); event.stopPropagation();"
                        style="
                            width:17px;
                            height:17px;
                            margin-right:12px;
                            accent-color:#fc8019;
                        "
                    >

                    Credit / Debit Card

                </label>


                <div id="cardBox"
                     style="
                         display:none;
                         margin-top:15px;
                         padding:15px;
                         background:#fff7f2;
                         border-radius:10px;
                         box-sizing:border-box;
                     ">

                    <div style="
                        color:#777777;
                        font-size:12px;
                        margin-bottom:8px;
                    ">

                        Enter your card details

                    </div>


                    <input
                        type="text"
                        id="cardNumber"
                        placeholder="Card Number"
                        style="
                            width:100%;
                            height:44px;
                            box-sizing:border-box;
                            padding:0 13px;
                            margin-bottom:10px;
                            border:1px solid #dddddd;
                            border-radius:8px;
                            outline:none;
                            background:#ffffff;
                            font-size:13px;
                        "
                    >


                    <div style="
                        display:flex;
                        gap:10px;
                    ">


                        <input
                            type="text"
                            id="expiry"
                            placeholder="MM/YY"
                            style="
                                width:50%;
                                height:44px;
                                box-sizing:border-box;
                                padding:0 13px;
                                border:1px solid #dddddd;
                                border-radius:8px;
                                outline:none;
                                background:#ffffff;
                                font-size:13px;
                            "
                        >


                        <input
                            type="text"
                            id="cvv"
                            placeholder="CVV"
                            style="
                                width:50%;
                                height:44px;
                                box-sizing:border-box;
                                padding:0 13px;
                                border:1px solid #dddddd;
                                border-radius:8px;
                                outline:none;
                                background:#ffffff;
                                font-size:13px;
                            "
                        >

                    </div>

                </div>

            </div>



            <!-- ================================================= -->
            <!-- CASH ON DELIVERY -->
            <!-- ================================================= -->

            <div id="codOption"
                 onclick="selectPaymentBox('cod')"
                 style="
                     border:1px solid #e5e5e5;
                     border-radius:12px;
                     padding:18px;
                     margin-bottom:20px;
                     background:#ffffff;
                     cursor:pointer;
                     box-sizing:border-box;
                 ">

                <label style="
                    display:flex;
                    align-items:center;
                    cursor:pointer;
                    font-size:15px;
                    font-weight:700;
                    color:#333333;
                ">

                    <input
                        type="radio"
                        name="payment"
                        value="Cash on Delivery"
                        onclick="showPayment('cod'); event.stopPropagation();"
                        style="
                            width:17px;
                            height:17px;
                            margin-right:12px;
                            accent-color:#fc8019;
                        "
                    >

                    Cash on Delivery

                </label>


                <div style="
                    margin-left:29px;
                    margin-top:8px;
                    color:#888888;
                    font-size:12px;
                    line-height:1.5;
                ">

                    Pay when your order is delivered.

                </div>

            </div>



            <!-- ================================================= -->
            <!-- PLACE ORDER -->
            <!-- ================================================= -->

            <button
                type="button"
                onclick="placeOrder()"
                style="
                    width:100%;
                    border:none;
                    padding:15px;
                    background:#fc8019;
                    color:#ffffff;
                    font-size:15px;
                    font-weight:700;
                    border-radius:9px;
                    cursor:pointer;
                    box-sizing:border-box;
                "
            >

                Place Order

            </button>



            <!-- ================================================= -->
            <!-- BACK TO CART -->
            <!-- ================================================= -->

            <a href="cart"
               style="
                   display:inline-flex;
                   align-items:center;
                   justify-content:center;
                   gap:8px;
                   width:100%;
                   margin-top:18px;
                   color:#fc8019;
                   text-decoration:none;
                   font-size:14px;
                   font-weight:600;
                   box-sizing:border-box;
               ">

                <span style="
                    font-size:20px;
                    line-height:1;
                    font-weight:400;
                ">&larr;</span>

                <span>
                    Back to Cart
                </span>

            </a>

        </div>



        <!-- ================================================= -->
        <!-- ORDER SUMMARY -->
        <!-- ================================================= -->

        <div style="
            width:340px;
            background:#ffffff;
            border:1px solid #eeeeee;
            border-radius:18px;
            padding:28px;
            box-sizing:border-box;
            box-shadow:0 6px 20px rgba(0,0,0,0.06);
        ">


            <!-- SUMMARY HEADING -->

            <div style="
                margin-bottom:20px;
                padding-bottom:15px;
                border-bottom:1px solid #eeeeee;
            ">

                <div style="
                    color:#fc8019;
                    font-size:11px;
                    font-weight:800;
                    letter-spacing:0.7px;
                    margin-bottom:6px;
                ">

                    YOUR ORDER

                </div>


                <h2 style="
                    margin:0;
                    color:#222222;
                    font-size:22px;
                    font-weight:800;
                ">

                    Order Summary

                </h2>

            </div>



            <!-- ================================================= -->
            <!-- CART ITEMS -->
            <!-- ================================================= -->

            <%

                if (cartItems != null &&
                    menuItems != null &&
                    !cartItems.isEmpty()) {

                    for (int i = 0;
                         i < cartItems.size();
                         i++) {

                        CartItem cartItem =
                            cartItems.get(i);

                        Menu menu =
                            menuItems.get(i);

                        if (menu != null) {

                            double itemTotal =
                                menu.getPrice()
                                * cartItem.getQuantity();

            %>


            <div style="
                display:flex;
                justify-content:space-between;
                align-items:flex-start;
                gap:15px;
                padding:14px 0;
                border-bottom:1px solid #eeeeee;
            ">


                <div style="
                    flex:1;
                ">

                    <div style="
                        font-size:14px;
                        font-weight:700;
                        color:#222222;
                        line-height:1.4;
                    ">

                        <%= menu.getName() %>

                    </div>


                    <div style="
                        font-size:12px;
                        color:#888888;
                        margin-top:5px;
                    ">

                        <%= cartItem.getQuantity() %>
                        ×
                        &#8377;<%= menu.getPrice() %>

                    </div>

                </div>


                <div style="
                    font-size:14px;
                    font-weight:700;
                    color:#333333;
                    white-space:nowrap;
                ">

                    &#8377;<%= itemTotal %>

                </div>

            </div>


            <%

                        }

                    }

                }

            %>



            <!-- ================================================= -->
            <!-- SUBTOTAL -->
            <!-- ================================================= -->

            <div style="
                display:flex;
                justify-content:space-between;
                margin-top:20px;
                margin-bottom:14px;
                color:#777777;
                font-size:14px;
            ">

                <span>
                    Subtotal
                </span>

                <span style="
                    color:#333333;
                    font-weight:600;
                ">

                    &#8377;<%= subtotal %>

                </span>

            </div>



            <!-- ================================================= -->
            <!-- DELIVERY FEE -->
            <!-- ================================================= -->

            <div style="
                display:flex;
                justify-content:space-between;
                margin-bottom:14px;
                color:#777777;
                font-size:14px;
            ">

                <span>
                    Delivery Fee
                </span>

                <span style="
                    color:#333333;
                    font-weight:600;
                ">

                    &#8377;<%= deliveryFee %>

                </span>

            </div>



            <!-- ================================================= -->
            <!-- TAX -->
            <!-- ================================================= -->

            <div style="
                display:flex;
                justify-content:space-between;
                margin-bottom:18px;
                color:#777777;
                font-size:14px;
            ">

                <span>
                    Tax
                </span>

                <span style="
                    color:#333333;
                    font-weight:600;
                ">

                    &#8377;<%= tax %>

                </span>

            </div>



            <!-- ================================================= -->
            <!-- TOTAL -->
            <!-- ================================================= -->

            <div style="
                display:flex;
                justify-content:space-between;
                align-items:center;
                padding-top:18px;
                border-top:1px solid #dddddd;
            ">

                <span style="
                    font-size:18px;
                    font-weight:800;
                    color:#222222;
                ">

                    Total

                </span>


                <span style="
                    font-size:21px;
                    font-weight:800;
                    color:#fc8019;
                ">

                    &#8377;<%= total %>

                </span>

            </div>



            <!-- ================================================= -->
            <!-- SECURITY NOTE -->
            <!-- ================================================= -->

            <div style="
                margin-top:22px;
                padding:13px;
                background:#fff7f2;
                border-radius:9px;
                text-align:center;
                color:#777777;
                font-size:11px;
                line-height:1.5;
            ">

                Your order details are securely processed.

            </div>

        </div>

    </div>

</main>



<!-- ===================================================== -->
<!-- FOOTER -->
<!-- ===================================================== -->

<footer style="
    background:#222222;
    color:#ffffff;
    text-align:center;
    padding:24px 15px;
">


    <div style="
        color:#fc8019;
        font-size:20px;
        font-weight:800;
        margin-bottom:7px;
    ">

        FoodOrder

    </div>


    <p style="
        margin:0;
        color:#bbbbbb;
        font-size:12px;
    ">

        Delicious food delivered fast to your doorstep.

    </p>


    <p style="
        margin:15px 0 0 0;
        color:#888888;
        font-size:11px;
    ">

        © 2026 FoodOrder. All Rights Reserved.

    </p>

</footer>



<!-- ===================================================== -->
<!-- JAVASCRIPT -->
<!-- ===================================================== -->

<script>

function showPayment(type) {

    document.getElementById("upiBox").style.display = "none";

    document.getElementById("cardBox").style.display = "none";


    document.getElementById("upiOption").style.border =
        "1px solid #e5e5e5";

    document.getElementById("cardOption").style.border =
        "1px solid #e5e5e5";

    document.getElementById("codOption").style.border =
        "1px solid #e5e5e5";


    document.getElementById("upiOption").style.background =
        "#ffffff";

    document.getElementById("cardOption").style.background =
        "#ffffff";

    document.getElementById("codOption").style.background =
        "#ffffff";


    if (type === "upi") {

        document.getElementById("upiBox").style.display =
            "block";

        document.getElementById("upiOption").style.border =
            "1px solid #fc8019";

        document.getElementById("upiOption").style.background =
            "#fffaf7";
    }


    if (type === "card") {

        document.getElementById("cardBox").style.display =
            "block";

        document.getElementById("cardOption").style.border =
            "1px solid #fc8019";

        document.getElementById("cardOption").style.background =
            "#fffaf7";
    }


    if (type === "cod") {

        document.getElementById("codOption").style.border =
            "1px solid #fc8019";

        document.getElementById("codOption").style.background =
            "#fffaf7";
    }

}



function selectPaymentBox(type) {

    let radioButtons =
        document.querySelectorAll(
            'input[name="payment"]'
        );


    if (type === "upi") {

        radioButtons[0].checked = true;

        showPayment("upi");

    }


    if (type === "card") {

        radioButtons[1].checked = true;

        showPayment("card");

    }


    if (type === "cod") {

        radioButtons[2].checked = true;

        showPayment("cod");

    }

}



function placeOrder() {


    let payment =
        document.querySelector(
            'input[name="payment"]:checked'
        );


    if (!payment) {

        alert("Please select a payment method.");

        return;
    }


    let selectedPayment =
        payment.value;



    <!-- UPI VALIDATION -->

    if (selectedPayment === "UPI") {

        let upiId =
            document.getElementById("upiId")
            .value
            .trim();


        if (upiId === "") {

            alert("Please enter your UPI ID.");

            return;
        }

    }



    <!-- CARD VALIDATION -->

    if (selectedPayment === "Card") {

        let cardNumber =
            document.getElementById("cardNumber")
            .value
            .trim();


        let expiry =
            document.getElementById("expiry")
            .value
            .trim();


        let cvv =
            document.getElementById("cvv")
            .value
            .trim();


        if (cardNumber === "" ||
            expiry === "" ||
            cvv === "") {

            alert("Please enter all card details.");

            return;
        }

    }



    let form =
        document.createElement("form");


    form.method = "POST";

    form.action = "payment";



    let input =
        document.createElement("input");


    input.type = "hidden";

    input.name = "paymentMethod";

    input.value = selectedPayment;



    form.appendChild(input);

    document.body.appendChild(form);

    form.submit();

}

</script>


</body>

</html>