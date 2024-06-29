<%-- 
    Document   : adminEditReservation
    Created on : 23 Jun 2024, 20:41:52
    Author     : Mrqts
--%>

<%@page import="Reservation.DiningPref"%>
<%@page import="java.util.List"%>
<%@page import="Reservation.Reservation"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Reservation</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 20px;
        }
        nav {
            background-color: #904220;
            color: #fff;
            padding: 1rem 0;
        }
        nav ul {
            list-style: none;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
        }
        nav ul li {
            margin-right: 1rem;
        }
        nav ul li a {
            text-decoration: none;
            color: #fff;
            padding: 0.5rem 1rem;
            transition: background-color 0.3s ease;
        }
        nav ul li a:hover {
            background-color: #555;
        }
        form {
            max-width: 600px;
            margin: 0 auto;
            background-color: #f9f9f9;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        label {
            font-weight: bold;
            margin-top: 10px;
        }
        input[type=text], input[type=date], select {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        select {
            height: 40px;
        }
        input[type=submit] {
            background-color: #904220;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 10px;
        }
        input[type=submit]:hover {
            background-color: #45a049;
        }
    </style>
</head>
    <body>
        <% 
            Reservation reservation = (Reservation) request.getAttribute("reservation");
        %>
        <nav>
            <ul>
                <li><a href="adminHomePage.jsp">Add Booking</a></li>
                <li><a href="/Project2/AdminController?action=past">Booking History</a></li>
                <li><a href="/Project2/AdminController?action=upcoming">Upcoming Bookings</a></li>
            </ul>
        </nav>
        <form action="AdminController" method="post">
            <label for="room-id">Room ID:</label><br>
            <input type="text" id="room-id" name="room-id" value="<%= reservation.getRoomId() %>"><br><br>

            <label for="check-in">Check-In Date:</label><br>
            <input type="date" id="check-in" name="check-in" value="<%= reservation.getCheckIn()%>"><br><br>

            <label for="check-out">Check-Out Date:</label><br>
            <input type="date" id="check-out" name="check-out" value="<%= reservation.getCheckOut()%>"><br><br>

            <label for="total-price">Total Price:</label><br>
            <input type="text" id="total-price" name="total-price" value="<%= reservation.getTotalPrice()%>"><br><br>

            <label for="dining-pref">Dining Preference:</label><br>
            <select id="dining-pref" name="dining-pref">
                <option value="" disabled selected>Select Dining Preference</option>
                <option value="VEGAN" <%= (reservation.getDiningPref() != null && reservation.getDiningPref() == DiningPref.VEGAN) ? "selected" : "" %>>VEGAN</option>
                <option value="GLUTEN_FREE" <%= (reservation.getDiningPref() != null && reservation.getDiningPref() == DiningPref.GLUTEN_FREE) ? "selected" : "" %>>GLUTEN-FREE</option>
                <option value="HALAAL" <%= (reservation.getDiningPref() != null && reservation.getDiningPref() == DiningPref.HALAAL) ? "selected" : "" %>>HALAAL</option>
                <option value="OTHER" <%= (reservation.getDiningPref() != null && reservation.getDiningPref() == DiningPref.OTHER) ? "selected" : "" %>>OTHER</option>
            </select><br><br>

            <label for="special-requests">Special Requests:</label><br>
            <input type="text" id="special-requests" name="special-requests" value="<%= reservation.getSpecialRequests() %>"><br><br>

            <input type="hidden" name="reservation-id" value="<%= reservation.getReservationId() %>">
            <input type="hidden" name="guest-id" value="<%= reservation.getGuestId() %>">

            <input name="submit" type="submit" value="Update Booking">
            <input name="submit" type="submit" value="Delete">
        </form>
    </body>
</html>


