<%-- 
    Document   : addBooking
    Created on : 19 Jun 2024, 15:36:04
    Author     : Mrqts
--%>

<%@page import="java.time.temporal.ChronoUnit"%>
<%@page import="java.time.LocalDate"%>
<%@page import="Guest.Guest"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Booking Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: white;
            margin: 0;
            padding: 20px;
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
            padding: 14px 20px;
            text-decoration: none;
        }
        .navbar a:hover {
            background-color: rgba(0, 0, 0, 0.3);
            color: white;
        }
        .booking-section {
            background-color: white;
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .booking-section h2 {
            margin-top: 0;
            font-size: 24px;
            color: white;
        }
        form {
            margin-top: 15px;
            color: black;
        }
        label {
            font-weight: bold;
            margin-bottom: 5px;
        }
        select, input[type="text"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 16px;
        }
        button[type="submit"] {
            background-color: #904220;
            color: black;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        button[type="submit"]:hover {
            background-color: #904220;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group::after {
            content: "";
            display: table;
            clear: both;
        }
        .form-group label {
            float: left;
            width: 30%;
            text-align: right;
            margin-right: 2%;
            line-height: 32px;
        }
        .form-group input, .form-group select {
            float: left;
            width: 65%;
        }
    </style>
</head>
    <body>
        <% 
            // Retrieving necessary data from request attributes or session
            Guest guest = (Guest) request.getSession(false).getAttribute("guest");
            LocalDate checkInDate = (LocalDate) request.getAttribute("checkInDate");
            LocalDate checkOutDate = (LocalDate) request.getAttribute("checkOutDate");
            long totalPrice = (Long) request.getAttribute("totalPrice");
            int roomId = (Integer) request.getAttribute("roomId");

            // Calculating days between check-in and check-out dates
            long daysBetween = (checkInDate != null && checkOutDate != null) ? 
                                ChronoUnit.DAYS.between(checkInDate, checkOutDate) : 0;
        %>
        <div class="navbar" style="a">
            <a href="homepage.html">HOME</a>
            <a href="viewRooms.jsp">VIEW ROOMS</a>
            <a href="chooseDates.html">ADD BOOKING</a>
            <a href="/Project2/ReservationController">VIEW BOOKING HISTORY</a>
        </div>
        <div class="booking-section">
            <h2>Book Now</h2>
            <br>
            <div class="row" style="text-align: center; color: black">
                <div class="col-md-6">
                    <h4>Check-In:</h4>
                    <h5>After 14:00</h5>
                </div>
                <div class="col-md-6">
                    <h4>Check-Out:</h4>
                    <h5>Before 11:00</h5>
                </div>
            </div>
            <form id="booking-form" action="ReservationController" method="post">
                <div class="form-group">
                    <label for="guestName">Guest:</label>
                    <input type="text" id="guestName" name="guestName" value="<%= guest.getFirstName() %>" readonly>
                </div>
                <div class="form-group">
                    <label for="checkInDate">Check-in Date:</label>
                    <input type="text" id="checkInDate" name="checkInDate" value="<%= checkInDate %>" readonly>
                </div>
                <div class="form-group">
                    <label for="checkOutDate">Check-out Date:</label>
                    <input type="text" id="checkOutDate" name="checkOutDate" value="<%= checkOutDate %>" readonly>
                </div>
                <div class="form-group">
                    <label for="totalPrice">Total Price:</label>
                    <input type="text" id="totalPrice" name="totalPrice" value="<%= totalPrice %>" readonly>
                </div>
                <div class="form-group">
                    <label for="diningPreference">Dining Preference:</label>
                    <select id="diningPreference" name="diningPreference">
                        <option value="" disabled selected>Dining Preference</option>
                        <option value="VEGAN">VEGAN</option>
                        <option value="GLUTEN_FREE">GLUTEN-FREE</option>
                        <option value="HALAAL">HALAAL</option>
                        <option value="OTHER">OTHER</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="specialRequests">Special Requests:</label>
                    <input type="text" id="special-requests" name="special-requests">
                </div>
                <div class="form-group">
                    <button type="submit" name="submit" value="addBooking">Submit</button>
                </div>
                <!-- Hidden inputs to carry booking details -->
                <input type="hidden" name="roomId" value="<%= roomId %>">
                <input type="hidden" name="checkInDate" value="<%= checkInDate %>">
                <input type="hidden" name="checkOutDate" value="<%= checkOutDate %>">
                <input type="hidden" name="totalPrice" value="<%= totalPrice %>">
            </form>
        </div>
    </body>
</html>

