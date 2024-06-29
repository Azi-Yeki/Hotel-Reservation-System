<%-- 
    Document   : editReservation
    Created on : 22 Jun 2024, 10:50:01
    Author     : Mrqts
--%>

<%@page import="Reservation.DiningPref"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Reservation</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('https://i.pinimg.com/474x/fc/45/f2/fc45f203df30f329f5d7c28824cc2c5a.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            height: 100vh;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }
        form {
            background-color: rgba(0, 0, 0, 0.3);
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            text-align: center;
            max-width: 400px;
            width: 100%;
        }
        select, input[type="text"], input[type="submit"] {
            width: calc(100% - 20px);
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 16px;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
    <body>
        <% 
            DiningPref currentDiningPref = (DiningPref) request.getAttribute("diningPref");
            String currentSpecialRequests = (String) request.getAttribute("specialRequests");
            int reservationId = (Integer) request.getAttribute("reservationId");
        %>
        <form action="ReservationController" method="post">
            <select id="dining-pref" name="dining-pref">
                <option value="" disabled selected>Dining Preference</option>
                <option value="VEGAN" <% if (currentDiningPref != null && currentDiningPref == DiningPref.VEGAN) { %>selected<% } %>>VEGAN</option>
                <option value="GLUTEN_FREE" <% if (currentDiningPref != null && currentDiningPref == DiningPref.GLUTEN_FREE) { %>selected<% } %>>GLUTEN-FREE</option>
                <option value="HALAAL" <% if (currentDiningPref != null && currentDiningPref == DiningPref.HALAAL) { %>selected<% } %>>HALAAL</option>
                <option value="OTHER" <% if (currentDiningPref != null && currentDiningPref == DiningPref.OTHER) { %>selected<% } %>>OTHER</option>
            </select><br><br>

            <label for="special-requests" style="color: white">Special Requests:</label><br>
            <input type="text" id="special-requests" name="special-requests" value="<%= currentSpecialRequests %>"><br><br>

            <input type="hidden" name="reservation-id" value="<%= reservationId %>">
            <input name="submit" type="submit" value="Update Booking">
            <h5 style="color: white">To remove booking, <a href="mailto:azyeki01@outlook.com">email us</a>.</h5>
        </form>
    </body>
</html>

