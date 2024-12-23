package Functionality;

import java.io.IOException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet(name = "ShowtimingAdd", urlPatterns = {"/ShowtimingAdd"})
public class ShowtimingAdd extends HttpServlet {
    @Override
  public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException{
     
     String url ="jdbc:sqlserver://192.168.121.250\\DATABASESERVER:1433;databaseName=Silent;encrypt=true;trustServerCertificate=true";
     String username = "Supun";
     String password = "Rulz@2002"; 

            try {
                
                String theater = req.getParameter("theater");
                String movie = req.getParameter("movie");
                String sdate = req.getParameter("sdate");
                String edate = req.getParameter("edate");
                String stime = req.getParameter("stime");
                String etime = req.getParameter("etime");
              
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection conn = DriverManager.getConnection(url, username, password);
            
                PreparedStatement sql = conn.prepareStatement("INSERT INTO timming(theater,movie,sdate,edate,stime,etime) VALUES(?,?,?,?,?,?)");
                
                sql.setString(1, theater);
                sql.setString(2, movie);
                sql.setString(3, sdate);
                sql.setString(4, edate);
                sql.setString(5, stime);
                sql.setString(6, etime);
                
                sql.executeUpdate();
             
                res.sendRedirect("./Admin/Dashboard.jsp");
    
                conn.close();
            } catch (Exception ex) {
                res.getWriter().println(ex.getMessage());
            }
  }
}
