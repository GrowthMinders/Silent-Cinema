<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Show Timings</title>
    <link rel="stylesheet" href="../CSS/Show_Timings.css">
</head>
<body>
    <div class="container">
        <h2>Show Timings</h2>
        <table>
            <thead>
                <tr>
                    <th>S.No</th>
                    <th>Theater</th>
                    <th>Movie</th>
                    <th>Start Date</th>
                    <th>End Date</th>
                    <th>Start Time</th>
                    <th>End Time</th>
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
                             PreparedStatement sql = conn.prepareStatement("SELECT * FROM timming");

                             ResultSet result = sql.executeQuery();
            
                             while (result.next()) { %>
                                <tr>
                                    <td><%= result.getString("tmid")%></td>
                                    <td><%= result.getString("theater")%></td>
                                    
                                    <td><%= result.getString("movie")%></td>
                                    <td><%= result.getString("sdate")%></td>
                                    <td><%= result.getString("edate")%></td>
                                    
                                    <td><%= result.getString("stime")%></td>
                                    <td><%= result.getString("etime")%></td>
                                    
                                    <td>
                                       <form action="../Show_TimingsDelete" method="post">
                                           <input type="hidden" name="tmId" id="tmId" value="<%= result.getString("tmid")%>">
                                              <button type="submit" class="btn-delete">
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
