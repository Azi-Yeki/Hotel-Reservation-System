<%-- 
    Document   : availableRooms
    Created on : 15 Jun 2024, 20:51:48
    Author     : Mrqts
--%>

<%@page import="java.time.LocalDate"%>
<%@page import="java.util.List"%>
<%@page import="Rooms.Room"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="stylesheet.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <title>JSP Page</title>
        <style>
            .navbar {
                    background-color: #904220;
                    padding: 10px 0;
                    border-radius: 1px;
                    width: 100%
                }

                .navbar a {
                    color: #fff;
                    text-decoration: none;
                    padding: 10px 15px;
                    font-size: 18px;
                }

                .navbar a:hover {
                    background-color: #555;
                }
        </style>
    </head>
    <body style="background-color: white">
        <div class="navbar" style="a">
            <a href="homepage.html">HOME</a>
            <a href="viewRooms.jsp">VIEW ROOMS</a>
            <a href="chooseDates.html">ADD BOOKING</a>
            <a href="/Project2/ReservationController?action=past">VIEW BOOKING HISTORY</a>
            <a href="/Project2/ReservationController?action=upcoming">VIEW UPCOMING BOOKINGS</a>
        </div>
            <% 
            List<Room> availableRooms = (List<Room>) request.getAttribute("availableRooms");
            List<Room> availableSoon = (List<Room>) request.getAttribute("availableSoon");
            LocalDate checkInDate = (LocalDate) request.getAttribute("checkInDate");
            LocalDate checkOutDate = (LocalDate) request.getAttribute("checkOutDate");
            int numOfGuests = (Integer) request.getAttribute("numOfGuests");
//            if (availableRooms != null && !availableRooms.isEmpty()) {
//                for (Room room : availableRooms) { 
            %>
            <div class="container" style="background-image: none; color: black">
            <% if (availableRooms != null && !availableRooms.isEmpty()) { %>
                <h2 style="color: white">Available Rooms from <%=checkInDate%> to <%=checkOutDate%></h2>
                <br>
                <% for (Room room : availableRooms) { %>
                    <div class="row" style="margin-bottom: 50px;">
                        <div class="col-md-4">
                            <img src="<%= room.getPicture() %>" style="height: 300px; width: 100%;" alt="<%= room.getRoomType() %> Image">
                        </div>
                        <div class="col-md-8" style="margin-top: 30px; color: black">
                            <h3><%= room.getRoomType() %></h3>
                            <p><strong>Details:</strong> <%= room.getDetails() %></p>
                            <p><strong>Price:</strong> R<%= room.getRoomPrice() %></p>
                            <form method="post" action="ReservationController">
                                <input type="hidden" name="roomId" value="<%= room.getRoomId() %>">
                                <input type="hidden" name="checkInDate" value="<%= checkInDate %>">
                                <input type="hidden" name="checkOutDate" value="<%= checkOutDate %>">
                                <input type="hidden" name="price" value="<%= room.getRoomPrice() %>">
                                <input type="hidden" name="num-of-guests" value="<%= room.getOccupancyLimit() %>">
                                <button type="submit" name="submit" value="selectRoom" class="btn btn-primary" style="background-color: #904220; color: black">Select Room</button>
                            </form>
                        </div>
                    </div>
                <% } %>
            <% } else if (availableSoon != null && !availableSoon.isEmpty()) { %>
                <h2>Rooms Available Soon</h2>
                <% for (Room room : availableSoon) { %>
                    <div class="row" style="margin-bottom: 50px;">
                        <div class="col-md-4">
                            <img src="<%= room.getPicture() %>" style="height: 300px; width: 100%;" alt="<%= room.getRoomType() %> Image">
                        </div>
                        <div class="col-md-8">
                            <h3><%= room.getRoomType() %></h3>
                            <p><strong>Details:</strong> <%= room.getDetails() %></p>
                            <p><strong>Price:</strong> R<%= room.getRoomPrice() %></p>
                        </div>
                    </div>
                <% } %>
            <% } else { %>
                <p>No rooms available. Contact us</p>
            <% } %>
        </div>
    </body>
</html>
