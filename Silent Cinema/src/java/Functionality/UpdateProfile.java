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

@WebServlet(name = "UpdateProfile", urlPatterns = {"/UpdateProfile"})
public class UpdateProfile extends HttpServlet {
  @Override
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
     
        String url = "jdbc:sqlserver://192.168.121.250\\DATABASESERVER:1433;databaseName=Silent;encrypt=true;trustServerCertificate=true";
        String username = "Supun";
        String password = "Rulz@2002"; 
        
        String email = req.getParameter("email");
        String tel = req.getParameter("tel"); 
        String pass = req.getParameter("pass");
       
        String id = req.getParameter("custid");
        
        String hash = BCrypt.hashpw(pass, BCrypt.gensalt());

                    try {
                        Connection conn2 = DriverManager.getConnection(url, username, password);
                        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                        PreparedStatement in = conn2.prepareStatement("UPDATE customer SET email ?, tel = ?, pass = ? WHERE id = ?");
                        
                       
                        in.setString(1, email);
                        in.setString(2, tel);
                        in.setString(3, hash);
                        in.setString(4, id);
                        in.executeUpdate();

                        res.sendRedirect("../MyProfile.jsp");
           
        } catch (Exception ex) {
            res.getWriter().println("Error: " + ex.getMessage());
        }
    }
}
