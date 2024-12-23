package Functionality;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.mail.*;
import jakarta.mail.internet.*;
import jakarta.activation.*;
import java.util.Properties;

@WebServlet(name = "Passwordreset", urlPatterns = {"/Passwordreset"})
public class Passwordreset extends HttpServlet {
  @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String message = "http://localhost:8080/Silent_Cinema/Forgotpw.jsp";

        // Correct Gmail SMTP details
        String receiver = email;  // Destination email address
        String sender = "supun200202@gmail.com";   // Your Gmail email address
        String host = "smtp.gmail.com";         // Gmail SMTP server

        // Set up properties for the SMTP server
        Properties properties = System.getProperties();
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.port", "587"); // Port for TLS
        properties.put("mail.smtp.auth", "true");

        // Set up session with authentication details
        Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                String username = "supun200202@gmail.com";
                String password = "unei tuzg pjeh smtn"; 
                // Use your Gmail email address and App Password
                return new PasswordAuthentication(username, password); // Replace with your App Password
            }
        });

        try {
            // Create a MimeMessage
            MimeMessage mimeMessage = new MimeMessage(session);
            mimeMessage.setFrom(new InternetAddress(receiver));
            mimeMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(sender));
            mimeMessage.setSubject("Password reseting: ");

            // Create the content of the email
            String content = "Please cofirm yoyr identity and get the password reseted " + message;
            mimeMessage.setText(content);

            // Send the email
            Transport.send(mimeMessage);
            response.sendRedirect("./index.jsp");
        } catch (MessagingException mex) {
            // Output the error message
            response.sendRedirect("./Loginpassword.jsp");
        }
    }
}
