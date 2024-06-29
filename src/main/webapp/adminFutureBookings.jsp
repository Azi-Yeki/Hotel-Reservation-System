<%@page import="java.util.List"%>
<%@page import="Reservation.Reservation"%>
<%@page import="Guest.Guest"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Reservations</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 20px;
        }
        nav {
            background-color: #904220;
            color: white;
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
        h2 {
            text-align: center;
            color: #333;
        }
        .reservations-table {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            margin-top: 20px;
        }
        .reservations-table th, .reservations-table td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        .reservations-table th {
            background-color: #f2f2f2;
        }
        .reservations-table tbody tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        .reservations-table tbody tr:hover {
            background-color: #e9e9e9;
        }
        .edit-form {
            display: inline-block;
        }
        .add-reservation-link {
            display: block;
            text-align: center;
            margin-top: 20px;
        }
        footer {
            background-color: #904220;
            color: white;
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
        <h2>All Upcoming Reservations</h2>
        <% 
            List<Reservation> allFutureBookings = (List<Reservation>) request.getAttribute("allFutureBookings");
            if (allFutureBookings == null || allFutureBookings.isEmpty()) { %>
            <p>No upcoming reservations available</p>
        <% } else { %>

            <table class="reservations-table">
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
                        <th>ACTION</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Reservation reservation : allFutureBookings) { %>
                        <tr>
                            <td><%= reservation.getReservationId() %></td>
                            <td><%= reservation.getGuestId() %></td>
                            <td><%= reservation.getRoomId() %></td>
                            <td><%= reservation.getCheckIn() %></td>
                            <td><%= reservation.getCheckOut() %></td>
                            <td>R <%= reservation.getTotalPrice() %></td>
                            <td><%= reservation.getDiningPref() %></td>
                            <td><%= reservation.getSpecialRequests() %></td>
                            <td>
                                <form class="edit-form" action="AdminController" method="post">
                                    <input type="hidden" name="reservation-id" value="<%= reservation.getReservationId() %>">
                                    <input type="hidden" name="guest-id" value="<%= reservation.getGuestId()%>">
                                    <input type="hidden" name="room-id" value="<%= reservation.getRoomId()%>">
                                    <input type="hidden" name="check-in" value="<%= reservation.getCheckIn()%>">
                                    <input type="hidden" name="check-out" value="<%= reservation.getCheckOut()%>">
                                    <input type="hidden" name="total-price" value="<%= reservation.getTotalPrice()%>">
                                    <input type="hidden" name="dining-pref" value="<%= reservation.getDiningPref()%>">
                                    <input type="hidden" name="special-requests" value="<%= reservation.getSpecialRequests()%>">
                                    <input type="submit" name="submit" value="Edit">
                                </form>
                            </td>
                        </tr>
                    <% } %>   
                </tbody>
            </table>
        <% } %>
        <div class="add-reservation-link">
            <a href="adminHomePage.jsp">Click here to add a reservation</a>
        </div>
        <footer>
            © 2024 Luxury Leisure Hotel.
        </footer>
    </body>
</html>
