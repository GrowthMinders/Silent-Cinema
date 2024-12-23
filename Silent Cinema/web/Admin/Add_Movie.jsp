<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Movie Details</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="../CSS/AddMovie.css" rel="stylesheet">
</head>

<body class="bg-light">
    <div class="container py-5">
        <div class="card shadow mx-auto" style="max-width: 600px;">
            <div class="card-body">
                <h2 class="text-center mb-4">Add Movie Details</h2>
                <form action="../MovieAdd" method="post" >
                    
                    <div class="mb-3">
                        <label for="movie-name" class="form-label">Movie Name:</label>
                        <input type="text" id="mname" name="mname" class="form-control" placeholder="Enter Movie Name" required>
                    </div>

                    
                    <div class="mb-3">
                        <label for="movie-poster" class="form-label">Movie Poster:</label>
                        <input type="file" id="mposter" name="mposter" class="form-control" accept="image/*" required>
                    </div>

                    
                    <div class="mb-3">
                        <label for="movie-details" class="form-label">Movie Details:</label>
                        <textarea id="mdetails" name="mdetails" class="form-control" rows="4" placeholder="Enter Movie Description" required></textarea>
                    </div>

                    
                    <div class="mb-3">
                        <label for="movie-cast" class="form-label">Cast:</label>
                        <textarea id="mcast" name="mcast" class="form-control" rows="3" placeholder="Enter Cast Details (e.g., Actor 1, Actor 2...)" required></textarea>
                    </div>

                    
                    <div class="mb-3">
                        <label for="movie-facts" class="form-label">Facts:</label>
                        <textarea id="mfacts" name="mfacts" class="form-control" rows="3" placeholder="Enter Interesting Facts"></textarea>
                    </div>

                    
                    <div class="mb-3">
                        <label for="trailer-link" class="form-label">Trailer Link:</label>
                        <input type="url" id="tlink" name="tlink" class="form-control" placeholder="Enter YouTube Trailer Link" required>
                    </div>

                    
                    <div class="mb-3">
                        <label for="movie-rating" class="form-label">Rating:</label>
                        <input type="number" id="mrating" name="mrating" class="form-control" placeholder="Enter Rating (1 to 10)" min="1" max="10" step="0.1" required>
                    </div>
                    
                    <div class="mb-3">
                        <label for="movie-rating" class="form-label">Price:</label>
                        <input type="number" id="mprice" name="mprice" class="form-control" placeholder="Enter price" min="500" max="2000" step="500" required>
                    </div>
                    
                    <div class="mb-3">
                        <label for="mgenre" class="form-label">Genre:</label>
                        <input type="text" id="mgenre" name="mgenre" class="form-control" placeholder="Enter genre" required>
                    </div>
                    
                 <%   
                      String url ="jdbc:sqlserver://192.168.121.250\\DATABASESERVER:1433;databaseName=Silent;encrypt=true;trustServerCertificate=true";
                      String username = "Supun";
                      String password = "Rulz@2002"; 
                      
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
                           <option selected hidden>Cinema</option>
                        <% for(int i=0; i < theater.length; i++){ 
                                    if(theater[i] != null){  %>                  
                                        <option value="<%= theater[i]%>"><%= theater[i]%></option>
                                    <% } %>    
                        <% } %> 
                       </select>
                    </div>

                    
                    <div class="d-grid">
                        <button type="submit" class="btn btn-primary">Add Movie</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
