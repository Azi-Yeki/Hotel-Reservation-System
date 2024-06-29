/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Reservation;

import java.util.Comparator;

/**
 *
 * @author Mrqts
 */
public class ReservationComparator implements Comparator<Reservation>{

    @Override
    public int compare(Reservation o1, Reservation o2) {
        return o1.getCheckIn().compareTo(o2.getCheckIn());
    }
    
}
