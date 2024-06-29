/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Admin;

import Exceptions.GuestNotFoundException;
import Exceptions.RoomNotFoundException;
import Guest.Guest;
import Guest.GuestDaoImpl;
import Reservation.DiningPref;
import Reservation.Reservation;
import Reservation.ReservationDaoImpl;
import Rooms.Room;
import Rooms.RoomType;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger; 

/**
 *
 * @author Admin
 */
public class AdminDaoImpl implements AdminDao{
    private final String URL = "jdbc:mysql://localhost:3306/hotelproject?useSSL=false";
    private final String USER = "root";
    private final String PASSWORD = "root";
    PreparedStatement ps = null;
    ResultSet rs = null;
    Connection con = null;
    private static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
    
    public AdminDaoImpl() {
        try {
            Class.forName(JDBC_DRIVER);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AdminDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            con = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (SQLException ex) {
            Logger.getLogger(AdminDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    @Override
    public int addBooking(Reservation reservation) {
        try {
            ps = con.prepareStatement("Insert into reservations(guest_id, room_id, check_in_date, check_out_date, total_price, dining_pref, special_requests) values(?,?,?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
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
            Logger.getLogger(AdminDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    @Override
    public boolean updateBooking(Reservation reservation) {
        try {
            ps = con.prepareStatement("Update reservations set room_id = ?, check_in_date = ?, check_out_date = ?, total_price = ?, dining_pref = ?, special_requests = ? where reservation_id = ?");
            Date checkIn = Date.valueOf(reservation.getCheckIn());
            Date checkOut = Date.valueOf(reservation.getCheckOut());
            ps.setInt(1, reservation.getRoomId());
            ps.setDate(2, checkIn);
            ps.setDate(3, checkOut);
            ps.setLong(4, reservation.getTotalPrice());
            ps.setString(5, reservation.getDiningPref().toString());
            ps.setString(6, reservation.getSpecialRequests());
            ps.setInt(7, reservation.getReservationId());
            
            
            return ps.executeUpdate() ==1;
        } catch (SQLException ex) {
            Logger.getLogger(AdminDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public boolean cancelBooking(int reservationId) {
        try {
            ps = con.prepareStatement("delete from reservations where reservation_id=?");
            ps.setInt(1, reservationId);
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(AdminDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public List<Reservation> getAllPastBookings() {
        List<Reservation> reservations = new ArrayList<>();
        try {
            ps = con.prepareStatement("select * from reservations where check_out_date < NOW()");
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
            }
        } catch (SQLException ex) {
            Logger.getLogger(GuestDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return reservations;
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
    public Guest getGuest(int guestId) {
        try {
            ps = con.prepareStatement("select * from guests where guest_id = ?");
            ps.setInt(1, guestId);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Guest(rs.getInt("guest_id"), rs.getString("first_name"), rs.getString("last_name"), rs.getString("phone_number"), rs.getString("email"), rs.getString("password"));
            } else {
                throw new GuestNotFoundException("Room not found.");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ReservationDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        } catch (GuestNotFoundException ex) {
            System.out.println(ex.getMessage());
        }
        return null;
    }

    @Override
    public List<Reservation> getAllFutureBookings() {
        List<Reservation> reservations = new ArrayList<>();
        try {
            ps = con.prepareStatement("select * from reservations where check_out_date > NOW()");
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
            }
        } catch (SQLException ex) {
            Logger.getLogger(GuestDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return reservations;
    }
    
}
