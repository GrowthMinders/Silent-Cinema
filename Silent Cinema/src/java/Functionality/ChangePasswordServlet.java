package Functionality;

import java.io.IOException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Connection;

@WebServlet(name = "ChangePasswordServlet", urlPatterns = {"/ChangePasswordServlet"})
public class ChangePasswordServlet extends HttpServlet {
  @Override
 public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException{
     
     String url ="jdbc:sqlserver://192.168.121.250\\DATABASESERVER:1433;databaseName=Silent;encrypt=true;trustServerCertificate=true";
     String username = "Supun";
     String password = "Rulz@2002"; 

            try {
                
                String email = req.getParameter("email");
                String pass = req.getParameter("pass");
              
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection conn = DriverManager.getConnection(url, username, password);
                PreparedStatement sql = conn.prepareStatement("UPDATE customer SET pass = ?  WHERE email = ?");
                
                sql.setString(1, pass);
                sql.setString(2, email);
                
                sql.executeQuery();
                
                res.sendRedirect("./Logemail.jsp");
                
     
                conn.close();
            } catch (Exception ex) {
                res.getWriter().println(ex.getMessage());
            }
 }
}
