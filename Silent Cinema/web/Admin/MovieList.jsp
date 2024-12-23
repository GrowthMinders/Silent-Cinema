<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../CSS/MovieList.css">
    <title>Movie List</title>
</head>
<body>
    <div class="container">
        <h2>Movies List</h2>
        <table>
            <thead>
                <tr>
                    <th>S.No</th>
                    <th>Movie Name</th>
                    <th>Poster</th>
                    <th>Details</th>
                    <th>Cast</th>
                    <th>Facts</th>
                    <th>Trailer</th>
                    <th>Rating</th>
                    <th>Price</th>
                    <th>Genre</th>
                    <th>Theater</th>
                    <th>Delete</th>
                    <th>Modify</th>
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
                             PreparedStatement sql = conn.prepareStatement("SELECT * FROM movie");

                             ResultSet result = sql.executeQuery();
            
                             while (result.next()) { %>
                                <tr>
                                    <td><%= result.getString("mid")%></td>
                                    <td><%= result.getString("mname")%></td>
                                    <td><img src="../Backend_Images/Movies/<%= result.getString("mposter")%>" alt="<%= result.getString("mposter")%>" class="poster"></td>
                                    <td><%= result.getString("mdetails")%></td>
                                    <td><%= result.getString("mcast")%></td>
                                    <td><%= result.getString("mfacts")%></td>
                                    <td><a href="<%= result.getString("tlink")%>" target="_blank">View Trailer</a></td>
                                    <td><%= result.getString("mrating")%></td>
                                    <td><%= result.getString("mprice")%></td>
                                    <td><%= result.getString("mgenre")%></td>
                                    <td><%= result.getString("mtheater")%></td>
                                    <td>
                                       <form action="../MovieDelete" method="post">
                                          <input type="hidden" name="movieId" id="movieId" value="<%= result.getString("mid")%>">
                                              <button type="submit" class="delete-button">
                                                 <img src="../Images/Admin/icons8-delete-24.png" alt="Delete" class="icon">
                                              </button>
                                       </form>
                                    </td>
                                    <td>
                                       <form action="../Admin/Eddit_Movie.jsp" method="post">
                                           <input type="hidden" name="movieId" id="movieId" value="<%= result.getString("mid")%>">
                                              <button type="submit" class="delete-button">
                                                 <img src="../Images/Admin/icons8-edit-text-file-50.png" alt="Edit" class="icon">
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
