package Email;

import Guest.Guest;
import Reservation.Reservation;
import Rooms.Room;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.time.LocalDate;

public class Invoice {
    
    public static String generateInvoice(int reservationId, Reservation reservation, Guest guest, Room room) throws IOException{
        String invoiceContent = generateInvoiceContent(reservationId, reservation, guest, room);
        
        String filePath = "C:\\Users\\Mrqts\\Desktop\\invoice"+reservationId+".txt";
        
        try(BufferedWriter bw = new BufferedWriter(new FileWriter(filePath))){
            bw.write(invoiceContent);
            System.out.println("File written succefully");
        }
        return filePath;
    }
    
    private static String generateInvoiceContent(int reservationId, Reservation reservation, Guest guest, Room room){
        StringBuilder content = new StringBuilder();
        
        content.append("LUXURY LEISURE HOTEL\n\n");
        content.append("Invoice ID: \t\t").append(reservationId).append("\n");
        content.append("Date: \t\t\t").append(LocalDate.now()).append("\n");
        content.append("Amount Paid: \t\tR").append(reservation.getTotalPrice()).append("\n");
        content.append("Account Holder: \t").append(guest.getFirstName()).append(" ").append(guest.getLastName()).append("\n");
        content.append("Email: \t\t\t").append(guest.getEmail());
        
        content.append("\n\n");
        content.append("Reservation Details: \n");
        content.append("Room Details: \t\t").append(room.getDetails()).append("\n");
        content.append("Duration of stay: \t").append(reservation.getCheckIn()).append(" - ").append(reservation.getCheckOut());
        content.append("\n\n");
        content.append("Log onto the website to manage your booking.");
        return content.toString();
    }
}




