/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Reservation;

/**
 *
 * @author Mrqts
 */
import java.util.Collections;
import java.util.List;

public class ReservationManager {
    public void sortReservationsByCheckInDate(List<Reservation> reservations) {
        Collections.sort(reservations, new ReservationComparator());
    }
}

