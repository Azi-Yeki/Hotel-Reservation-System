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
public class AdminServiceImpl implements AdminService{
    private AdminDao adminDao;

    public AdminServiceImpl(AdminDao adminDao) {
        this.adminDao = adminDao;
    }

    @Override
    public int addBooking(Reservation reservation) {
        return adminDao.addBooking(reservation);
    }

    @Override
    public boolean updateBooking(Reservation reservation) {
        return adminDao.updateBooking(reservation);
    }

    @Override
    public boolean cancelBooking(int reservationId) {
        return adminDao.cancelBooking(reservationId);
    }

    @Override
    public List<Reservation> getAllPastBookings() {
        return adminDao.getAllPastBookings();
    }

    @Override
    public Room getRoom(int roomId) {
        return adminDao.getRoom(roomId);
    }

    @Override
    public Guest getGuest(int guestId) {
        return adminDao.getGuest(guestId);
    }

    @Override
    public List<Reservation> getAllFutureBookings() {
        return adminDao.getAllFutureBookings();
    }
    
}
