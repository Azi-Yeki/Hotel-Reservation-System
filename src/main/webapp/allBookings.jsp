<%-- 
    Document   : allBookings
    Created on : 20 Jun 2024, 11:52:06
    Author     : Mrqts
--%>

<%@page import="java.util.List"%>
<%@page import="Reservation.Reservation"%>
<%@page import="Guest.Guest"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2>Your Reservations</h2>
        <% 
            List<Reservation> allReservations = (List<Reservation>)request.getAttribute("allReservationss");
            if (allReservations == null || allReservations.isEmpty()) { %>
            <p>No reservations available</p>
        <% } else { %>
        
            <table border="1">
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
                    
                    <% for(Reservation reservation:allReservations){ %>
                        <tr>
                            <td><%=reservation.getReservationId()%></td>
                            <td><%=reservation.getGuestId()%></td>
                            <td><%=reservation.getRoomId()%></td>
                            <td><%=reservation.getCheckIn()%></td>
                            <td><%=reservation.getCheckOut()%></td>
                            <td><%=reservation.getTotalPrice()%></td>
                            <td><%=reservation.getDiningPref()%></td>
                            <td><%=reservation.getSpecialRequests()%></td>
                            <td>
                                <form action="AdminController" method="post">
                                    <input type="hidden" name="reservations" value="<%=allReservations%>">
                                    <input type="submit" name="submit" value="Edit">
                                </form>
                            </td>
                        </tr>
                     <%}%>   
                    
                </tbody>
            </table>
        <% } %>
        <a href="/Project2/ReservationController?command=checkAvailability">Click here to add a reservation</a>
    </body>
</html>
