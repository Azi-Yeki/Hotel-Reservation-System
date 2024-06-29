package Reservation;

import java.time.LocalDate;
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
@AllArgsConstructor@NoArgsConstructor@Setter@Getter
public class Reservation {
    private int reservationId;
    private int guestId;
    private int roomId;
    private LocalDate checkIn;
    private LocalDate checkOut;
    private long totalPrice;
    private DiningPref diningPref;
    private String specialRequests;

    public Reservation(int guestId, int roomId, LocalDate checkIn, LocalDate checkOut, long totalPrice, DiningPref diningPref, String specialRequests) {
        this.guestId = guestId;
        this.roomId = roomId;
        this.checkIn = checkIn;
        this.checkOut = checkOut;
        this.totalPrice = totalPrice;
        this.diningPref = diningPref;
        this.specialRequests = specialRequests;
    }

    public Reservation(LocalDate checkIn, LocalDate checkOut, long totalPrice, DiningPref diningPref, String specialRequests) {
        this.checkIn = checkIn;
        this.checkOut = checkOut;
        this.totalPrice = totalPrice;
        this.diningPref = diningPref;
        this.specialRequests = specialRequests;
    }

    public Reservation(int guestId, LocalDate checkIn, LocalDate checkOut, long totalPrice, DiningPref diningPref, String specialRequests) {
        this.guestId = guestId;
        this.checkIn = checkIn;
        this.checkOut = checkOut;
        this.totalPrice = totalPrice;
        this.diningPref = diningPref;
        this.specialRequests = specialRequests;
    }

    @Override
    public String toString() {
        return "Reservation{" + "reservationId=" + reservationId + ", guestId=" + guestId + ", roomId=" + roomId + ", checkIn=" + checkIn + ", checkOut=" + checkOut + ", totalPrice=" + totalPrice + ", diningPref=" + diningPref + ", specialRequests=" + specialRequests + '}';
    }
    
    
}
