package Functionality;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "LogoutServletCust", urlPatterns = {"/LogoutServletCust"})
public class LogoutServletCust extends HttpServlet {
  @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession name = req.getSession(false); // false to not create a new session if it doesn't exist
        if (name != null) {
            name.invalidate(); // Invalidates the session
        }

        // Redirect the user to the login page or home page after logout
        res.sendRedirect("http://localhost:8080/Silent_Cinema/index.jsp"); // Redirect to your login page or home page
    }
}
