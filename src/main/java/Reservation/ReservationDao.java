/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Reservation;

import Guest.Guest;
import Rooms.Room;
import java.time.LocalDate;
import java.util.List;

/**
 *
 * @author Mrqts
 */
public interface ReservationDao {
    List<Room> availableRooms(LocalDate checkIn, LocalDate checkOut, int occupancy_limit);
    public List<Reservation> getAllGuestPastBookings(Guest guest);
    public List<Reservation> getAllGuestFutureBookings(Guest guest);
    List<Reservation> allBookings();
    int addBooking(Reservation reservation);
    boolean UpdateBooking(int reservationId, DiningPref diningPref, String specialRequests);
    Room getRoom(int roomId);
    public List<Room> availableSoon(LocalDate checkInDateSearch, LocalDate checkOutDateSearch, int numOfGuests);
}
