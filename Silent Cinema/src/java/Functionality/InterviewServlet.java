package Functionality;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "InterviewServlet", urlPatterns = {"/InterviewServlet"})
public class InterviewServlet extends HttpServlet {
  public class servecv{
      public static String email = ""; 
  }  
    
    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {

        // Database connection details
        String url = "jdbc:sqlserver://192.168.121.250\\DATABASESERVER:1433;databaseName=Silent;encrypt=true;trustServerCertificate=true";
        String username = "Supun";
        String password = "Rulz@2002";

        // Retrieve form data
        String fullname = req.getParameter("fullname");
        servecv.email = req.getParameter("email");
        String tel = req.getParameter("tel");
        String message = req.getParameter("message");

       
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection conn = DriverManager.getConnection(url, username, password);
            PreparedStatement in = conn.prepareStatement("INSERT INTO vacancy(fullname, email, tel, message) VALUES(?, ?, ?, ?)");

            in.setString(1, fullname);
            in.setString(2, servecv.email);
            in.setString(3, tel);
            in.setString(4, message);

            in.executeUpdate();

            res.sendRedirect("./CVUpload.jsp");

        } catch (Exception ex) {
            res.getWriter().println("Error: " + ex.getMessage());
        }
    }
}