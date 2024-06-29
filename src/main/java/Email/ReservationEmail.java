/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Email;

import static Email.Invoice.generateInvoice;
import Guest.Guest;
import Rooms.Room;
import Reservation.Reservation;
import java.io.IOException;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import org.simplejavamail.api.email.Email;
import org.simplejavamail.api.mailer.Mailer;
import org.simplejavamail.api.mailer.config.TransportStrategy;
import org.simplejavamail.email.EmailBuilder;
import org.simplejavamail.mailer.MailerBuilder;

/**
 *
 * @author Mrqts
 */
public class ReservationEmail {
    public static void reservationEmail(int reservationId, Reservation reservation, Guest guest, Room room) throws IOException {
        String attachmentPath = generateInvoice(reservationId, reservation, guest, room);
        
        DataSource attachment = new FileDataSource(attachmentPath);
        Email email = EmailBuilder.startingBlank()
                .from("Luxury Leisure Hotel", "azyeki01@outlook.com")
                .to(guest.getEmail())
                .withSubject("Reservation Successful")
                .withPlainText("Dear " +guest.getFirstName()+",\n\nThank you for staying with us. Find your invoice attached.\n\nRegards,\nLuxury Leisure Hotel")
                .withAttachment("Invoice", attachment)
                .buildEmail();

        Mailer mailer = MailerBuilder
                .withSMTPServer("smtp.office365.com", 587, "azyeki01@outlook.com", "Lukhanyo1")
                .withTransportStrategy(TransportStrategy.SMTP_TLS)
                .buildMailer();

        mailer.sendMail(email);
        System.out.println("Email sent successfully to " + guest.getEmail());
    }
    
}
