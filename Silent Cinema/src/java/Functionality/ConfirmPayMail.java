package Functionality;

import Functionality.PaymentServlet.emailgrab;


import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Properties;

@WebServlet(name = "ConfirmPayMail", urlPatterns = {"/ConfirmPayMail"})
public class ConfirmPayMail extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String receiver = emailgrab.selemail;  // Destination email address
        String sender = "supun200202@gmail.com";   // Your Gmail email address
        String host = "smtp.gmail.com";         // Gmail SMTP server

        // Set up properties for the SMTP server
        Properties properties = new Properties();
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", "587"); // Port for TLS
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");

        // Set up session with authentication details
        Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                String username = "supun200202@gmail.com";
                String password = "unei tuzg pjeh smtn"; 
                return new PasswordAuthentication(username, password); // Replace with your App Password
            }
        });

        try {
            // Create a MimeMessage
            MimeMessage mimeMessage = new MimeMessage(session);
            mimeMessage.setFrom(new InternetAddress(sender));
            mimeMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(receiver));
            mimeMessage.setSubject("Receipt of Ticket Purchase Approval");

            // Create the content of the email
          String content = "<!DOCTYPE html>" +
        "<html lang=\"en\">" +
        "<head>" +
        "<meta charset=\"UTF-8\">" +
        "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">" +
        "<title>Booking Summary</title>" +
        "<style>" +
        "body {" +
        "font-family: Arial, sans-serif;" +
        "margin: 0;" +
        "padding: 0;" +
        "background-color: #f8f8f8;" +
        "}" +

        ".booking-summary {" +
        "background-color: #fff;" +
        "max-width: 400px;" +
        "margin: 40px auto;" +
        "border: 1px solid #e0e0e0;" +
        "border-radius: 8px;" +
        "padding: 20px;" +
        "box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);" +
        "}" +

        ".summary-title {" +
        "font-size: 20px;" +
        "margin-bottom: 15px;" +
        "font-weight: bold;" +
        "text-align: center;" +
        "}" +

        ".ticket-details {" +
        "display: flex;" +
        "flex-direction: column;" +
        "gap: 5px;" +  // Adds spacing between items
        "margin-bottom: 15px;" +
        "}" +

        ".ticket-details p {" +
        "margin: 0;" +
        "font-size: 14px;" +
        "}" +

        ".price {" +
        "color: #000;" +
        "font-weight: bold;" +
        "}" +

        ".pricing .row {" +
        "display: flex;" +
        "justify-content: space-between;" +
        "font-size: 14px;" +
        "margin-bottom: 5px;" +
        "}" +

        ".total {" +
        "display: flex;" +
        "justify-content: space-between;" +
        "margin-top: 10px;" +
        "padding-top: 15px;" +
        "border-top: 1px solid #ddd;" +
        "}" +

        ".total p {" +
        "margin: 0;" +
        "font-size: 16px;" +
        "}" +
        "</style>" +
        "</head>" +
        "<body>" +
        "<div class=\"booking-summary\">" +

        "<h2 class=\"summary-title\">BOOKING SUMMARY</h2>" +
        "<div class=\"ticket-details\">" +
        "<p><strong>Movie Date: </strong>" + emailgrab.seldate + "</p>" +
        "</div>" +
        "<div class=\"ticket-details\">" +
        "<p><strong>Movie Time: </strong>" + emailgrab.seltime + "</p>" +
        "</div>" +
        "<div class=\"ticket-details\">" +
        "<p><strong>Movie Name: </strong>" + emailgrab.selmovie + "</p>" +
        "</div>" +

        "<div class=\"ticket-details\">" +
        "<p><strong>Seats Booked: </strong>" + emailgrab.selseats + "</p>" +
        "</div>" +

        "<div class=\"pricing\">" +
        "<div class=\"row\">" +
        "<span><strong>Unit Price:</strong></span>" +
        "<span class=\"price\">Rs. " + emailgrab.seatprice + "/=</span>" +
        "</div>" +
        "</div>" +

        "<div class=\"total\">" +
        "<p><strong>Total Price:</strong></p>" +
        "<p class=\"price\"><strong>Rs. " + (emailgrab.seatprice * emailgrab.selseatsno) + "/=</strong></p>" +
        "</div>" +
        "</div>" +
        "</body>" +
        "</html>";




            mimeMessage.setContent(content, "text/html; charset=utf-8");

            // Send the email
            Transport.send(mimeMessage);
            response.sendRedirect("http://localhost:8080/Silent_Cinema/ReserveServlet");
        } catch (MessagingException mex) {
            // Log the error for debugging
            response.sendRedirect("http://localhost:8080/Silent_Cinema/Bill.jsp");
        }
    }
}
