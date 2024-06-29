
<%@page import="Reservation.Reservation"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="Guest.Guest"%>
<%@ page session="false" %>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Reservations</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: white;
            margin: 0;
            padding: 20px;
            color: black;
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: black;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        table th, table td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        table th {
            background-color: whitesmoke;
        }
        table tbody tr:nth-child(even) {
            background-color: #904220;
        }
        table tbody tr:hover {
            background-color: whitesmoke;
        }
        .edit-form {
            display: inline-block;
        }
        .add-reservation-link {
            display: block;
            text-align: center;
            margin-top: 20px;
        }
        .navbar {
            background-color: #904220;
            padding: 10px 0;
            border-radius: 1px;
            width: 100%;
            height: 40px    
        }

        .navbar a {
            color: #fff;
            text-decoration: none;
            padding: 10px 15px;
            font-size: 18px;
        }

        .navbar a:hover {
            background-color: #7d391c;
        }
    </style>
</head>
    <body>
        <div class="navbar" style="a">
            <a href="homepage.html">HOME</a>
            <a href="viewRooms.jsp">VIEW ROOMS</a>
            <a href="chooseDates.html">ADD BOOKING</a>
            <a href="/Project2/ReservationController?action=past">VIEW BOOKING HISTORY</a>
            <a href="/Project2/ReservationController?action=upcoming">VIEW UPCOMING BOOKINGS</a>
        </div>
        <h2>Reservations History</h2>
        <% 
            Guest guest = (Guest) request.getSession(false).getAttribute("guest");
            List<Reservation> allPastGuestBookings = (List<Reservation>) request.getAttribute("allPastGuestBookings");
            if (allPastGuestBookings == null || allPastGuestBookings.isEmpty()) { %>
            <p>No reservations available</p>
        <% } else { %>

            <table>
                <thead>
                    <tr>
                        <th>RESERVATION ID</th>
                        <th>GUEST ID</th>
                        <th>ROOM ID</th>
                        <th>CHECK IN DATE</th>
                        <th>CHECK OUT DATE</th>
                        <th>TOTAL PRICE</th>
                        <th>DINING TYPE</th>
                        <th>SPECIAL REQUESTS</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Reservation reservation : allPastGuestBookings) { %>
                        <tr>
                            <td><%= reservation.getReservationId() %></td>
                            <td><%= reservation.getGuestId() %></td>
                            <td><%= reservation.getRoomId() %></td>
                            <td><%= reservation.getCheckIn() %></td>
                            <td><%= reservation.getCheckOut() %></td>
                            <td>R <%= reservation.getTotalPrice() %></td>
                            <td><%= reservation.getDiningPref() %></td>
                            <td><%= reservation.getSpecialRequests() %></td>
                        </tr>
                    <% } %>   
                </tbody>
            </table>
        <% } %>
        <a class="add-reservation-link" style="color: white" href="/Project2/ReservationController?command=checkAvailability">Click here to add a reservation</a>
    </body>
</html>
