<%@page import="Reservation.Reservation"%>
<%@page import="Reservation.DiningPref"%>
<%@page import="Guest.Guest"%>
<%@page import="java.time.LocalDate"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Details</title>
    <link rel="stylesheet" href="styles/payment.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }

        .navbar {
            background-color: #904220;
            overflow: hidden;
        }

        .navbar a {
            float: left;
            display: block;
            color: white;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }

        .navbar a:hover {
            background-color: #ddd;
            color: black;
        }

        .container {
            margin-top: 20px;
            margin-bottom: 20px;
            max-width: 900px;
            margin-left: auto;
            margin-right: auto;
        }

        .row {
            display: flex;
            flex-wrap: wrap;
            margin: 0 -16px;
        }

        .col-25 {
            flex: 25%;
            padding: 0 16px;
        }

        .col-50 {
            flex: 50%;
            padding: 0 16px;
        }

        .col-75 {
            flex: 75%;
            padding: 0 16px;
        }

        input[type=text], input[type=password], input[type=email], input[type=tel], input[type=number], input[type=date], input[type=time], input[type=datetime-local], input[type=month], input[type=week], input[type=search], input[type=color], select, textarea {
            width: 100%;
            padding: 12px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        label {
            margin-bottom: 8px;
            display: block;
        }

        .icon-container {
            margin-bottom: 20px;
            padding: 7px 0;
            font-size: 24px;
        }

        .btn {
            background-color: #04AA6D;
            color: white;
            padding: 12px;
            margin: 10px 0;
            border: none;
            width: 100%;
            border-radius: 3px;
            cursor: pointer;
            font-size: 17px;
        }

        .btn:hover {
            background-color: #45a049;
        }

        .price {
            float: right;
            color: grey;
        }

        /* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other */
        @media (max-width: 800px) {
            .row {
                flex-direction: column;
            }
        }

    </style>
</head>
    <body>
        <% 
            Guest guest = (Guest) request.getSession(false).getAttribute("guest");
            LocalDate checkInDate = (LocalDate) request.getAttribute("checkInDate");
            LocalDate checkOutDate = (LocalDate) request.getAttribute("checkOutDate");
            long totalPrice = (Long) request.getAttribute("totalPrice");
            DiningPref diningPref = (DiningPref) request.getAttribute("diningPref2");
            String specialRequests = (String) request.getAttribute("specialRequests");
            int roomId = (Integer) request.getAttribute("roomId");
        %>

        <div class="navbar">
            <a href="homepage.html">HOME</a>
            <a href="viewRooms.html">VIEW ROOMS</a>
            <a href="chooseDates.html">ADD BOOKING</a>
            <a href="/Project2/ReservationController?action=past">VIEW BOOKING HISTORY</a>
            <a href="/Project2/ReservationController?action=upcoming">VIEW UPCOMING BOOKINGS</a>
        </div>

        <div class="container">
            <div class="billing-payment-form">
                <form action="ReservationController" method="post">
                    <div class="row">
                        <div class="col-50">
                            <h3>Booking Details</h3>
                            <label for="name"> Full Name</label>
                            <input type="text" id="name" name="name" value="<%=guest.getFirstName() + " " + guest.getLastName()%>" readonly="">
                            <label for="email"> Email</label>
                            <input type="text" id="email" name="email" value="<%=guest.getEmail()%>" readonly="">
                            <label for="check-in-date">Check-in Date</label>
                            <input type="date" id="check-in-date" name="check-in-date" value="<%=checkInDate%>" readonly="">
                            <label for="check-out-date">Check-out Date</label>
                            <input type="date" id="check-out-date" name="check-out-date" value="<%=checkInDate%>" readonly="">
                        </div>

                        <div class="col-50">
                            <h3>Payment</h3>
                            <label for="fname">Accepted Cards</label>
                            <div class="icon-container">
                                <i class="fa fa-cc-visa" style="color:navy;"></i>
                                <i class="fa fa-cc-amex" style="color:blue;"></i>
                                <i class="fa fa-cc-mastercard" style="color:red;"></i>
                                <i class="fa fa-cc-discover" style="color:orange;"></i>
                            </div>
                            <label for="cardName">Name on Card</label>
                            <input type="text" id="cardName" name="cardName" placeholder="John More Doe">
                            <label for="cardNumber">Card number</label>
                            <input type="text" id="cardNumber" name="cardNumber" placeholder="1111-2222-3333-4444">
                            <label for="expiry-month">Exp Month</label>
                            <input type="text" id="expiry-month" name="expiry-month" placeholder="September">

                            <div class="row">
                                <div class="col-50">
                                    <label for="expiry-date">Exp Year</label>
                                    <input type="text" id="expiry-date" name="expiry-date" placeholder="2018">
                                </div>
                                <div class="col-50">
                                    <label for="csv">CVV</label>
                                    <input type="text" id="csv" name="csv" placeholder="352">
                                </div>
                            </div>
                        </div>
                    </div>
                    <input type="submit" style="background-color: #904220" name="submit" value="Make payment" class="btn">
                    <input type="hidden" name="checkInDate" value="<%=checkInDate%>">
                    <input type="hidden" name="checkOutDate" value="<%=checkOutDate%>">
                    <input type="hidden" name="totalPrice" value="<%=totalPrice%>">
                    <input type="hidden" name="roomId" value="<%=roomId%>">
                    <input type="hidden" name="diningPref" value="<%=diningPref%>">
                    <input type="hidden" name="specialRequests" value="<%=specialRequests%>">
                </form>
            </div>
                <p>Total <span class="price"><b>R<%=totalPrice%></b></span></p>
        </div>
    </body>
</html>


