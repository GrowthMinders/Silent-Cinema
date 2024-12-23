package Functionality;

import java.io.IOException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import org.mindrot.jbcrypt.BCrypt;

@WebServlet(name = "AdminRegisterServlet", urlPatterns = {"/AdminRegisterServlet"})
public class AdminRegisterServlet extends HttpServlet {
  @Override
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
     
        String url = "jdbc:sqlserver://192.168.121.250\\DATABASESERVER:1433;databaseName=Silent;encrypt=true;trustServerCertificate=true";
        String username = "Supun";
        String password = "Rulz@2002"; 
        
        String fname = req.getParameter("fname");
        String lname = req.getParameter("lname");
        String email = req.getParameter("email");
        String pass = req.getParameter("pass");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
  
            String hash = BCrypt.hashpw(pass, BCrypt.gensalt());

                    try (Connection conn2 = DriverManager.getConnection(url, username, password)) {
                        PreparedStatement in = conn2.prepareStatement("INSERT INTO admininstrator(fname, lname, email, pass) VALUES(?, ?, ?, ?)");
                        
                        in.setString(1, fname);
                        in.setString(2, lname);
                        in.setString(3, email);
                        in.setString(4, hash);
                        in.executeUpdate();

                        res.sendRedirect("http://localhost:8080/Silent_Cinema/AdminLogin.jsp");
                    }
               
        } catch (Exception ex) {
            res.getWriter().println("Error: " + ex.getMessage());
        }
    }
}
