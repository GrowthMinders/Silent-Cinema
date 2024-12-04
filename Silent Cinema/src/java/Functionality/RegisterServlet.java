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

@WebServlet(name = "RegisterServlet", urlPatterns = {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {
    
    public class GlobalVariables {
        public static String[] data = new String[8];
        public static String emaildb;
        public static String teldb;
        public static String nicdb;
    }

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
     
        String url = "jdbc:sqlserver://192.168.57.250\\DATABASESERVER:1433;databaseName=Silent;encrypt=true;trustServerCertificate=true";
        String username = "Supun";
        String password = "Rulz@2002"; 
        
        String fname = req.getParameter("fname");
        String lname = req.getParameter("lname");
        String email = req.getParameter("email");
        String tel = req.getParameter("tel"); 
        String pass = req.getParameter("pass");
        String cpass = req.getParameter("cpass");
        String gen = req.getParameter("gen");
        String nic = req.getParameter("nic");

        boolean takenmail = false;
        boolean takentel = false;
        boolean takennic = false;
        
        String[] userin = {fname, lname, email, tel, pass, cpass, gen, nic};
        for (int i = 0; i < 8; i++) {
            GlobalVariables.data[i] = userin[i];
        }

        String sql = "SELECT email, tel, nic FROM customer WHERE email = ? OR tel = ? OR nic = ?";
        
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection(url, username, password);
                 PreparedStatement query = conn.prepareStatement(sql)) {
                
                query.setString(1, email);
                query.setString(2, tel);
                query.setString(3, nic);

                try (ResultSet result = query.executeQuery()) {
                    if (result.next()) {
                        if (email.equals(result.getString("email"))) {
                            GlobalVariables.emaildb = result.getString("email");
                            takenmail = true;
                        }
                        if (tel.equals(result.getString("tel"))) {
                            GlobalVariables.teldb = result.getString("tel");
                            takentel = true;
                        }
                        if (nic.equals(result.getString("nic"))) {
                            GlobalVariables.nicdb = result.getString("nic");
                            takennic = true;
                        }
                    }
                }

                if (takenmail || takentel || takennic) {
                       res.sendRedirect("./Registration.jsp");

                }else{
                   for (int i = 0; i < 8; i++) {
                        GlobalVariables.data[i] = null;
                   }
                   GlobalVariables.emaildb = "";
                   GlobalVariables.teldb = "";
                   GlobalVariables.nicdb = "";
                   
                   String hash = BCrypt.hashpw(pass, BCrypt.gensalt());

                    try (Connection conn2 = DriverManager.getConnection(url, username, password)) {
                        PreparedStatement in = conn2.prepareStatement("INSERT INTO customer(fname, lname, email, tel, pass, gen, nic) VALUES(?, ?, ?, ?, ?, ?, ?)");
                        
                        in.setString(1, fname);
                        in.setString(2, lname);
                        in.setString(3, email);
                        in.setString(4, tel);
                        in.setString(5, hash);
                        in.setString(6, gen);
                        in.setString(7, nic);
                        in.executeUpdate();


                        res.sendRedirect("./Login.jsp");

                    }
                }
            }
        } catch (Exception ex) {
            System.err.println("Error: " + ex.getMessage());
            res.getWriter().println("Error: " + ex.getMessage());
        }
    }
}
