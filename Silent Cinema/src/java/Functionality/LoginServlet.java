package Functionality;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import org.mindrot.jbcrypt.BCrypt;



@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet{
    @Override
 public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException{
     
     String url ="jdbc:sqlserver://192.168.130.250\\DATABASESERVER:1433;databaseName=Silent;encrypt=true;trustServerCertificate=true";
     String username = "Supun";
     String password = "Rulz@2002"; 

            try {
                
                String email = req.getParameter("email");
                String pass = req.getParameter("pass");
              
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection conn = DriverManager.getConnection(url, username, password);
                PreparedStatement sql = conn.prepareStatement("SELECT * FROM customer WHERE email = ?");
                
                sql.setString(1, email);
                
                ResultSet result = sql.executeQuery();
                
                if(result.next()){
                   String dbpass = result.getString("pass");
                   if (BCrypt.checkpw(pass, dbpass)){
                     res.sendRedirect("./index.html");
                   }else{
                     res.getWriter().println("Invalid Credentials");
                   }
                }else{
                   res.getWriter().println("Invalid Credentials");
                }
                   
                conn.close();
            } catch (Exception ex) {
                res.getWriter().println(ex.getMessage());
            }
 }
}

    