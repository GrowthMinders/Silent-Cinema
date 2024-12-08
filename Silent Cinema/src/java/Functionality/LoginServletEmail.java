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


@WebServlet(name = "LoginServletEmail", urlPatterns = {"/LoginServletEmail"})
public class LoginServletEmail extends HttpServlet {
    
  public class match{
     public static int state;
     public static String emailrec;
  } 
    
     @Override
 public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException{
     
     String url ="jdbc:sqlserver://192.168.209.250\\DATABASESERVER:1433;databaseName=Silent;encrypt=true;trustServerCertificate=true";
     String username = "Supun";
     String password = "Rulz@2002"; 

            try {
                
                String email = req.getParameter("email");
              
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection conn = DriverManager.getConnection(url, username, password);
                PreparedStatement sql = conn.prepareStatement("SELECT email FROM customer WHERE email = ?");
                
                sql.setString(1, email);
                
                ResultSet result = sql.executeQuery();
                
                if(result.next()){
                   match.emailrec = email;
                   res.sendRedirect("./Logpassword.jsp");
                }else{
                   match.state = 1;
                   res.sendRedirect("./Logemail.jsp");
                }
     
                conn.close();
            } catch (Exception ex) {
                res.getWriter().println(ex.getMessage());
            }
 }
}






   
    