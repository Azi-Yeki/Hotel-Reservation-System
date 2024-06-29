/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Reservation;

import Guest.Guest;
import static Guest.GuestEmail.sendEmail;
import Rooms.Room;
import java.time.LocalDate;
import java.util.List;

/**
 *
 * @author Mrqts
 */
public class ReservationServiceImpl implements ReservationService{
    private ReservationDao reservationDao;

    public ReservationServiceImpl(ReservationDao reservationDao) {
        this.reservationDao = reservationDao;
    }

    @Override
    public List<Room> availableRooms(LocalDate checkIn, LocalDate checkOut, int occupancy_limit) {
         return reservationDao.availableRooms(checkIn, checkOut, occupancy_limit);
    }

    @Override
    public List<Reservation> getAllGuestPastBookings(Guest guest) {
        return reservationDao.getAllGuestPastBookings(guest);
    }

    @Override
    public List<Reservation> allBookings() {
        return reservationDao.allBookings();
    }

    @Override
    public int addBooking(Reservation reservation) {
        return reservationDao.addBooking(reservation);
    }

    @Override
    public boolean UpdateBooking(int reservationId, DiningPref diningPref, String specialRequests) {
        return reservationDao.UpdateBooking(reservationId, diningPref, specialRequests);
    }

    @Override
    public Room getRoom(int roomId) {
        return reservationDao.getRoom(roomId);
    }

    @Override
    public List<Room> availableSoon(LocalDate checkInDateSearch, LocalDate checkOutDateSearch, int numOfGuests) {
        return reservationDao.availableSoon(checkInDateSearch, checkOutDateSearch, numOfGuests);
    }


    @Override
    public List<Reservation> getAllGuestFutureBookings(Guest guest) {
        return reservationDao.getAllGuestFutureBookings(guest);
    }
    
}
