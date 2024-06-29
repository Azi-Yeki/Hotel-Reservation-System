/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Guest;

import Admin.AdminDaoImpl;
import Admin.AdminService;
import Admin.AdminServiceImpl;
import Exceptions.EmailExistsException;
import Exceptions.IncorrectLoginException;
import static Guest.GuestEmail.sendEmail;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.mindrot.jbcrypt.BCrypt;

/**
 *
 * @author Mrqts
 */
@WebServlet(name = "GuestController", urlPatterns = {"/GuestController"})
public class GuestController extends HttpServlet {
    GuestService guestService = new GuestServiceImpl(new GuestDaoImpl());
    AdminService adminService = new AdminServiceImpl(new AdminDaoImpl());

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        List<Reservation> allReservations = adminService.getAllBookings();
//        request.setAttribute("allReservations", allReservations);
//        request.getRequestDispatcher("adminPage.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        switch (request.getParameter("submit")) {
            case "Login" :
                try {
                    String email = request.getParameter("email").toLowerCase().trim();
                    String password = request.getParameter("password").trim();
                    Guest guest = guestService.login(email, password);
                    
                    HttpSession session = request.getSession(true);
                    session.setAttribute("guest", guest);
                    if (email.equalsIgnoreCase("admin@llh.co.za")) {
//                        List<Reservation> allReservations = adminService.getAllBookings();
//                        request.setAttribute("allReservations", allReservations);
                        request.getRequestDispatcher("adminHomePage.jsp").forward(request, response);
                    } else {
                        request.getRequestDispatcher("homepage.html").forward(request, response);
                    }
                } catch (RuntimeException | IncorrectLoginException e) {
                    
                    request.setAttribute("message", "Login failed: " + e.getMessage());
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
                break;
            case "register" :
                String name= request.getParameter("name");
                String surname= request.getParameter("surname");
                String phoneNumberStr = request.getParameter("phone");
                
                String email2 = request.getParameter("email");
                String password2 = request.getParameter("password");
                String hashedPassword2 = BCrypt.hashpw(password2, BCrypt.gensalt());
                
            {
                try {
                    guestService.addGuest(new Guest(name,surname, phoneNumberStr, email2, hashedPassword2));
                    sendEmail(email2);
                response.sendRedirect("login.jsp");
                } catch (EmailExistsException e) {
                    request.setAttribute("message", e.getMessage());
                    request.getRequestDispatcher("register.jsp").forward(request, response);
                }
            }   
                break;
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
