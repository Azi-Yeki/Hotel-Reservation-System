/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Admin;

import static Email.ReservationEmail.reservationEmail;
import Guest.Guest;
import Reservation.*;
import Rooms.Room;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
@WebServlet(name = "AdminController", urlPatterns = {"/AdminController"})
public class AdminController extends HttpServlet {
    AdminService adminService = new AdminServiceImpl(new AdminDaoImpl());
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        switch (request.getParameter("action")) {
            case "upcoming" :
                List<Reservation> allFutureBookings = adminService.getAllFutureBookings();
                ReservationManager reservationManager = new ReservationManager();
                reservationManager.sortReservationsByCheckInDate(allFutureBookings);
                request.setAttribute("allFutureBookings", allFutureBookings);
                request.getRequestDispatcher("adminFutureBookings.jsp").forward(request, response);
                break;
            case "past" :
                List<Reservation> allPastBookings = adminService.getAllPastBookings();
                ReservationManager reservationManagerPast = new ReservationManager();
                reservationManagerPast.sortReservationsByCheckInDate(allPastBookings);
                request.setAttribute("allPastBookings", allPastBookings);
                request.getRequestDispatcher("adminPastBookings.jsp").forward(request, response);
                break;
        }
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        switch(request.getParameter("submit")) {
            
            case "Add Booking" :
                int guestId = Integer.parseInt(request.getParameter("guest-id"));
                int roomId = Integer.parseInt(request.getParameter("room-id"));
                LocalDate checkInDate = LocalDate.parse(request.getParameter("check-in"));
                LocalDate checkOutDate = LocalDate.parse(request.getParameter("check-out"));
                //int guests = Integer.parseInt(request.getParameter("guests"));
                long totalPrice = Long.parseLong(request.getParameter("total-price"));
                DiningPref diningPref = DiningPref.valueOf(request.getParameter("dining-pref"));
                String specialRequests = request.getParameter("special-requests");
                Reservation reservation = new Reservation(guestId, roomId, checkInDate, checkOutDate, totalPrice, diningPref, specialRequests);
                int reservationId = adminService.addBooking(reservation);
                Room room = adminService.getRoom(reservation.getRoomId());
                Guest guest = adminService.getGuest(guestId);
                reservationEmail(reservationId, reservation, guest, room);
                request.getRequestDispatcher("adminHomePage.jsp").forward(request, response);
                break;
            case "Edit" :
                int ReservationIdEdit = Integer.parseInt(request.getParameter("reservation-id"));
                int GuestIdEdit = Integer.parseInt(request.getParameter("guest-id"));
                int RoomIdEdit = Integer.parseInt(request.getParameter("room-id"));
                LocalDate checkInEdit = LocalDate.parse(request.getParameter("check-in"));
                LocalDate checkOutEdit= LocalDate.parse(request.getParameter("check-out"));
                long TotalPriceEdit = Long.parseLong(request.getParameter("total-price"));
                DiningPref diningPrefEdit = DiningPref.valueOf(request.getParameter("dining-pref"));
                String SpecialRequestsEdit = request.getParameter("special-requests");
                Reservation reservationEdit = new Reservation(ReservationIdEdit, GuestIdEdit, RoomIdEdit, checkInEdit, checkOutEdit, TotalPriceEdit, diningPrefEdit, SpecialRequestsEdit);
                request.setAttribute("reservation", reservationEdit);
                request.getRequestDispatcher("adminEditReservation.jsp").forward(request, response);
                break;
            case "Update Booking" :
                int ReservationIdUpdate = Integer.parseInt(request.getParameter("reservation-id"));
                int GuestIdUpdate = Integer.parseInt(request.getParameter("guest-id"));
                int RoomIdUpdate = Integer.parseInt(request.getParameter("room-id"));
                LocalDate checkInUpdate = LocalDate.parse(request.getParameter("check-in"));
                LocalDate checkOutUpdate= LocalDate.parse(request.getParameter("check-out"));
                long TotalPriceUpdate = Long.parseLong(request.getParameter("total-price"));
                DiningPref diningPrefUpdate = DiningPref.valueOf(request.getParameter("dining-pref"));
                String SpecialRequestsUpdate = request.getParameter("special-requests");
                adminService.updateBooking(new Reservation(ReservationIdUpdate, GuestIdUpdate, RoomIdUpdate, checkInUpdate, checkOutUpdate, TotalPriceUpdate, diningPrefUpdate, SpecialRequestsUpdate));
                List<Reservation> allFutureBookings = adminService.getAllFutureBookings();
                ReservationManager reservationManager = new ReservationManager();
                reservationManager.sortReservationsByCheckInDate(allFutureBookings);
                request.setAttribute("allFutureBookings", allFutureBookings);
                request.getRequestDispatcher("adminFutureBookings.jsp").forward(request, response);
                break;
            case "Delete" :
                int reservationIdDelete = Integer.parseInt(request.getParameter("reservation-id"));
                adminService.cancelBooking(reservationIdDelete);
                List<Reservation> allFutureBookingsUpdated = adminService.getAllFutureBookings();
                ReservationManager reservationManagerUpdated = new ReservationManager();
                reservationManagerUpdated.sortReservationsByCheckInDate(allFutureBookingsUpdated);
                request.setAttribute("allFutureBookings", allFutureBookingsUpdated);
                request.getRequestDispatcher("adminFutureBookings.jsp").forward(request, response);
                break;
        }
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
