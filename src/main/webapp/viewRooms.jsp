<%@page import="Guest.Guest"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Rooms</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            color: black
        }
        .room-details {
            padding: 20px;
        }
        .room-image img {
            width: 60%;
            border-radius: 8px;
        }
        .room-details h3 {
            margin-top: 0;
        }
        .room-details p {
            margin-bottom: 10px;
        }
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
    <body style="background-color: white;">
        <% 
            Guest guest= (Guest) request.getSession(false).getAttribute("guest");
            if (guest != null) {
        %>
        <div class="navbar" style="a">
            <a href="homepage.html">HOME</a>
            <a href="viewRooms.jsp">VIEW ROOMS</a>
            <a href="chooseDates.html">ADD BOOKING</a>
            <a href="/Project2/ReservationController?action=past">VIEW BOOKING HISTORY</a>
            <a href="/Project2/ReservationController?action=upcoming">VIEW UPCOMING BOOKINGS</a>
        </div>
        <%} else if (guest == null) { %>
        <div class="navbar" style="a">
            <a href="index.jsp">HOME</a>
        </div>
        <%}%>
        <div class="container mt-4">
            <div class="row">
                <div class="col-md-6 mb-4">
                    <div class="room-image">
                        <img src="https://i.pinimg.com/474x/7f/36/34/7f36345fa22d4dc74399855820021b0b.jpg" alt="Room 1">
                    </div>
                </div>
                <div class="col-md-6 mb-4">
                    <div class="room-details">
                        <h3>Luxury Suite</h3>
                        <p>Luxury Suite | King bed, Butler, WiFi.</p>
                        <p>Price from R4100 per night</p>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6 mb-4">
                    <div class="room-image">
                        <img src="https://i.pinimg.com/474x/46/f5/13/46f51372f29add02c79505afcb2da7e0.jpg" alt="Room 2">
                    </div>
                </div>
                <div class="col-md-6 mb-4">
                    <div class="room-details">
                        <h3>Villa Luxury Suite</h3>
                        <p>Villa Luxury Suite | King bed, Butler, WiFi.</p>
                        <p>Price from R5000 per night</p>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6 mb-4">
                    <div class="room-image">
                        <img src="https://i.pinimg.com/474x/d3/91/f0/d391f03cb8389a2fa525547faaa08b09.jpg" alt="Room 3">
                    </div>
                </div>
                <div class="col-md-6 mb-4">
                    <div class="room-details">
                        <h3>Presidential Suite</h3>
                        <p>Presidential Suite | King bed, Butler, WiFi.</p>
                        <p>Price from R6300 per night</p>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6 mb-4">
                    <div class="room-image">
                        <img src="https://i.pinimg.com/564x/1e/0e/f9/1e0ef9acd2f094ec42fdc6aec3b854a0.jpg" alt="Room 4">
                    </div>
                </div>
                <div class="col-md-6 mb-4">
                    <div class="room-details">
                        <<h3>Villa Presidential Suite</h3>
                        <p>Villa Presidential Suite | King bed, Butler, WiFi.</p>
                        <p>Price from R8000 per night</p>
                        
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS and dependencies (optional) -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-hW85o7IjP0S/Oi0Q79jg3Lr4cSbPs6LIAG43Nzna7Bb/sMVcVW9mPQfJFcLzP1NC" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-FlpUJ9pq6Q5m0JxGn6BuhFv7ApeFCz5Z6pVmAgDRlYk3fRTodUVCA6KJd5AVPyn" crossorigin="anonymous"></script>
    </body>
</html>
