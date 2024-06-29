/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Guest;
import org.simplejavamail.api.email.Email;
import org.simplejavamail.email.EmailBuilder;
import org.simplejavamail.api.mailer.Mailer;
import org.simplejavamail.api.mailer.config.TransportStrategy;
import org.simplejavamail.mailer.MailerBuilder;
/**
 *
 * @author Mrqts
 */
public class GuestEmail {
    public static void sendEmail(String toEmail) {
        Email email = EmailBuilder.startingBlank()
                .from("Luxury Leisure Hotel", "azyeki01@outlook.com")
                .to(toEmail)
                .withSubject("Registration Successful")
                .withPlainText("Dear User,\n\nThank you for registering with us.\n\nRegards,\nLuxury Leisure Hotel")
                .buildEmail();

        Mailer mailer = MailerBuilder
                .withSMTPServer("smtp.office365.com", 587, "azyeki01@outlook.com", "Lukhanyo1")
                .withTransportStrategy(TransportStrategy.SMTP_TLS)
                .buildMailer();

        mailer.sendMail(email);
        System.out.println("Email sent successfully to " + toEmail);
    }

}
