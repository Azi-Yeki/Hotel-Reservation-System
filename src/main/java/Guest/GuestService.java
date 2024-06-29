/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Guest;

import Exceptions.EmailExistsException;
import Exceptions.IncorrectLoginException;

/**
 *
 * @author Admin
 */
public interface GuestService {
    boolean addGuest(Guest guest) throws EmailExistsException;
    Guest login(String email, String password) throws IncorrectLoginException; 
}
