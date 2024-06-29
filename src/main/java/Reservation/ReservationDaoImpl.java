/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Reservation;

import Exceptions.RoomNotFoundException;
import Guest.Guest;
import Guest.GuestDaoImpl;
import Rooms.Room;
import Rooms.RoomType;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Mrqts
 */
public class ReservationDaoImpl implements ReservationDao{
    private final String URL = "jdbc:mysql://localhost:3306/hotelproject?useSSL=false";
    private final String USER = "root";
    private final String PASSWORD = "root";
    PreparedStatement ps = null;
    ResultSet rs = null;
    Connection con = null;
    private static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
    
    public ReservationDaoImpl() {
        try {
            Class.forName(JDBC_DRIVER);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ReservationDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            con = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (SQLException ex) {
            Logger.getLogger(ReservationDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public List<Room> availableRooms(LocalDate checkIn, LocalDate checkOut, int guestsCount) {
        List<Room> availableRooms = new ArrayList<>();
        try {
            Date checkInDate = Date.valueOf(checkIn);
            Date checkOutDate = Date.valueOf(checkOut);

            ps = con.prepareStatement("SELECT r.* " +
                 "FROM rooms r " +
                 "WHERE r.room_id NOT IN (" +
                 "    SELECT res.room_id " +
                 "    FROM reservations res " +
                 "    WHERE (res.check_out_date > ? AND res.check_in_date < ?) " +
                 "       OR (res.check_in_date < ? AND res.check_out_date > ?) " +
                 "       OR (res.check_in_date >= ? AND res.check_out_date <= ?) " +
                 ") " +
                 "AND r.occupancy_limit >= ?");

            ps.setDate(1, checkInDate);
            ps.setDate(2, checkOutDate);
            ps.setDate(3, checkInDate);
            ps.setDate(4, checkOutDate);
            ps.setDate(5, checkInDate);
            ps.setDate(6, checkOutDate);
            ps.setInt(7, guestsCount);
            
            rs = ps.executeQuery();

            while (rs.next()) {
                Room room = new Room();
                room.setRoomId(rs.getInt("room_id"));
                room.setRoomType(RoomType.valueOf(rs.getString("room_type")));
                room.setPicture(rs.getString("picture"));
                room.setDetails(rs.getString("details"));
                room.setRoomPrice(rs.getLong("price"));
                room.setOccupancyLimit(rs.getInt("occupancy_limit"));
                availableRooms.add(room);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(GuestDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println(availableRooms);
        return availableRooms;
    }
    
    @Override
    public List<Room> availableSoon(LocalDate checkIn, LocalDate checkOut, int guestsCount) {
        List<Room> availableSoon = new ArrayList<>();
        try {
            
            Date checkOutDate = Date.valueOf(checkOut);
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(checkOutDate);
            calendar.add(Calendar.DAY_OF_YEAR, 7);
            Date checkInDateAfter = new Date(calendar.getTimeInMillis());

            ps = con.prepareStatement("SELECT r.* " +
                         "FROM rooms r " +
                         "LEFT JOIN reservations res ON r.room_id = res.room_id " +
                         "WHERE res.room_id IS NULL " +
                         "  AND r.occupancy_limit >= ? " +
                         "  AND r.room_id NOT IN (" +
                         "      SELECT rb.room_id " +
                         "      FROM reservations rb " +
                         "      WHERE rb.check_in_date <= ? " +
                         "        AND rb.check_out_date >= ?" +
                         "  )");
            ps.setInt(1, guestsCount);
            ps.setDate(2, checkInDateAfter);
            ps.setDate(3, checkOutDate);

            rs = ps.executeQuery();

            while (rs.next()) {
                // Retrieve room details and add to a list or process as needed
                Room room = new Room();
                room.setRoomId(rs.getInt("room_id"));
                room.setRoomType(RoomType.valueOf(rs.getString("room_type")));
                room.setPicture(rs.getString("picture"));
                room.setDetails(rs.getString("details"));
                room.setRoomPrice(rs.getLong("price"));
                room.setOccupancyLimit(rs.getInt("occupancy_limit"));
                availableSoon.add(room);
            }

            // Close resources (ResultSet, PreparedStatement) in a finally block

        } catch (SQLException ex) {
            // Handle SQL exceptions
            ex.printStackTrace();
        }

        return availableSoon;
    }

    @Override
    public List<Reservation> getAllGuestPastBookings(Guest guest) {
        List<Reservation> reservations = new ArrayList<>();
        try {
            ps = con.prepareStatement("select * from reservations where guest_id=? and check_out_date < NOW()");
            ps.setInt(1, guest.getGuestId());
            rs = ps.executeQuery();
            
            while (rs.next()) {
                Reservation reservation = new Reservation();
                reservation.setReservationId(rs.getInt("reservation_id"));
                reservation.setGuestId(rs.getInt("guest_id"));
                reservation.setRoomId(rs.getInt("room_id"));
                reservation.setCheckIn(rs.getDate("check_in_date").toLocalDate());
                reservation.setCheckOut(rs.getDate("check_out_date").toLocalDate());
                reservation.setTotalPrice(rs.getLong("total_price"));
                reservation.setDiningPref(DiningPref.valueOf(rs.getString("dining_pref")));
                reservation.setSpecialRequests(rs.getString("special_requests"));
               
                reservations.add(reservation);
                System.out.println("Your reservation: "+reservation);
                
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            ex.printStackTrace();
        }
        return reservations;
    }

    @Override
    public List<Reservation> allBookings() {
        List<Reservation> allBookings = new ArrayList<>();
        try {
            ps = con.prepareStatement("select * from reservations");
            rs = ps.executeQuery();
            
            while (rs.next()) {
                Reservation reservation = new Reservation();
                reservation.setReservationId(rs.getInt("reservation_id"));
                reservation.setGuestId(rs.getInt("guest_id"));
                reservation.setRoomId(rs.getInt("room_id"));
                reservation.setCheckIn(rs.getDate("check_in_date").toLocalDate());
                reservation.setCheckOut(rs.getDate("check_out_date").toLocalDate());
                reservation.setTotalPrice(rs.getLong("total_price"));
                reservation.setDiningPref(DiningPref.valueOf(rs.getString("dining_pref")));
                reservation.setSpecialRequests(rs.getString("special_requests"));
                
                allBookings.add(reservation);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ReservationDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return allBookings;
    }

    @Override
    public int addBooking(Reservation reservation) {
        try {
            ps = con.prepareStatement("Insert into reservations(guest_id, room_id, check_in_date, check_out_date, total_price, dining_pref, special_requests) values(?,?,?,?,?,?,?)");
            Date checkIn = Date.valueOf(reservation.getCheckIn());
            Date checkOut = Date.valueOf(reservation.getCheckOut());
            ps.setInt(1, reservation.getGuestId());
            ps.setInt(2, reservation.getRoomId());
            ps.setDate(3, checkIn);
            ps.setDate(4, checkOut);
            ps.setLong(5, reservation.getTotalPrice());
            ps.setString(6, reservation.getDiningPref().toString());
            ps.setString(7, reservation.getSpecialRequests());
            
            if (ps.executeUpdate() == 1) {
                ResultSet reservationId = ps.getGeneratedKeys();
                if (reservationId.next()) {
                    return reservationId.getInt(1);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(ReservationDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    @Override
    public boolean UpdateBooking(int reservationId, DiningPref diningPref, String specialRequests) {
        try {
            ps = con.prepareStatement("Update reservations set dining_pref = ?, special_requests = ? where reservation_id = ?");
            ps.setString(1, diningPref.toString());
            ps.setString(2, specialRequests);
            ps.setInt(3, reservationId);
            
            return ps.executeUpdate() ==1;
        } catch (SQLException ex) {
            Logger.getLogger(ReservationDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public Room getRoom(int roomId) {
        try {
            ps = con.prepareStatement("select * from rooms where room_id = ?");
            ps.setInt(1, roomId);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Room(rs.getInt("room_id"), RoomType.valueOf(rs.getString("room_type")), rs.getString("picture"), rs.getString("details"), rs.getLong("price"), rs.getInt("occupancy_limit"));
            } else {
                throw new RoomNotFoundException("Room not found.");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ReservationDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        } catch (RoomNotFoundException ex) {
            System.out.println(ex.getMessage());
        }
        return null;
    }
    
    @Override
    public List<Reservation> getAllGuestFutureBookings(Guest guest) {
        List<Reservation> reservations = new ArrayList<>();
        try {
            ps = con.prepareStatement("select * from reservations where guest_id=? and check_in_date > NOW()");
            ps.setInt(1, guest.getGuestId());
            rs = ps.executeQuery();
            
            while (rs.next()) {
                Reservation reservation = new Reservation();
                reservation.setReservationId(rs.getInt("reservation_id"));
                reservation.setGuestId(rs.getInt("guest_id"));
                reservation.setRoomId(rs.getInt("room_id"));
                reservation.setCheckIn(rs.getDate("check_in_date").toLocalDate());
                reservation.setCheckOut(rs.getDate("check_out_date").toLocalDate());
                reservation.setTotalPrice(rs.getLong("total_price"));
                reservation.setDiningPref(DiningPref.valueOf(rs.getString("dining_pref")));
                reservation.setSpecialRequests(rs.getString("special_requests"));
               
                reservations.add(reservation);
                System.out.println("Your reservation: "+reservation);
                
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            ex.printStackTrace();
        }
        return reservations;
    }
    
}




