<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.util.*, jakarta.servlet.*, jakarta.servlet.http.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">

   <% String id = request.getParameter("movieId"); %>
    
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Movie Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../CSS/Eddit_Movie.css">
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center mb-4">Edit Movie Details</h2>
        <form action="../MovieEdit" method="post">
            
<%   
                      String url ="jdbc:sqlserver://192.168.121.250\\DATABASESERVER:1433;databaseName=Silent;encrypt=true;trustServerCertificate=true";
                      String username = "Supun";
                      String password = "Rulz@2002"; 
                      
                      String mname = "";
                      String mposter = "";
                      String mdetails = "";
                      String mcast = "";
                      String mfacts = "";
                      String tlink = "";
                      String mrating = "";
                      String mprice = "";
                      String mgenre = "";
                      String mtheater = "";
                       try {
                             Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                             Connection conn = DriverManager.getConnection(url, username, password);
                             PreparedStatement sql = conn.prepareStatement("SELECT * FROM movie WHERE mid = ?");

                             sql.setString(1, id);
                             
                             ResultSet result = sql.executeQuery();
            
                             if(result.next()) { 
                                
                                    mname = result.getString("mname");
                                    mposter = result.getString("mposter");
                                    mdetails = result.getString("mdetails");
                                    mcast = result.getString("mcast");
                                    mfacts = result.getString("mfacts");
                                    tlink = result.getString("tlink");
                                    mrating = result.getString("mrating");
                                    mprice = result.getString("mprice");
                                    mgenre = result.getString("mgenre");
                                    mtheater = result.getString("mtheater");

                               }
   
                             conn.close();
                       } catch (Exception ex) {
                
                       }
               %>  
               
                     <div class="mb-3">
                        <label for="movie-name" class="form-label">Movie Name:</label>
                        <input type="text" id="id" name="id" class="form-control"  value="<%= id %>"  hidden>
                    </div>
       
                    <div class="mb-3">
                        <label for="movie-name" class="form-label">Movie Name:</label>
                        <input type="text" id="mname" name="mname" class="form-control" placeholder="Enter Movie Name" <% if (mname != null &&  mname != "") { %> value="<%= mname %>" <% } %> required>
                    </div>

                    
                    <div class="mb-3">
                        <label for="movie-poster" class="form-label">Movie Poster:</label>
                        <input type="file" id="mposter" name="mposter" class="form-control" accept="image/*" required>
                    </div>

                    
                    <div class="mb-3">
                        <label for="movie-details" class="form-label">Movie Details:</label>
                        <input type="text" id="mdetails" name="mdetails" class="form-control" placeholder="Enter Movie Description" <% if (mdetails != null &&  mdetails != "") { %> value="<%= mdetails %>" <% } %> required>
                    </div>

                    
                    <div class="mb-3">
                        <label for="movie-cast" class="form-label">Cast:</label>
                        <input type="text" id="mcast" name="mcast" class="form-control" placeholder="Enter Cast Details (e.g., Actor 1, Actor 2...)" <% if (mcast != null &&  mcast != "") { %> value="<%= mcast %>" <% } %> required>
                    </div>

                    
                    <div class="mb-3">
                        <label for="movie-facts" class="form-label">Facts:</label>
                        <input type="text" id="mfacts" name="mfacts" class="form-control"  placeholder="Enter Interesting Facts" <% if (mfacts != null &&  mfacts != "") { %> value="<%= mfacts %>" <% } %> required>
                    </div>

                    
                    <div class="mb-3">
                        <label for="trailer-link" class="form-label">Trailer Link:</label>
                        <input type="url" id="tlink" name="tlink" class="form-control" placeholder="Enter YouTube Trailer Link" <% if (tlink != null &&  tlink != "") { %> value="<%= tlink %>" <% } %> required>
                    </div>

                    
                    <div class="mb-3">
                        <label for="movie-rating" class="form-label">Rating:</label>
                        <input type="text" id="mrating" name="mrating" class="form-control" placeholder="Enter Rating (1 to 10)" <% if (mrating != null &&  mrating != "") { %> value="<%= mrating %>" <% } %> required>
                    </div>
                    
                    <div class="mb-3">
                        <label for="movie-rating" class="form-label">Price:</label>
                        <input type="text" id="mprice" name="mprice" class="form-control" placeholder="Enter price" <% if (mprice != null &&  mprice != "") { %> value="<%= mprice %>" <% } %> required>
                    </div>
                    
                    <div class="mb-3">
                        <label for="mgenre" class="form-label">Genre:</label>
                        <input type="text" id="mgenre" name="mgenre" class="form-control" placeholder="Enter genre" <% if (mgenre != null &&  mgenre != "") { %> value="<%= mgenre %>" <% } %> required>
                    </div>
                    
                    
                    <%   
                      
                      String theater [] = new String[100];
                       try {
                             Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                             Connection conn = DriverManager.getConnection(url, username, password);
                             PreparedStatement sql = conn.prepareStatement("SELECT tname FROM theater");

                             ResultSet result = sql.executeQuery();
            
                             for(int i =0;result.next() && i < theater.length;i++){
                                 theater[i] = result.getString("tname");
                             }
   
                             conn.close();
                       } catch (Exception ex) {
                
                       }
                    %>
                    
                    <div class="mb-3">
                        <label for="mtheater" class="form-label">Location:</label>
                        <select name = "mtheater" id = "mtheater" required style="width: 100%; padding: 10px; font-size: 16px; border: 1px solid #ccc; border-radius: 4px; background-color: #f9f9f9;">
                        <% for(int i=0; i < theater.length; i++){ 
                             if(theater[i] != null){  %>                  
                                 <option value="<%= theater[i]%>"  <%= (mtheater != null && theater[i].equals(mtheater)) ? "selected" : "" %>><%= theater[i]%></option>
                             <% } %>    
                        <% } %> 
                       </select>
                    </div>
            
            <div class="text-center">
                <button type="submit" class="btn btn-primary">Edit Movie</button>
            </div>
        </form>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
