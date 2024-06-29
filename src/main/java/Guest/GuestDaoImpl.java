package Guest;

import Exceptions.EmailExistsException;
import Exceptions.IncorrectLoginException;
import Reservation.DiningPref;
import Reservation.Reservation;
import Rooms.Room;
import Rooms.RoomType;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.mindrot.jbcrypt.BCrypt;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Admin
 */
public class GuestDaoImpl implements GuestDao {

    private final String URL = "jdbc:mysql://localhost:3306/hotelproject?useSSL=false";
    private final String USER = "root";
    private final String PASSWORD = "root";
    PreparedStatement ps = null;
    ResultSet rs = null;
    Connection con = null;
    private static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";

    public GuestDaoImpl() {
        try {
            Class.forName(JDBC_DRIVER);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(GuestDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            con = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (SQLException ex) {
            Logger.getLogger(GuestDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public boolean addGuest(Guest guest) throws EmailExistsException {
        try {
            ps = con.prepareStatement("select 1 from guests where email = ?");
            ps.setString(1, guest.getEmail());
            rs = ps.executeQuery();
            if (rs.next()) {
                throw new EmailExistsException("Email address is already in use.");
            }
            ps.close();
            
            ps = con.prepareStatement("insert into guests(first_name, last_name, phone_number, email, password) values(?,?,?,?,?)");
            ps.setString(1, guest.getFirstName());
            ps.setString(2, guest.getLastName());
            ps.setString(3, guest.getPhoneNumber());
            ps.setString(4, guest.getEmail());
            ps.setString(5, guest.getPassword());

            return ps.executeUpdate() == 1;

        } catch (SQLException ex) {
            Logger.getLogger(GuestDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public Guest login(String email, String password) throws IncorrectLoginException {

        try {
            ps = con.prepareStatement("Select * from guests where email=?");
            ps.setString(1, email);
            rs = ps.executeQuery();
            if (rs.next()) {
                String dbPassword=rs.getString("password");
               
                if (BCrypt.checkpw(password, dbPassword)) {
                    System.out.println("User found!");
                    return new Guest(rs.getInt("guest_id"), rs.getString("first_name"), rs.getString("last_name"), rs.getString("phone_number"), rs.getString("email"));
                }else{
              throw new IncorrectLoginException("Invalid email or password");

                }
            } else {
                System.out.println("User not found!");
                throw new IncorrectLoginException("Invalid email or password");
            }

        } catch (SQLException ex) {
            Logger.getLogger(GuestDaoImpl.class.getName()).log(Level.SEVERE, null, ex);

        }
        return null;
    }
}
