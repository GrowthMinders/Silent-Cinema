<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Theater List</title>
  <link rel="stylesheet" href="../CSS/Theater.css"> 
</head>
<body>
  <div class="container">
    <h1>Theater List</h1>
    <table>
      <thead>
        <tr>
          <th>S.No.</th>
          <th>Theater Name</th>
          <th>Image</th>
          <th>Delete</th>
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
                             PreparedStatement sql = conn.prepareStatement("SELECT * FROM theater");

                             ResultSet result = sql.executeQuery();
            
                              while (result.next()) { %>
                                 <tr>
                                   <td><%= result.getString("tid")%></td>
                                   <td><%= result.getString("tname")%></td>
                                   <td><img src="../Backend_Images/Theaters/<%= result.getString("timage") %>" id="theater" alt="<%= result.getString("tname")%>"></td>
                                   <td>
                                       <form action="../TheaterDelete" method="post">
                                          <input type="hidden" name="theaterId" id="theaterId" value="<%= result.getString("tid")%>">
                                              <button type="submit" class="delete-button">
                                                 <img src="../Images/Admin/icons8-delete-24.png" alt="Delete" class="icon">
                                              </button>
                                       </form>
                                   </td>          
                                </tr>
                            <% }
   
                             conn.close();
                       } catch (Exception ex) {
                
                       }
               %>     
          
      </tbody>
    </table>
  </div>
</body>
</html>
