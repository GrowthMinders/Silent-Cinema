package Functionality;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import org.mindrot.jbcrypt.BCrypt;

@WebServlet(name = "LoginServletPass", urlPatterns = {"/LoginServletPass"})
public class LoginServletPass extends HttpServlet {
    
  public class match1{
     public static int state1;
  }    
    
        @Override
 public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException{
     
     String url ="jdbc:sqlserver://192.168.209.250\\DATABASESERVER:1433;databaseName=Silent;encrypt=true;trustServerCertificate=true";
     String username = "Supun";
     String password = "Rulz@2002"; 

            try {
                
                String email = req.getParameter("email");
                String pass = req.getParameter("pass");
              
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection conn = DriverManager.getConnection(url, username, password);
                PreparedStatement sql = conn.prepareStatement("SELECT pass,fname,lname FROM customer WHERE email = ?");
                
                sql.setString(1, email);
                
               ResultSet result = sql.executeQuery();
            
            if (result.next()) {
                String unamef = result.getString("fname");
                String unamel = result.getString("lname");
                String uname = unamef +" "+ unamel;
                String hashedPass = result.getString("pass");
                if (BCrypt.checkpw(pass, hashedPass)) {
                    HttpSession name = req.getSession();
                    name.setAttribute("uname",uname);
                    res.sendRedirect("./index.jsp");
                } else {
                    match1.state1 = 1;
                    res.sendRedirect("./Logpassword.jsp");
                }
            }
   
                conn.close();
            } catch (Exception ex) {
                res.getWriter().println(ex.getMessage());
            }
 }
}










    