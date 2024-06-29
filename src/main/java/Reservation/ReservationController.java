/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Reservation;

import Admin.PaymentProcessor;
import static Email.ReservationEmail.reservationEmail;
import Guest.Guest;
import Rooms.Room;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Mrqts
 */
@WebServlet(name = "ReservationController", urlPatterns = {"/ReservationController"})
public class ReservationController extends HttpServlet {
    ReservationService reservationService = new ReservationServiceImpl(new ReservationDaoImpl());

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        switch (request.getParameter("action")) {
            case "upcoming" :
                Guest guest = (Guest) request.getSession(false).getAttribute("guest");
                List<Reservation> allFutureGuestBookings = reservationService.getAllGuestFutureBookings(guest);
                ReservationManager reservationManager = new ReservationManager();
                reservationManager.sortReservationsByCheckInDate(allFutureGuestBookings);
                request.setAttribute("allFutureGuestBookings", allFutureGuestBookings);
                request.getRequestDispatcher("manageBookings.jsp").forward(request, response);
                break;
            case "past" :
                Guest guestPast = (Guest) request.getSession(false).getAttribute("guest");
                List<Reservation> allPastGuestBookings = reservationService.getAllGuestPastBookings(guestPast);
                ReservationManager reservationManagerPast = new ReservationManager();
                reservationManagerPast.sortReservationsByCheckInDate(allPastGuestBookings);
                request.setAttribute("allPastGuestBookings", allPastGuestBookings);
                request.getRequestDispatcher("pastBookings.jsp").forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        switch (request.getParameter("submit")) {
            case "searchAvailability" :
                LocalDate checkInDateSearch = LocalDate.parse(request.getParameter("check-in-date"));
                LocalDate checkOutDateSearch = LocalDate.parse(request.getParameter("check-out-date"));
                int numOfGuests = Integer.parseInt(request.getParameter("num-of-guests"));

                List<Room> availableRooms = reservationService.availableRooms(checkInDateSearch, checkOutDateSearch, numOfGuests);
                List<Room> availableSoon = reservationService.availableSoon(checkInDateSearch, checkOutDateSearch, numOfGuests);
                request.setAttribute("availableRooms", availableRooms);
                request.setAttribute("availableSoon", availableSoon);
                request.setAttribute("checkInDate", checkInDateSearch); // Store check-in date
                request.setAttribute("checkOutDate", checkOutDateSearch);
                request.setAttribute("numOfGuests", numOfGuests);
                request.getRequestDispatcher("availableRooms.jsp").forward(request, response);
                break;

            case "checkAvailability" :
                request.getRequestDispatcher("chooseDates.html").forward(request, response);
                break;

//            case "Upcoming Bookings" :
//                Guest guest = (Guest) request.getSession(false).getAttribute("guest");
//                List<Reservation> allFutureGuestBookings = reservationService.getAllGuestBookings(guest);
//                request.setAttribute("allFutureGuestBookings", allFutureGuestBookings);
//                request.getRequestDispatcher("manageBookings.jsp").forward(request, response);
//                break;

            case "selectRoom":
                LocalDate checkInDate = LocalDate.parse(request.getParameter("checkInDate"));
                LocalDate checkOutDate = LocalDate.parse(request.getParameter("checkOutDate"));
                String totalPriceParam = request.getParameter("price");
                long totalPrice = 0;

                if (totalPriceParam != null && !totalPriceParam.isEmpty()) {
                    try {
                        totalPrice = Long.parseLong(totalPriceParam);
                    } catch (NumberFormatException e) {
                        e.printStackTrace();    
                    }
                }

                long daysBetween = ChronoUnit.DAYS.between(checkInDate, checkOutDate);
                long pricePerNight = totalPrice; // Assuming totalPrice is correctly parsed
                long totalPriceForStay = pricePerNight * daysBetween;
                int roomId = Integer.parseInt(request.getParameter("roomId"));

                request.setAttribute("checkInDate", checkInDate);
                request.setAttribute("checkOutDate", checkOutDate);
                request.setAttribute("totalPrice", totalPriceForStay);
                request.setAttribute("roomId", roomId);
                request.getRequestDispatcher("addBooking.jsp").forward(request, response);
                break;


            case "addBooking" :
                DiningPref diningPref2 = DiningPref.valueOf(request.getParameter("diningPreference"));
                System.out.println("Enum value: "+diningPref2);
                String specialRequests = request.getParameter("special-requests");
                if (specialRequests == null) {
                    specialRequests = "none";
                }

                request.setAttribute("diningPref2", diningPref2);
                request.setAttribute("specialRequests", specialRequests);

                LocalDate checkInDate2 = LocalDate.parse(request.getParameter("checkInDate"));
                LocalDate checkOutDate2 = LocalDate.parse(request.getParameter("checkOutDate"));
                String totalPriceParam2 = request.getParameter("totalPrice");
                long totalPrice2 = 0;

                if (totalPriceParam2 != null && !totalPriceParam2.isEmpty()) {
                    totalPrice2 = Long.parseLong(totalPriceParam2);
                }

                int roomId2 = Integer.parseInt(request.getParameter("roomId"));
                request.setAttribute("checkInDate", checkInDate2);
                request.setAttribute("checkOutDate", checkOutDate2);
                request.setAttribute("totalPrice", totalPrice2);
                request.setAttribute("roomId", roomId2);
                Reservation reserve = new Reservation(roomId2, checkInDate2, checkOutDate2, totalPrice2, diningPref2, specialRequests);
                request.setAttribute("reserve", reserve);
                request.getRequestDispatcher("payment.jsp").forward(request, response);
                
                break;

            case "Make payment" :
                Guest guestPay = (Guest) request.getSession(false).getAttribute("guest");
                LocalDate checkInDatePay = LocalDate.parse(request.getParameter("checkInDate"));
                LocalDate checkOutDatePay = LocalDate.parse(request.getParameter("checkOutDate"));
                String totalPriceParamPay = request.getParameter("totalPrice");
                long totalPricePay = 0;

                if (totalPriceParamPay != null && !totalPriceParamPay.isEmpty()) {
                    totalPricePay = Long.parseLong(totalPriceParamPay);
                }
                
                int roomIdPay = Integer.parseInt(request.getParameter("roomId"));
                long totalPriceToPay = Long.parseLong(request.getParameter("totalPrice"));
                DiningPref diningPrefPay;
                try {
                    diningPrefPay = DiningPref.valueOf(request.getParameter("diningPref").toLowerCase());
                } catch (IllegalArgumentException e) {
                    diningPrefPay = DiningPref.OTHER;
                }
                
                String specialRequestsPay = request.getParameter("specialRequests");
                String cardNumber = request.getParameter("cardNumber");
                String expiryDate = request.getParameter("expiry-date");
                String csvNumber = request.getParameter("csv");
                String expiryMonth = request.getParameter("expiry-month");
                PaymentProcessor payment = new PaymentProcessor();
                
                if (cardNumber.isEmpty() || expiryDate.isEmpty() || csvNumber.isEmpty() || expiryMonth.isEmpty()) {
                    payment.failedPayment();
                    request.setAttribute("message", payment.failedPayment());
                    request.getRequestDispatcher("payment.jsp").forward(request, response);
                } else {
                    payment.processPayment();
                    Reservation reservation = new Reservation(guestPay.getGuestId(), roomIdPay, checkInDatePay, checkOutDatePay, totalPriceToPay, diningPrefPay, specialRequestsPay);
                    int reservationId = reservationService.addBooking(reservation);
                    Room room = reservationService.getRoom(reservation.getRoomId());
                    reservationEmail(reservationId, reservation, guestPay, room);
                    Guest guest = (Guest) request.getSession(false).getAttribute("guest");
                    List<Reservation> allFutureGuestBookings = reservationService.getAllGuestFutureBookings(guest);
                    ReservationManager reservationManager = new ReservationManager();
                    reservationManager.sortReservationsByCheckInDate(allFutureGuestBookings);
                    request.setAttribute("allFutureGuestBookings", allFutureGuestBookings);
                    request.getRequestDispatcher("manageBookings.jsp").forward(request, response);
                }
                break;
            case "Edit" :
                DiningPref diningPrefEdit = DiningPref.valueOf(request.getParameter("dining-pref"));
                String specialRequestsEdit = request.getParameter("special-requests");
                int reservationIdEdit = Integer.parseInt(request.getParameter("reservation-id"));
                request.setAttribute("diningPref", diningPrefEdit);
                request.setAttribute("specialRequests", specialRequestsEdit);
                request.setAttribute("reservationId", reservationIdEdit);
                request.getRequestDispatcher("editReservation.jsp").forward(request, response);
            case "Update Booking" :
                DiningPref diningPrefUpdate = DiningPref.valueOf(request.getParameter("dining-pref"));
                String specialRequestsUpdate = request.getParameter("special-requests");
                int reservationIdUpdate = Integer.parseInt(request.getParameter("reservation-id")); 
                reservationService.UpdateBooking(reservationIdUpdate, diningPrefUpdate, specialRequestsUpdate);
                Guest guest = (Guest) request.getSession(false).getAttribute("guest");
                List<Reservation> allFutureGuestBookings = reservationService.getAllGuestFutureBookings(guest);
                request.setAttribute("allFutureGuestBookings", allFutureGuestBookings);
                request.getRequestDispatcher("manageBookings.jsp").forward(request, response);
                break;
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

