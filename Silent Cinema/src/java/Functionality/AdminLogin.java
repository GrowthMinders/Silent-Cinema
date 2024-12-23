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



@WebServlet(name = "AdminLogin", urlPatterns = {"/AdminLogin"})
public class AdminLogin extends HttpServlet{
    
    public class match2{
      public static int state2;
    }
    
    @Override
 public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException{
     
     String url ="jdbc:sqlserver://192.168.121.250\\DATABASESERVER:1433;databaseName=Silent;encrypt=true;trustServerCertificate=true";
     String username = "Supun";
     String password = "Rulz@2002"; 

            try {
                
                String demail = req.getParameter("email");
                String pass = req.getParameter("pass");
              
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection conn = DriverManager.getConnection(url, username, password);
                PreparedStatement sql = conn.prepareStatement("SELECT * FROM admininstrator WHERE email = ?");
                
                sql.setString(1, demail);
                
                ResultSet result = sql.executeQuery();
                
                if(result.next()){
                   String dbpass = result.getString("pass");
                   if (BCrypt.checkpw(pass, dbpass)){
                    match2.state2 = 0;
                    String uname = result.getString("fname");
                    HttpSession name = req.getSession();
                    name.setAttribute("uname",uname);
                    
                     res.sendRedirect("./Admin/Dashboard.jsp");
                   }else{
                     match2.state2 = 1;
                     res.sendRedirect("http://localhost:8080/Silent_Cinema/AdminLogin.jsp");
                   }
                }else{
                   match2.state2 = 1;
                   res.sendRedirect("http://localhost:8080/Silent_Cinema/AdminLogin.jsp");
                }
                   
                conn.close();
            } catch (Exception ex) {
                res.getWriter().println(ex.getMessage());
            }
 }
}

    