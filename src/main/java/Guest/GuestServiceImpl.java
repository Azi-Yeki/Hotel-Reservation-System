package Guest;

import Exceptions.EmailExistsException;
import Exceptions.IncorrectLoginException;
import Guest.GuestService;
import Reservation.Reservation;
import Rooms.Room;
import java.util.List;
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
public class GuestServiceImpl implements GuestService {
    private GuestDao guestDao;

    public GuestServiceImpl(GuestDao guestDao) {
        this.guestDao = guestDao;
    }

    @Override
    public Guest login(String email, String password) throws IncorrectLoginException{
            return guestDao.login(email, password);
    }

    @Override
    public boolean addGuest(Guest guest) throws EmailExistsException {
        return guestDao.addGuest(guest);
    }  
}
