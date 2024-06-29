/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Admin;

import Guest.Guest;
import Reservation.Reservation;
import Rooms.Room;
import java.util.List;

/**
 *
 * @author Admin
 */
public interface AdminService {
    int addBooking(Reservation reservation);
    boolean updateBooking(Reservation reservation);
    boolean cancelBooking(int reservationId);
    public List<Reservation> getAllPastBookings();
    public List<Reservation> getAllFutureBookings();
    Room getRoom(int roomId);
    Guest getGuest(int guestId);
}
