<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Users</title>
    <link rel="stylesheet" href="../CSS/Users.css">
</head>

<body>
    <div class="container container-custom">
        <h2 class="text-center">Users</h2>
        <div class="table-responsive">
            <table class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>First Name</th>
                        <th>Last name</th>
                        <th>Email</th>
                        <th>Telephone Number</th>
                        <th>Password</th>
                        <th>Gender</th>
                        <th>NIC</th>
                    </tr>
                </thead>
                <tbody>
                    <%   
                      String url ="jdbc:sqlserver://192.168.121.250\\DATABASESERVER:1433;databaseName=Silent;encrypt=true;trustServerCertificate=true";
                      String username = "Supun";
                      String password = "Rulz@2002"; 
                      
                       try {
                             Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                             Connection conn = DriverManager.getConnection(url, username, password);
                             PreparedStatement sql = conn.prepareStatement("SELECT * FROM customer");

                             ResultSet result = sql.executeQuery();
            
                             while (result.next()) { %>
                                 <tr>
                                   <td><%= result.getString("id")%></td>
                                   <td><%= result.getString("fname")%></td>
                                   <td><%= result.getString("lname")%></td>
                                   <td><%= result.getString("email")%></td>
                                   <td><%= result.getString("tel")%></td>
                                   <td><%= result.getString("pass")%></td>
                                   <td><%= result.getString("gen")%></td>
                                   <td><%= result.getString("nic")%></td>
                                </tr>
                            <% }
   
                             conn.close();
                       } catch (Exception ex) {
                
                       }
               %>     
                        
                </tbody>
            </table>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
