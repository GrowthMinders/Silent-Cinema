package Functionality;

import java.io.IOException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet(name = "MovieEdit", urlPatterns = {"/MovieEdit"})
public class MovieEdit extends HttpServlet {
  @Override
 public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException{
     
     String url ="jdbc:sqlserver://192.168.121.250\\DATABASESERVER:1433;databaseName=Silent;encrypt=true;trustServerCertificate=true";
     String username = "Supun";
     String password = "Rulz@2002"; 

            try {
                
                String mname = req.getParameter("mname");
                String mposter = req.getParameter("mposter");
                String mdetails = req.getParameter("mdetails");
                String mcast = req.getParameter("mcast");
                String mfacts = req.getParameter("mfacts");
                String tlink = req.getParameter("tlink");
                String mrating = req.getParameter("mrating");
                String mprice = req.getParameter("mprice");
                String mgenre = req.getParameter("mgenre");
                String mtheater = req.getParameter("mtheater");
                
                String id = req.getParameter("id");
              
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection conn = DriverManager.getConnection(url, username, password);
                PreparedStatement sql = conn.prepareStatement("UPDATE movie SET mname = ?, mposter = ?, mdetails = ?, mcast = ?, mfacts = ?, tlink = ?, mrating = ?, mprice = ?, mgenre = ?, mtheater = ? WHERE mid = ?");
                
               
                sql.setString(1, mname);
                sql.setString(2, mposter);
                sql.setString(3, mdetails);
                sql.setString(4, mcast);
                sql.setString(5, mfacts);
                sql.setString(6, tlink);
                sql.setString(7, mrating);
                sql.setString(8, mprice);
                sql.setString(9, mgenre);
                sql.setString(10, mtheater);
                sql.setString(11, id);
                
                sql.executeUpdate();
             
                res.sendRedirect("./Admin/Dashboard.jsp");
    
                conn.close();
            } catch (Exception ex) {
                res.getWriter().println(ex.getMessage());
            }
  }
}
