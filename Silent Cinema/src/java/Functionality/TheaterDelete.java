package Functionality;

import java.io.IOException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet(name = "TheaterDelete", urlPatterns = {"/TheaterDelete"})
public class TheaterDelete extends HttpServlet {
     @Override
  public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException{
     
     String url ="jdbc:sqlserver://192.168.121.250\\DATABASESERVER:1433;databaseName=Silent;encrypt=true;trustServerCertificate=true";
     String username = "Supun";
     String password = "Rulz@2002"; 

            try {
                
                String id = req.getParameter("theaterId");
              
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection conn = DriverManager.getConnection(url, username, password);
            
                PreparedStatement sql = conn.prepareStatement("DELETE FROM theater WHERE tid = ?");
                
                sql.setString(1, id);
                
                sql.executeUpdate();
             
                id = " ";
                res.sendRedirect("./Admin/Dashboard.jsp");
           
                conn.close();
            } catch (Exception ex) {
                res.getWriter().println(ex.getMessage());
            }
  }
}
