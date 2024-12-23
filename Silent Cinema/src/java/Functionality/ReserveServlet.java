package Functionality;

import Functionality.PaymentServlet.emailgrab;

import java.io.IOException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet(name = "ReserveServlet", urlPatterns = {"/ReserveServlet"})
public class ReserveServlet extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException {
        String url = "jdbc:sqlserver://192.168.121.250\\DATABASESERVER:1433;databaseName=Silent;encrypt=true;trustServerCertificate=true";
        String username = "Supun";
        String password = "Rulz@2002"; 

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection conn = DriverManager.getConnection(url, username, password);
            
            PreparedStatement in = conn.prepareStatement("INSERT INTO booking(date, time, movie, seat) VALUES(?, ?, ?, ?)");
            in.setString(1, emailgrab.seldate);
            in.setString(2, emailgrab.seltime);
            in.setString(3, emailgrab.selmovie);
            in.setString(4, emailgrab.selseats);
            in.executeUpdate();

            res.sendRedirect("./correct.jsp");

            conn.close();
        } catch (Exception ex) {
            res.getWriter().println("Error: " + ex.getMessage());
        }
    }
}
