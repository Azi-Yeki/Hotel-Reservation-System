package Guest;

import Exceptions.EmailExistsException;
import Exceptions.IncorrectLoginException;
import Reservation.Reservation;
import Rooms.Room;
import java.util.List;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Admin
 */
public interface GuestDao {
    boolean addGuest(Guest guest) throws EmailExistsException;
    Guest login(String email, String password) throws IncorrectLoginException; 
}
