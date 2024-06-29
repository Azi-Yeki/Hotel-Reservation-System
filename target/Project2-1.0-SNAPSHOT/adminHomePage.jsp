<%-- 
    Document   : adminHomePage
    Created on : 21 Jun 2024, 20:36:31
    Author     : Mrqts
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Bookings</title>
    <style>
        /* Reset and basic styling */
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
            color: #333;
        }
        /* Navigation Menu */
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
        /* Booking Form */
        #booking-form {
            background-color: #fff;
            max-width: 600px;
            margin: 20px auto;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        #booking-form label {
            display: block;
            margin-top: 10px;
            font-weight: bold;
        }
        #booking-form input[type="text"],
        #booking-form input[type="date"],
        #booking-form select,
        #booking-form textarea {
            width: calc(100% - 20px);
            padding: 10px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 16px;
        }
        #booking-form input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 5px;
            font-size: 16px;
        }
        #booking-form input[type="submit"]:hover {
            background-color: #45a049;
        }
        /* Footer */
        footer {
            background-color: #904220;
            color: #fff;
            text-align: center;
            padding: 1rem;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
    <body>
        <nav>
            <ul>
                <li><a href="adminHomePage.jsp">Add Booking</a></li>
                <li><a href="/Project2/AdminController?action=past">Booking History</a></li>
                <li><a href="/Project2/AdminController?action=upcoming">Upcoming Bookings</a></li>
            </ul>
        </nav>
        <form id="booking-form" method="post" action="AdminController">
            <label for="guest-id">Guest ID:</label>
            <input type="text" id="guest-id" name="guest-id" required>

            <label for="room-id">Room ID:</label>
            <input type="text" id="room-id" name="room-id" required>

            <label for="check-in">Check-In Date:</label>
            <input type="date" id="check-in" name="check-in" required>

            <label for="check-out">Check-Out Date:</label>
            <input type="date" id="check-out" name="check-out" required>

            <label for="total-price">Total Price:</label>
            <input type="text" id="total-price" name="total-price" required>

            <label for="dining-pref">Dining Preference:</label>
            <select id="dining-pref" name="dining-pref" required="">
                <option value="" disabled selected>Dining Preference</option>
                <option value="VEGAN">VEGAN</option>
                <option value="GLUTEN_FREE">GLUTEN-FREE</option>
                <option value="HALAAL">HALAAL</option>
                <option value="OTHER">OTHER</option>
            </select>

            <label for="special-requests">Special Requests:</label>
            <textarea id="special-requests" name="special-requests"></textarea>

            <input name="submit" type="submit" style="background-color: #904220; color: white" value="Add Booking">
        </form>
        <footer>
            © 2024 Luxury Leisure Hotel.
        </footer>
    </body>
</html>

