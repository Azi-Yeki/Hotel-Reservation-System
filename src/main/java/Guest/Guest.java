package Guest;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Admin
 */
@AllArgsConstructor@NoArgsConstructor@Getter@Setter
public class Guest {
    private int guestId;
    private String firstName;
    private String lastName;
    private String phoneNumber;
    private String email;
    private String password;

    public Guest(String firstName, String lastName, String phoneNumber, String email, String password) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.password = password;
    }
    
    public Guest(int guestId, String firstName, String lastName, String phoneNumber, String email) {
        this.guestId = guestId;
        this.firstName = firstName;
        this.lastName = lastName;
        this.phoneNumber = phoneNumber;
        this.email = email;
    }
    
}
